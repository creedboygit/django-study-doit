from django.urls import path

from board import views

urlpatterns = [
    path("", views.BoardList.as_view()),
]
