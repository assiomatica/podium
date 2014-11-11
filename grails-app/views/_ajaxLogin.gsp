<style>


  .modal {
    _background-color:#fff;
    display:none;
    width:480px;
    _padding:15px;
    _text-align:left;
    _border:2px solid #333;

    _opacity:0.8;
    _-moz-border-radius:6px;
    _-webkit-border-radius:6px;
    -moz-box-shadow: 0 0 50px #ccc;
    -webkit-box-shadow: 0 0 50px #ccc;
  }

</style>
<style type='text/css' media='screen'>

  #ajaxLogin {
    _margin: 15px 0px; padding: 0px;
    _text-align: center;
    display: none;
    position: absolute;
    z-order: 999;
    width: 480px;
  }

  #ajaxLogin .inner .login_message {color:red;}
  #ajaxLogin .inner .text_ {width:120px;}
  .errorMessage { color: red; }
</style>

<div class="modal shadowblock_out" id="prompt">
  <div class="shadowblock">
    <h2 class="dotted"><span class="colour">Login</span></h2>
    <form action='' method='POST'  class="loginform"  id="ajaxLoginForm">
      <p>Please complete the fields below to login to your account.</p>

      <p>
        <label for="j_username">Username:</label>
        <input type="text" class="text" name="j_username" id="j_username" value="" />
      </p>

      <p>

        <label for="j_password">Password:</label>
        <input type="password" class="text" name="j_password" id="j_password" value="" />
      </p>

      <div class="clr"></div>
      <div style='display: none; text-align: left;' id='loginMessage'></div> 

      <div id="checksave">

        <p class="rememberme">
          <input name="spring_security_remember_me" class="checkbox" id="spring_security_remember_me" value="forever" type="checkbox" />
          <label for="spring_security_remember_me">Remember me</label>

        </p>	

        <p class="submit">
          <button type="button" class="btn_orange" name="login" id="login" onclick=' $(".modalInput").overlay().close();' />Annulla</button>&nbsp;<button type="submit" class="btn_orange" name="login" id="login" />Login &raquo;</button>
        </p>

        <p>
          <!-- a class="lostpass" href="" title="Password Lost and Found">Lost your password?</a -->
          <br /><a href="">Register</a>

        </p>
      </div>
    </form>
    <div class="clr"></div>            
  </div><!-- /shadowblock -->
</div>

<script type='text/javascript'>
  $(document).ready(function() {
    
  // jQuery.noConflict();

  $("#ajaxLoginForm").submit(function() { // loginForm is submitted
    var username = $('#j_username').attr('value'); // get username
    var password = $('#j_password').attr('value'); // get password
    var dataString = $("#ajaxLoginForm").serialize()+'&spring-security-redirect=/login/ajaxSuccess';
    
    if (username && password) { // values are not empty
      $.ajax({
        type: "POST",
        url: "${request.contextPath}/j_spring_security_check", // URL of the Perl script
        dataType: "json",
        // send username and password as parameters to the Perl script
        data: dataString,
        // script call was *not* successful
        error: function(XMLHttpRequest, textStatus, errorThrown) { 
          $('div#loginMessage').text("responseText: " + XMLHttpRequest.responseText 
            + ", textStatus: " + textStatus 
            + ", errorThrown: " + errorThrown);
          $('div#loginMessage').addClass("error");
        }, // error 
        // script call was successful 
        // data contains the JSON values returned by the Perl script 
        success: function(data){
          if (data.error) { // script returned error
            $('div#loginMessage').text(data.error);
            $('div#loginMessage').addClass("error");
          } // if
          else { // login was successful
            // $('form#prompt').hide();
            $('div#loginMessage').text("data.success: " + data.success);
            $('div#loginMessage').addClass("success");
            $(".modalInput").overlay().close();
            // location.reload();
            window.location.href=window.location.href+'?refresh';


          } //else
        } // success
      }); // ajax
    } // if
    else {
      $('div#loginMessage').text("enter username and password");
      $('div#loginMessage').addClass("error");
    } // else
    $('div#loginMessage').fadeIn();
    return false;
  });


var triggers = $(".modalInput").overlay({

        // some mask tweaks suitable for modal dialogs
        mask: {
                color: '#ebecff',
                loadSpeed: 200,
                opacity: 0.9
        },

        closeOnClick: false
  });
});

</script>


