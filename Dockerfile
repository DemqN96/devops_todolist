ARG PYTHON_VERSION=3.8 

FROM python:${PYTHON_VERSION}-slim AS build

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN apt-get update && \
    apt-get install -y gcc python3-dev musl-dev && \
    rm -rf /var/lib/apt/lists/*
RUN pip install -r requirements.txt

COPY . .

RUN python manage.py migrate

FROM build AS run

WORKDIR /app

EXPOSE 8080

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
