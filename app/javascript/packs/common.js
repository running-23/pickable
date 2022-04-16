document.addEventListener('turbolinks:load', window.buttonClick = function buttonClick() {
  let btnAccepted = document.getElementById("radio-random-ac");
  let subForm = document.getElementById("select-category");
  // let txtArea = document.getElementById("txt-area"); 切り替えでカテゴリー選択のチェックを外す記述。とりあえずOFF
  if (btnAccepted.checked) {
    subForm.style.display = "";
  } else {
    subForm.style.display = "none";
    // txtArea.value = ""; 切り替えでカテゴリー選択のチェックを外す記述。とりあえずOFF
  }
});

// events#showモーダル
document.addEventListener('turbolinks:load', window.buttonClick = function buttonClick() {
  $(function () {
    $('#openModal').click(function(){
        $('#modalArea').fadeIn();
    });
    $('#closeModal , #modalBg').click(function(){
      $('#modalArea').fadeOut();
    });
  });
});