/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.beans;

import cl.controller.TransactionException;
import cl.entities.Categoria;
import cl.entities.Perfil;
import cl.entities.Producto;
import cl.entities.Usuario;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author clrubilarc
 */
@Local
public interface ServicioBeanLocal {
    Usuario iniciarSesion(String rut,String clave);
    void guardar(Object o);
    void sincronizar(Object o);
    
    Categoria buscarCategoria(int id);
    void editarCategoria(int idCategoria, String categoria );
    List<Categoria> getCategorias();
    
    Usuario buscarUsuario(String rut);
    void editarUsuario(String rut, String clave);
    List<Usuario> getUsuarios();
    
    Perfil buscarPerfil(int id);
    
    List<Perfil> getPerfiles();
    Producto buscarProducto(int idProducto);
    
    
    
    List<Producto> getProductos();
   
    void comprar(String rut, ArrayList<String> lista) throws TransactionException;
    
}
