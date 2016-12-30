<!DOCTYPE html>
{% include "template-variables" %}
<html class="blog-page blog-and-news-page {{ view_mode }} site-search-closed {{ language_flags_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="blog-news-page">
    {% include "template-svg-spritesheet" %}
    <div class="site-container">
      <div class="wrap">
        {% include "site-header" %}
        <main class="page-content" role="main">

          <section class="blog-articles content-area">
            <div class="content-body" data-search-indexing-allowed="true">
              {% include "blog-news-tags" %}
              <div class="content-inner">
                {% addbutton %}
                {% for article in articles limit: 5 %}
                  {% include "blog-article-template" %}
                {% endfor %}
              </div>
            </div>
          </section>

          {% assign articles_size = articles | size %}
          {% if articles_size >= 6 %}
            <section class="articles-listing content-area">
              <div class="content-body" data-search-indexing-allowed="true">
                <div class="content-inner older-post">

                  <header class="articles-listing-header">
                    <h2 class="articles-listing-title">{{ "older_news" | lc }}</h2>
                  </header>
                  {% for article in articles offset: 5 %}
                    <article class="blog-article">
                        <p class="article-title"><a href="{{ article.url }}">{{ article.title }}</a></p>
                        <p class="article-date"><time class="" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}</time></p>
                    </article>
                  {% endfor %}

                </div>
              </div>
            </section>
          {% endif %}

        </main>

        {% include "site-footer" %}
      </div>
    </div>

    {% include "mobilemenu" %}
    {% include "menu-language-popover" %}
    {% include "template-tools" %}
    {% include "site-search" %}
    {% include "template-javascripts" %}

    <script>site.initBlogPage();</script>
  </body>
</html>
