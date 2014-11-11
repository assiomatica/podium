

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table id="table1">
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'categoria.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="titolo" title="${message(code: 'categoria.titolo.label', default: 'Titolo')}" />
                        
                            <g:sortableColumn property="descrizione" title="${message(code: 'categoria.descrizione.label', default: 'Descrizione')}" />
                        
                            <g:sortableColumn property="icona" title="${message(code: 'categoria.icona.label', default: 'Icona')}" />
                        
                            <th><g:message code="categoria.madre.label" default="Madre" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${categoriaInstanceList}" status="i" var="categoriaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${categoriaInstance.id}">${fieldValue(bean: categoriaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: categoriaInstance, field: "titolo")}</td>
                        
                            <td>${fieldValue(bean: categoriaInstance, field: "descrizione")}</td>
                        
                            <td>
           <g:if test="${categoriaInstance?.icona}">
            <img class="avatar" src="${createLink(controller:'categoria', action:'icona_image', id:categoriaInstance.ident())}" />
          </g:if>                 
                    </td>
                        
                             <td>${fieldValue(bean: categoriaInstance, field: "madre")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${categoriaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
