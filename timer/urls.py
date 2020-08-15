from django.urls import path
from . import views

app_name = 'timer'
urlpatterns = [
  path('', views.index, name='index'),
  path('detail/', views.detail, name='detail'),
  path('create/', views.create, name='create'),
  path('<int:pk>/update/', views.update, name='update'),
  path('<int:pk>/delete/', views.delete, name='delete'),
  path('history/', views.history, name='history'),
  path('history/graph/', views.get_svg, name='graph')
]