import json
from locust import HttpUser, task, between
from loguru import logger

class APIUser(HttpUser):
    host = 'http://10.240.1.112:80'
    wait_time = between(3, 5)
    @task()
    def tictoc_endpoint(self):
        response = self.client.get('/tic')
        logger.info("Response status code:", response.status_code)
        logger.info("Response content:", response.text)