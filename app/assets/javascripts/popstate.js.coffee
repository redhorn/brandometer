$(window).bind "popstate", (e) ->
  oe = e.originalEvent
  document.location.href = oe.state.page if (oe.state and oe.state.page)
  return
