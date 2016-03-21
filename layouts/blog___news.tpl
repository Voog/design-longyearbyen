<!DOCTYPE html>
{% include "template-variables" %}
<html class="blog-page blog-and-news-page {{ view_mode }} site-search-closed {{ language_flags_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body>
    {% include "template-svg-spritesheet" %}
    <div class="site-container">
      <div class="wrap">
        {% include "site-header" %}
        <main class="page-content" role="main">
          <section class="blog-articles content-area">
            <div class="content-body">
              <div class="content-inner">
                {% addbutton %}
                {% for article in articles %}
                  {% include "blog-article-template" %}
                {% endfor %}
              </div>
            </div>
          </section>
        </main>
        {% include "site-footer" %}
      </div>
    </div>
    
    {% include "menu-language-popover" %}
    {% include "template-tools" %}
    {% include "template-javascripts" %}
    {% include "site-search "%}
    
    <script>site.initBlogPage();</script>
    
  </body>
</html>
