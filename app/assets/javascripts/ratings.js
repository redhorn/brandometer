var documentReady = false;

jQuery(document).bind("ready", function() {
  if (documentReady) {
    return
  } else {
    documentReady = true;
  }

  function submitRatingVal(val) {
    $("#rating_value").val(val);
    $("#new_rating").submit();
  }

  $("#rate_down").on("click", function() {
    submitRatingVal("-1")
  });
  $("#rate_skip").on("click", function() {
    submitRatingVal("0")
  });
  $("#rate_up").on("click", function() {
    submitRatingVal("1")
  });
});
