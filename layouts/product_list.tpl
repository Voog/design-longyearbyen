<!DOCTYPE html>
{% include "template-variables" %}
<html class="common-page item-list-page content-page {{ view_mode }} site-search-closed {{ language_flags_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" with "product_list_page" %}
  </head>

  <body>
    {% include "template-svg-spritesheet" %}
    <div class="site-container">
      <div class="wrap">
        {% include "site-header" %}

        <main class="page-content" role="main">
          {% include "menu-breadcrumbs" %}

          <div class="content-inner content-area" data-search-indexing-allowed="true">{% content %}</div>

          <section class="content-item-boxes">
            {% if site.root_item.selected? %}
              {% for level_1 in site.visible_menuitems_with_data %}
                {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
                  {% include "product-list-item" menu_level: level_1 %}
                {% endif %}
              {% endfor %}
            {% else %}
              {% include "product-list-loop" menu_items: site.visible_menuitems %}
            {% endif %}
          </section>
        </main>

        {% include "site-footer" %}
      </div>
    </div>

    {% include "mobilemenu" %}
    {% include "menu-language-popover" %}
    {% include "site-search" %}
    {% include "site-signout" %}
    {% include "template-javascripts" %}
    {% include "template-tools" items_page: true %}

    <script>template.initItemsPage();</script>
  </body>
</html>
