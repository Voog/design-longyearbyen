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

  };


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
      });
    };


  //============================================================================
  // Binds site search functionality.
  //============================================================================
  var bindSiteSearch = function(searchForm, languageCode) {
    console.log(searchForm);
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

  var initFrontPage = function() {
    // Add front page layout specific functions here.
  };

  var init = function() {
    // Add site wide functions here.
    // TODO: Replace with click.
    bindButtonClicks();
  };

  // Enables the usage of the initiations outside this file.
  window.site = $.extend(window.site || {}, {
    // Initiations for layouts.
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage,
    initCommonPage: initCommonPage,
    initFrontPage: initFrontPage,
    // Initiations for specific functions.
    bindSiteSearch: bindSiteSearch,
    bindLanguageFlagsToggle: bindLanguageFlagsToggle
  });

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

  // Header background image and color preview logic function.
  var bgPickerPreview = function(bgPickerArea, data, bgPicker, bgPickerImageColorDataReturn) {
    // Defines the variables used in preview logic.

    var bgPickerImagePrevious = $(bgPickerArea).find('.js-background-image').css('background-image'),
        bgPickerImageSuitable = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : null,
        bgPickerImage = (data.image && data.image !== '') ? 'url(' + bgPickerImageSuitable.url + ')' : 'none',
        bgPickerImageSizes = (data.imageSizes && data.imageSizes !== '') ? data.imageSizes : null,
        bgPickerColor = (data.color && data.color !== '') ? data.color : 'rgba(0,0,0,0)',
        bgPickerColorDataLightness = (data.colorData && data.colorData !== '') ? data.colorData.a : 0,
        bgPickerColorAlpha = bgPickerColorDataLightness,
        bgPickerImageColorDataInternal = bgPickerImageColorDataReturn,

        colorExtractImage = $('<img>'),
        colorExtractCanvas = $('<canvas>'),
        colorExtractImageUrl = (data.image && data.image !== '') ? data.image : null;

    if (colorExtractImageUrl) {
      if (bgPickerImageSizesContains(bgPickerImageSizes, bgPickerImagePrevious, bgPickerImageColorDataInternal)) {
        bgPickerCombinedLightness = getCombinedLightness(bgPickerImageColorDataInternal, bgPickerColor);
        bgPickerContentLightnessClass(bgPickerArea, bgPickerColorAlpha);
        bgPickerImageColorData = bgPickerImageColorDataInternal;
      } else {
        colorExtractImage.attr('src', colorExtractImageUrl.replace(/.*\/(photos|voogstock)/g,'/photos'));
        colorExtractImage.load(function() {
          ColorExtract.extract(colorExtractImage[0], colorExtractCanvas[0], function(data) {
            bgPicker.bgPickerImageColor = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';
            bgPickerCombinedLightness = getCombinedLightness(bgPicker.bgPickerImageColor, bgPickerColor);
            bgPickerContentLightnessClass(bgPickerArea, bgPickerColorAlpha);

            bgPickerImageColorData = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';
            bgPickerImageColorDataInternal = bgPicker.bgPickerImageColor;
          });
        });
      };
    }
     else {
      bgPickerCombinedLightness = getCombinedLightness('rgba(255,255,255,1)', bgPickerColor);
      bgPickerContentLightnessClass(bgPickerArea, bgPickerColorAlpha);
      bgPickerImageColorData = '';
    };

    // Updates the bgPickerContent background image and background color.
    $(bgPickerArea).find('.js-background-image').css({'background-image' : bgPickerImage});
    $(bgPickerArea).find('.js-background-color').css({'background-color' : bgPickerColor});
  };

  var getCombinedLightness = function(bgColor, fgColor) {
    var combinedColor = getCombinedColor(bgColor, fgColor);
    var color = Math.round(((+combinedColor[0]) * 0.2126 + (+combinedColor[1]) * 0.7152 + (+combinedColor[2]) * 0.0722) / 2.55) / 100;
    return color;
  };

  // Header background image and color save logic function.
  var bgPickerCommit = function(dataBgKey, data) {
    var commitData = $.extend(true, {}, data);
    commitData.image = data.image || '';
    commitData.imageSizes = data.imageSizes || '';
    commitData.color = data.color || '';
    commitData.combinedLightness = bgPickerCombinedLightness;
    commitData.imageColorData = bgPickerImageColorData || '';

    if (pageType === 'articlePage') {
      if (dataBgKey == 'footer_bg') {
        siteData.set(dataBgKey, commitData);
      } else {
        Edicy.articles.currentArticle.setData(dataBgKey, commitData);
      }
    } else {
      if (pageType === 'contentPage' && (dataBgKey === 'footer_bg') || (dataBgKey === 'body_bg')) {
        siteData.set(dataBgKey, commitData);
      } else {
        pageData.set(dataBgKey, commitData);
      }
    }
  };

  var colorSum = function(bgColor, fgColor) {
    if (bgColor && fgColor) {
      if (typeof bgColor == 'string') {
        bgColor = bgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(bgColor, function(n, x) {bgColor[n] = +x;});
      }
      if (typeof fgColor == 'string') {
        fgColor = fgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(fgColor, function(n, x) {fgColor[n] = +x;});
      }
      if (typeof bgColor == 'object' && bgColor.hasOwnProperty('length')) {
        if (bgColor.length == 3) { bgColor.push(1.0); }
      }
      if (typeof fgColor == 'object' && fgColor.hasOwnProperty('length')) {
        if (fgColor.length == 3) { fgColor.push(1.0); }
      }
      var result = [0, 0, 0, 0];
      result[3] = 1 - (1 - fgColor[3]) * (1 - bgColor[3]);
      if (result[3] === 0) { result[3] = 1e-6; }
      result[0] = Math.min(fgColor[0] * fgColor[3] / result[3] + bgColor[0] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[1] = Math.min(fgColor[1] * fgColor[3] / result[3] + bgColor[1] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[2] = Math.min(fgColor[2] * fgColor[3] / result[3] + bgColor[2] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      return $.map(result, function(e) { return Math.floor(e); });
    }
  };

  var getCombinedColor = function(bgColor, fgColor) {
    var sum = colorSum(bgColor || [255,255,255,1], fgColor || [255,255,255,1]);
    return sum;
  };

  var getCombinedLightness = function(bgColor, fgColor) {
    var combinedColor = getCombinedColor(bgColor, fgColor);
    var color = Math.round(((+combinedColor[0]) * 0.2126 + (+combinedColor[1]) * 0.7152 + (+combinedColor[2]) * 0.0722) / 2.55) / 100;
    return color;
  };

  var bgPickerColorScheme = function(lightness) {
    if (typeof lightness != 'undefined') {
      if (lightness > 0.6) {
        $('.header-wrapper').addClass('light').removeClass('dark');
      } else {
        $('.header-wrapper').addClass('dark').removeClass('light');
      }
    }
  };

  // Checks the lightness sum of header background image and color and sets the lightness class depending on it's value.
 var bgPickerContentLightnessClass = function(bgPickerArea, bgPickerColorAlpha) {
   var bgPickerAreaGlobalAttr = bgPickerArea.attr('data-bg-global'),
       bgPickerAreaGlobal = '[data-bg-global="' + bgPickerAreaGlobalAttr + '"]',
       bgPickerAreaGlobalBooleanAttr = bgPickerArea.attr('data-bg-global-boolean'),
       bgPickerAreaGlobalBoolean = '[data-bg-global-boolean="false"]',
       bgPickerAreaMultiSectionAttr = bgPickerArea.attr('data-section-name'),
       bgPickerAreaMultiSection = '[data-section-name="' + bgPickerAreaMultiSectionAttr + '"]';

   if (bgPickerCombinedLightness >= 0.5) {
     $(bgPickerArea).find('.js-background-type').addClass('light-background').removeClass('dark-background');
     $(bgPickerAreaMultiSection).find('.js-background-type').addClass('light-background').removeClass('dark-background');

     if ( $(bgPickerArea).is('[data-bg-global-master="true"]') ) {
       $(bgPickerAreaGlobal).not(bgPickerAreaGlobalBoolean).find('.js-background-type').addClass('light-background').removeClass('dark-background');
     }

   } else {
     $(bgPickerArea).find('.js-background-type').addClass('dark-background').removeClass('light-background');
     $(bgPickerAreaMultiSection).find('.js-background-type').addClass('dark-background').removeClass('light-background');

     if ( $(bgPickerArea).is('[data-bg-global-master="true"]') ) {
       $(bgPickerAreaGlobal).not(bgPickerAreaGlobalBoolean).find('.js-background-type').addClass('dark-background').removeClass('light-background');
     }

   };

   if ( $('body').find('[data-bg-global-master="true"]').find('.js-background-type').hasClass('light-background') ) {
     var bgPickerAreaGlobalClass = 'light-background';
   } else {
     var bgPickerAreaGlobalClass = 'dark-background';
   };

   // Set mobile base bg when main section image bg isn't covering individual content areas.
   $('.container').find('.js-bg-picker-area').removeClass('transparent-dark-background transparent-light-background').addClass('transparent-' + bgPickerAreaGlobalClass);
   $('.container').find(bgPickerAreaGlobal).removeClass('transparent-dark-background transparent-light-background').addClass('transparent-' + bgPickerAreaGlobalClass);

   if ( bgPickerColorAlpha >= 0.5 ) {
     $(bgPickerArea).attr('data-bg-global-boolean', false);
     $(bgPickerAreaMultiSection).attr('data-bg-global-boolean', false);
   } else {
     $(bgPickerArea).attr('data-bg-global-boolean', true);
     $(bgPickerAreaMultiSection).attr('data-bg-global-boolean', true);
     $(bgPickerArea).find('.js-background-type').removeClass('light-background dark-background').addClass(bgPickerAreaGlobalClass);
     $(bgPickerAreaMultiSection).find('.js-background-type').removeClass('light-background dark-background').addClass(bgPickerAreaGlobalClass);
   };
 };

  // Enables the usage of the initiations outside this file.
  // For example add "<script>site.initBlogPage();</script>" at the end of the "Blog & News" page to initiate blog listing view functions.
  window.site = $.extend(window.site || {}, {
    toggleFlags: toggleFlags,
    togglePadding: togglePadding,
    bgPickerPreview: bgPickerPreview,
    bgPickerCommit: bgPickerCommit,
    bgPickerColorScheme: bgPickerColorScheme
  });


  init();
})(jQuery);
