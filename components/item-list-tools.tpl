{% comment %}
================================================================================
ITEM LIST TOOLS RELATED JAVASCRIPT.
Adds item list specific JS tools.
================================================================================
{% endcomment %}

{% editorjsblock %}
  <script>
    site.bindItemBgPickers();
    site.bindItemImgDropAreas();
    site.bindItemImageCropToggle();

    {%if site.data.settings_root_item %}
      rootItemValuesObj = {{ site.data.settings_root_item | json }};
    {% else %}
      rootItemValuesObj = {};
    {% endif %};

    site.bindRootItemSettings(rootItemValuesObj);
  </script>
{% endeditorjsblock %}
