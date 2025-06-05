#!/bin/bash

echo "🔒 Teste 1: Tentando acessar SEM certificado de cliente..."
curl -v https://localhost:5000 --cacert certs/ca.crt
echo ""
echo "❌ Esperado: erro de handshake ou rejeição por falta de autenticação mTLS."
echo ""
echo "────────────────────────────────────────────────────────────"

echo "🔐 Teste 2: Acessando COM certificado de cliente..."
curl -v https://localhost:5000 \
  --cert certs/client.crt \
  --key certs/client.key \
  --cacert certs/ca.crt
echo ""
echo "✅ Esperado: conexão bem-sucedida com resposta do servidor."
