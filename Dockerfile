# minimal conda environment
# Build --> docker build -t conda/jupyterlab .
# Run   --> docker run --rm -it -p 8888:8888 -v conda-work:/root conda/jupyterlab
FROM python:slim

RUN apt-get update && apt-get -y upgrade \
    && apt-get install -y --no-install-recommends \
    g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /project

COPY ./requirements.txt /project

COPY ./main.py /project

RUN pip3 install -r requirements.txt

CMD ["python","main.py"]