<!DOCTYPE html>
{% include "template-variables" %}
<html class="common-page {{ view_mode }} site-search-closed {{ language_flags_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="item-list-page">
    {% include "template-svg-spritesheet" %}
    <div class="site-container">
      <div class="wrap">

        {% include "site-header" %}
        {% include "common-page-variables" %}

        <main class="page-content" role="main">
          <section class="content-item-boxes">
            {% if site.root_item.selected? %}
              {% if editmode %}
                <ul class="menu menu-horizontal menu-cms">
                  {% if site.untranslated_menuitems.size > 0 %}
                    <li class="menu-item menu-item-cms">{% menubtn site.untranslated_menuitems %}</li>
                  {% endif %}

                  {% if site.hidden_menuitems.size > 0 %}
                    <li class="menu-item menu-item-cms">{% menubtn site.hidden_menuitems %}</li>
                  {% endif %}

                  <li class="menu-item menu-item-cms">{% menuadd %}</li>

                  {% if site.root_item.selected? %}
                    <li class="menu-item menu-item-cms float-right">
                      <a class="js-root-item-settings-toggle"></a>
                    </li>
                  {% endif %}
                </ul>
              {% endif %}

              {% for level_1 in site.visible_menuitems_with_data %}
                {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
                  {% include "product-list-item" menu_level: level_1 %}
                {% endif %}
              {% endfor %}
            {% else %}
              {% for level_1 in site.visible_menuitems %}
                {% if level_1.selected? %}
                  {% if level_1.current? and editmode %}
                    <ul class="menu menu-horizontal menu-cms">
                      {% if level_1.untranslated_children.size > 0 %}
                        <li class="menu-item menu-item-cms">{% menubtn level_1.untranslated_children %}</li>
                      {% endif %}

                      {% if level_1.hidden_children.size > 0 %}
                        <li class="menu-item menu-item-cms">{% menubtn level_1.hidden_children %}</li>
                      {% endif %}

                      <li class="menu-item menu-item-cms">{% menuadd parent="level_1" %}</li>
                    </ul>
                  {% endif %}

                  {% for level_2 in level_1.visible_children_with_data %}
                    {% if level_1.current? %}
                      {% if level_2.layout_title == product_list_layout or level_2.layout_title == product_layout %}
                        {% include "product-list-item" menu_level: level_2 %}
                      {% endif %}
                    {% else %}
                      {% if level_2.selected? %}
                        {% if level_2.current? and editmode %}
                          <ul class="menu menu-horizontal menu-cms">
                            {% if level_2.untranslated_children.size > 0 %}
                              <li class="menu-item menu-item-cms">{% menubtn level_2.untranslated_children %}</li>
                            {% endif %}

                            {% if level_2.hidden_children.size > 0 %}
                              <li class="menu-item menu-item-cms">{% menubtn level_1.hidden_children %}</li>
                            {% endif %}

                            <li class="menu-item menu-item-cms">{% menuadd parent="level_2" %}</li>
                          </ul>
                        {% endif %}

                        {% for level_3 in level_2.visible_children_with_data %}
                          {% if level_3.layout_title == product_list_layout or level_3.layout_title == product_layout %}
                            {% include "product-list-item" menu_level: level_3 %}
                          {% endif %}
                        {% endfor %}
                      {% endif %}
                    {% endif %}
                  {% endfor %}
                {% endif %}
              {% endfor %}
            {% endif %}
          </section>
        </main>

        {% include "site-footer" %}
      </div>
    </div>

    {% include "mobilemenu" %}
    {% include "menu-language-popover" %}
    {% include "site-search" %}

    {% include "template-javascripts" %}
    {% include "template-tools" %}
    {% include "item-list-tools" %}

    <script>site.initItemsPage();</script>
  </body>
</html>
