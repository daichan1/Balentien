from django.contrib import admin
from markdownx.admin import MarkdownxModelAdmin
from .models import Diary

class DiaryAdmin(MarkdownxModelAdmin):
  list_display = ('title', 'user', 'created_at', 'updated_at')

admin.site.register(Diary, DiaryAdmin)
