{% if site.has_language_tags? %}
  <div class="tagged-list-header">
    <nav class="tags">
      <ul class="menu-horizontal menu-sub">
        <li class="menu-item">
          <a class="menu-link js-tags-all{% unless tags.size > 0 %} active{% endunless %}" href="{{ site.url }}{{ site.blogs.first.page.path }}">{{ tags_all }}</a>
        </li>
        {% for tag in site.language_tags %}
          {% assign activestr = "" %}
          {% for tmptag in tags %}
            {% if tmptag.name == tag.name %}
              {% assign activestr = " active" %}
            {% endif %}
          {% endfor %}
          <li class="menu-item">
            <a class="menu-link{{ activestr }}" href="{{ site.url }}{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
          </li>
        {% endfor %}
      </ul>
    </nav>
  </div>
{% endif %}
