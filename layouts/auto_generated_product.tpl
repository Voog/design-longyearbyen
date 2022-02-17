<!DOCTYPE html>
{% include "template-variables" %}

{%- if product.image == blank -%}
  {%- assign product_image_state = "without-image" -%}
{%- else -%}
  {%- assign product_image_state = "with-image" -%}
{%- endif -%}

<html class="common-page item-page content-page product-page {{ view_mode }} site-search-closed {{ language_flags_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body>
    {%- capture bottom_content_html -%}
      {%- unless editmode -%}
        {%- content bind=product name="content" -%}
      {%- endunless -%}
    {%- endcapture -%}

    {%- assign bottom_content_size = bottom_content_html | strip | size -%}

    {%- capture gallery_content_html -%}
      {%- unless editmode -%}
        {%- content bind=product name="gallery" -%}
      {%- endunless -%}
    {%- endcapture -%}

    {%- assign gallery_content_size = gallery_content_html | strip | size -%}
    {% include "template-svg-spritesheet" %}
    <div class="site-container">
      <div class="wrap">
        {% include "site-header" %}

        <main class="page-content product-content" role="main">
          <section class="content-body">
            {% include "menu-breadcrumbs-sd" %}

            <div class="content-inner items-body">
              <div class="flex-col flex-col-left">
                <div class="content-illustrations">
                  <div class="content-item-box {{ product_image_state }} js-content-item-box">
                    <div class="item-top product-image">
                      {%- if product.image != blank -%}
                        <div class="top-inner aspect-ratio-inner">
                          {%- assign image_class = "item-image not-cropped" -%}
                          {% image product.image target_width: "1280" class: image_class loading: "lazy" %}
                        </div>
                      {%- endif -%}
                    </div>
                  </div>
                    
                  {%- if gallery_content_size > 0 or editmode -%}
                    <div class="formatted js-product-gallery content-area" data-search-indexing-allowed="true">
                      {% content bind=product name="gallery" %}
                    </div>
                  {%- endif -%}
                  </div>
                </div>
                <div class="flex-col">
                  <div class="content-body js-product-right-content">
                    <div class="content-body-inner">
                      <header class="content-header">
                        <div class="formatted content-item-title" data-search-indexing-allowed="true">
                          <h1>{%- editable product.name -%}</h1>
                        </div>
                      </header>

                      <div class="product-price">
                        {%- if product.price_max_with_tax != product.price_min_with_tax -%}
                          {{ product.price_min_with_tax | money_with_currency: product.currency -}}
                          <span class="product-price-divider">–</span>
                        {%- endif -%}
                        {{ product.price_max_with_tax | money_with_currency: product.currency -}}
                      </div>

                      <div class="formatted area-normal" data-search-indexing-allowed="true">
                        {%- if editmode or product.description != blank -%}
                          <div class="content-product-description content-area">
                            {%- editable product.description -%}
                          </div>
                        {%- endif -%}

                        <div class="buy-btn-content js-buy-btn-content content-area">
                          {% include "buy-button" %}
                        </div>
                        <div class="content-area">
                          {% content bind=product %}
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                 
              </div>
              
            {%- if bottom_content_size > 0 or editmode -%}
                <section
                  class="content-product-wide content-area"
                  data-search-indexing-allowed="true">
                  {% content bind=product name="content" %}
                </section>
              {%- endif -%}
            
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
    {% include "template-tools" %}

    <script>
      if (template) {
        template.handleProductPageContent();

        {%- if product and editmode -%}
          template.handleProductImageClick({{ product.id }});
        {% endif %}
      }
    </script>
  </body>
</html>
