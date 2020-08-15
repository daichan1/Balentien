from django import forms
from django.contrib import admin
from django.contrib.auth.models import Group
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.forms import ReadOnlyPasswordHashField
from .models import User

class UserCreationForm(forms.ModelForm):
  password = forms.CharField(label='Password', widget=forms.PasswordInput)
  password_confirmation = forms.CharField(label='Password Confirmation', widget=forms.PasswordInput)

  class Meta:
    model = User
    fields = ('username', 'email')

  def clean_password_confirmation(self):
    password = self.cleaned_data.get('password')
    password_confirmation = self.cleaned_data.get('password_confirmation')
    if password and password_confirmation and password != password_confirmation:
      raise forms.ValidationError("Password don't match")
    return password_confirmation

  def save(self, commit=True):
    user = super().save(commit=False)
    user.set_password(self.cleaned_data["password"])
    if commit:
      user.save()
    return user

class UserChangeForm(forms.ModelForm):
  password = ReadOnlyPasswordHashField()

  class Meta:
    model = User
    fields = ('username', 'email', 'password', 'is_active', 'is_admin')
  
  def clean_password(self):
    return self.initial["password"]

class UserAdmin(BaseUserAdmin):
  form = UserChangeForm
  add_form = UserCreationForm

  list_display = ('username', 'email', 'is_admin')
  list_filter = ('is_admin',)
  fieldsets = (
    (None, {'fields': ('email', 'password',)}),
    ('管理者権限', {'fields': ('is_admin',)}),
  )
  add_fieldsets = (
    (None, {
      'classes': ('wide',),
      'fields': ('username', 'email', 'password', 'password_confirmation',)
    }),
  )

  search_fields = ('username',)
  ordering = ('username',)
  filter_horizontal = ()

admin.site.register(User, UserAdmin)
admin.site.unregister(Group)