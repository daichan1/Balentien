# Generated by Django 3.0.3 on 2020-07-22 05:28

from django.db import migrations
import markdownx.models


class Migration(migrations.Migration):

    dependencies = [
        ('diary', '0005_auto_20200722_1426'),
    ]

    operations = [
        migrations.AlterField(
            model_name='diary',
            name='body',
            field=markdownx.models.MarkdownxField(help_text='Markdown形式で本文を書こう', verbose_name='本文'),
        ),
    ]
