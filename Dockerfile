FROM python:3.12.1

ENV PYTHONUNBUFFERED = 1

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y inetutils-ping
#RUN apt-get install -y python3-pip

WORKDIR /app

COPY requirements.txt .

RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

# collectstatic 실행
RUN python manage.py collectstatic --noinput
RUN python manage.py makemigrations

#CMD ["python", "manage.py", "runserver", "0:8000"]
CMD ["gunicorn", "--bind", "0:8000", "django_project_doit.wsgi:application"]

EXPOSE 8000
