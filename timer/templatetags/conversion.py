from django import template
import math

register = template.Library()

CLOCK_CYCLE = 60

@register.simple_tag
def display_time_notation(time):
  sec = math.floor(time % CLOCK_CYCLE)
  min = math.floor(time / CLOCK_CYCLE) % CLOCK_CYCLE
  hour = math.floor(time / (CLOCK_CYCLE * CLOCK_CYCLE))
  display_sec = str(sec).zfill(2)
  display_min = str(min).zfill(2)
  display_hour = str(hour).zfill(2)
  result = display_hour + ':' + display_min + ':' + display_sec
  return result