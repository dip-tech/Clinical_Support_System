//check email and password is empty or not in login modal.
function check()
      {
        var u=document.forms["loginform"]["mail"];
        var p=document.forms["loginform"]["pass"];
        if(u.value=="")
        {
          window.alert("Input Mail");
          return false;
        }
        if(p.value=="")
        {
          window.alert("Input Password");
          return false;
        }

        
      }
// check login form in doctor registration page.
function check_dc_login()
      {
        var du=document.forms["dc_login"]["dmail"];
        var dp=document.forms["dc_login"]["dpass"];
        if(du.value=="")
        {
          window.alert("Input Mail");
          return false;
        }
        if(dp.value=="")
        {
          window.alert("Input Password");
          return false;
        }

        
      }

//check all the input type in registration modal.
function formvalid()
{
    var ps=document.forms["regForm"]["pass"].value;
    var cps=document.forms["regForm"]["cpass"].value;
    
    if(ps!=cps)
    {
        window.alert("Password Not Matched");
        return false;
    }
}


function formvalid_dc_reg()
{
    var dps=document.forms["dc_reg"]["dpass"].value;
    var dcps=document.forms["dc_reg"]["dcpass"].value;
    
    if(dps!=dcps)
    {
        window.alert("Password Not Matched");
        return false;
    }
}

//user login modal hide
function user_modal_hide()
{
  document.getElementById('loginModal').style.display="none";
}

function user_modal_show()
{
  document.getElementById('loginModal').style.display="block";
}




   


