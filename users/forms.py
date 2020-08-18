from django.contrib.auth.forms import (
  AuthenticationForm,
  UserCreationForm
)
from django.contrib.auth import get_user_model

User = get_user_model()

class LoginForm(AuthenticationForm):

  def __init__(self, *args, **kwargs):
    super().__init__(*args, **kwargs)
    for field in self.fields.values():
      field.widget.attrs['class'] = 'form-control'
      field.widget.attrs['placeholder'] = field.label

class SingUpForm(UserCreationForm):

  class Meta:
    model = User
    fields = ('username', 'email')

  def __init__(self, *args, **kwargs):
    super().__init__(*args, **kwargs)
    for field in self.fields.values():
      field.widget.attrs['class'] = 'form-control'
      field.widget.attrs['placeholder'] = field.label