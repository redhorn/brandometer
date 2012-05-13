jQuery ($) ->
  $(".battle-action").on "click", ->
    $("#battle_winner").val $(this).attr "data-brand-id"
    $("#new_battle").submit()
    return false
