FROM python:3.12.1

WORKDIR /usr/src/app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# collectstatic 실행
RUN python manage.py collectstatic --noinput

#CMD ["python", "manage.py", "runserver", "0:8000"]
CMD ["gunicorn", "--bind", "0:8000", "django_project_doit.wsgi:application"]

#EXPOSE 8000
