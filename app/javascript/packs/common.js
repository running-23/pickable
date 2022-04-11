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