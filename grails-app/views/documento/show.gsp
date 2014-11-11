

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Documento</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Documento List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Documento</g:link></span>
        </div>
        <div class="body">
            <h1>Show Documento</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documento, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Descrizione:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documento, field:'descrizione')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Image URL:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:documento, field:'imageURL')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Socio:</td>
                            
                            <td valign="top" class="value"><g:link controller="socio" action="show" id="${documento?.socio?.id}">${documento?.socio?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${documento?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
