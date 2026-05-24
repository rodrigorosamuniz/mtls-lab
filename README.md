# Laboratório de mTLS com Python

Este repositório contém um laboratório prático para ensinar **mutual TLS (mTLS)** usando Python, Flask, Requests e certificados gerados com OpenSSL.

## Objetivo

Demonstrar uma comunicação HTTPS com autenticação mútua, na qual:

- o cliente valida o certificado do servidor;
- o servidor exige e valida o certificado do cliente;
- conexões sem certificado de cliente são rejeitadas durante o handshake TLS.

## Arquivos

```text
server.py           Servidor HTTPS que exige certificado de cliente
client.py           Cliente Python com certificado próprio
generate_certs.sh   Gera CA, certificado do servidor e certificado do cliente
setup.sh            Cria ambiente virtual e instala dependências
test_mtls.sh        Testa acesso sem e com certificado de cliente
requirements.txt    Dependências Python
```

Os certificados gerados ficam em `certs/` e não são versionados.

## Pré-requisitos

- Python 3.8 ou superior;
- OpenSSL instalado;
- Git Bash, WSL ou terminal Linux/macOS;
- `pip` e `venv`.

## Como executar

Clone o repositório:

```bash
git clone https://github.com/rodrigorosamuniz/mtls-lab.git
cd mtls-lab
```

Crie o ambiente e instale as dependências:

```bash
./setup.sh
source venv/bin/activate
```

Gere os certificados didáticos:

```bash
./generate_certs.sh
```

Suba o servidor:

```bash
python server.py
```

Em outro terminal, ative o ambiente e execute os testes:

```bash
source venv/bin/activate
./test_mtls.sh
python client.py
```

## Resultado esperado

O teste sem certificado de cliente deve falhar:

```bash
curl -v https://localhost:5000 --cacert certs/ca.crt
```

Esse erro é esperado porque o servidor exige autenticação mútua.

O teste com certificado de cliente deve funcionar:

```bash
curl -v https://localhost:5000 \
  --cert certs/client.crt \
  --key certs/client.key \
  --cacert certs/ca.crt
```

## Cuidados didáticos

Não use chaves privadas, certificados ou dados reais neste laboratório. Os certificados gerados são locais, didáticos e devem ser recriados sempre que necessário com `generate_certs.sh`.

Este projeto não é uma implementação de produção. Em ambientes reais, avalie rotação de certificados, proteção de chaves privadas, cadeia de confiança, revogação, observabilidade e endurecimento do servidor.
