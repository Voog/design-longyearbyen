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
  {% assign language_flags_enabled = site.data.language_flags_enabled %}
  {% if language_flags_enabled == nil or language_flags_enabled == false %}
    {% assign language_flags_mode = "language-flags-disabled" %}
  {% else %}
    {% assign language_flags_mode = "language-flags-enabled" %}
  {% endif %}

  {% comment %}== FRONT PAGE FEATURE 1 RELATED ASSIGNMENTS START =={% endcomment %}
  {% unless page.data.feature_1_is_wide %}
    {% assign feature_1_section_padding_class = "section-with-padding" %}
  {% endunless %}

  {% capture feature_1_html %}{% unless editmode %}{% content name="feature_1" %}{% endunless %}{% endcapture %}
  {% capture feature_1_size %}{{ feature_1_html | size | minus : 1 }}{% endcapture %}

  {% unless feature_1_size contains "-" %}
    {% assign feature_1_has_content = true %}
  {% endunless %}

  {% assign content_bg_1 = page.data.content_bg_1 %}
  {% assign content_bg_1_color = content_bg_1.color %}

  {% if content_bg_1_color == nil %}
    {% assign content_bg_1_color = "rgba(244, 244, 244, 1)" %}
  {% endif %}

  {% if content_bg_1 == nil %}
    {% assign content_bg_1_str = '{"color": "rgba(244, 244, 244, 1)", "colorData": {"r": 244, "g": 244, "b": 244, "a": 1, "lightness": 0.96}, "image": "", "imageSizes": ""}' %}
  {% else %}
    {% assign content_bg_1_str = content_bg_1 | json %}
  {% endif %}
  {% comment %}== FRONT PAGE FEATURE 1 RELATED ASSIGNMENTS END =={% endcomment %}

  {% comment %}== FRONT PAGE FEATURE 2 RELATED ASSIGNMENTS START =={% endcomment %}
  {% assign feature_2_is_wide = page.data.feature_2_is_wide %}

  {% unless feature_2_is_wide == nil or feature_2_is_wide == true %}
    {% assign feature_2_section_padding_class = "section-with-padding" %}
  {% endunless %}

  {% capture feature_2_html %}{% unless editmode %}{% content name="feature_2" %}{% endunless %}{% endcapture %}
  {% capture feature_2_size %}{{ feature_2_html | size | minus : 1 }}{% endcapture %}

  {% unless feature_2_size contains "-" %}
    {% assign feature_2_has_content = true %}
  {% endunless %}

  {% assign content_bg_2 = page.data.content_bg_2 %}
  {% assign content_bg_2_color = content_bg_2.color %}

  {% if content_bg_2_color == nil %}
    {% assign content_bg_2_color = "rgba(244, 244, 244, 1)" %}
  {% endif %}

  {% if content_bg_2 == nil %}
    {% assign content_bg_2_str = '{"color": "rgba(244, 244, 244, 1)", "colorData": {"r": 244, "g": 244, "b": 244, "a": 1, "lightness": 0.96}, "image": "", "imageSizes": ""}' %}
  {% else %}
    {% assign content_bg_2_str = content_bg_2 | json %}
  {% endif %}
  {% comment %}== FRONT PAGE FEATURE 2 RELATED ASSIGNMENTS END =={% endcomment %}

  {% comment %}Product related layouts variables.{% endcomment %}
  {% assign product_list_layout = "Product list" %}
  {% assign product_layout = "Product" %}

  {% assign show_product_related_pages_in_main_menu = site.data.settings_root_item.show_product_related_pages_in_main_menu %}
{% endcapture %}
