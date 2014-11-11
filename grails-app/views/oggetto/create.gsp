

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Inserimento Oggetto</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Lista Oggetti</g:link></span>
        </div>
        <div class="body">
            <h1>Create Oggetto</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${oggettoInstance}">
            <div class="errors">
                <g:renderErrors bean="${oggettoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" id="inform">
                <div class="dialog">
                    <table>
                        <tbody>
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
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
                <script type="text/javascript">
                    Form.focusFirstElement(document.forms[1]);
                </script>
        </div>
    </body>
</html>
