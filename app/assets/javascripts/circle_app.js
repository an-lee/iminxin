//= require rails-ujs
//= require popper
//= require tabler
//= require tabler.plugins
//= require activestorage
//= require turbolinks
//= require noty
//= require qrcode
//= require_self

//= require_tree ./circle
//= require_tree ./components
//= require_tree ./pages

(function() {
  this.App || (this.App = {});

  // Configure noty
  Noty.overrideDefaults({ timeout: 5000, theme: 'mint', layout: 'center', closeWith: ['click', 'button'] });

  $(document).on('turbolinks:load', function() {
  });
}).call(this);
