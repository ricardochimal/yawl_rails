// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var YawlProcess = {
  url : null,

  updateStepState : function() {
    $.ajax(YawlProcess.url, {
      success: YawlProcess.updateStepsBody
    });
  },

  updateStepsBody : function(r, s, x) {
    $("#steps tbody").html(r);
    YawlProcess.updateStepProgress();

    var pctCompleted = YawlProcess.stepPctCompleted();
    if (pctCompleted != 100) {
      setTimeout(YawlProcess.updateStepState, 5000);
    }
  },

  updateStepProgress : function() {
    var pctCompleted = YawlProcess.stepPctCompleted();
    $("#process-progress").css("width", pctCompleted + "%");
    if (pctCompleted == 100) {
      $("#process-progress").parent().removeClass("progress-striped active");
      $("#process-progress").addClass("bar-success");
    }
  },

  stepPctCompleted : function() {
    var total = $(".step").size();
    var completed = $(".step-state").filter(function() { return $(this).html() == "completed" }).size();
    return Math.round(completed / total * 100.0);
  },

  init : function() {
    $(document).ready(function() {
      YawlProcess.updateStepProgress();
      setTimeout(YawlProcess.updateStepState, 5000);
    });
  }
};
