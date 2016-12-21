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
  </script>
{% endeditorjsblock %}
