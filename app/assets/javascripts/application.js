// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function() {
     $("#sort_preference").change(function() {
     	value = $("#sort_preference")[0].value;
     	window.location.href = "?preference=" + value;
     });

     $(".card:not(.collected):not(.no_owner)").click(function(event) {
     	partner_id = event.currentTarget.getAttribute("data-partner-id");
     	partner_name = event.currentTarget.getAttribute("data-partner-name");
     	message = prompt("What did you work on with " + partner_name + "?");
     	if (message != null) {
     		$.post("partnerships", {"partnership":{"message": message, "partner_id": partner_id}}, function(data) {
     			$('html').html(data);
     		});
     	}
     });
});