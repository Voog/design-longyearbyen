{% comment %}Site search settings are located in "sources/javascript/base.js" file –> "bindSiteSearch" function.{% endcomment %}
{% if site.search.enabled %}
  <div class="site-search js-prevent-sideclick">
    <form class="search-form js-search-form" method="get">
      <input class="search-input js-search-input" type="search" placeholder="{{ 'search' | lc }}...">
      <svg class="search-clear js-clear-search-input" width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
        <use xlink:href="#ico-clear"></use>
      </svg>
    </form>

    <div class="voog-search-modal js-voog-search-modal"></div>
  </div>
{% endif %}
