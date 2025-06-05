#!/bin/bash

echo "Criando ambiente virtual..."
python3 -m venv venv

echo "Ambiente virtual criado."

echo "Ativando ambiente virtual e instalando dependências..."
source venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt

echo "Tudo pronto! Para iniciar o servidor:"
echo ""
echo "1. Ative o ambiente virtual:"
echo "   source venv/bin/activate"
echo ""
echo "2. Rode o servidor:"
echo "   python server.py"
echo ""
echo "3. Rode o cliente em outro terminal (também com o ambiente ativado):"
echo "   python client.py"
