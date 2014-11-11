<html>
  <head>
    <title>Sample title</title>
  </head>
  <body>
<fieldset>
  <legend>Image Upload</legend>
  <g:form action="upload_image" method="post" enctype="multipart/form-data">
    <label for="image">Image (16K)</label>
    <input type="file" name="image" id="image" />
    <div style="font-size:0.8em; margin: 1.0em;">
    </div>
    <input type="submit" class="buttons" value="Upload" />
  </g:form>
</fieldset>
  </body>
</html>
