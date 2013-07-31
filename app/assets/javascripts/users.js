var destroyUser = function(userId){
  $.ajax({
    type: "POST",
    url: "/users/" + userId,
    dataType: "json",
    data: {"_method":"delete"},
  });
};