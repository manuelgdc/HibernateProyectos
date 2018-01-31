/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import controlador.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Manuel
 */
public class Ayudante {
    Session sesion = null;
    public Ayudante()
    {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        this.sesion = sessionFactory.openSession();
        org.hibernate.Transaction tx = sesion.beginTransaction();
    }
    
    //---------------------------------------------------------------
    public List mostrarVideoClub(){
        List<Store> videoclub;
        Query q=sesion.createQuery("from Store");
        videoclub=(List<Store>) q.list();
        return videoclub;
    }
    
    public List mostrarCategorias(){
        List<Category> categorias;
        Query q=sesion.createQuery("from Category");
        categorias=(List<Category>) q.list();
        return categorias;
    }
    //-----------------------------------------------------------------------------
    public List mostrarDatosNegocio(String id){
       
        //Query q=sesion.createQuery("select sto.nombre, add.address, cit.city, cou.country from Store  sto, Address  add, City  cit, Country cou where sto.storeId='"+id+"' and sto.address=add.addressId and add.city=cit.cityId and cit.country=cou.countryId ");
        Query q=sesion.createQuery("from Store sto where sto.storeId="+id );
        List<Store> categorias= q.list();
        return categorias;
    }
    
    public List mostrarDatosCliente(String id){
        List<Staff> categorias;
        Query q=sesion.createQuery("from Staff sta where sta.staffId="+id);
        categorias=(List<Staff>) q.list();
        return categorias;
    }
    //------------------------------------------------------------------------------------------
    public List mostrarClientesActivos(String id, int pagAMostrar){
        Query q=sesion.createQuery("from Customer cus where cus.store='"+id+"' and cus.active=1").setFirstResult(pagAMostrar*10).setMaxResults(10);
        List<Customer> lista=q.list();
        return lista;
    }
    
    public List mostrarClientesInactivos(String id){
        Query q=sesion.createQuery("from Customer cus where cus.store='"+id+"' and cus.active=0");
        List<Customer> lista=q.list();
        return lista;
    }
    
    
    public int paginacionClientes(String id,int tam){
         long numTotalObjetos = (Long) sesion.createQuery("select count(*) from Customer cus where cus.store='"+id+"' and cus.active=1").uniqueResult();
         int numPaginas = (int) Math.ceil((double) numTotalObjetos / (double) tam);
        return numPaginas;
    }
    //--------------------------------------------------------------
    
    
    public List getPeliculaPorCategoria(String storeid, String categoriaid, int pagAMostrar){
        Query q=sesion.createQuery("select distinct f from Inventory i, Film f, FilmCategory fc where i.film=f.filmId and f.filmId=fc.film and i.store='"+storeid+"' and fc.category='"+categoriaid+"' ").setFirstResult(pagAMostrar*10).setMaxResults(10);
        List<Film> lista=q.list();
        return lista;
    }
    
      public int paginacionCategoria(String id, int tam) {
        long numTotalObjetos = (Long) sesion.createQuery("SELECT COUNT(*) FROM Film AS film WHERE film.filmId IN "
                + "(SELECT filmCat.film.filmId FROM FilmCategory AS filmCat WHERE filmCat.category.categoryId='" + id + "')").uniqueResult();
        int numPaginas = (int) Math.ceil((double) numTotalObjetos / (double) tam);
        return numPaginas;
    }
      
      public List getDescripcion(String id){
          Query q=sesion.createQuery("from Film f where f.filmId='"+id+"'  ");
         List<Store> lista=q.list();
        return lista;
      }
      
    
}
