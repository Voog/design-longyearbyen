<!DOCTYPE html>
{% include "template-variables" %}
{% include "blog-article-variables" %}
<html class="blog-page blog-and-news-page content-page {{ view_mode }} site-search-closed {{ language_flags_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" with "blog_list_page" %}
  </head>

  <body>
    {% include "template-svg-spritesheet" %}
    <div class="site-container">
      <div class="wrap">
        {% include "site-header" %}
        <main class="page-content" role="main">

          <section class="blog-articles content-area">
            <div class="content-body" data-search-indexing-allowed="true">
              {% include "blog-news-tags" %}
              <div class="content-inner"> 
                <div class="blog-intro-content" {{ edy_intro_edit_text }}>{% content %}</div>
               
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
                      {% assign article_year = article.created_at | format_date: "%Y" | to_num %}
                      <p class="article-title"><a href="{{ article.url }}">{{ article.title }}</a></p>
                      <p class="article-date"><time datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{% if article_year == current_year %}{{ article.created_at | format_date: "long_without_year" }}{% else %}{{ article.created_at | format_date: "long" }}{% endif %}</time></p>
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

    <script>template.initBlogPage();</script>
  </body>
</html>
