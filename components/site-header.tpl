<header class="site-header">
  <div class="header-top">
    {% include "menu-level-1" %}
    <div class="site-options">
      <button class="menu-language-btn ico-flags ico-flag-{{ page.language_code }} js-toggle-menu-language js-prevent-sideclick">{{ current_language_title }}</button>
    </div>

    <a href="#" class="mobile-menu-toggler"><span></span></a>

    {% if site.search.enabled %}
      <button class="site-search-btn js-toggle-site-search js-prevent-sideclick">
        <svg class="ico-search" width="18" height="19" viewBox="0 0 18 19" xmlns="http://www.w3.org/2000/svg">
          <use xlink:href="#ico-search"></use>
        </svg>
      </button>
    {% endif %}
  </div>
  <div class="header-content">{% xcontentblock name="content_header" publish_default_content="true" %}<h1>Longyearbyen</h1>{% endxcontentblock %}</div>
  <div class="slogan">{% xcontent name="slogan" %}</div>
</header>
