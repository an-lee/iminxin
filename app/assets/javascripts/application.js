// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require popper
//= require tabler
//= require tabler.plugins
//= require activestorage
//= require turbolinks
//= require noty
//= require qrcode
//= require_self

//= require_tree ./components
//= require_tree ./pages

(function() {
  this.App || (this.App = {});

  // Configure noty
  Noty.overrideDefaults({ timeout: 5000, theme: 'mint', layout: 'center', closeWith: ['click', 'button'] });

  $(document).on('turbolinks:load', function() {
  });
}).call(this);
