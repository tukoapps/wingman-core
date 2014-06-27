// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

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

$( window ).scroll(function() {
  if (window.pageYOffset > 200 && !threeColLoaded){
    loadThreeCol();
  }
  if (window.pageYOffset > 1000 && !sloganAnim){
    sloganAnimate();
  }
});

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