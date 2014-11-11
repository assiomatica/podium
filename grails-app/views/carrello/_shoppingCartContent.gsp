<g:javascript library="jquery"/>
<style>
  #cart td.descr {
    width:70%;
    padding:5px;
  }
    #cart td.prize {
    width:70%;
    text-align:right;
    padding-right:30px;
  }
  
  #cart td.icn {
    width:10%;
    text-align: center;
    padding:0;
    margin-top:10px;
  }
  #cart td.icn img {
     margin-top:8px;
  }
  
  #cart {
    width:100%;
  }  
  #cart td {
    height:32px;
    vertical-align:middle;
  }  
    #cart th {
    height:30px;
    vertical-align:middle;
    background-color:#eeeeee;
  }  
</style>

<table id="cart">
    <thead>
      <tr >
        <th>Descrizione</th>
        <th>Punti</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
<%
def totalepunti = 0
%>
    <sc:each>
      <tr>
        <td class="descr">
${com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.metasieve.shoppingcart.ShoppingCartInterfaceTestProduct.findByShoppingItem(it['item'])}
        </td>
        <td class="prize">
${com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']).prezzo}
        </td>
        <td class="icn">
      <g:remoteLink action="removeAll" controller="carrello" 
                    params="${[id:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.metasieve.shoppingcart.ShoppingCartInterfaceTestProduct.findByShoppingItem(it['item'])).id, class:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.metasieve.shoppingcart.ShoppingCartInterfaceTestProduct.findByShoppingItem(it['item'])).class, version:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.metasieve.shoppingcart.ShoppingCartInterfaceTestProduct.findByShoppingItem(it['item'])).version]}"
                    update="[success: 'shoppingCartContent']"
                    onComplete="alert('Oggetto eliminato dal carrello')">
        <img src="${resource(dir:'images',file:'Shopping_Cart_Remove32.png')}" title="cancella" />
      </g:remoteLink>
      </td>
      </tr>
    </sc:each>
    <tr style="text-align:right;font-weight: bold; border-top:1px solid;">
      <td>Totale Punti:</td>
      <td class="prize" id="totalepunticart"></td>
      <td></td>
    <tr>
    </tbody>
  </table>
  <br />
  <g:remoteLink action="checkOut" controller="carrello" 
                update="shoppingCartContent"
                onComplete="" class="btn_orange">Conferma &raquo;
  </g:remoteLink>
  <script>
$("#totalepunticart").html(sumOfColumns("cart", 2, true));
    
function sumOfColumns(tableID, columnIndex, hasHeader) {
  var tot = 0;
  var number = new Number();
  
  $("#" + tableID + " tr" + (hasHeader ? ":gt(0)" : ""))
  .children("td:nth-child(" + columnIndex + ")")
  .each(function() {
      number = Number($(this).html());
      if (!isNaN(number)) {
        tot += number;
      }
  });
  return tot;
}

</script>
