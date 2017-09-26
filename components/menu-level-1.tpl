<nav class="menu-main">
  <ul class="menu menu-horizontal menu-public menu-level-1">
    {% unless site.root_item.hidden? %}
      {% if site.root_item.layout_title == product_list_layout and show_product_related_pages_in_main_menu != true %}
        {% if page.layout_title == product_list_layout or page.layout_title == product_layout %}
          {% menulink site.root_item wrapper-tag="li" wrapper-class="selected" %}
        {% else %}
          {% menulink site.root_item wrapper-tag="li" %}
        {% endif %}
      {% else %}
        {% menulink site.root_item wrapper-tag="li" %}
      {% endif %}
    {% endunless %}

    {% for level_1 in site.visible_menuitems %}
      {% if site.root_item.layout_title == product_list_layout %}
        {% if editmode %}
          {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
            {% unless show_product_related_pages_in_main_menu %}
              {% menulink level_1 wrapper-tag="li" wrapper-class="is-hidden js-menu-item-products" %}
            {% else %}
              {% menulink level_1 wrapper-tag="li" wrapper-class="js-menu-item-products" %}
            {% endunless %}
          {% else %}
            {% menulink level_1 wrapper-tag="li" %}
          {% endif %}
        {% else %}
          {% unless show_product_related_pages_in_main_menu %}
            {% unless level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
              {% menulink level_1 wrapper-tag="li" %}
            {% endunless %}
          {% else %}
            {% menulink level_1 wrapper-tag="li" %}
          {% endunless %}
        {% endif %}
      {% else %}
        {% menulink level_1 wrapper-tag="li" %}
      {% endif %}
    {% endfor %}
  </ul>

  {% if editmode %}
    <ul class="menu menu-horizontal menu-cms">
      {% if site.hidden_menuitems.size > 0 %}
        <li>{% menubtn site.hidden_menuitems %}</li>
      {% endif %}

      <li {{ edy_intro_add_page }}>{% menuadd %}</li>
    </ul>
  {% endif %}
</nav>
