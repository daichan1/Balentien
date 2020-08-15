from django import template
from django.conf import settings
import markdown
from django.utils.safestring import mark_safe
from markdown.extensions import Extension

# Djangoのテンプレートタグライブラリ
register = template.Library()

class EscapeHtml(Extension):
  def extendMarkdown(self, md):
    # md.safeMode = "escape"
    # ブロックタグのエスケープ
    md.preprocessors.deregister('html_block')
    # インラインタグのエスケープ
    md.inlinePatterns.deregister('html')

# カスタムタグを登録
@register.simple_tag
def display_body_markdown(body):
  # 拡張機能追加 + HTMLエスケープ
  print("test")
  extensions = settings.MARKDOWNX_MARKDOWN_EXTENSIONS + [EscapeHtml()]
  html = markdown.markdown(body, extensions=extensions)
  return mark_safe(html)