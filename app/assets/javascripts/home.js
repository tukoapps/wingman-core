// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


var ready;
ready = function(){

  $('.new_beta_email').on('ajax:success',function(data, status, xhr){
    if (status['status'] == "success"){
      $('.form-container').css("background-image", "none");
      $('.form-container').css("background-color", "#2ecc71");
    }else{
      $('.form-container').css("background-image", "none");
      $('.form-container').css("background-color", "#e74c3c");
    }
    $('#email-feedback').text(status['message']);
    
  }).on('ajax:error',function(xhr, status, error){
    console.log(status);
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);

$(function() {
  $('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
});

var threeColLoaded = false;
var sloganAnim = false;
var mock1Anim = false;
var mock2Anim = false;
var mock1TextAnim = false;
var mock2TextAnim = false;

$( window ).scroll(function() {
  if (window.pageYOffset > 200 && !threeColLoaded){
    loadThreeCol();
  }
  if (window.pageYOffset > 1000 && !sloganAnim){
    sloganAnimate();
  }
  if (window.pageYOffset > 1400 && !mock1Anim){
    mock1Animate();
    mock1TextAnimate();
  }
  if (window.pageYOffset > 1800 && !mock2Anim){
    mock2Animate();
    mock2TextAnimate();
  }
});

function mock1Animate(){
  $('#mock1').css("margin-right", 100);
  $('#mock1').css("opacity", 1);
  mock1Anim = true;
};

function mock2Animate(){
  $('#mock2').css("margin-left", 100);
  $('#mock2').css("opacity", 1);
  mock2Anim = true;
};

function mock1TextAnimate(){
  $('#mock1-text').css("opacity", 1);
  mock1TextAnim = true;
};

function mock2TextAnimate(){
  $('#mock2-text').css("opacity", 1);
  mock2TextAnim = true;
};

function sloganAnimate(){
  $('.font-anim').css("margin-left", 0);
  $('.font-anim').css("opacity", 1);
  sloganAnim = true;
};

function loadThreeCol(){
  $('#market1').css("opacity", 1);
  setTimeout(function(){
    $('#market2').css("opacity", 1);
  }, 500);
  setTimeout(function(){
    $('#market3').css("opacity", 1);
  }, 1000);
  threeColLoaded = true;
};

$(document).ready(function(){
  setTimeout(function(){
    $('.masthead-brand').css("margin-top", -10);
  }, 500);
  setTimeout(function(){
    $('.masthead-nav').css("margin-top", 0);
    $('.masthead-nav').css("opacity", 1);
  }, 1000);
  setTimeout(function(){
    $('#main-cover').css("opacity", 1);
  }, 2000);
}); 