<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
    <script type="text/javascript">
     window.onload = function(){
       ConvertRowsToLinks("table1");
     }

     function ConvertRowsToLinks(xTableId){

       var rows = document.getElementById(xTableId).getElementsByTagName("tr");

       for(i=0;i<rows.length;i++){
         var link = rows[i].getElementsByTagName("a")
         if(link.length == 1){
           rows[i].onclick = new Function("document.location.href='" + link[0].href + "'");
           rows[i].onmouseover = new Function("this.className='highlight'");
           rows[i].onmouseout = new Function("this.className=''");
         }
       }

     }

    </script>
    <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
       <h1 style="margin-left:20px;">Scambiacose BackOffice</h1>
        <p style="margin-left:20px;width:80%"></p>
        <div class="dialog" style="margin-left:20px;width:100%;">
        
        <cms:adminMenu />
        <cms:menu name="primary" minLevel="0" maxLevel="100"/>
        <g:link url="${wcm.userLogOutUrl().encodeAsHTML()}">Log Out</g:link>
        <g:render template="/menu" />
        <g:layoutBody />
    </body>
</html>