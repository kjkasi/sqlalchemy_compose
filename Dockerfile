# For more information, please refer to https://aka.ms/vscode-docker-python
FROM  kjkasi/python-image

WORKDIR /app
COPY . /app

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
#CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
CMD ["sh", "-c", "python /tmp/debugpy --listen 0.0.0.0:5678 -m uvicorn app.main:app --host 0.0.0.0 --port 80 --reload"]
#CMD ["sh", "-c", "python /tmp/debugpy --listen 0.0.0.0:5678 --wait-for-client -m uvicorn app.main:app --host 0.0.0.0 --port 80 --reload"]
