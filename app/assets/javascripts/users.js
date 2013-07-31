var destroyUser = function(userId){

  if (confirm('Are you sure?')) { 

    $.ajax({
      type: "POST",
      url: "/users/" + userId,
      dataType: "json",
      data: {"_method":"delete"},
    });

    alert("Your account was successfully deleted. Please come back again when you feel like pair programming :)")

  }  

  else {

    alert("Yay!! You're still with us. We are logging you out, so you can take a break :)")

  };
};