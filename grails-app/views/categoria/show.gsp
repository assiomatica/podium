

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
  </div>
  <div class="body">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
      <table>
        <tbody>

          <tr class="prop">
            <td valign="top" class="name"><g:message code="categoria.id.label" default="Id" /></td>

        <td valign="top" class="value">${fieldValue(bean: categoriaInstance, field: "id")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="categoria.titolo.label" default="Titolo" /></td>

        <td valign="top" class="value">${fieldValue(bean: categoriaInstance, field: "titolo")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="categoria.descrizione.label" default="Descrizione" /></td>

        <td valign="top" class="value">${fieldValue(bean: categoriaInstance, field: "descrizione")}</td>

        </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="icona"><g:message code="categoria.icona.label" default="Icona" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: categoriaInstance, field: 'icona', 'errors')}">
           <g:if test="${categoriaInstance?.icona}">
            <img class="avatar" src="${createLink(controller:'categoria', action:'icona_image', id:categoriaInstance.ident())}" />
          </g:if>    <g:link action="select_icona" id="${categoriaInstance.id}">Cambia icona</g:link>             
                                </td>
                            </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="categoria.iconaType.label" default="Icona Type" /></td>

        <td valign="top" class="value">${fieldValue(bean: categoriaInstance, field: "iconaType")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="categoria.madre.label" default="Madre" /></td>

        <td valign="top" class="value"><g:link controller="categoria" action="show" id="${categoriaInstance?.madre?.id}">${categoriaInstance?.madre?.encodeAsHTML()}</g:link></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="categoria.orderIndex.label" default="Order Index" /></td>

        <td valign="top" class="value">${fieldValue(bean: categoriaInstance, field: "orderIndex")}</td>

        </tr>


        </tbody>
      </table>
    </div>
    <div class="buttons">
      <g:form>
        <g:hiddenField name="id" value="${categoriaInstance?.id}" />
        <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
        <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
      </g:form>
    </div>
  </div>
</body>
</html>