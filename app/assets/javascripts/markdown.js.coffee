$ ->
  if $(".chapter").length
    converter = Markdown.getSanitizingConverter()
    editor = new Markdown.Editor(converter)
    editor.run()
  $(".markdown-source").each ->
    converter = Markdown.getSanitizingConverter()
    $(this).html converter.makeHtml($(this).text())
  $(".addimagebutton").click ->
    txt = $.trim($(this).attr('url'))
    box = $(".wmd-input")
    box.val box.val() + "![](#{txt})"