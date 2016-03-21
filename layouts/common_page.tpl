<!DOCTYPE html>
{% include "template-variables" %}
<html class="common-page {{ view_mode }} site-search-closed {{ language_flags_mode }}" lang="{{ page.language_code }}">
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
            <div class="content-body">
              {% include "menu-level-2" %}
              <div class="content-inner">{% content %}</div>
            </div>
          </section>
        </main>

        {% include "site-footer" %}
      </div>
    </div>
    
    {% include "menu-language-popover" %}
    {% include "template-tools" %}
    {% include "template-javascripts" %}
    {% include "site-search "%}
    
    <script>site.initCommonPage();</script>
    
  </body>
</html>
