#!/bin/bash

echo "📁 Criando diretório certs/"
mkdir -p certs
cd certs

echo "📝 Criando arquivo ca.conf..."
cat > ca.conf <<EOF
[ req ]
default_bits       = 2048
distinguished_name = dn
x509_extensions    = v3_ca
prompt             = no

[ dn ]
CN = MyCA

[ v3_ca ]
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer
basicConstraints = critical,CA:TRUE
keyUsage = critical, keyCertSign, cRLSign
EOF

echo "🔐 Gerando CA..."
openssl req -x509 -newkey rsa:2048 -days 365 -nodes \
  -keyout ca.key -out ca.crt -config ca.conf

echo "📝 Criando arquivo server.conf..."
cat > server.conf <<EOF
[ req ]
default_bits       = 2048
prompt             = no
default_md         = sha256
req_extensions     = req_ext
distinguished_name = dn

[ dn ]
CN = localhost

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = localhost
EOF

echo "🔐 Gerando certificado do servidor..."
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -config server.conf
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key \
  -CAcreateserial -out server.crt -days 365 -sha256 \
  -extfile server.conf -extensions req_ext

echo "🔐 Gerando certificado do cliente..."
openssl genrsa -out client.key 2048
openssl req -new -key client.key -out client.csr -subj "/CN=client"
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key \
  -CAcreateserial -out client.crt -days 365 -sha256

echo "✅ Todos os certificados foram gerados com sucesso!"
