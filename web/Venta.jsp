<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>


<c:set var="productos" scope="page" value="<%= servicio.getProductos() %>"/>
<div class="row">
 
    <c:forEach items="${pageScope.productos}" var="p">
        <c:if test="${p.unidadesProducto > 0}">
            <div class="col s4">
                <div class="card-panel">
                    <form action="control.do" method="post">
                        <input type="hidden" name="codigo" value="${p.idProducto}"/>
                        <p>${p.idProducto}</p>
                        <h4>${p.nombreProducto}</h4>
                        <h5>${p.precioProducto}</h5>
                        <button class="btn-floating btn-large waves-effect waves-light red right" accesskey="" type="submit" name="boton" value="addcar">                       
                             <i class="material-icons">add_shopping_cart</i>
                        </button>    
                        <br><br>
                    </form>   
                    
                </div>
                
            </div>
            
        </c:if>
    </c:forEach>
    
    
</div>


<%@include file="plantilla/footer.jsp" %>


