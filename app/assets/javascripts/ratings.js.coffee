jQuery ($) ->
  $(".rating-action").on "click", ->
    $("#rating_value").val $(this).attr "data-rating-val"
    $("#new_rating").submit()
    return false
