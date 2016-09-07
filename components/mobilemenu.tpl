<div id="mobile-menu" class="js-menu-lang-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
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
        <li><a href="{{site.root_item.url}}"{% if site.root_item.selected? %} class="active"{% endif %}>{{site.root_item.title}}</a></li>
      {% endunless %}
      {% for item in site.visible_menuitems %}
        <li><a href="{{ item.url }}" {% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="fci-editor-menuadd untranslated"{% endunless %}>{{ item.title }}</a></li>
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
