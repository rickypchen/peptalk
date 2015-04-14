$(document).ready(function() {


  $('button#login-trigger').on('click', function(){
    $('div.login-box-off').toggleClass("login-box-on");
  });

  $('button.follow').on('click', function(e){
    e.preventDefault();

    var motivator = $('li.user').text();

    var ajaxRequest = $.ajax({
      url: '/follow/' + motivator,
      type: "get",
    });

    ajaxRequest.done(function(){
      $('button.follow').addClass("following");
      $('button.follow').text("Following");
    });
  });


});
