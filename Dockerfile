FROM python:3.12.1

WORKDIR /usr/src/app

COPY . .

RUN pip install -r requirements.txt

CMD ["python", "manage.py", "runserver", "0:8000"]

EXPOSE 8000
