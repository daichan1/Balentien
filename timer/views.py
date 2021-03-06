from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, Http404
from django.http.response import JsonResponse 
from django.utils import timezone
from .models import Timer
from .forms import TimerForm
from .utils import HistoryGraph
import json

@login_required
def index(request):
  now = timezone.datetime.now()
  timers = Timer.objects.filter(
    user_id=request.user.id,
    created_at__year=now.year,
    created_at__month=now.month,
    created_at__day=now.day
  ).order_by("-updated_at")
  return render(request, "timer/index.html", {'timers': timers})

@login_required
def detail(request):
  params = request.GET
  timer = Timer.objects.filter(
    user_id=request.user.id,
    name=params["name"],
    created_at__year=params["year"],
    created_at__month=params["month"],
    created_at__day=params["day"]
  ).first()
  if timer:
    res = {'id': timer.id, 'name': timer.name, 'elapsed_time': timer.elapsed_time}
    return JsonResponse(res)
  else:
    res = {'name': params["name"], 'elapsed_time': 0}
    return JsonResponse(res)

@login_required
def create(request):
  if request.method == 'POST':
    form = TimerForm(request.POST)
    if form.is_valid():
      timer = form.save(commit=False)
      timer.user_id = request.user.id
      timer.save()
      res = {'name': timer.name, 'elapsed_time': timer.elapsed_time}
      return JsonResponse(res)
    else:
      res = {'error_message': '適切な入力値ではありません'}
      return JsonResponse(res)
  else:
    res = {'error_message': 'error'}
    return JsonResponse(res)

@login_required
def update(request, pk):
  timer = Timer.objects.get(user_id=request.user.id, pk=pk)
  if request.method == 'POST':
    form = TimerForm(request.POST, instance=timer)
    if form.is_valid():
      update_timer = form.save(commit=False)
      update_timer.save()
      res = {'name': timer.name, 'elapsed_time': timer.elapsed_time}
      return JsonResponse(res)
    else:
      res = {'error_message': '適切な入力値ではありません'}
      return JsonResponse(res)
  else:
    res = {'error_message': 'error'}
    return JsonResponse(res)

@login_required
def delete(request, pk):
  if request.method == 'POST':
    timer = Timer.objects.get(user_id=request.user.id, pk=pk)
    timer.delete()
    return redirect('timer:index')
  else:
    raise Http404

@login_required
def history(request):
  now = timezone.datetime.now()
  week = HistoryGraph.display_period_week(now)
  display_monday = week['monday'].strftime('%Y/%m/%d')
  display_sunday = week['sunday'].strftime('%Y/%m/%d')
  return render(request, 'timer/history.html', {'monday': display_monday, 'sunday': display_sunday})

@login_required
def get_svg(request):
  # 本当はURLリクエストで日付をするのは調査中
  now = timezone.datetime.now()
  week = HistoryGraph.display_period_week(now)
  start = timezone.make_aware(week['monday'])
  end = timezone.make_aware(week['sunday'])
  timers = Timer.objects.filter(user_id=request.user.id, created_at__range=(start, end))
  svg = HistoryGraph.create_graph(timers, start, end)
  response = HttpResponse(svg, content_type='image/svg+xml')
  return response