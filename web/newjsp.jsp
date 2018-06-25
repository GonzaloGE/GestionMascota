 protected void compra(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String rut = request.getParameter("rut");
        Usuario user = servicio.buscarUsuario(rut);
        String NomPerfil = request.getParameter("perfil");
        Perfil perf = servicio.buscarPerfil(Integer.parseInt(NomPerfil));
        
        if (user != null && perf.getNombrePerfil().equals("cliente") || perf.getNombrePerfil().equals("administrador")) {
           ArrayList<Producto> carro=(ArrayList) request.getSession().getAttribute("carro"); 
           ArrayList<String> data = new ArrayList<>();
           for (Producto p : carro) {
             String unidad = request.getParameter("unidades"+p.getIdProducto());
             data.add(p.getIdProducto()+","+unidad);
                      }
            try {
                servicio.comprar(rut, data);
                request.setAttribute("msg", "Compra realizada exitosamente");
                //falta limpiar carro
            request.getRequestDispatcher("DetalleCarro.jsp").forward(request, response);
                
            } catch (TransactionException ex) {
                 request.setAttribute("msg", "Hubo un error de stock al intentar su compra revise su carro de compra");
                //actualizar información carro
                request.getRequestDispatcher("DetalleCarro.jsp").forward(request, response);
                
                Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            request.setAttribute("msg", "usuario no encontrado");
            request.getRequestDispatcher("DetalleCarro.jsp").forward(request, response);
            
        }
        
    }
    
    
    ------
   
     protected void compra(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String rut = request.getParameter("rut");
        Usuario user = servicio.buscarUsuario(rut);

        if (user != null && user.getPerfil().equals("administrador") || user.getPerfil().equals("cliente")) {
            ArrayList<Producto> carro = (ArrayList) request.getSession().getAttribute("carro");
            ArrayList<String> data = new ArrayList<>();
            for (Producto p : carro) {
                String unidad = request.getParameter("unidades" + p.getIdProducto());
                data.add(p.getIdProducto() + "," + unidad);
            }
            try {
                servicio.comprar(rut, data);
                request.setAttribute("msg", "Compra realizada exitosamente");
                //falta limpiar carro
                request.getRequestDispatcher("DetalleCarro.jsp").forward(request, response);

            } catch (TransactionException ex) {
                request.setAttribute("msg", "Hubo un error de stock al intentar su compra revise su carro de compra");
                //actualizar información carro
                request.getRequestDispatcher("DetalleCarro.jsp").forward(request, response);
                Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            request.setAttribute("msg", "usuario no encontrado");
            request.getRequestDispatcher("DetalleCarro.jsp").forward(request, response);

        }

    }