<article class="blog-article">
  {% if blog_article_page %}
    <div class="article-content">
      <header class="article-header">
        <h1 class="article-title">{% editable article.title %}</a></h1>
        <div class="article-info">
          <time class="article-date" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}</time> &mdash;
          <span class="article-author">{{ article.author.name }}</span>
        </div>
      </header>
      <div class="article-excerpt content-area">{% editable article.excerpt %}</div>
      <div class="article-body content-area">{% editable article.body %}</div>
    </div>
  {% else %}
    <header class="article-header">
      <h1 class="article-title"><a href="{{ article.url }}">{{ article.title }}</a></h1>
      <div class="article-info">
        <time class="article-date" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | format_date: "long" }}</time> &mdash;
        <span class="article-author">{{ article.author.name }}</span>
      </div>
    </header>

    <div class="article-content">
      <div class="article-excerpt content-area">{{ article.excerpt }}</div>
    </div>
  {% endif %}
</article>
