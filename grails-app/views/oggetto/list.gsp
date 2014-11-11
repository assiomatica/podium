

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Lista Oggetti</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">Nuovo Oggetto</g:link></span>
        </div>
        <div class="body">
            <h1>Lista Oggetti</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table id="table1">
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Codice" />
                        
                   	        <g:sortableColumn property="titolo" title="Titolo" />

                   	        <g:sortableColumn property="descrizione" title="Descrizione" />
                        
                   	        <th>Categoria</th>
                       
                   	        <g:sortableColumn property="dataingresso" title="Dataingresso" />
                        
                   	        <g:sortableColumn property="datauscita" title="Datauscita" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${oggettoInstanceList}" status="i" var="oggettoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${oggettoInstance.id}">${fieldValue(bean:oggettoInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:oggettoInstance, field:'titolo')}</td>

                            <td>${fieldValue(bean:oggettoInstance, field:'descrizione')}</td>
                        
                            <td>${fieldValue(bean:oggettoInstance, field:'categoria')}</td>

                            <td><g:formatDate format="dd/MM/yyyy HH:mm" date="${oggettoInstance.dataingresso}"/></td>
                        
                            <td><g:formatDate format="dd/MM/yyyy HH:mm" date="${oggettoInstance.datauscita}"/></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${oggettoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
