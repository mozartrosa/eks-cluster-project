
#importa das classes
from flask import Flask
from flask import jsonify
from flask import request
# instrumentação para o monitoramento
from prometheus_client import start_http_server, Counter
import random
import time

app_name = 'comentarios'
app = Flask(app_name)
app.debug = True
#dicionario
comments = {}
# especifica que esta rota só aceita requisições HTTP do tipo POST.
@app.route('/api/comment/new', methods=['POST'])
def api_comment_new():
    request_data = request.get_json()

    email = request_data['email']
    comment = request_data['comment']
    content_id = '{}'.format(request_data['content_id'])

    new_comment = {
            'email': email,
            'comment': comment,
            }

    if content_id in comments:
        comments[content_id].append(new_comment)
    else:
        comments[content_id] = [new_comment]

    message = 'comment created and associated with content_id {}'.format(content_id)
    response = {
            'status': 'SUCCESS',
            'message': message,
            }
    
    return jsonify(response)


@app.route('/api/comment/list/<content_id>')
def api_comment_list(content_id):
    content_id = '{}'.format(content_id)

    if content_id in comments:
        return jsonify(comments[content_id])
    else:
        message = 'content_id {} not found'.format(content_id)
        response = {
                'status': 'NOT-FOUND',
                'message': message,
                }
        return jsonify(response), 404
    
# Criação de uma métrica do tipo contador
REQUEST_COUNT = Counter('app_requests_total',
                             'Total de requisições processadas')
def process_request():
    """Simula o processamento de uma requisição"""
    REQUEST_COUNT.inc()  # Incrementa o contador para cada requisição
    time.sleep(random.random())  # Simula o tempo de processamento
    # Inicia o servidor HTTP para expor as métricas do Prometheus na porta 7000.
if __name__ == '__main__':
    start_http_server(7000)
    print("Servidor de métricas iniciado na porta 8000")
    
    # Simula um loop contínuo de processamento de requisições
    while True:
        process_request()
