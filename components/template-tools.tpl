{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>

  <script>
    var siteData = new Edicy.CustomData({
      type: 'site'
    });
    site.bindLanguageFlagsToggle();
  </script>
{% endeditorjsblock %}
