from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from .models import Diary
from .forms import DiaryForm

@login_required
def index(request):
  year = request.GET.get("year")
  month = request.GET.get("month")
  if year and month:
    if year.isdigit() and month.isdigit():
      diaries = Diary.objects.filter(user_id=request.user.id, updated_at__year=year, updated_at__month=month).order_by("-updated_at")
    else:
      diaries = []
  else:
    now = timezone.datetime.now()
    diaries = Diary.objects.filter(user_id=request.user.id, updated_at__month=now.month).order_by("-updated_at")
  filter_diaries = Diary.objects.filter(user_id=request.user.id)
  dates = filter_diaries.dates('updated_at', 'month', order='DESC')
  return render(request, 'diary/index.html', {'diaries': diaries, 'dates': dates})

@login_required
def detail(request, pk):
  diary = get_object_or_404(Diary, pk=pk)
  return render(request, 'diary/detail.html', {'diary': diary})

@login_required
def new(request):
  form = DiaryForm()
  return render(request, 'diary/new.html', {'form': form})

@login_required
def create(request):
  if request.method == "POST":
    form = DiaryForm(request.POST)
    if form.is_valid():
      diary = form.save(commit=False)
      diary.user_id = request.user.id
      diary.save()
      return redirect('diary:detail', pk=diary.id)
  else:
    form = DiaryForm()
  return render(request, 'diary/new.html', {'form': form})

@login_required
def edit(request, pk):
  diary = get_object_or_404(Diary, pk=pk)
  form = DiaryForm(instance=diary)
  return render(request, 'diary/edit.html', {'diary': diary, 'form': form})

@login_required
def update(request, pk):
  diary = Diary.objects.get(user_id=request.user.id, pk=pk)
  if request.method == "POST":
    form = DiaryForm(request.POST, instance=diary)
    if form.is_valid():
      update_diary = form.save(commit=False)
      update_diary.save()
      return redirect('diary:detail', pk=diary.id)
  else:
    form = DiaryForm(instance=diary)
  return render(request, 'diary/edit.html', {'diary': diary, 'form': form})

@login_required
def delete(request, pk):
  diary = Diary.objects.get(user_id=request.user.id, pk=pk)
  diary.delete()
  return redirect('diary:index')