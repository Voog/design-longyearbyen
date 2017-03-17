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
.content-area.introtext, .content-area.introtext h1, .content-area.introtext h2, .content-area.introtext h3 {
  font-family: var(--main-font-family);
}
.content-area a {
  color: var(--content-link-color);
  border-bottom: 5px solid var(--content-link-hover-color);
}
.content-area a:hover {
  background: var(--content-link-hover-color);
}
.content-area .custom-btn {
  padding: calc(var(--content-button-padding) - 8px) var(--content-button-padding);
  font-size: var(--content-button-font-size);
  font-style: var(--content-button-font-style);
  color: var(--content-button-color);
  text-decoration: var(--content-button-text-decoration);
  text-transform: var(--content-button-text-transform);
}
.content-area .custom-btn:not(.custom-btn-disabled) {
  background: var(--content-button-background-color);
}
.content-area .custom-btn:not(.custom-btn-disabled):hover {
  color: var(--content-button-hover-color);
  background-color: var(--content-button-background-color);
}
.content-area .article-read-more-btn {
  font-style: var(--content-button-font-style);
  color: var(--content-button-color);
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
  text-decoration: var(--content-button-text-decoration);
  text-transform: var(--content-button-text-transform);
  background: var(--content-button-background-color);
}
.content-area .form_submit input:hover {
  color: var(--content-button-hover-color);
  background-color: var(--content-button-background-color);
}
