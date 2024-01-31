FROM python:3.12.1

ENV PYTHONUNBUFFERED = 1

WORKDIR /usr/src/app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# collectstatic 실행
RUN python manage.py collectstatic --noinput

RUN apt-get update && apt-get install -y vim

#CMD ["python", "manage.py", "runserver", "0:8000"]
CMD ["gunicorn", "--bind", "0:8000", "django_project_doit.wsgi:application"]

EXPOSE 8000
