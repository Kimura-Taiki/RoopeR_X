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
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .



$(function() {
  $(".key_package_dayo").change(function(){
    const package_id = $(".key_package_dayo").val();
    $.ajax({
      url: "rule_changes",
      type: "GET",
      data: { id: package_id },
      datatype: "json"
    })
    .done(function(data) {
      console.log(data)
      const y_rules = data.rule_y
      const y_selector = "#script_rule_y"
      $(y_selector).empty();
      $(y_selector).append("<option value>(nil)</option>");
      $(y_rules).each(function(i, rule) {
        $(y_selector).append("<option value=\""+rule.id+"\">"+rule.name+"</option>");
      });
      const x_rules = data.rule_x
      const x1_selector = "#script_rule_x1"
      $(x1_selector).empty();
      $(x1_selector).append("<option value>(nil)</option>");
      $(x_rules).each(function(i, rule) {
        $(x1_selector).append("<option value=\""+rule.id+"\">"+rule.name+"</option>");
      })
      const x2_selector = "#script_rule_x2"
      $(x2_selector).empty();
      $(x2_selector).append("<option value>(nil)</option>");
      $(x_rules).each(function(i, rule) {
        $(x2_selector).append("<option value=\""+rule.id+"\">"+rule.name+"</option>");
      })
    })
  });

  $(".new_pawn-class").click(function() {
    console.log("neo_novels???????????????")
    $(".pawn_dayo").val()
    $(".za_dayo").val(0)
    $(".position_dayo").val(0)
  });

  $(".edit_pawn-class").click(function(){
    const pawn_id = $(this).data("pawn");
    console.log("pawn_id???"+pawn_id+"??????");
    $.ajax({
      url: "pawn_edits",
      type: "GET",
      data: { id: pawn_id },
      datatype: "json"
    })
    .done(function(data){ // data????????????????????????????????????????????????
      //?????????????????????????????????
      console.log(data)
      // $("h4.modal-title").text("?????????????????????")
      $(data).each(function(i,pawn) {
        $(".pawn_dayo").val(pawn.id)
        $(".za_dayo").val(pawn.za_id)
        $(".position_dayo").val(pawn.position_id)
        // $("#scripts_show-delete-pawn-Button").href("/pawns/"+pawn.id)
        $("#scripts_show-delete-pawn-Button").attr("href", "/pawns/"+pawn.id)
        // $("#mylink").attr("href", "http://example.com/")
      });
    })
  });

  $(".new_incident-class").click(function() {
    console.log("neo_incidents???????????????")
    $(".incident_dayo").val()
    $(".pawn_dayo").val(0)
    $(".crime_dayo").val(0)
  });

  $(".edit_incident-class").click(function() {
    console.log(".edit_incident-class?????????????????????????????????")
    const incident_id = $(this).data("incident");
    console.log("??????id???"+incident_id+"??????")
    $.ajax({
      url: "incident_edits",
      type: "GET",
      data: {id: incident_id},
      datatype: "json"
    })
    .done(function(data){
      console.log(data)
      $(data).each(function(i,incident){
        $(".incident_dayo").val(incident.id)
        $(".day_dayo").val(incident.day)
        $(".pawn_dayo").val(incident.pawn_id)
        $(".crime_dayo").val(incident.crime_id)
        $("#scripts_show-delete-incident-Button").attr("href", "/incidents/"+incident.id)
      })
    })
  })
})

// $("#scripts_show-edit-pawn-Modal").on('show.bs.modal', function (event) {
//   console.log("??????????????????")
//   var button = $(event.relatedTarget) //??????????????????????????????????????????????????????????????????
//   var recipient = button.data('whatever') //data-whatever ???????????????

//   //Ajax?????????????????????

//   // var modal = $(this)  //?????????????????????
//   // modal.find('.modal-title').text('New message to ' + recipient) //??????????????????????????????????????????
//   // modal.find('.modal-body input#recipient-name').val(recipient) //input??????????????????
// });
