{% capture dont_render %}
  {% comment %}Detects viewing mode.{% endcomment %}
  {% if editmode %}
    {% assign view_mode = "editmode" %}
  {% else %}
    {% assign view_mode = "publicmode" %}
  {% endif %}

  {% comment %}Sets current language title variable.{% endcomment %}
  {% for language in site.languages %}
    {% if language.selected? %}
      {% assign current_language_title = language.title %}
    {% endif %}
  {% endfor %}

  {% comment %}Detects language flags visibility settings.{% endcomment %}
  {% if site.data.language_flags_enabled == nil or site.data.language_flags_enabled == false %}
    {% assign language_flags_mode = "language-flags-disabled" %}
  {% else %}
    {% assign language_flags_mode = "language-flags-enabled" %}
  {% endif %}

  {% comment %}ASSIGN FEATURE 1 SECTION WIDTH{% endcomment %}
  {% assign feature_1_is_wide = page.data.feature_1_is_wide %}
  {% if feature_1_is_wide == true %}
    {% assign feature_1_section_width = "" %}
  {% else %}
    {% assign feature_1_section_width = "section-with-padding" %}
  {% endif %}

  {% comment %}ASSIGN FEATURE 2 SECTION WIDTH{% endcomment %}
  {% assign feature_2_is_wide = page.data.feature_2_is_wide %}
  {% if feature_2_is_wide == true %}
    {% assign feature_2_section_width = "" %}
  {% else %}
    {% assign feature_2_section_width = "section-with-padding" %}
  {% endif %}

  {% comment %}ASSIGN FEATURE 3 SECTION WIDTH{% endcomment %}
  {% assign feature_3_is_wide = page.data.feature_3_is_wide %}
  {% if feature_3_is_wide == true %}
    {% assign feature_3_section_width = "" %}
  {% else %}
    {% assign feature_3_section_width = "section-with-padding" %}
  {% endif %}

  {% comment %}ASSIGN FEATURE 4 SECTION WIDTH{% endcomment %}
  {% assign feature_4_is_wide = page.data.feature_4_is_wide %}
  {% if feature_4_is_wide == true %}
    {% assign feature_4_section_width = "" %}
  {% else %}
    {% assign feature_4_section_width = "section-with-padding" %}
  {% endif %}

  {% comment %}SITE MAIN SECTION RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign main_bg = page.data.main_bg %}
  {% assign main_bg_image = main_bg.image %}
  {% assign main_bg_image_sizes = main_bg.imageSizes %}
  {% assign main_bg_color = main_bg.color %}
  {% assign main_bg_color_data = main_bg.colorData %}
  {% assign main_bg_combined_lightness = main_bg.combinedLightness %}

  {% assign main_bg_image_color_data = main_bg.imageColorData %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if main_bg %}
    {% if main_bg_combined_lightness %}
      {% if main_bg_combined_lightness > 0.5 %}
        {% assign main_bg_type = "light-background" %}
        {% assign content_bg_transparent = "transparent-light-background" %}
      {% else %}
        {% assign main_bg_type = "dark-background" %}
        {% assign content_bg_transparent = "transparent-dark-background" %}
      {% endif %}
    {% else %}
      {% if main_bg_color_data.a >= 0.5 %}
        {% if main_bg_color_data.lightness >= 0.5 %}
          {% assign main_bg_type = "light-background" %}
          {% assign content_bg_transparent = "transparent-light-background" %}
        {% else %}
          {% assign main_bg_type = "dark-background" %}
          {% assign content_bg_transparent = "transparent-dark-background" %}
        {% endif %}
      {% else %}
        {% assign main_bg_type = "light-background" %}
        {% assign content_bg_transparent = "transparent-light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign main_bg_type = "dark-background" %}
    {% assign content_bg_transparent = "transparent-dark-background" %}
  {% endif %}

  {% if main_bg_image == nil %}
    {% assign main_bg_image = images_path | append: "/front-page-bg_block.jpg" %}
  {% endif %}

  {% if main_bg_image_sizes == nil %}
    {% assign main_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-page-bg.jpg", "width":2800, "height":1776}, {"url":"' | append: images_path | append: '/front-page-bg_huge.jpg", "width":2048, "height":1299}, {"url":"' | append: images_path | append: '/front-page-bg_large.jpg", "width":1280, "height":812}]' %}
  {% else %}
    {% if main_bg_image_sizes == "" %}
      {% assign main_bg_image_sizes_str = "" %}
    {% else %}
      {% assign main_bg_image_sizes_str = main_bg_image_sizes | json %}
    {% endif %}
  {% endif %}

  {% if main_bg_color == nil %}
    {% assign main_bg_color = "rgba(0, 0, 0, 0)" %}
  {% endif %}

  {% if main_bg_color_data == nil %}
    {% assign main_bg_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0, "lightness": 0.18}' %}
  {% else %}
    {% assign main_bg_color_data_str = main_bg_color_data | json %}
  {% endif %}

  {% if main_bg_image_color_data == nil %}
    {% assign main_bg_image_color_data = "rgb(42, 46, 46)" %}
  {% endif %}

  {% comment %}FRONT PAGE CONTENT AREA 1 RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign content_bg_1 = page.data.content_bg_1 %}
  {% assign content_bg_1_color = content_bg_1.color %}
  {% assign content_bg_1_color_data = content_bg_1.colorData %}
  {% assign content_bg_1_combined_lightness = content_bg_1.combinedLightness %}
  {% assign content_bg_1_alpha = content_bg_1.colorData.a %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if content_bg_1 %}
    {% if content_bg_1_combined_lightness %}
      {% if content_bg_1_combined_lightness > 0.5 %}
        {% assign content_bg_1_type = "light-background" %}
      {% else %}
        {% assign content_bg_1_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if content_bg_1_color_data.a >= 0.5 %}
        {% if content_bg_1_color_data.lightness >= 0.5 %}
          {% assign content_bg_1_type = "light-background" %}
        {% else %}
          {% assign content_bg_1_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign content_bg_1_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign content_bg_1_type = "light-background" %}
  {% endif %}

  {% if content_bg_1_color == nil %}
    {% assign content_bg_1_color = "rgba(255, 255, 255, 1)" %}
  {% endif %}

  {% if content_bg_1_color_data == nil %}
    {% assign content_bg_1_color_data_str = '{"r": 255, "g": 255, "b": 255, "a": 1, "lightness": 1}' %}
  {% else %}
    {% assign content_bg_1_color_data_str = content_bg_1_color_data | json %}
  {% endif %}

  {% comment %}Allow global bg to apply lightness into individual transparent content areas.{% endcomment %}
  {% if content_bg_1_color_data.a >= 0.5 %}
    {% assign content_1_global_bg_boolean = "false" %}
  {% else %}
    {% unless content_bg_1 == nil %}
      {% assign content_1_global_bg_boolean = "true" %}
      {% assign content_bg_1_type = main_bg_type %}
    {% endunless%}
  {% endif %}
  {% if content_bg_1_alpha == nil %}
    {% assign content_1_global_bg_boolean = "true" %}
  {% endif %}
  {% if content_bg_1 == nil %}
    {% assign content_1_global_bg_boolean = "false" %}
  {% endif %}

  {% comment %}Empty content area detection.{% endcomment %}
  {% capture feature_1_html %}{% unless editmode %}{% content name="feature_1" %}{% endunless %}{% endcapture %}
  {% capture feature_1_size %}{{ feature_1_html | size | minus : 1 }}{% endcapture %}
  {% unless feature_1_size contains "-" %}
    {% assign feature_1_has_content = true %}
  {% endunless %}
  {% unless feature_1_has_content or editmode %}
    {% assign feature_1_empty = "section-empty" %}
  {% endunless %}

  {% if feature_1_has_content %}
    {% assign feature_1_visible = true %}
  {% else %}
    {% if content_bg_1_color_data.a > 0 %}
      {% assign feature_1_visible = true %}
    {% else %}
      {% if content_bg_1 == nil %}
        {% assign feature_1_visible = true %}
      {% else %}
        {% assign feature_1_visible = false %}
      {% endif %}
    {% endif %}
  {% endif %}

  {% comment %}FRONT PAGE CONTENT AREA 2 RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign content_bg_2 = page.data.content_bg_2 %}
  {% assign content_bg_2_color = content_bg_2.color %}
  {% assign content_bg_2_color_data = content_bg_2.colorData %}
  {% assign content_bg_2_combined_lightness = content_bg_2.combinedLightness %}
  {% assign content_bg_2_alpha = content_bg_2.colorData.a %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if content_bg_2 %}
    {% if content_bg_2_color_data.a >= 0.5 %}
      {% assign content_2_global_bg_boolean = "false" %}
    {% endif %}
    {% if content_bg_2_combined_lightness %}
      {% if content_bg_2_combined_lightness > 0.5 %}
        {% assign content_bg_2_type = "light-background" %}
      {% else %}
        {% assign content_bg_2_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if content_bg_2_color_data.a >= 0.5 %}
        {% if content_bg_2_color_data.lightness >= 0.5 %}
          {% assign content_bg_2_type = "light-background" %}
        {% else %}
          {% assign content_bg_2_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign content_bg_2_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign content_bg_2_type = "light-background" %}
  {% endif %}

  {% if content_bg_2_color == nil %}
    {% assign content_bg_2_color = "rgba(233, 233, 233, 1)" %}
  {% endif %}

  {% if content_bg_2_color_data == nil %}
    {% assign content_bg_2_color_data_str = '{"r": 233, "g": 233, "b": 233, "a": 1, "lightness": 0.91}' %}
  {% else %}
    {% assign content_bg_2_color_data_str = content_bg_2_color_data | json %}
  {% endif %}

  {% comment %}Allow global bg to apply lightness into individual transparent content areas.{% endcomment %}
  {% if content_bg_2_color_data.a >= 0.5 %}
    {% assign content_2_global_bg_boolean = "false" %}
  {% else %}
    {% unless content_bg_2 == nil %}
      {% assign content_2_global_bg_boolean = "true" %}
      {% assign content_bg_2_type = main_bg_type %}
    {% endunless%}
  {% endif %}
  {% if content_bg_2_alpha == nil %}
    {% assign content_2_global_bg_boolean = "true" %}
  {% endif %}
  {% if content_bg_2 == nil %}
    {% assign content_2_global_bg_boolean = "false" %}
  {% endif %}

  {% comment %}Empty content area detection.{% endcomment %}
  {% capture feature_2_html %}{% unless editmode %}{% content name="feature_2" %}{% endunless %}{% endcapture %}
  {% capture feature_2_size %}{{ feature_2_html | size | minus : 1 }}{% endcapture %}
  {% unless feature_2_size contains "-" %}
    {% assign feature_2_has_content = true %}
  {% endunless %}
  {% unless feature_2_has_content or editmode %}
    {% assign feature_2_empty = "section-empty" %}
  {% endunless %}

  {% if feature_2_has_content %}
    {% assign feature_2_visible = true %}
  {% else %}
    {% if content_bg_2_color_data.a > 0 %}
      {% assign feature_2_visible = true %}
    {% else %}
      {% if content_bg_2 == nil %}
        {% assign feature_2_visible = true %}
      {% else %}
        {% assign feature_2_visible = false %}
      {% endif %}
    {% endif %}
  {% endif %}

  {% comment %}FRONT PAGE CONTENT AREA 3 RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign content_bg_3 = page.data.content_bg_3 %}
  {% assign content_bg_3_color = content_bg_3.color %}
  {% assign content_bg_3_color_data = content_bg_3.colorData %}
  {% assign content_bg_3_combined_lightness = content_bg_3.combinedLightness %}
  {% assign content_bg_3_alpha = content_bg_3.colorData.a %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if content_bg_3 %}
    {% if content_bg_3_color_data.a >= 0.5 %}
      {% assign content_3_global_bg_boolean = "false" %}
    {% endif %}
    {% if content_bg_3_combined_lightness %}
      {% if content_bg_3_combined_lightness > 0.5 %}
        {% assign content_bg_3_type = "light-background" %}
      {% else %}
        {% assign content_bg_3_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if content_bg_3_color_data.a >= 0.5 %}
        {% if content_bg_3_color_data.lightness >= 0.5 %}
          {% assign content_bg_3_type = "light-background" %}
        {% else %}
          {% assign content_bg_3_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign content_bg_3_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign content_bg_3_type = "dark-background" %}
  {% endif %}

  {% if content_bg_3_color == nil %}
    {% assign content_bg_3_color = "rgba(21, 39, 51, 1)" %}
  {% endif %}

  {% if content_bg_3_color_data == nil %}
    {% assign content_bg_3_color_data_str = '{"r": 21, "g": 39, "b": 51, "a": 1, "lightness": 0.14}' %}
  {% else %}
    {% assign content_bg_3_color_data_str = content_bg_3_color_data | json %}
  {% endif %}

  {% comment %}Allow global bg to apply lightness into individual transparent content areas.{% endcomment %}
  {% if content_bg_3_color_data.a >= 0.5 %}
    {% assign content_3_global_bg_boolean = "false" %}
  {% else %}
    {% unless content_bg_3 == nil %}
      {% assign content_3_global_bg_boolean = "true" %}
      {% assign content_bg_3_type = main_bg_type %}
    {% endunless%}
  {% endif %}
  {% if content_bg_3_alpha == nil %}
    {% assign content_3_global_bg_boolean = "true" %}
  {% endif %}
  {% if content_bg_3 == nil %}
    {% assign content_3_global_bg_boolean = "false" %}
  {% endif %}

  {% comment %}Empty content area detection.{% endcomment %}
  {% capture feature_3_html %}{% unless editmode %}{% content name="feature_3" %}{% endunless %}{% endcapture %}
  {% capture feature_3_size %}{{ feature_3_html | size | minus : 1 }}{% endcapture %}
  {% unless feature_3_size contains "-" %}
    {% assign feature_3_has_content = true %}
  {% endunless %}
  {% unless feature_3_has_content or editmode %}
    {% assign feature_3_empty = "section-empty" %}
  {% endunless %}

  {% if feature_3_has_content %}
    {% assign feature_3_visible = true %}
  {% else %}
    {% if content_bg_3_color_data.a > 0 %}
      {% assign feature_3_visible = true %}
    {% else %}
      {% if content_bg_3 == nil %}
        {% assign feature_3_visible = true %}
      {% else %}
        {% assign feature_3_visible = false %}
      {% endif %}
    {% endif %}
  {% endif %}

  {% comment %}FRONT PAGE CONTENT AREA 4 RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign content_bg_4 = page.data.content_bg_4 %}
  {% assign content_bg_4_color = content_bg_4.color %}
  {% assign content_bg_4_color_data = content_bg_4.colorData %}
  {% assign content_bg_4_combined_lightness = content_bg_4.combinedLightness %}
  {% assign content_bg_4_alpha = content_bg_4.colorData.a %}

  {% comment %}Sets the background type to choose active CMS color scheme.{% endcomment %}
  {% if content_bg_4 %}
    {% if content_bg_4_combined_lightness %}
      {% if content_bg_4_combined_lightness > 0.5 %}
        {% assign content_bg_4_type = "light-background" %}
      {% else %}
        {% assign content_bg_4_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if content_bg_4_color_data.a >= 0.5 %}
        {% if content_bg_4_color_data.lightness >= 0.5 %}
          {% assign content_bg_4_type = "light-background" %}
        {% else %}
          {% assign content_bg_4_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign content_bg_4_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign content_bg_4_type = "dark-background" %}
  {% endif %}

  {% if content_bg_4_color == nil %}
    {% assign content_bg_4_color = "rgba(0, 0, 0, 0)" %}
  {% endif %}

  {% if content_bg_4_color_data == nil %}
    {% assign content_bg_4_color_data_str = '{"r": 0, "g": 0, "b": 0, "a": 0, "lightness": 0}' %}
  {% else %}
    {% assign content_bg_4_color_data_str = content_bg_4_color_data | json %}
  {% endif %}

  {% comment %}Allow global bg to apply lightness into individual transparent content areas.{% endcomment %}
  {% if content_bg_4_color_data.a >= 0.5 %}
    {% assign content_4_global_bg_boolean = "false" %}
  {% else %}
    {% unless content_bg_4 == nil %}
      {% assign content_4_global_bg_boolean = "true" %}
    {% endunless%}
    {% assign content_bg_4_type = main_bg_type %}
  {% endif %}
  {% if content_bg_4_alpha == nil %}
    {% assign content_4_global_bg_boolean = "true" %}
  {% endif %}
  {% if content_bg_4 == nil %}
    {% assign content_4_global_bg_boolean = "true" %}
  {% endif %}

  {% comment %}Minimize section height when only voog reference is show.{% endcomment %}
  {% capture feature_4_html %}{% unless editmode %}{% content name="feature_4" %}{% endunless %}{% endcapture %}
  {% capture feature_4_size %}{{ feature_4_html | size | minus : 1 }}{% endcapture %}
  {% unless feature_4_size contains "-" %}
    {% assign feature_4_has_content = true %}
  {% endunless %}
  {% unless feature_4_has_content or editmode %}
    {% assign feature_4_empty = "section-empty" %}
  {% endunless %}

  {% if feature_4_has_content %}
    {% assign feature_4_visible = true %}
  {% else %}
    {% if content_bg_4_color_data.a > 0 %}
      {% assign feature_4_visible = true %}
    {% else %}
      {% assign feature_4_visible = false %}
    {% endif %}
  {% endif %}

  {% comment %}Assign Voog reference bg lightness, based on current visible parent bg.{% endcomment %}
  {% unless feature_4_visible %}
    {% assign voog_reference_bg_transparent = content_bg_transparent %}
  {% endunless %}

  {% if feature_4_visible or editmode %}
    {% assign voog_reference_bg_type = content_bg_4_type %}
  {% else %}
    {% if feature_3_visible %}
      {% assign voog_reference_bg_type = content_bg_3_type %}
    {% else %}
      {% if feature_2_visible %}
        {% assign voog_reference_bg_type = content_bg_2_type %}
      {% else %}
        {% if feature_1_visible %}
          {% assign voog_reference_bg_type = content_bg_1_type %}
        {% else %}
          {% assign voog_reference_bg_type = main_bg_type %}
        {% endif %}
      {% endif %}
    {% endif %}
  {% endif %}

{% endcapture %}
