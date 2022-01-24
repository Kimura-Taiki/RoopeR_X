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


// visibleとhiddenを使い分ける文章だからモーダル関連っぽいけど消しても問題なさそうなのでコメントアウト
// const select = document.querySelector("#select")
// select.addEventListener("change", () => {
//   const b = document.querySelector(".b")
//   if (select.value === "B") {
//     b.style.visibility = "visible"
//   } else {
//     b.style.visibility = "hidden"
//   }
// })

$(function(){
  $("#Tuika").on("click",function() {
    console.log("追加したよ");
  });
});

$(function() {
  $(".novel_pawn-class").click(function() {
    console.log("neo_novelsへ来たぞー")
    $(".pawn_dayo").val()
    $(".za_dayo").val(0)
    $(".position_dayo").val(0)
  });

  $(".edit_pawn-class").click(function(){
    const pawn_id = $(this).data("pawn");
    console.log("pawn_idは"+pawn_id+"です");
    $.ajax({
      url: "pawn_edits",
      type: "GET",
      data: { id: pawn_id },
      datatype: "json"
    })
    .done(function(data){ // dataにはレスポンスされたデータが入る
      //通信に成功した際の処理
      console.log(data)
      // $("h4.modal-title").text("駒編集フォーム")
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
})

// $("#scripts_show-edit-pawn-Modal").on('show.bs.modal', function (event) {
//   console.log("これたか！？")
//   var button = $(event.relatedTarget) //モーダルを呼び出すときに使われたボタンを取得
//   var recipient = button.data('whatever') //data-whatever の値を取得

//   //Ajaxの処理はここに

//   // var modal = $(this)  //モーダルを取得
//   // modal.find('.modal-title').text('New message to ' + recipient) //モーダルのタイトルに値を表示
//   // modal.find('.modal-body input#recipient-name').val(recipient) //inputタグにも表示
// });
