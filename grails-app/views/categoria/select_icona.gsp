<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
  </head>
  <body>
    <fieldset>
  <legend>Carica Icona</legend>
  <g:form action="upload_icona" method="post" enctype="multipart/form-data">
    <label for="icona">Icona (16K)</label>
    <input type="file" name="avatar" id="avatar" />
    <input type="hidden" name="categoria" id="categoria" value="${params.id}"/>
    <div style="font-size:0.8em; margin: 1.0em;">
      formato png o gif - dimensioni max 24 x 24 pixel sfondo bianco o trasparente. 
    </div>
    <input type="submit" class="buttons" value="Carica" />
  </g:form>
</fieldset>
  </body>
</html>
