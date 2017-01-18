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

  {% comment %}=================================================================
  || Design editor variables.
  ============================================================= {% endcomment %}
  {% capture base_font_set %}
    [
      {
        "type": "group",
        "title": "Sans Serif",
        "list": [
          {
            "title": "PT Sans",
            "value": "\"PT Sans\", Arial, sans-serif"
          },
          {
            "title": "Avenir Next",
            "value": "\"Avenir Next\", \"Helvetica Neue\", \"Helvetica\", \"Segoe UI\", sans-serif"
          },
          {
            "title": "Fira Sans",
            "value": "\"Fira Sans\", sans-serif"
          },
          {
            "title": "Lato",
            "value": "\"Lato\", sans-serif"
          },
          {
            "title": "Montserrat",
            "value": "\"Montserrat\", Helvetica, Arial, sans-serif"
          },
          {
            "title": "Open Sans",
            "value": "\"Open Sans\", sans-serif"
          },
          {
            "title": "Roboto",
            "value": "\"Roboto\", sans-serif"
          },
          {
            "title": "Source Sans Pro",
            "value": "\"Source Sans Pro\", sans-serif"
          },
          {
            "title": "Ubuntu",
            "value": "\"Ubuntu\", sans-serif"
          }
        ]
      },
      {
        "type": "group",
        "title": "Serif",
        "list": [
          {
            "title": "Arvo",
            "value": "\"Arvo\", serif"
          },
          {
            "title": "Crimson Text",
            "value": "\"Crimson Text\", serif"
          },
          {
            "title": "Lora",
            "value": "\"Lora\", serif"
          },
          {
            "title": "Noto Serif",
            "value": "\"Noto Serif\", serif"
          },
          {
            "title": "Playfair Display",
            "value": "\"Playfair Display\", serif"
          },
          {
            "title": "PT Serif",
            "value": "\"PT Serif\", serif"
          },
          {
            "title": "Roboto Slab",
            "value": "\"Roboto Slab\", serif"
          }
        ]
      },
      {
        "type": "group",
        "title": "Monospace",
        "list": [
          {
            "title": "Anonymous Pro",
            "value": "\"Anonymous Pro\", monospace"
          },
          {
            "title": "Cousine",
            "value": "\"Cousine\", monospace"
          },
          {
            "title": "Roboto Mono",
            "value": "\"Roboto Mono\", monospace"
          },
          {
            "title": "Ubuntu Mono",
            "value": "\"Ubuntu Mono\", monospace"
          }
        ]
      }
    ]
  {% endcapture %}

  {% capture base_number_of_columns_set %}
    [
      {
        "title": "1",
        "value": "100%"
      },
      {
        "title": "2",
        "value": "50%"
      },
      {
        "title": "3",
        "value": "33.3%"
      },
      {
        "title": "4",
        "value": "25%"
      },
      {
        "title": "5",
        "value": "20%"
      },
      {
        "title": "6",
        "value": "16.6%"
      },
      {
        "title": "7",
        "value": "14.2%"
      },
      {
        "title": "8",
        "value": "12.5%"
      },
      {
        "title": "9",
        "value": "11.1%"
      },
      {
        "title": "10",
        "value": "10%"
      }
    ]
  {% endcapture %}

{% endcapture %}
