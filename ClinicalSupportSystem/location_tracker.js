function getLocation()
  {
    if(navigator.geolocation)
      {
        navigator.geolocation.getCurrentPosition(showPosition);
      }
      else
      {
        alert("GeoLocation not supported in your Browser..!");
      }
  }
function showPosition(position)
  {
    
    var locAPI="https://api.bigdatacloud.net/data/reverse-geocode-client?latitude="+position.coords.latitude+"&longitude="+position.coords.longitude+"&localityLanguage=en";
 
    $.get({
            url : locAPI,
            success: function(data)
              {
                console.log(data);
                getAdd(data.localityInfo.administrative[2].name);
              }
          });
  }
function getAdd(address)
{
  document.getElementById('output').value=address.replace(" district","");
}