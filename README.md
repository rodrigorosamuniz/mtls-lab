# 🔐 Laboratório de mTLS com Python

Este repositório contém um laboratório prático para ensinar **mutual TLS (mTLS)** usando **Flask + Requests**, com certificados gerados via **OpenSSL**.

## 📚 Objetivo

Demonstrar como funciona uma comunicação HTTPS com **autenticação mútua**, onde cliente e servidor **precisam apresentar certificados válidos**.

---

## ⚙️ Pré-requisitos

- Python 3.8+ (ideal Python 3.13)
- OpenSSL instalado
- Git Bash, WSL ou terminal Linux/macOS
- `pip`, `virtualenv`

---

## 🚀 Como executar

```bash
git clone https://github.com/SEU_USUARIO/mtls-lab.git
cd mtls-lab
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
