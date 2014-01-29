//= require creatives.js
//= require markdown.converter
//= require markdown.sanitizer
//= require markdown.editor
$(document).ready(function()	{
  var converter = Markdown.getSanitizingConverter();
	var editor = new Markdown.Editor(converter);
	editor.run();
});