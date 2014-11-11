

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Immagine</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Immagine List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Immagine</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${immagine}">
            <div class="errors">
                <g:renderErrors bean="${immagine}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:immagine,field:'descrizione','errors')}">
                                    <input type="text" id="descrizione" name="descrizione" value="${fieldValue(bean:immagine,field:'descrizione')}"/>
                                </td>
                            </tr> 
                       
                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fileUpload">Upload:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:immagine,field:'upload','errors')}">
                                    <input type="file" id="fileUpload" name="fileUpload" />
                                    <input type="hidden" id="oggetto.id" name="oggetto.id"  value="${immagine?.oggetto?.id}"/>
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
