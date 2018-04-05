{% for i in (1..4) %}
  {% assign level_str = 'menuitems_on_level_' | append: i %}
  {% for level_1 in site[level_str] %}
    {% if level_1.selected? %}
      {% for level_2 in level_1.visible_children_with_data %}
        {% if level_1.current? %}
          {% if level_2.layout_title == product_list_layout or level_2.layout_title == product_layout %}
            {% include "product-list-item" menu_level: level_2 %}
          {% endif %}
        {% endif %}
      {% endfor %}
    {% endif %}
  {% endfor %}
{% endfor %}