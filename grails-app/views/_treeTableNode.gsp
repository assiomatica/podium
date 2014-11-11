<g:if test="${c.madre == null}">
<li class="maincat cat-item-${c.id}" style="background: url('${createLink(controller:'categoria', action:'icona_image', id:c.ident())}') no-repeat scroll left center transparent;">
</g:if>
<g:else>
<li class="cat-item">  
</g:else>
<a href="${wcm.createLink(uri:'/')}pagina_categoria?id_categoria=${c.id}" title="${c.descrizione.encodeAsHTML()}">${c.titolo.encodeAsHTML()}</a></li>
<g:if test="${c.children.size()}">
	<g:each in="${c.children}" var="child">
		<g:render template="/treeTableNode" model="[c:child]"/>
	</g:each>
</g:if>