.site-container {
  background-color: var(--body-background-color);
}

@media screen and (min-width: 641px) {
  .item-list-page .content-item-box {
    width: var(--product-list-box-width);
  }
}

.item-top .top-inner {
  border-radius: var(--product-box-image-radius);
}

.item-placeholder {
  color: var(--product-list-box-color);
}

.item-title {
  line-height: var(--product-box-line-height);
}

.item-title .item-link {
  -webkit-text-decoration: var(--product-box-text-decoration);
          text-decoration: var(--product-box-text-decoration);
}

.item-list-page .item-title {
  font-style: var(--product-box-font-style);
  text-transform: var(--product-box-text-transform);
}

.content-item-box .item-title {
  color: var(--product-list-box-color);
}

@media screen and (min-width: 641px) {
  .content-item-box .item-title {
    font-size: var(--product-box-font-size);
  }
}

.site-container .wrap {
  max-width: var(--wrap-max-width);
}

.wrap .page-content {
  background: var(--content-background-color);
}

body {
  font-family: var(--main-font-family);
}

.mobile-menu {
  font-family: var(--main-font-family);
}

.menu:not(.menu-vertical) li {
  font-size: var(--menu-main-font-size);
}

.menu:not(.menu-vertical) li a:hover {
  color: var(--menu-main-hover-color);
  background-color: var(--menu-main-background-color);
}

.menu-main li a {
  color: var(--menu-main-color);
}

.menu-main li.selected a {
  color: var(--menu-main-active-color);
}

.menu-horizontal.menu-sub li {
  font-size: var(--menu-sub-font-size);
}

.menu-horizontal.menu-sub li a {
  color: var(--menu-sub-color);
}

.menu-horizontal.menu-sub li a:hover {
  color: var(--menu-sub-hover-color);
  background: var(--submenu-link-background-color);
}

.menu-horizontal.menu-sub li a.current {
  color: var(--menu-sub-active-color);
}

.pswp__caption__center {
  font-family: var(--main-font-family);
}

.blog-and-news-page .article-title {
  font-family: var(--headings-font-family);
}

.blog-and-news-page .articles-listing .article-title {
  font-family: var(--main-font-family);
}

.content-area,
.content-area p {
  color: var(--content-body-color);
}

.content-area h1,
.content-area h2,
.content-area h3,
.content-area h4,
.content-area h5,
.content-area h6 {
  font-family: var(--headings-font-family);
}

.content-area.header-content h1 {
  font-family: var(--headings-font-family);
}

.content-area.header-content h2 {
  font-family: var(--headings-font-family);
}

.content-area.header-content h3 {
  font-family: var(--headings-font-family);
}

.content-area.introtext,
.content-area.introtext h1,
.content-area.introtext h2,
.content-area.introtext h3 {
  font-family: var(--main-font-family);
}

.content-area a {
  color: var(--content-link-color);
  border-bottom: 5px solid var(--content-link-hover-color);
}

.content-area a:hover {
  background: var(--content-link-hover-color);
}

.content-area .custom-btn,
.content-area .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-btn-wrap .edy-product-widget-item-btn {
  padding: calc(var(--content-button-padding) - 8px) var(--content-button-padding);
  font-size: var(--content-button-font-size);
  font-style: var(--content-button-font-style);
  color: var(--content-button-color);
  -webkit-text-decoration: var(--content-button-text-decoration);
          text-decoration: var(--content-button-text-decoration);
  text-transform: var(--content-button-text-transform);
}

.content-area .custom-btn:not(.custom-btn-disabled),
.content-area .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-btn-wrap .edy-product-widget-item-btn:not(.custom-btn-disabled) {
  background: var(--content-button-background-color);
}

.content-area .custom-btn:not(.custom-btn-disabled):hover,
.content-area .edy-product-widget-list .edy-product-widget-item-wrap .edy-product-widget-item .edy-product-widget-item-details-wrap .edy-product-widget-item-btn-wrap .edy-product-widget-item-btn:not(.custom-btn-disabled):hover {
  color: var(--content-button-hover-color);
  background-color: var(--content-button-background-color);
}

.content-area .edy-buy-button-price-container .edy-buy-button-effective-price,
.content-area .edy-buy-button-price-container .edy-buy-button-price-original {
  color: var(--content-body-color);
}

.content-area .article-read-more-btn {
  font-style: var(--content-button-font-style);
  color: var(--content-button-color);
  -webkit-text-decoration: var(--content-button-text-decoration);
          text-decoration: var(--content-button-text-decoration);
  text-transform: var(--content-button-text-transform);
  background: var(--content-button-background-color);
}

.content-area .article-read-more-btn:hover {
  color: var(--content-button-hover-color);
  background-color: var(--content-button-background-color);
}

.content-area .form_field_textfield,
.content-area .form_field_textarea,
.content-area .form_field_select {
  font-size: var(--form-field-font-size);
  font-style: var(--form-field-font-style);
  font-weight: var(--form-field-font-weight);
  color: var(--form-field-color);
  -webkit-text-decoration: var(--form-field-text-decoration);
          text-decoration: var(--form-field-text-decoration);
  text-transform: var(--form-field-text-transform);
  background-color: var(--form-field-background-color);
}

.content-area label .form_field_checkbox + .form_control_indicator::before {
  background-color: var(--form-field-background-color);
  border-color: var(--secondary-color);
}

.content-area label .form_field_checkbox:checked + .form_control_indicator::before {
  background-color: var(--secondary-color);
}

.content-area label .form_field_radio + .form_control_indicator::before {
  border-color: var(--form-field-background-color);
  outline-color: var(--secondary-color);
}

.content-area label .form_field_radio:checked + .form_control_indicator::before {
  background-color: var(--secondary-color);
}

.content-area .form_submit input {
  padding: calc(var(--content-button-padding) - 8px) var(--content-button-padding);
  font-family: var(--main-font-family);
  font-size: var(--content-button-font-size);
  font-style: var(--content-button-font-style);
  color: var(--content-button-color);
  -webkit-text-decoration: var(--content-button-text-decoration);
          text-decoration: var(--content-button-text-decoration);
  text-transform: var(--content-button-text-transform);
  background: var(--content-button-background-color);
}

.content-area .form_submit input:hover {
  color: var(--content-button-hover-color);
  background-color: var(--content-button-background-color);
}

.product-page .content-header h1 {
  font-size: var(--product-title-size);
  font-weight: var(--product-title-font-weight);
  font-style: var(--product-title-font-style);
  -webkit-text-decoration: var(--product-title-font-text-decoration);
          text-decoration: var(--product-title-font-text-decoration);
  color: var(--product-title-color);
  text-align: var(--product-title-alignment);
}

.product-page .formatted .content-product-description {
  font-size: var(--product-description-size);
  font-weight: var(--product-description-font-weight);
  font-style: var(--product-description-font-style);
  -webkit-text-decoration: var(--product-description-font-text-decoration);
          text-decoration: var(--product-description-font-text-decoration);
}

.product-page .formatted .content-product-description,
.product-page .formatted .content-product-description a {
  color: var(--product-description-color);
}

.product-page .product-price {
  color: var(--product-price-color);
  font-size: var(--product-price-size);
  font-weight: var(--product-price-font-weight);
  font-style: var(--product-price-font-style);
  -webkit-text-decoration: var(--product-price-font-text-decoration);
          text-decoration: var(--product-price-font-text-decoration);
}
