<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
<html class="common-page content-page {{ view_mode }} site-search-closed {{ language_flags_mode }}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body>
    {% include "template-svg-spritesheet" %}
    <div class="site-container">
      <div class="wrap">
        {% include "site-header" %}

        <main class="page-content" role="main">
          <section class="content-area">
            <div class="content-body" data-search-indexing-allowed="true">
              {% include "menu-level-2" %}

              {%- assign content_default_title = "content" | lce -%}
              {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}
              <div class="content-inner">
                {% content title=content_default_title title_tooltip=content_default_title_tooltip %}
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

    <script>template.initCommonPage();</script>
  </body>
</html>
