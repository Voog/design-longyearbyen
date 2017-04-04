<!DOCTYPE html>
{% include "template-variables" %}
<html class="blog-page blog-article-page content-page {{ view_mode }} site-search-closed {{ language_flags_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
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
                {% include "blog-article-variables" %}

                {% include "blog-article-template" blog_article_page: true %}
                
                {% include "blog-article-tags" %}

                {% if article.older or article.newer %}
                  <div class="post-nav">
                    <div class="post-nav-inner">
                      {% if article.older %}
                        <a class="post-nav-link {% if article.newer %}post-nav-link-half{% else %}post-nav-link-full{% endif %}" href="{{ article.older.url }}">
                          <div class="post-nav-link-inner">
                            <div class="post-nav-direction">{{ "previous" | lc }}</div>
                            <div class="post-nav-title">{{ article.older.title }}</div>
                          </div>
                        </a>
                      {% endif %}

                      {% if article.newer %}
                        <a class="post-nav-link {% if article.older %}post-nav-link-half{% else %}post-nav-link-full{% endif %}" href="{{ article.newer.url }}">
                          <div class="post-nav-link-inner">
                            <div class="post-nav-direction">{{ "next" | lc }}</div>
                            <div class="post-nav-title">{{ article.newer.title }}</div>
                          </div>
                        </a>
                      {% endif %}
                    </div>
                  </div>
                {% endif %}

              </div>
            </div>
          </section>
          {% include "blog-article-comments" %}
        </main>
        {% include "site-footer" %}
      </div>
    </div>

    {% include "mobilemenu" %}
    {% include "menu-language-popover" %}
    {% include "template-tools" %}
    {% include "site-search" %}
    {% include "template-javascripts" %}

    <script>
      template.initArticlePage();
    </script>
  </body>

</html>
