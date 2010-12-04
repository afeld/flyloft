// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}

$(document).ready(function(){
  $(".remove-field").live('click', function(e) {
    $(this).prev("input[type=hidden]").val("1");
    $(this).closest("fieldset").hide();
  });
});
