# Generated by Django 3.0.3 on 2020-08-04 06:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('timer', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='timer',
            name='is_active',
        ),
    ]
