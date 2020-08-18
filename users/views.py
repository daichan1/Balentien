from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from django.contrib.auth import login, logout, get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import (
  LoginView, LogoutView
)
from .forms import LoginForm, SingUpForm

User = get_user_model()

class Login(LoginView):
  # ログイン画面
  def get(self, request, *args, **kwargs):
    # ログイン中はトップページへ遷移
    if request.user.is_anonymous:
      form = LoginForm()
      return render(request, 'users/login.html', {'form': form})
    else:
      return redirect('index')
  
  # ログイン処理
  def post(self, request, *args, **kwargs):
    form = LoginForm(data=request.POST)
    if form.is_valid():
      username = form.cleaned_data.get('username')
      user = User.objects.get(username=username)
      login(request, user)
      return redirect('timer:index')
    return render(request, 'users/login.html', {'form': form})

class Logout(LogoutView):
  
  def get(self, request, *args, **kwargs):
    return render(request, 'users/logout.html')
  
  def post(self, request, *args, **kwargs):
    return redirect('users:logout')

class SignUp(CreateView):
  form_class = SingUpForm

  # 会員登録画面
  def get(self, request, *args, **kwargs):
    # ログイン中はトップページへ遷移
    if request.user.is_anonymous:
      form = SingUpForm()
      return render(request, 'users/signup.html', {'form': form})
    else:
      return redirect('index')

  def form_valid(self, form):
    user = form.save(commit=False)
    user.save()
    login(self.request, user)
    return redirect('timer:index')
