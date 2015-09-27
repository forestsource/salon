$ ->
  $("#to_top").click ->
    $("html,body").animate
      scrollTop: 0
    , "slow"
    return

  return