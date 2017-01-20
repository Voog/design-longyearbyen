<header class="site-header">
  <div class="header-top">
    {% include "menu-level-1" %}
    <div class="site-options">
      <button class="menu-language-btn ico-flags ico-flag-{{ page.language_code }} js-toggle-menu-language js-prevent-sideclick">{{ current_language_title }}</button>
    </div>

    <a href="#" class="mobile-menu-toggler"><span></span></a>

    {% if site.search.enabled %}
      <button class="site-search-btn js-toggle-site-search js-prevent-sideclick">
        <svg xmlns="http://www.w3.org/2000/svg" width="16.75" height="16.906" viewBox="0 0 16.75 16.906">
          <defs>
            <style>
              .cls-1 {
                fill: #333;
                fill-rule: evenodd;
                opacity: 0.5;
              }
            </style>
          </defs>
          <path id="luup_copy_4" data-name="luup copy 4" class="cls-1" d="M919.626,32.664a7.482,7.482,0,0,1-2.422.445,6.8,6.8,0,0,1-6.788-6.8c0-.008,0-0.013,0-0.021a6.794,6.794,0,0,1,6.783-6.754V19.526a6.795,6.795,0,0,1,6.788,6.8,8.791,8.791,0,0,1-.531,2.637A5.97,5.97,0,0,1,919.626,32.664Zm-7.554-6.342a5.13,5.13,0,0,0,9.844,2.016l0.024-.056c0.056-.135.107-0.273,0.152-0.414,0.009-.028.017-0.057,0.025-0.086,0.041-.136.078-0.275,0.107-0.415,0.008-.035.012-0.071,0.019-0.107,0.025-.137.049-0.275,0.063-0.415,0-.047,0-0.095.008-0.142,0.01-.129.02-0.259,0.02-0.39A5.131,5.131,0,0,0,912.072,26.322Zm14.647,7.554-3.846-3.846a6.838,6.838,0,0,1-2.152,2.074l3.885,3.885A1.494,1.494,0,0,0,926.719,33.876Z" transform="translate(-910.406 -19.531)"/>
        </svg>
      </button>
    {% endif %}
  </div>

  <div class="content-area header-content">{% editable site.header %}</div>
  <div class="content-area slogan">{% xcontent name="slogan" %}</div>
</header>
