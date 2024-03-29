<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
<html class="front-page {{ view_mode }} site-search-closed {{ language_flags_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body>
    {% include "template-svg-spritesheet" %}
    <div class="site-container">
      <div class="wrap">
        {% include "site-header" %}
        {%- assign content_default_title = "content" | lce -%}
        {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}

        <main class="page-content" role="main">
          <section class="content-area">
            <div class="content-body" data-search-indexing-allowed="true">
              <div class="sections {% if site.branding.enabled %}voog-reference-enabled{% endif %}">
                {% if feature_1_has_content or content_bg_1_color or editmode %}
                  <div class="feature-section {{ feature_1_section_padding_class }} js-bg-picker-area feature-1" data-section-name="feature_1">
                    <div class="background-color js-background-color" style="background-color: {% if content_bg_1_color %}{{ content_bg_1_color }}{% else %}transparent{% endif %};"></div>

                    {% if editmode %}
                      <button class="voog-bg-picker-btn js-background-settings" data-bg-key="content_bg_1" data-bg="{{ content_bg_1_str | escape }}"></button>
                      <button class="voog-padding-switcher" type="button" name="button"></button>
                    {% endif %}

                    <section class="feature-content content-area introtext" data-search-indexing-allowed="true">
                      {% content title=content_default_title title_tooltip=content_default_title_tooltip %}
                    </section>
                  </div>
                {% endif %}

                {% if feature_2_has_content or content_bg_2_color or editmode %}
                  <div class="feature-section {{ feature_2_empty }} {{ feature_2_section_padding_class }} js-bg-picker-area feature-2" data-section-name="feature_2" data-bg-global="main_bg" data-bg-global-boolean="{{ content_2_global_bg_boolean }}">
                    <div class="background-color js-background-color" style="background-color: {% if content_bg_2_color %}{{ content_bg_2_color }}{% else %}transparent{% endif %};"></div>

                    {% if editmode %}
                      <button class="voog-bg-picker-btn js-background-settings" data-bg-key="content_bg_2" data-bg="{{ content_bg_2_str | escape }}"></button>
                      <button class="voog-padding-switcher" type="button" name="button"></button>
                    {% endif %}

                    <section class="feature-content content-area introtext" data-search-indexing-allowed="true">
                      {% content name="feature_2" title=content_default_title title_tooltip=content_default_title_tooltip %}
                    </section>
                  </div>
                {% endif %}
              </div>
            </div>
          </section>
        </main>

        {% include "site-footer" %}
      </div>
    </div>

    {% include "mobilemenu" %}
    {% include "menu-language-popover" %}
    {% include "template-tools" %}
    {% include "site-search" %}
    {% include "site-signout" %}
    {% include "template-javascripts" %}

    <script>template.initFrontPage();</script>
  </body>
</html>
