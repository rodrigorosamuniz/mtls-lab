from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return '✅ Conexão mTLS estabelecida com sucesso!'

if __name__ == '__main__':
    context = (
        'certs/server.crt',
        'certs/server.key'
    )
    app.run(host='127.0.0.1', port=5000, ssl_context=context)
