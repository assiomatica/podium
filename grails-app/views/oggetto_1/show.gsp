

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Visualizzazione Oggetto</title>
        <SCRIPT SRC="${createLinkTo(dir:'')}/js/DymoPrintLabel.js"></SCRIPT>

    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Lista Oggetti</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Nuovo Oggetto</g:link></span>
        </div>
        <div class="body">
            <h1>Oggetto</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">Codice:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:oggettoInstance, field:'id')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Titolo:</td>

                            <td valign="top" class="value">${fieldValue(bean:oggettoInstance, field:'titolo')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Descrizione:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:oggettoInstance, field:'descrizione')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Categoria:</td>
                            
                            <td valign="top" class="value"><g:link controller="categoria" action="show" id="${oggettoInstance?.categoria?.id}">${oggettoInstance?.categoria?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Dataingresso:</td>
                            
                            <td valign="top" class="value"><g:formatDate format="dd/MM/yyyy HH:mm" date="${oggettoInstance.dataingresso}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Datauscita:</td>
                            
                            <td valign="top" class="value"><g:formatDate format="dd/MM/yyyy HH:mm" date="${oggettoInstance.datauscita}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Foto:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="p" in="${oggettoInstance.foto}">
                                    <li><g:link controller="immagine" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
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
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
          </td></tr>
</g:if>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Punti:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:oggettoInstance, field:'prezzo')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Socio:</td>
                            
                            <td valign="top" class="value"><g:link controller="socio" action="show" id="${oggettoInstance?.socio?.id}">${oggettoInstance?.socio?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"></td>

                            <td valign="top" class="value"><button onclick="PrintLabel('${createLinkTo(dir:'/dymo/label.LWL',absolute:true)}','${fieldValue(bean:oggettoInstance, field:'titolo')}','Punti:','${fieldValue(bean:oggettoInstance, field:'prezzo')}','O<g:formatNumber number="${fieldValue(bean:oggettoInstance, field:'id')}" format="00000000" />');">Stampa Etichetta</button></td>

                        </tr>
                         <tr class="prop">
                            <td valign="top" class="name">In Evidenza:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:oggettoInstance, field:'inEvidenza')}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Online:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:oggettoInstance, field:'onLine')}</td>
                            
                        </tr>
                   
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${oggettoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
