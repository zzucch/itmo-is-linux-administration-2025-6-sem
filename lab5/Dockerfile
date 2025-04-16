FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
RUN useradd --system zcchr && \
    chown -R zcchr:zcchr /app

USER zcchr
COPY --chown=zcchr:zcchr . .

EXPOSE 5000

CMD ["python", "app.py"]
