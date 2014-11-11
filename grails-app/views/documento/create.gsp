

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Documento</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Documento List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Documento</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${documento}">
            <div class="errors">
                <g:renderErrors bean="${documento}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="upload" method="post" enctype="multipart/form-data" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descrizione">Descrizione:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:documento,field:'descrizione','errors')}">
                                    <input type="text" id="descrizione" name="descrizione" value="${fieldValue(bean:documento,field:'descrizione')}"/>
                                </td>
                            </tr> 
                       
                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fileUpload">Upload:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:documento,field:'upload','errors')}">
                                    <input type="file" id="fileUpload" name="fileUpload" />
                                    <input type="hidden" id="socio.id" name="socio.id"  value="${documento?.socio?.id}"/>
                                </td>
                            </tr>
                        
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
