# Load testing APIs using Locust

## Setup local environment

```
conda create --name locust python=3.8
conda activate locust
pip install -r requirements.txt
locust
```

__Note:__ Before running the last comment make sure that the API server which you want to test is up and running. In locust file change the URL and port. After this is done run `locust` command to run load testing in local.

## Generate HTML report

```
locust -f locustfile.py --headless -u 10 -r 10 --run-time 15s --html=load_test_report.html
```

## Create docker image

```
docker build -t loadtest .
docker run -d -p 8089:8089 loadtest
```