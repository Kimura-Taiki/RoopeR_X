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
  $(".edit_pawn-class").click(function(){
    console.log("hoihoi")
    $.ajax({
      url: "edit_pawn",
      type: "GET",
      id: 99
      // data: { id: 99 }
    });
  });
})

$(document).ready(function () {
  console.log("Hello world");
});

// var title = "javascriptが使えました";
// alert(title);
