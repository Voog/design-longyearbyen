<article class="blog-article">
  {% unless blog_article_page %}
    <header class="article-header">
      <h1 class="article-title">{% if blog_article_page %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
      <div class="article-info">
        <time class="article-date" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}</time> &mdash;
        <span class="article-author">{{ article.author.name }}</span>
      </div>
    </header>
  {% endunless %}

  {% if blog_article_page %}
    <div class="article-content">
      <header class="article-header">
        <h1 class="article-title">{% if blog_article_page %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h1>
        <div class="article-info">
          <time class="article-date" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}</time> &mdash;
          <span class="article-author">{{ article.author.name }}</span>
        </div>
      </header>
      <div class="article-excerpt content-area">{% if blog_article_page %}{% editable article.excerpt %}{% else %}{{ article.excerpt }}{% endif %}</div>
      <div class="article-body content-area">{% if blog_article_page %}{% editable article.body %}{% endif %}</div>
    </div>
  {% else %}
    <div class="article-content">
      <div class="article-excerpt content-area">{{ article.excerpt }}</div>
    </div>
  {% endif %}
</article>
