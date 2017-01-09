{% for item in site.visible_menuitems %}
  {% if item.selected? and item.children? or editmode %}

    <ul class="menu-horizontal menu-sub">
      {% for subitem in item.visible_children %}
        {% if hide_product_related_pages %}
          {% unless subitem.layout_title == product_list_layout or subitem.layout_title == product_layout %}
            <li>{% menulink subitem %}</li>
          {% endunless %}
        {% else %}
          <li>{% menulink subitem %}</li>
        {% endif %}
      {% endfor %}

      {% if editmode %}
        {% if item.hidden_children.size > 0 %}
          <li class="menu-item-cms">{% menubtn item.hidden_children %}</li>
        {% endif %}

        <li class="menu-item-cms">{% menuadd parent="item" %}</li>
      {% endif %}

    </ul>
  {% endif %}
{% endfor %}
