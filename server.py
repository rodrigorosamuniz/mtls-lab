import ssl

from flask import Flask
from werkzeug.serving import make_server

app = Flask(__name__)

@app.route('/')
def hello():
    return '✅ Conexão mTLS estabelecida com sucesso!'

if __name__ == '__main__':
    context = ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
    context.load_cert_chain(certfile='certs/server.crt', keyfile='certs/server.key')
    context.load_verify_locations(cafile='certs/ca.crt')
    context.verify_mode = ssl.CERT_REQUIRED
    context.minimum_version = ssl.TLSVersion.TLSv1_2

    server = make_server('127.0.0.1', 5000, app, ssl_context=context)
    print('Servidor mTLS ouvindo em https://localhost:5000')
    server.serve_forever()
