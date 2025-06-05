import requests
import ssl
from urllib3.util.ssl_ import create_urllib3_context
from requests.adapters import HTTPAdapter
from requests.packages.urllib3.poolmanager import PoolManager

CA_CERT = 'certs/ca.crt'
CLIENT_CERT = ('certs/client.crt', 'certs/client.key')

class TLSAdapter(HTTPAdapter):
    def init_poolmanager(self, *args, **kwargs):
        ctx = create_urllib3_context()
        ctx.minimum_version = ssl.TLSVersion.TLSv1_2
        ctx.verify_mode = ssl.CERT_REQUIRED
        ctx.check_hostname = True
        ctx.load_verify_locations(cafile=CA_CERT)
        kwargs['ssl_context'] = ctx
        super().init_poolmanager(*args, **kwargs)

session = requests.Session()
session.mount("https://", TLSAdapter())

try:
    response = session.get(
        "https://localhost:5000",
        cert=CLIENT_CERT,
        timeout=5
    )
    print("🔐 Sucesso:", response.text)
except Exception as e:
    print("❌ Erro:", e)
