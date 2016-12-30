{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>

  <script>
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    var pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    // Initiates language flag toggling functionality.
    // TODO: remove duplicate function.
    site.bindLanguageFlagsToggle();
    site.toggleFlags();
    site.togglePadding();

    $('.js-bg-picker-area').each(function(index, bgPickerArea) {
      var bgPickerButton = $(bgPickerArea).find('.js-background-settings'),
          dataBgKey = $(bgPickerButton).data('bg-key');

      var bgPicker = new Edicy.BgPicker(bgPickerButton, {
        picture: false,
        color: true,
        showAlpha: true,
        preview: function(data) {
          site.bgPickerPreview($(bgPickerArea), data);
        },
        commit: function(data) {
          site.bgPickerCommit(dataBgKey, data);
        }
      });
    });

    {% if items_page %}
      site.bindItemBgPickers();
      site.bindItemImgDropAreas();
      site.bindItemImageCropToggle();

      {%if site.data.settings_root_item %}
        rootItemValuesObj = {{ site.data.settings_root_item | json }};
      {% else %}
        rootItemValuesObj = {};
      {% endif %};

      site.bindRootItemSettings(rootItemValuesObj);
    {% endif %}
  </script>
{% endeditorjsblock %}
