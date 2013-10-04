// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require vendor/custom.modernizr
//= require foundation
//= require_directory .

$(function(){ 
  $(document).foundation();

  $('#template select').change(function(e){
    $('.forms').hide();

    $this = $(this);
    if($this.val() != ''){
      $('#' + $this.val()).show();
      $('#template').hide();
    }
  }).change(); // init

  $('.step2 .nav_left').click(function(){
    $(this).parents('.forms').hide();
    $('#template').show();
  });

  $('.step2 .nav_right').click(function(){
    var f = $(this).parents('.forms');
    f.find('.step2').hide();
    f.find('.step3').show();
  });

  $('.step3 .nav_left').click(function(){
    var f = $(this).parents('.forms');
    f.find('.step2').show();
    f.find('.step3').hide();
  });

  $('.datepicker').datepicker({
    onSelect: function(date, inst){
      $('.when_run').val(date)
    }
  });
});
