<!DOCTYPE html>
{% include "template-variables" %}
<html class="front-page {{ view_mode }} site-search-closed {{ language_flags_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" front_page: true %}
    {% assign front_page = true %}
  </head>

  <body class="front-page">
    {% include "template-svg-spritesheet" %}
    <div class="site-container">
      <div class="wrap">

        {% include "site-header" %}

        <main class="page-content" role="main">
          <section class="content-area">
            <div class="content-body" data-search-indexing-allowed="true">

              <div class="sections {% if site.branding.enabled %}voog-reference-enabled{% endif %}">
                {% if feature_1_visible or editmode %}
                  <div class="feature-section {{ content_bg_transparent }} {{ feature_1_empty }} {{ feature_1_section_width }} js-bg-picker-area feature-1" data-section-name="feature_1" data-bg-global="main_bg" data-bg-global-boolean="{{ content_1_global_bg_boolean }}">
                    <div class="background-image js-background-image"></div>
                    <div class="background-color js-background-color"></div>
                    {% if editmode %}
                      <button class="voog-bg-picker-btn js-background-settings" data-bg-key="content_bg_1" data-bg-picture-boolean="false" data-target-width="600" data-bg-image="{{ content_bg_1_image }}" data-bg-image-sizes="{{ content_bg_1_image_sizes_str | escape }}" data-bg-color="{{ content_bg_1_color }}" data-bg-color-data="{{ content_bg_1_color_data_str | escape }}"></button>
                      <button class="voog-padding-switcher" type="button" name="button"></button>
                    {% endif %}

                    <div class="wrap_s js-background-type {{ content_bg_1_type }}">
                      <section class="feature-content content-formatted" data-search-indexing-allowed="true">{% content name="feature_1" %}</section>
                    </div>
                  </div>
                {% else %}
                  {% if feature_2_visible or feature_3_visible or feature_4_visible %}
                    <div class="empty-section"></div>
                  {% endif %}
                {% endif %}

                {% if feature_2_visible or editmode %}
                  <div class="feature-section {{ content_bg_transparent }} {{ feature_2_empty }} {{ feature_2_section_width }} js-bg-picker-area feature-2" data-section-name="feature_2" data-bg-global="main_bg" data-bg-global-boolean="{{ content_2_global_bg_boolean }}">
                    <div class="background-image js-background-image"></div>
                    <div class="background-color js-background-color"></div>
                    {% if editmode %}
                      <button class="voog-bg-picker-btn js-background-settings" data-bg-key="content_bg_2" data-bg-picture-boolean="false" data-target-width="600" data-bg-image="{{ content_bg_2_image }}" data-bg-image-sizes="{{ content_bg_2_image_sizes_str | escape }}" data-bg-color="{{ content_bg_2_color }}" data-bg-color-data="{{ content_bg_2_color_data_str | escape }}"></button>
                      <button class="voog-padding-switcher" type="button" name="button"></button>
                    {% endif %}

                    <div class="wrap_s js-background-type {{ content_bg_2_type }}">
                      <section class="feature-content content-formatted" data-search-indexing-allowed="true">{% content name="feature_2" %}</section>
                    </div>
                  </div>
                {% else %}
                  {% if feature_3_visible or feature_4_visible %}
                    <div class="empty-section"></div>
                  {% endif %}
                {% endif %}
              </div>

            </div>
          </section>
        </main>

        {% include "site-footer" %}
      </div>
    </div>

    {% include "menu-language-popover" %}
    {% include "template-tools" %}
    {% include "site-search "%}
    {% include "template-javascripts" %}

    <script>site.initFrontPage();</script>

  </body>
</html>
