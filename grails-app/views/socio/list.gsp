

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'socio.label', default: 'Socio')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'socio.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="username" title="${message(code: 'socio.username.label', default: 'Username')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'socio.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="cognome" title="${message(code: 'socio.cognome.label', default: 'Cognome')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${socioInstanceList}" status="i" var="socioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${socioInstance.id}">${fieldValue(bean: socioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: socioInstance, field: "username")}</td>
                        
                            <td>${fieldValue(bean: socioInstance, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: socioInstance, field: "cognome")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${socioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
