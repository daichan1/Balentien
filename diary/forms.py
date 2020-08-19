from django import forms
from markdownx.fields import MarkdownxFormField
from markdownx.widgets import MarkdownxWidget
from .models import Diary

class DiaryForm(forms.ModelForm):

  class Meta:
    model = Diary
    body = MarkdownxFormField()
    fields = ('title', 'body')