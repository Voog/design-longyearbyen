<!DOCTYPE html>
{% include "template-variables" %}
<html class="common-page {{ view_mode }} site-search-closed {{ language_flags_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="item-page">
    {% include "template-svg-spritesheet" %}
    <div class="site-container">
      <div class="wrap">

        {% include "site-header" %}
        {% include "common-page-variables" %}

        <main class="page-content" role="main">
          <section class="content-body">
            {% include "product-breadcrumbs" %}

            <div class="content-inner items-body" {{ edy_intro_edit_text }}>
              <div class="content-illustrations">
                {% if editmode %}
                  <div class="content-item-box {{ page_image_state }} js-content-item-box" data-item-type="page" data-item-id="{{ page.page_id }}">
                    <div class="item-top js-bg-picker-area">
                      <button class="btn bg-picker-btn js-bg-picker-btn" data-bg-key="image" data-bg-picture-boolean="true" data-bg-color-boolean="false" data-bg-image="{{ page.image.for-width-680.url }}" data-bg-target-width="680"></button>

                      <button class="btn bg-crop-btn {% if page_image_orientation == "image-square" or page.image == nil %}is-hidden{% else %}is-visible{% endif %} js-toggle-crop-state">
                        <svg width="45" height="45" viewBox="0 0 45 45" xmlns="http://www.w3.org/2000/svg">
                          <use xlink:href="#ico-toggle"></use>
                        </svg>
                      </button>

                      <div class="top-inner aspect-ratio-inner image-drop-area {{ page_image_orientation }} {{ page_image_crop_state }} js-img-drop-area" data-image="{{ page.image.for-width-680.url }}"></div>
                    </div>
                  </div>
                {% else %}
                  {% if page.image %}
                    <div class="content-item-box {{ page_image_state }} js-content-item-box" href="{{ page.url }}">
                      <div class="item-top">
                        <div class="top-inner aspect-ratio-inner">
                          {% if page.image %}
                            <div class="loader js-loader"></div>
                            <img class="item-image {{ page_image_orientation }} {{ page_image_crop_state }} js-lazyload" data-original="{{ page.image.for-width-680.url }}">
                          {% else %}
                            <div class="item-placeholder">{{ page.title | truncate: 50 }}</div>
                          {% endif %}
                        </div>
                      </div>
                    </div>
                  {% endif %}
                {% endif %}

                <div class="content-gallery content-area">{% content name="gallery" %}</div>
              </div>

              <div class="content-body-inner">
                <header class="content-header">
                  <div class="content-area">
                    <h1 class="content-item-title">{% contentblock name="content_header" publish_default_content="true" single="plaintext" %}{{ page.title }}{% endcontentblock %}</h1>
                  </div>
                </header>

                <div class="content-area area-normal" data-search-indexing-allowed="true">{% content %}</div>
              </div>
            </div>
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
