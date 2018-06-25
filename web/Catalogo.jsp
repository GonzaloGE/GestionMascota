<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>


   <c:set var="categorias" scope="page" value="<%= servicio.getCategorias() %>"/>
    <c:set var="productos" scope="page" value="<%= servicio.getProductos() %>"/>
 
    <%@taglib prefix="xx" uri="/WEB-INF/tlds/TAGimg.tld" %>
     <h3><center>Catalogo</center></h3>
     
    <c:forEach items="${pageScope.productos}" var="p">
       
  <div class="row">
      <div class="col s4"><div class="row">
    <div class="card">
    <div class="card-image waves-effect waves-block waves-light">
      <img class="activator" src="img/prueba.png">
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4">${p.idProducto} ${p.nombreProducto}<i class="material-icons right">more_vert</i></span>
      <p><a href="#">This is a link</a></p>
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4 ">${p.nombreProducto}<i class="material-icons right">close</i></span>
      <center><p>ID: ${p.idProducto}
                 <br>Nombre: ${p.nombreProducto}<br><xx:TagImage array="${p.fotoProducto}" tam="300"/><br>Precio: ${p.precioProducto}
      <br>Cantidad: ${p.unidadesProducto}<br>Categoría: ${p.categoria.nombreCategoria}<br><br><br> <b>Agregar descripción del animal</b></p></center>
    </div>
  </div>
    </div>
 </div>
 </c:forEach>  
          
    
     
                     
         
             
             
         
       
       
      
         
         

     
     


   <%@include file="plantilla/footer.jsp" %>
    
