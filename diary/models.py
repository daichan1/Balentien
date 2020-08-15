from django.db import models
from markdownx.models import MarkdownxField
from users.models import User

class Diary(models.Model):
  title = models.CharField(verbose_name='タイトル', max_length=255, null=False, blank=False)
  body = MarkdownxField(verbose_name='本文', help_text="Markdown形式で本文を書こう", null=False, blank=False)
  user = models.ForeignKey(User, verbose_name='執筆者', on_delete=models.CASCADE)
  created_at = models.DateTimeField(verbose_name='作成日', auto_now_add=True, null=False)
  updated_at = models.DateTimeField(verbose_name='更新日', auto_now=True, null=False)

  def __str__(self):
    return self.title
