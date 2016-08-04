<!DOCTYPE html>
{% include "template-variables" %}
<html class="blog-page blog-article-page {{ view_mode }} site-search-closed {{ language_flags_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% assign blog_article_page = true %}
    {% include "template-head" %}
  </head>

  <body>
    {% include "template-svg-spritesheet" %}
    <div class="site-container">
      <div class="wrap">
        {% include "site-header" %}
        <main class="page-content" role="main">
          <section class="blog-article content-area">
            <div class="content-body" data-search-indexing-allowed="true">
              <div class="content-inner">
                {% include "blog-article-template" with "article_page" %}
              </div>
            </div>
          </section>
          {% include "blog-article-comments" %}
        </main>
        {% include "site-footer" %}
      </div>
    </div>

    {% include "menu-language-popover" %}
    {% include "template-tools" %}
    {% include "site-search "%}
    {% include "template-javascripts" %}
    
    <script>
      site.initArticlePage();
    </script>
  </body>

</html>
