var task = function() {
  var showTask = function(taskId) {
    // TODO Fix this selector
    $('section.task').hide();
    $('#'+taskId).show();
  };
  return {
    showTask: showTask
  };
}();

$( document ).ready(function() {
  $('section.task').hide();
  $('section.task:first').show();
});
