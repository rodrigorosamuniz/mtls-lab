# 🔐 Laboratórios TLS e mTLS com Python

Este repositório contém laboratórios práticos para ensinar **TLS**, **HTTPS** e **mutual TLS (mTLS)** usando Python, Docker e OpenSSL.

## 📚 Objetivo

Demonstrar como certificados digitais, autoridades certificadoras, HTTPS e autenticação mútua funcionam na prática.

## 🧪 Laboratórios

| Laboratório | Tema | Material |
| --- | --- | --- |
| TLS, certificados e HTTPS | HTTP vs HTTPS, CA local, certificado de servidor, SAN, cadeia de confiança e relação com Let's Encrypt | [Abrir lab](labs/tls-certificados-https/README.md) |
| mTLS com Python | HTTPS com autenticação mútua entre cliente e servidor usando certificados | Arquivos na raiz do repositório |

---

## ⚙️ Pré-requisitos

- Python 3.8+ (ideal Python 3.13)
- OpenSSL instalado
- Git Bash, WSL ou terminal Linux/macOS
- `pip`, `virtualenv`

---

## 🚀 Como executar o lab mTLS da raiz

```bash
git clone https://github.com/rodrigorosamuniz/mtls-lab.git
cd mtls-lab
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
