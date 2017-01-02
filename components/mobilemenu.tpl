<div id="mobile-menu" class="mobile-menu js-menu-lang-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
  <a href="#" class="mobile-menu-close"></a>
  {% if editmode or site.has_many_languages? %}
    <a href="#" role="button" class="language-menu-btn">
      <span class="lang-menu-btn lang-flag lang-flag-{{ page.language_.code }}" data-lang-code="{{ page.language_code }}">
          <span class="lang-title">
            {% for language in site.languages %}{% if language.selected? %}{{ language.title }}{% endif %}{% endfor %}
            <span class="ico-popover-toggle">▼</span>
          </span>
      </span>
    </a>
  {% endif %}

  {% if editmode or site.has_many_languages? %}
    <div class="language-menu">
      <ul>
        {% for language in site.languages %}
          <li>
            <a class="{% if language.selected? %} active{% endif %}" href="{{ language.url }}">{{ language.title }}</a>
          </li>
        {% endfor %}
        {% if editmode %}<li>{% languageadd %}</li>{% endif %}

        {% if editmode %}
          <div class="lang-options">
            <ul class="menu">
              <li class="menu-item">
                <button class="option-btn js-option-toggle-flags{% if flags_state %} js-flag-disable-btn{% endif %}">
                  <span class="disable-text">{{ "disable_lang_flags" | lc: editor_locale }}</span>
                  <span class="enable-text">{{ "enable_lang_flags" | lc: editor_locale }}</span>
                </button>
              </li>
            </ul>
          </div>
        {% endif %}
      </ul>
    </div>
  {% endif %}

  <div class="navigation-menu">
    <ul>
      {% unless site.root_item.hidden? %}
        {% if site.root_item.layout_title == product_list_layout and hide_categories_from_main_menu %}
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
              {% if hide_categories_from_main_menu %}
                {% menulink level_1 wrapper-tag="li" wrapper-class="is-hidden js-menu-item-category" %}
              {% else %}
                {% menulink level_1 wrapper-tag="li" wrapper-class="js-menu-item-category" %}
              {% endif %}
            {% else %}
              {% menulink level_1 wrapper-tag="li" %}
            {% endif %}
          {% else %}
            {% if hide_categories_from_main_menu %}
              {% unless level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
                {% menulink level_1 wrapper-tag="li" %}
              {% endunless %}
            {% else %}
              {% unless level_1.layout_title == product_layout %}
                {% menulink level_1 wrapper-tag="li" %}
              {% endunless %}
            {% endif %}
          {% endif %}
        {% else %}
          {% menulink level_1 wrapper-tag="li" %}
        {% endif %}
      {% endfor %}

      {% if editmode %}
        {% if site.hidden_menuitems.size > 0 %}
          <li>{% menubtn site.hidden_menuitems %}</li>
        {% endif %}

        <li>{% menuadd %}</li>
      {% endif %}
    </ul>
  </div>
</div>
