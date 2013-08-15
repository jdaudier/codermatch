// var destroyUser = function(userId){

//   if (confirm('Are you sure?')) {

//     $.ajax({
//       // since browsers are whacky, we may need to use POST instead of DELETE
//       type: "POST",
//       url: "/users/" + userId,
//       dataType: "json",
//       data: {"_method":"delete"},
//     });

//     alert("Your account was successfully deleted. Please come back again when you feel like pair programming :)")

//   }

//   else {

//     alert("Yay! You're still with us. We're logging you out, so you can take a break :)")

//   };
// };

var setNotifyFalse = function(userId){
  $.ajax({
    type: "PUT",
    url: "/users/" + userId,
    dataType: "json",
    data: {
      "user": {
        "notify": "false"
      }
    }
  });

  alert("You'll no longer get emails when a new coder of your language and level joins who can pair with you remotely.");

  $(".icon-envelope-alt").parent().parent().remove();
};

