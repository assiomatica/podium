

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Lista Documenti</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">Nuovo Documento</g:link></span>
        </div>
        <div class="body">
            <h1>Lista Documenti</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="descrizione" title="Descrizione" />
                        
                   	        <g:sortableColumn property="imageURL" title="Image URL" />
                        
                   	        <th>Socio</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${documentoList}" status="i" var="documento">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${documento.id}">${fieldValue(bean:documento, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:documento, field:'descrizione')}</td>
                        
                            <td>${fieldValue(bean:documento, field:'imageURL')}</td>
                        
                            <td>${fieldValue(bean:documento, field:'socio')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Documento.count()}" />
            </div>
        </div>
    </body>
</html>
