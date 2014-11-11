<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US">
<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<meta name='layout' content='' />
<title>Login</title>
<!-- script type='text/javascript' src="${createLink(uri:'/js/jquery/jquery.js')}"></script -->
 <script src="http://code.jquery.com/jquery-latest.js"></script>
<script type='text/javascript' src="${createLink(uri:'/js/cufon-yui.js')}"></script>

<link href="${createLink(uri:'/css/style.css')}" rel="stylesheet" type="text/css" />
<link href="${createLink(uri:'/css/red.css')}" rel="stylesheet" type="text/css" />
<link href="${createLink(uri:'/css/custom.css')}" rel="stylesheet" type="text/css" />
<!-- cufon fonts  -->
<script src="${createLink(uri:'/js/fonts/Vegur_400-Vegur_700.font.js')}" type="text/javascript"></script>
<script src="${createLink(uri:'/js/fonts/Liberation_Serif_400.font.js')}" type="text/javascript"></script>
<!-- end cufon fonts  -->
<!-- cufon font replacements -->
<script type="text/javascript">
    // <![CDATA[
    Cufon.replace('.content_right h2.dotted', { fontFamily: 'Liberation Serif', textShadow:'0 1px 0 #FFFFFF' });
    // ]]>
    </script>

<style type='text/css' media='screen'>

  .modale {
    _background-color:#fff;
    _display:none;
    width:480px;
    _padding:15px;
    _text-align:left;
    _border:2px solid #333;
    
    margin-left: auto ;
    margin-right: auto ;
    margin-top: 100px; 
   
    _opacity:0.8;
    _-moz-border-radius:6px;
   _-webkit-border-radius:6px;
    -moz-box-shadow: 0 0 50px #ccc;
    -webkit-box-shadow: 0 0 50px #ccc;
  }

  #ajaxLogin {
    _margin: 15px 0px; padding: 0px;
    _text-align: center;
    _display: none;
    position: absolute;
    z-order: 999;
    width: 480px;
  }

  #ajaxLogin .inner .login_message {color:red;}
  #ajaxLogin .inner .text_ {width:120px;}
  .errorMessage { color: red; }
</style>



</head>

<body>
  <div class="modale shadowblock_out" id="prompt">
  <div class="shadowblock">
    <h2 class="dotted"><span class="colour">Login</span></h2>
    <form action='${request.contextPath}/j_spring_security_check' method='post'  class="loginform"  id="ajaxLoginForm">
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
          <button type="submit" class="btn_orange" name="login" id="login" >Login &raquo;</button>
        </p>

        <p>
          <a class="lostpass" href="" title="Password Lost and Found">Lost your password?</a>
          <br /><a href="">Register</a>

        </p>
      </div>
    </form>
    <div class="clr"></div>            
  </div><!-- /shadowblock -->
</div>
 <script type='text/javascript'>
       $(document).ready(function() {
            $("#shadowblock :input[type='text']:first").focus();
        });
</script>
</body>
</html>
