{% for item in site.visible_menuitems %}
  {% if item.selected? and item.children? or editmode %}

    <ul class="menu-horizontal menu-sub">
      {% for subitem in item.visible_children %}
        <li>
          {% menulink subitem %}
        </li>
      {% endfor %}

      {% if editmode %}
        {% if item.hidden_children.size > 0 %}
          <li>{% menubtn item.hidden_children %}</li>
        {% endif %}
        <li class="last">{% menuadd parent="item" %}</li>
      {% endif %}

    </ul>
  {% endif %}
{% endfor %}
