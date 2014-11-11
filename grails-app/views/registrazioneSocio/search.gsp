<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="main" />
         <title>Registrazione Socio</title>
    </head>
    <body>
	<div class="nav">
		<span class="menuButton"><a class='home' href="${createLinkTo(dir:'')}">Home</a></span>
	</div>

	<div class="body">
		<h1>Inserire num. tessera</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${person}">
		<div class="errors">
			<g:renderErrors bean="${person}" as="list" />
		</div>
		</g:hasErrors>
        <div class="dialog" style="margin-left:20px;width:60%;">
				<form action='search' method='post'>
                    <input size='45' name='query' value='${attrs ? attrs.query : ''}'/>
                    <input type='submit' value='Ricerca'/>
                </form>
		</div>
      </div>
    </body>
</html>
            