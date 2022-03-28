document.addEventListener('turbolinks:load', function(){
  var elem = document.getElementById('selbox');
  elem.addEventListener('change', function(){
    var result = elem.value;

    if (result == "applicant_and_random") {
      //表示
      document.getElementById("applicants").style.display = "block";
    } else {
      //非表示
      document.getElementById("applicants").style.display = "none";
    }

  });
});
