

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Immagine List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Immagine</g:link></span>
        </div>
        <div class="body">
            <h1>Immagine List</h1>
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
                        
                   	        <th>Oggetto</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${immagineList}" status="i" var="immagine">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${immagine.id}">${fieldValue(bean:immagine, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:immagine, field:'descrizione')}</td>
                        
                            <td>${fieldValue(bean:immagine, field:'imageURL')}</td>
                        
                            <td>${fieldValue(bean:immagine, field:'oggetto')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Immagine.count()}" />
            </div>
        </div>
    </body>
</html>
