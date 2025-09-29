ARG PYTHON_VERSION=3.8 

FROM python:${PYTHON_VERSION}-slim AS build

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN apt-get update && \
    apt-get install -y gcc python3-dev build-essential && \
    rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

FROM python:${PYTHON_VERSION}-slim AS run

WORKDIR /app

COPY --from=build /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
COPY --from=build /usr/local/bin /usr/local/bin

COPY . .

EXPOSE 8080

CMD ["sh", "-c", "python manage.py migrate --noinput && python manage.py runserver 0.0.0.0:8080"]
