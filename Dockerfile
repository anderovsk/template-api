# Imagem base do Python
FROM python:3.9

# Configuração do diretório de trabalho
WORKDIR /app

# Copia o código fonte da aplicação para o diretório de trabalho
COPY . .
COPY requirements.txt .
RUN pip3 install -r requirements.txt
# Instala o servidor WSGI gunicorn
RUN pip install gunicorn

# Define a porta em que a aplicação será executada
EXPOSE 5000

# Comando para iniciar a aplicação usando o servidor WSGI gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
