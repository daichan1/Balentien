from django.contrib import admin
from .models import Timer

class TimerAdmin(admin.ModelAdmin):
  list_display = ('name', 'elapsed_time', 'is_active', 'user', 'created_at', 'updated_at')

admin.site.register(Timer)
