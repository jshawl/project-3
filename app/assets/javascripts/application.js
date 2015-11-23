// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.minicolors
//= require jquery.minicolors.simple_form
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){

  $.minicolors = {
      defaults: {
          animationSpeed: 50,
          animationEasing: 'swing',
          change: null,
          changeDelay: 0,
          control: 'hue',
          dataUris: true,
          defaultValue: '',
          format: 'hex',
          hide: null,
          hideSpeed: 100,
          inline: false,
          keywords: '',
          letterCase: 'uppercase',
          opacity: false,
          position: 'bottom left',
          show: null,
          showSpeed: 50,
          theme: 'default'
        }
      }
    })
    // I was unable to use this feature on the deployed app. No errors in the console.
