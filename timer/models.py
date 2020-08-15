from django.db import models
from users.models import User
import math

class Timer(models.Model):
  name = models.CharField(verbose_name='タスク名', max_length=255, null=False, blank=False)
  elapsed_time = models.IntegerField(verbose_name='経過時間', null=False, blank=False, default=0)
  user = models.ForeignKey(User, verbose_name='ユーザー名', on_delete=models.CASCADE)
  created_at = models.DateTimeField(verbose_name='作成日', auto_now_add=True, null=False)
  updated_at = models.DateTimeField(verbose_name='更新日', auto_now=True, null=False)

  def __str__(self):
    return self.name
  
  def conversion_time(self):
    sec = math.floor(self.elapsed_time % 60)
    min = math.floor(self.elapsed_time / 60) % 60
    hour = math.floor(self.elapsed_time / (60 * 60))
    return sec
