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
    template.bindLanguageFlagsToggle();
    template.toggleFlags();
    template.togglePadding();

    //==========================================================================
    // Binds custom styles under wysihtml editor.
    //==========================================================================
    template.bindCustomTexteditorStyles('{{ "button" | lc: editor_locale }}');

    //==========================================================================
    // Binds "Front page" color pickers.
    //==========================================================================
    $('.js-bg-picker-area').each(function(index, bgPickerArea) {
      var bgPickerButton = $(bgPickerArea).find('.js-background-settings'),
          dataBgKey = $(bgPickerButton).data('bg-key');

      var bgPicker = new Edicy.BgPicker(bgPickerButton, {
        picture: false,
        color: true,
        showAlpha: true,
        preview: function(data) {
          template.bgPickerPreview($(bgPickerArea), data);
        },
        commit: function(data) {
          template.bgPickerCommit(dataBgKey, data);
        }
      });
    });

    {% if items_page %}
      template.bindContentItemBgPickers();
      template.bindContentItemImgDropAreas('{{ "drag_picture_for_product_here" | lc }}');
      template.bindContentItemImageCropToggle();

      {%if site.data.settings_root_item %}
        rootItemValuesObj = {{ site.data.settings_root_item | json }};
      {% else %}
        rootItemValuesObj = {};
      {% endif %};

      template.bindRootItemSettings(rootItemValuesObj);
    {% endif %}
  </script>
{% endeditorjsblock %}
