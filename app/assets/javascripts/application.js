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
//= require camanjs-custom

$(function () {
  $('#creative_tags_tokens').tokenInput('/tags.json', { crossDomain: false, prePopulate: $('#creative_tags_tokens').data('pre'), theme: 'facebook' });
});