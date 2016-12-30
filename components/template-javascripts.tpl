{% comment %}TEMPLATE'S GLOBAL JAVASCRIPTS{% endcomment %}
{% comment %}Main template functionality.{% endcomment %}
<script src="{{ javascripts_path }}/main.min.js"></script>

{% comment %}Site search related javascript components.{% endcomment %}
{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
  <script>site.bindSiteSearch($('.js-search-form').get(0), '{{ page.language_code }}');</script>
{% endif %}

{% comment %}Button{% endcomment %}
<!-- TODO: Move to main.js file. -->
{% if editmode %}
  <script type="text/javascript">
     window.edy = window.edy || [];
     edy.push(['texteditorStyles', {name: 'Button', tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
   </script>
 {% endif %}

{% comment %}CMS related javascripts components.{% endcomment %}
{% sitejs_include %}

{% comment %}Google analytics initiation.{% endcomment %}
{{ site.analytics }}
