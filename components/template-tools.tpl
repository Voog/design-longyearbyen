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

  </script>
{% endeditorjsblock %}
