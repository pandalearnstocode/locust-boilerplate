FROM python:3.8.8-slim as builder
COPY requirements.txt /app/requirements.txt
WORKDIR app
RUN pip install --user -r requirements.txt
COPY . /app
FROM python:3.8.0-slim as app
COPY --from=builder /root/.local /root/.local
COPY --from=builder /app/locustfile.py /app/locustfile.py
WORKDIR app
ENV PATH=/root/.local/bin:$PATH
EXPOSE 8089
ENTRYPOINT locust