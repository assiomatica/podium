

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Modifica Oggetto</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Oggetti</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Nuovo Oggetto</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Oggetto</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${oggettoInstance}">
                <div class="errors">
                    <g:renderErrors bean="${oggettoInstance}" as="list" />
                </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${oggettoInstance?.id}" />
                <input type="hidden" name="version" value="${oggettoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codice">Codice:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:oggettoInstance,field:'id','errors')}">
                                    ${fieldValue(bean:oggettoInstance,field:'id')}
                                </td>
                            </tr>

                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="titolo">Titolo:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:oggettoInstance,field:'titolo','errors')}">
                                    <input  name="titolo" value="${fieldValue(bean:oggettoInstance, field:'titolo')}">
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descrizione">Descrizione:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:oggettoInstance,field:'descrizione','errors')}">
                                    <textarea rows="5" cols="40" name="descrizione">${fieldValue(bean:oggettoInstance, field:'descrizione')}</textarea>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="categoria">Categoria:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:oggettoInstance,field:'categoria','errors')}">
                                    <g:select optionKey="id" from="${Categoria.list()}" name="categoria.id" value="${oggettoInstance?.categoria?.id}" ></g:select>
                                </td>
                            </tr>


                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataingresso">Dataingresso:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:oggettoInstance,field:'dataingresso','errors')}">
                                    <g:datePicker name="dataingresso" value="${oggettoInstance?.dataingresso}" ></g:datePicker>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="datauscita">Datauscita:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:oggettoInstance,field:'datauscita','errors')}">
                                    <g:datePicker name="datauscita" value="${oggettoInstance?.datauscita}" default="none" noSelection="['':'-']" ></g:datePicker>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pictures">Foto:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:oggettoInstance,field:'foto','errors')}">
                                    <g:link controller="immagine" params="['oggetto.id':oggettoInstance?.id]" action="create">Aggiungi Foto</g:link>
                                </td>
                            </tr>
                            <g:if test="${oggettoInstance.foto?.size() != 0} ">
                            <tr><td colspan="2">
                                    <div class="list">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <g:sortableColumn property="files" title="Descrizione"/>
                                                    <g:sortableColumn property="path" title="Immagine" colspan="3"/>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <g:each in="${oggettoInstance.foto}" status="i" var="fileResourceInstance">
                                                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                                        <td>${fileResourceInstance.decodeURL()}</td>
                                                        <td> <image src="${createLink( uri:'/uploads/thumbnails/')}${fileResourceInstance.imageURL.decodeURL()}"/></td>
                                                        <td><g:link action="editImmagine" id="${fileResourceInstance.id}" ><image  border="0"  src="${createLink( uri:'/images/skin/database_edit.png')}"/></g:link></td>
                                                        <td><g:link action="deleteImmagine" id="${fileResourceInstance.id}" onclick="return confirm('Are you sure?');"><image border="0" src="${createLink( uri:'/images/skin/database_delete.png')}"/></g:link></td>
                                                    </tr>
                                                </g:each>
                                            </tbody>
                                        </table>
                                    </div>
                            </td></tr>
                            </g:if>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="prezzo">Punti:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:oggettoInstance,field:'prezzo','errors')}">
                                    <input type="text" id="prezzo" name="prezzo" value="${fieldValue(bean:oggettoInstance,field:'prezzo')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="socio">Socio:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:oggettoInstance,field:'socio','errors')}">
                                    <g:select optionKey="id" from="${Socio.list()}" name="socio.id" value="${oggettoInstance?.socio?.id}" ></g:select>
                                </td>
                            </tr>
 					<tr class="prop">
						<td valign="top" class="name"><label for="emailShow">In Evidenza:</label></td>
						<td valign="top" class="value ${hasErrors(bean:oggettoInstance,field:'inEvidenza','errors')}">
							<g:checkBox name="inEvidenza" value="${oggettoInstance.inEvidenza}"/>
						</td>
					</tr>
					<tr class="prop">
						<td valign="top" class="name"><label for="emailShow">Online:</label></td>
						<td valign="top" class="value ${hasErrors(bean:oggettoInstance,field:'onLine','errors')}">
							<g:checkBox name="onLine" value="${oggettoInstance.onLine}"/>
						</td>
					</tr>
                       

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
