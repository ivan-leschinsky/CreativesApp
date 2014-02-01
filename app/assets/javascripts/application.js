//= require jquery
//= require shortcut
//= require jquery.arcticmodal-0.3.min
//= require jquery_ujs
//= require jquery-fileupload
//= require jquery-ui
//= require jquery.tokeninput
//= require markdown.converter
//= require markdown.sanitizer
//= require markdown.editor
//= require markdown.js
//= require foundation

//= require pictures
//= require read

//= require global
//= require camanjs/caman.full

$(function () {
  $("#creative_tag_tokens,#picture_tag_tokens").tokenInput("/tags", {
    theme: "facebook",
    crossDomain: false,
    prePopulate: $(this).data("pre")
  });
});