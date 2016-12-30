;(function($) {
  //============================================================================
  // Helper function to detect if page viewer is in editmode.
  //============================================================================
  var editmode = function () {
    return $('html').hasClass('editmode');
  };

  //============================================================================
  // Helper function to limit the rate at which a function can fire.
  //============================================================================
  var debounce = function(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  //============================================================================
  // Bind site buttons functionality.
  //============================================================================
  var bindButtonClicks = function() {
    // Triggers the events when clicked anywhere on the document. Used for
    // sideclick functionality. Use the class "js-prevent-sideclick" on elements
    // that shouldn't trigger the sideclick events.
    $(document).on('click', function(event) {
      if (!$(event.target).closest('.js-prevent-sideclick').length) {
        var $html = $('html');

        $html.removeClass('menu-language-popover-open');
        $html.removeClass('site-search-opened');

        setTimeout(function(){
          $html.addClass('site-search-closed');
        }, 200);
      }
    });

    // language menu popover with flags.
    // By default this template uses the simple text listing version of the
    // language menu and popover menu with flags is disabled. Follow the
    // instructions in "components/site-header.tpl" to enable language menu
    // popover with flags.

    $('.js-toggle-menu-language').click(function() {
      if (!$('html').hasClass('menu-language-popover-open')) {
        handleMenuLanguagePopoverPositioning();
      } else {
        $('html').removeClass('menu-language-popover-open');
      }
    });

    // Toggles site search.
    $('.js-toggle-site-search').click(function() {
      var $html = $('html');

      if ($html.hasClass('menu-main-opened')) {
        $html.removeClass('menu-main-opened site-search-closed');
        $html.addClass('site-search-opened menu-main-closed');
        $('.js-search-input').focus();
      } else if ($html.hasClass('site-search-closed')) {
        $html.removeClass('site-search-closed');
        $html.addClass('site-search-opened');
        $('.js-search-input').focus();
      } else if ($html.hasClass('site-search-opened')) {
        $html.removeClass('site-search-opened');
        setTimeout(function(){
          $html.addClass('site-search-closed');
        }, 200);
      }

      if ($html.hasClass('menu-main-opened')) {
        $html.removeClass('menu-main-opened');
      }
    });

    // Clears site search input.
    $('.js-clear-search-input').click(function() {
      var $searchInput = $('.js-search-input');

      if ($searchInput.val().length > 0) {
        $searchInput.val('').focus();
      } else {
        $('html').removeClass('site-search-opened');
      }
    });

    $('.mobile-menu-toggler').click(function(event) {
      event.preventDefault();
      $('body').toggleClass('mobilemenu-open');
      $('body').removeClass('mobilesearch-open');
    });

    $('.mobile-menu-close').on('click', function(event) {
      event.preventDefault();

      if ($('body').hasClass('language-menu-open')) {
        $('body').removeClass('language-menu-open');
      }
      else {
        $('body').removeClass('mobilemenu-open');
      }
    });

    $('.language-menu-btn').on('click', function(event) {
      event.preventDefault();
      $('body').addClass('language-menu-open');
    });

    $('.tags-toggle').click(function() {
      $(this).find('.ico-arrow').toggleClass('active');
      $('.tags-bottom').toggleClass('visible');
    });
  };

  //============================================================================
  // Positions language menu popover under the toggleing button.
  //
  // By default this template uses the simple text listing version of the
  // language menu and popover menu with flags is disabled. Follow the
  // instructions in "components/site-header.tpl" to enable language menu
  // popover with flags.
  //============================================================================
  var handleMenuLanguagePopoverPositioning = function(button) {
    var $menuWrapper = $('.js-menu-language-popover'),
    $offsetItem = $('.js-toggle-menu-language'),
    offsetItemOffsetTop = $offsetItem.offset().top,
    offsetItemOffsetLeft = $offsetItem.offset().left,
    offsetItemOuterWidth = $offsetItem.outerWidth(),
    offsetItemOuterHeight = $offsetItem.outerHeight(),
    windowWidth = $(window).width();

    $('html').addClass('menu-language-popover-open');

    $menuWrapper.css({
      top: offsetItemOffsetTop + offsetItemOuterHeight,
      right: windowWidth - offsetItemOffsetLeft - offsetItemOuterWidth
    });
  };


  //============================================================================
  // Toggles language flags state.
  //
  // By default this template uses the simple text listing version of the
  // language menu and popover menu with flags is disabled. Follow the
  // instructions in "components/site-header.tpl" to enable language menu
  // popover with flags.
  //============================================================================

  var bindLanguageFlagsToggle = function() {
    $('.js-toggle-language-flags').click(function() {
      if ($('html').hasClass('language-flags-disabled')) {
        $('html')
        .removeClass('language-flags-disabled')
        .addClass('language-flags-enabled');

        siteData.set("language_flags_enabled", true);
      } else {
        $('html')
        .removeClass('language-flags-enabled')
        .addClass('language-flags-disabled');

        siteData.set("language_flags_enabled", false);
      }

      handleMenuLanguagePopoverPositioning();
    });
  };


  //============================================================================
  // Binds site search functionality.
  //============================================================================
  var bindSiteSearch = function(searchForm, languageCode) {
    if (searchForm) {
      var search = new VoogSearch(searchForm, {
        // Results are lazy-loaded on scroll.
        // This defines the number of results per query.
        per_page: 10,

        // Language code for restricting the search to page language
        lang: languageCode,

        // If given an DOM element results are rendered inside that element
        // instead of modal (with scroll lazy load support).
        // Example: resultsContainer: $('.custom-search-container').get(0),
        // Uncomment the <div class="custom-search-container"></div> element in
        // the "components/site-search.tpl" or add your own container to proper
        // place in the code if custom container is used.
        resultsContainer: $('.js-voog-search-modal').get(0),

        // Defines if modal should close on sideclick
        sideclick: true,

        // Mobile checkpoint (adds class "voog-search-mobile-mode" if <= nr)
        mobileModeWidth: 640,

        // Updates results on every keypress
        updateOnKeypress: false
      });
    }
  };

  // toggleFlags rule
  var toggleFlags = function() {
    $('.js-option-toggle-flags').on('click', function(event) {
      event.stopPropagation();

      if ($(this).hasClass('js-flag-disable-btn')) {
        var flagsState = false;
      } else {
        var flagsState = true;
      }

      siteData.set("flags_state", flagsState);

      $(this).toggleClass('js-flag-disable-btn');
      $('.js-menu-lang').toggleClass('flags-enabled flags-disabled');
    });
  };

  // Adds and removes padding to front page content areas when toggled.
  var togglePadding = function() {
    $('.voog-padding-switcher').on('click', function(event) {
      event.stopPropagation();
      var sectionTarget = $(this).closest('.feature-section');
      var sectionId = sectionTarget.attr('data-section-name');

      $(sectionTarget).toggleClass('section-with-padding');

      if ($(this).closest(sectionTarget).hasClass('section-with-padding')) {
        var sectionWideBool = false;
      } else {
        var sectionWideBool = true;
      }

      pageData.set(sectionId + '_is_wide', sectionWideBool);
    });
  };

  var bindCustomTexteditorStyles = function(buttonTranslation) {
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', {name: buttonTranslation, tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
  };

  // BG-Picker background image and color preview logic function.
  var bgPickerPreview = function(bgPickerArea, data) {
    console.log(data);
    $(bgPickerArea).find('.js-background-color').css({'background-color' : data.color ? data.color : 'transparent'});
  };

  // Header background image and color save logic function.
  var bgPickerCommit = function(dataBgKey, data) {
    pageData.set(dataBgKey, data);
  };

  // ===========================================================================
  // Wraps content area tables with the parent <div>. (Enables horizontal
  // scrolling if table's width is wider than the content area itself).
  // ===========================================================================
  var wrapContentAreaTables = function() {
    $.each($('.content-area'), function() {
      $(this).find('table').wrap('<div class="table-container"></div>');
    });
  };

  // ===========================================================================
  // Scrolls to the form if submit failed or succeeded (to show the error
  // messages or success notice to the user).
  // ===========================================================================
  var focusFormMessages = function() {
    $(document).ready(function() {
      if ($('.comment-form').hasClass('form_with_errors')) {
        $('html, body')
        .scrollTop($('.comment-form')
        .offset().top)
        ;
      } else if ($('form').find('.form_error, .form_notice').length > 0) {
        $('html, body')
        .scrollTop($('.form_error, .form_notice').closest('form')
        .offset().top)
        ;
      }
    });
  };

  // ===========================================================================
  // Removes error highlighting from form input if user modifies the faulty
  // field.
  // ===========================================================================
  var removeFormInputErrorHighlight = function() {
    $('[class^=form_field_]').on('input change', function() {
      $(this).closest('.form_field_with_errors').removeClass('form_field_with_errors');
    });
  };

  var setImageOrientation = function($contentItemBox, width, height) {
    var $imgDropAreaTarget = $contentItemBox.find('.js-img-drop-area'),
        $cropToggleButton = $contentItemBox.find('.js-toggle-crop-state');

    if (width > height) {
      $imgDropAreaTarget
        .removeClass('image-landscape image-square image-portrait')
        .addClass('image-landscape')
      ;
    } else if (width === height) {
      $imgDropAreaTarget
        .removeClass('image-landscape image-square image-portrait')
        .addClass('image-square')
      ;
    } else {
      $imgDropAreaTarget
        .removeClass('image-landscape image-square image-portrait')
        .addClass('image-portrait')
      ;
    }

    if ($imgDropAreaTarget.hasClass('image-square')) {
      $cropToggleButton
        .removeClass('is-visible')
        .addClass('is-hidden')
      ;
    } else {
      $cropToggleButton
        .removeClass('is-hidden')
        .addClass('is-visible')
      ;
    }
  };

  var setItemImage = function(itemId, imageId, itemType) {
    var apiType;

    // console.log(itemType);

    if (itemType === 'article') {
      apiType = 'articles';
    } else {
      apiType = 'pages';
    }

    $.ajax({
       type: 'PATCH',
       contentType: 'application/json',
       url: '/admin/api/' + apiType +'/' + itemId,
       data: JSON.stringify({'image_id': imageId}),
       dataType: 'json'
    });
  };

  // ===========================================================================
  // Binds editmode backgroun picker areas.
  // ===========================================================================
  var bindItemBgPickers = function() {
    $('.js-bg-picker-area').each(function(index, bgPickerArea) {
      var $bgPickerArea = $(bgPickerArea),
          $bgPickerButton = $bgPickerArea.find('.js-bg-picker-btn'),
          $contentItemBox = $bgPickerArea.closest('.js-content-item-box'),
          itemId = $contentItemBox.data('item-id'),
          itemType = $contentItemBox.data('item-type'),
          dataBgKey = $bgPickerButton.data('bg-key');

      var bgPicker = new Edicy.BgPicker($bgPickerButton, {
        picture: $bgPickerButton.data('bg-picture-boolean'),
        target_width: $bgPickerButton.data('bg-target-width'),
        color: $bgPickerButton.data('bg-color-boolean'),

        preview: function(data) {
          var $contentItemBox = $bgPickerArea.closest('.js-content-item-box'),
              $imgDropArea = $bgPickerArea.find('.js-img-drop-area');

          setImageOrientation($contentItemBox, data.width, data.height);

          $bgPickerArea.eq(0).data('imgDropArea').setData({
            id: data.original_id,
            url: data.image,
            width: data.width,
            height: data.height
          });

          $imgDropArea
            .removeClass('is-cropped')
            .addClass('not-cropped')
          ;
        },

        commit: function(data) {
          setItemImage(itemId, data.original_id, itemType);
        }
      });

      $bgPickerArea.data('bgpicker', bgPicker);
    });
  };

  // ===========================================================================
  // Binds editmode image drop areas.
  // ===========================================================================
  var bindItemImgDropAreas = function() {
    $('.js-img-drop-area').each(function(index, imgDropAreaTarget) {
      var $imgDropAreaTarget = $(imgDropAreaTarget),
          $contentItemBox = $imgDropAreaTarget.closest('.js-content-item-box'),
          $bgPickerArea = $contentItemBox.find('.js-bg-picker-area'),
          itemId = $contentItemBox.data('item-id'),
          itemType = $contentItemBox.data('item-type'),
          articleData = new Edicy.CustomData({
            type: 'article',
            id: itemId
          }),
          pageData = new Edicy.CustomData({
            type: 'page',
            id: $contentItemBox.data('item-id')
          });

      var imgDropArea = new Edicy.ImgDropArea($imgDropAreaTarget, {
        positionable: false,
        target_width: 1280,
        removeBtn: '',

        change: function(data) {
          var $bgPickerButton = $contentItemBox.find('.js-bg-picker-btn');

          $contentItemBox
            .addClass('with-image')
            .removeClass('without-image')
          ;

          $imgDropAreaTarget
            .removeClass('is-cropped')
            .addClass('not-cropped')
          ;

          setImageOrientation($contentItemBox, data.width, data.height);


          $bgPickerArea.eq(0).data('bgpicker').setData({
            id: data.original_id,
            image: data.url,
            width: data.width,
            height: data.height
          });

          setItemImage(itemId, data.original_id, itemType);

          if (itemType === 'article') {
            articleData.set('image_crop_state', 'not-cropped');
          } else {
            pageData.set('image_crop_state', 'not-cropped');
          }
        }
      });

      $bgPickerArea.data('imgDropArea', imgDropArea);
    });
  };

  // ===========================================================================
  // Sets functions that will be initiated globally when resizing the browser
  // window.
  // ===========================================================================
  var bindItemImageCropToggle = function() {
    $('.js-toggle-crop-state').on('click', function() {
      var $contentItemBox = $(this).closest('.js-content-item-box'),
          $imgDropAreaTarget = $contentItemBox.find('.js-img-drop-area'),
          itemType = $contentItemBox.data('item-type'),
          imageCropState;

      var articleData = new Edicy.CustomData({
        type: 'article',
        id: $contentItemBox.data('item-id')
      });

      var pageData = new Edicy.CustomData({
        type: 'page',
        id: $contentItemBox.data('item-id')
      });

      if ($imgDropAreaTarget.hasClass('is-cropped')) {
        $imgDropAreaTarget
          .removeClass('is-cropped')
          .addClass('not-cropped')
        ;

        imageCropState = 'not-cropped';

      } else {
        $imgDropAreaTarget
          .removeClass('not-cropped')
          .addClass('is-cropped')
        ;

        imageCropState = 'is-cropped';
      }

      if (itemType === 'article') {
        articleData.set('image_crop_state', imageCropState);
      } else {
        pageData.set('image_crop_state', imageCropState);
      }
    });
  };

  // ===========================================================================
  // Load article cover images only when they are close or appearing in the
  // viewport.
  // ===========================================================================
  var bindItemImageLazyload = function() {
    $(document).ready(function() {
      setTimeout(function() {
        $('.js-content-item-box').addClass('not-loaded');
      }, 3000);
    });

    $('.js-lazyload').lazyload({
      threshold : 500,
      effect : "fadeIn",
      placeholder: 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==',

      load : function() {
        var $contentItemBox = $(this).closest('.js-content-item-box');

        $contentItemBox.removeClass('not-loaded').addClass('is-loaded');

        setTimeout(function() {
          $contentItemBox.removeClass('not-loaded');
          $contentItemBox.find('.js-loader').remove();
        }, 3000);
      }
    });
  };

  // ===========================================================================
  // Toggles product categories visibility in main menu.
  // ===========================================================================
  var bindRootItemSettings = function(valuesObj) {
    if (!('hide_categories_from_main_menu' in valuesObj)) {
      valuesObj.hide_categories_from_main_menu = false;
    }

    $('.js-root-item-settings-toggle').each(function(index, languageMenuSettingsButton) {
      var rootItemSettingsEditor = new Edicy.SettingsEditor(languageMenuSettingsButton, {
        menuItems: [
          {
            "title": "Hide categories from main menu",
            "type": "checkbox",
            "key": "hide_categories_from_main_menu",
            "states": {
              "on": true,
              "off": false
            }
          }
        ],

        buttonTitleI18n: "settings",

        values: valuesObj,

        containerClass: ['js-root-item-settings-popover', 'js-prevent-sideclick'],

        preview: function(data) {
          if (data.hide_categories_from_main_menu === true) {
            $.each($('.js-menu-item-category'), function() {
              $(this).addClass('is-hidden');
            });
          } else {
            $.each($('.js-menu-item-category'), function() {
              $(this).removeClass('is-hidden');
            });
          }
        },

        commit: function(data) {
          siteData.set('settings_root_item', data);
        }
      });
    });
  };

  // Initiations
  var initWindowResize = function() {
    $(window).resize(function() {
      // Add window resizing functions here.
    });
  };

  var initBlogPage = function() {
    // Add blog listing layout specific functions here.
  };

  var initArticlePage = function() {
    // Add single post layout specific functions here.
  };

  var initCommonPage = function() {
    // Add common page layout specific functions here.
  };

  var initItemsPage = function() {
    // Add Items page layout specific functions here.
    bindItemImageLazyload();
  };

  var initFrontPage = function() {
    // Add front page layout specific functions here.
  };

  var init = function() {
    // Add site wide functions here.
    bindButtonClicks();
    focusFormMessages();
    removeFormInputErrorHighlight();
    wrapContentAreaTables();
  };

  // Enables the usage of the initiations outside this file.
  // For example add "<script>site.initBlogPage();</script>" at the end of the "Blog & News" page to initiate blog listing view functions.
  window.site = $.extend(window.site || {}, {
    // Initiations for layouts.
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage,
    initCommonPage: initCommonPage,
    initItemsPage: initItemsPage,
    initFrontPage: initFrontPage,
    // Initiations for specific functions.
    bindSiteSearch: bindSiteSearch,
    bindLanguageFlagsToggle: bindLanguageFlagsToggle,
    toggleFlags: toggleFlags,
    togglePadding: togglePadding,
    bindCustomTexteditorStyles: bindCustomTexteditorStyles,
    bgPickerPreview: bgPickerPreview,
    bgPickerCommit: bgPickerCommit,
    bindItemBgPickers: bindItemBgPickers,
    bindItemImgDropAreas: bindItemImgDropAreas,
    bindItemImageCropToggle: bindItemImageCropToggle,
    bindRootItemSettings: bindRootItemSettings
  });

  init();
})(jQuery);
