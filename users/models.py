from django.db import models
from django.contrib.auth.models import (BaseUserManager, AbstractBaseUser)

# CUIからユーザーを操作する時の設定
class UserManager(BaseUserManager):
  def create_user(self, username, email, password=None):
    if not username:
      raise ValueError('Users must have an username')
    elif not email:
      raise ValueError('Users must have an email address')

    user = self.model(username=username, email=self.normalize_email(email),)

    user.set_password(password)
    user.save(using=self._db)
    return user

  def create_superuser(self, username, email, password=None):
    user = self.create_user(username, email, password=password,)

    user.is_admin = True
    user.save(using=self._db)
    return user

class User(AbstractBaseUser):
  username = models.CharField(verbose_name='ユーザー名', max_length=20, unique=True, null=False, blank=False)
  email = models.EmailField(verbose_name='メールアドレス', max_length=255, unique=True, null=False, blank=False)
  is_active = models.BooleanField(default=True)
  is_admin = models.BooleanField(default=False)
  created_at = models.DateTimeField(auto_now_add=True, null=False)
  updated_at = models.DateTimeField(auto_now=True, null=False)

  objects = UserManager()

  USERNAME_FIELD = 'username'
  EMAIL_FIELD = 'email'
  REQUIRED_FIELDS = ['email']

  def __str__(self):
    return self.username
  
  def has_perm(self, perm, obj=None):
    # 権限チェックのためのメソッド
    return True

  def has_module_perms(self, app_label):
    return True

  @property

  def is_staff(self):
    return self.is_admin

