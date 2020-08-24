# Timerで使用する便利機能をまとめる
from django.utils.timezone import make_aware
import datetime
import pandas as pd
import matplotlib as mpl
mpl.use('SVG')
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import numpy as np
import io
import math

class HistoryGraph():

  @classmethod
  def create_graph(self, timers, start, end):
    timer_date = self.__set_timer_data(self, timers, start, end)
    graph_date = self.__create_graph_data(timer_date)

    mpl.rcParams['font.family'] = 'Hiragino Sans'
    ax = plt.subplot()
    ax.set(xlabel='日付', ylabel='時間(時)')
    ax.xaxis.set_major_locator(mdates.DayLocator())
    ax.xaxis.set_major_formatter(mdates.DateFormatter('%m-%d'))

    before_date = None
    before_elapsed_time = 0
    total_elapsed_time = 0
    colors = ['b', 'c', 'y', 'r', 'g', 'm']
    for date, elapsed_time in zip(graph_date.index, graph_date.elapsed_time):
      # 日付が異なった場合、0から積み上げ
      if before_date != date:
        before_elapsed_time = 0
        color_number = 0
      else:
        color_number = 0 if color_number >= len(colors) - 1 else color_number + 1
      ax.bar(date, elapsed_time, bottom=before_elapsed_time, color=colors[color_number], label='test')
      before_date = date
      before_elapsed_time += elapsed_time
      total_elapsed_time += elapsed_time
    
    y_limit = math.ceil(total_elapsed_time)
    plt.ylim(0, y_limit)
    svg = self.__plt_to_svg()
    return svg
  
  @classmethod
  def display_period_week(self, date):
    # 任意の日付から月曜から始まる1週間を算出(この期間のグラフを表示する)
    monday = date - datetime.timedelta(days=date.weekday())
    sunday = monday + datetime.timedelta(days=6)
    week = {'monday': monday, 'sunday': sunday}
    return week

  def __create_graph_data(timer_date):
    # 配列の要素数は同じである必要がある
    df = pd.DataFrame(
      {
        'date': timer_date['date'],
        'elapsed_time': timer_date['elapsed_time'],
      }
    )
    # 時系列データに変換
    df.index = pd.DatetimeIndex(pd.to_datetime(df.date))
    return df

  def __set_timer_data(self, timers, start, end):
    default_data = self.__set_default_timer_data(start, end)
    for timer in timers:
      default_data['date'].append(timer.created_at.strftime('%Y/%m/%d'))
      default_data['elapsed_time'].append(timer.conversion_hour_time())
    result = {'date': default_data['date'], 'elapsed_time': default_data['elapsed_time']}
    return result

  def __set_default_timer_data(start, end):
    default_date = []
    default_elapsed_time = []
    for i in range((end - start).days + 1):
      day = start + datetime.timedelta(i)
      default_date.append(day.strftime('%Y/%m/%d'))
      default_elapsed_time.append(0)
    default_data = {'date': default_date, 'elapsed_time': default_elapsed_time}
    return default_data

  # SVGへ変換
  # PCのメインメモリにグラフ画像(SVG形式)を保存し、戻り値としてSVGタグを返す。
  # メインメモリのグラフ画像は1回毎にメモリ領域を解放する
  def __plt_to_svg():
    buf = io.BytesIO()
    plt.savefig(buf, format='svg', bbox_inches='tight')
    svg = buf.getvalue()
    buf.close()
    plt.cla()
    return svg