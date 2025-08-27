# Selecionando SO para aplicação com atualizações, desabilitando configurações com interatividade
FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y python3.9 python3.9-dev pip

# Configurando diretório atual para o diretório /app a ser executado no container
COPY ./app /app

# Instalando dependências
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Expondo porta da aplicação
EXPOSE 8000

# Expondo porta para a coleta de métricas da aplicação
EXPOSE 7000

# Comando de Inicialização
WORKDIR /app
CMD cd /app;  python3 api.py 
