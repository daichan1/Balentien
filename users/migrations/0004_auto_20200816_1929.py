# Generated by Django 3.0.3 on 2020-08-16 10:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_auto_20200816_1400'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='username',
            field=models.CharField(max_length=20, verbose_name='ユーザー名'),
        ),
    ]
