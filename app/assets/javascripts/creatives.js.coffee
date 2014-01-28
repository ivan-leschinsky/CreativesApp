$("#mySpinner").hide()
$("#mySpinner").html('<img src="/assets/465.GIF"/>')
$("#sortable").sortable
  axis: "y"
  opacity: 0.8
  update: (event, ui) ->
    $("#mySpinner").fadeIn 100
    sortedParams = "?sorted=" + $("#sortable").sortable("toArray")
    $.post $("#sortable").attr("data-url") + sortedParams, (data) ->
      escape data
$("#sortable-grid").sortable
  opacity: 0.8
  update: (event, ui) ->
    $("#mySpinner").fadeIn 100
    sortedParams = "?sorted=" + $("#sortable").sortable("toArray")
    $.post $("#sortable").attr("data-url") + sortedParams, (data) ->
      escape data
$("#sortable-grid").disableSelection();