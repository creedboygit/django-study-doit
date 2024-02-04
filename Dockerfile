FROM python:3.12.1

ENV PYTHONUNBUFFERED = 1

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y inetutils-ping
#RUN apt-get install -y python3-pip

WORKDIR /app

COPY requirements.txt .

RUN python3 -m pip install --upgrade pip
RUN pip3 install -r requirements.txt

COPY . .

# collectstatic 실행
#RUN python manage.py collectstatic --noinput
#RUN python manage.py makemigrations
#RUN python manage.py migrate


#CMD ["python", "manage.py", "runserver", "0:8000"]
#CMD ["gunicorn", "--bind", "0:8000", "django_project_doit.wsgi:application"]

EXPOSE 8000

## 기본 이미지로 Python 3.8을 사용
#FROM python:3.8
#
## 환경 변수 설정
#ENV PYTHONDONTWRITEBYTECODE 1
#ENV PYTHONUNBUFFERED 1
#
## 작업 디렉터리 설정
#WORKDIR /code
#
## 의존성 파일 복사 및 설치
#COPY requirements.txt /code/
#RUN pip install --no-cache-dir -r requirements.txt
#
## 프로젝트 파일 복사
#COPY . /code/
#
## Gunicorn 실행
#CMD ["gunicorn", "--bind", "0.0.0.0:8000", "your_project_name.wsgi:application"]
