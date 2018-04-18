{% if blog and blog.has_tags? %}
  <div class="tagged-list-header">
    <nav class="tags">
      <ul class="menu-horizontal menu-sub">
        <li class="menu-item">
          <a class="menu-link {% unless tags.size > 0 %} active{% endunless %}" href="/{{ page.path }}">{{ 'all_posts' | lc }}</a>
        </li>
        {% for tag in blog.tags %}
          {% assign activestr = "" %}
          {% for tmptag in tags %}
            {% if tmptag.name == tag.name %}
              {% assign activestr = " active" %}
            {% endif %}
          {% endfor %}
          <li class="menu-item">
            <a class="menu-link{{ activestr }}" href="/{{ blog.page.path_with_lang }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
          </li>
        {% endfor %}
      </ul>
    </nav>
  </div>
{% endif %}
