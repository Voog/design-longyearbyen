{% if editmode %}
  <div class="blog-tags">
    <div class="tags-editor">{% editable article.tags %}</div>
  </div>
{% else %}
  {% unless article.tags == empty %}
    <div class="blog-tags">
      <ul class="menu">
        {% for tag in article.tags %}
          <li class="menu-item"><a class="menu-link" href="/{{ article.page.path_with_lang }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
        {% endfor %}
      </ul>
    </div>
  {% endunless %}
{% endif %}
