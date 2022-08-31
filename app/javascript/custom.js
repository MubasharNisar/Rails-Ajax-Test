var address = document.getElementById("address");
address.addEventListener("keydown", function (e) {
  if (e.code === "Enter") {  //checks whether the pressed key is "Enter"
    var url = address.value;
    if(url==""){
      console.log("Empty");
    }else{
      $.ajax({
        type:'GET',
        url:'/urls/add_new_url',
        data: { address: url},
        dataType: 'json',
        success:function(data){
          if (data !== false) {
            address.value = "";
            var url_arr = data['urls']
            document.getElementById('list_urls').innerHTML = '';
            for (let i = 0; i < url_arr.length; i++) {
              document.getElementById('list_urls').innerHTML += '<li>'+url_arr[i]+'</li>';
            }
          }else{
            alert("Something went wrong!");
          }
        }
      });
    }
  }
});
