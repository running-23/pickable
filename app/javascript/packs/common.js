document.addEventListener('turbolinks:load', function(){
  var elem = document.getElementById('selbox');
  elem.addEventListener('change', function(){
    var result = elem.value;

    if (result == "random") {
      //非表示
        document.getElementById("applicants").style.display = "none";
    } else {
      //表示
      document.getElementById("applicants").style.display = "block";
    }

  });
});
