$(window).bind "popstate", (e) ->
  oe = e.originalEvent
  if (oe.state)
    console.log oe.state.page
  document.location.href = oe.state.page if (oe.state and oe.state.page)
  return
