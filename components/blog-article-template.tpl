<article class="blog-article">
  {% if blog_article_page %}
    <div class="article-content">
      <header class="article-header">
        <h1 class="article-title">{% editable article.title %}</a></h1>
        <div class="article-info">
          {% assign article_year = article.created_at | format_date: "%Y" | to_num %}
          <time class="article-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{% if article_year == current_year %}{{ article.created_at | format_date: "long_without_year" }}{% else %}{{ article.created_at | format_date: "long" }}{% endif %}</time>
          <span class="article-author">{{ article.author.name }}</span>
        </div>
      </header>
      <div class="article-excerpt content-area">{% editable article.excerpt %}</div>
      <div class="article-body content-area">{% editable article.body %}</div>
      <div class="article-body content-area">{% content name="additional_body" bind="Article" %}</div>
    </div>
  {% else %}
    <header class="article-header">
      <h1 class="article-title"><a href="{{ article.url }}">{{ article.title }}</a></h1>
      <div class="article-info">
        {% assign article_year = article.created_at | format_date: "%Y" | to_num %}
        <time class="article-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{% if article_year == current_year %}{{ article.created_at | format_date: "long_without_year" }}{% else %}{{ article.created_at | format_date: "long" }}{% endif %}</time>
        <span class="article-author">{{ article.author.name }}</span>
      </div>
    </header>

    <div class="article-content">
      <div class="article-excerpt content-area">{{ article.excerpt }}</div>
      <div class="article-readmore "><a class="article-read-more-btn" href="{{ article.url }}">{{ "read_more" | lc }}</a></div>
    </div>
  {% endif %}
</article>
