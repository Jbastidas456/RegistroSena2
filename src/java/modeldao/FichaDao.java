/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeldao;

import Interfaz.MeFicha;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import static jdk.nashorn.internal.runtime.Debug.id;
import model.Ficha;

/**
 *
 * @author APRENDIZ
 */
public class FichaDao implements MeFicha
{
    Ficha fi = new Ficha();
    Conexion cn= new Conexion(); 
    Connection con;
    PreparedStatement ps; 
    ResultSet rs; 
    
    
    @Override
    public Ficha list(int cod) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

     @Override
    public List listaFichas() {
 
        ArrayList<Ficha> lista = new ArrayList<Ficha>();
        String sql ="select * from ficha ";  
          try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);  
            rs=ps.executeQuery();
            while(rs.next())
            {
            Ficha f = new Ficha();
            f.setCodFicha(rs.getInt("codficha"));
            f.setCantiaprendices(rs.getInt("cantiaprendices"));
            f.setCodprograma(rs.getInt("codprograma"));
            f.setCodaprendiz(rs.getInt("doapre"));
           
            lista.add(f);
           
            }
               
               
        }catch(Exception e)
        {
        }
        return lista;
    }

    @Override
    public boolean registroficha(Ficha fi) {
        String sql= "insert into ficha(codficha,cantiaprendices,codprograma,doapre)values('"+fi.getCodFicha()+"','"+fi.getCantiaprendices()+"','"+fi.getCodprograma()+"','"+fi.getCodaprendiz()+"')";
        try{
            con = cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
            JOptionPane.showMessageDialog(null,"Ficha registrada");
            
        }catch(Exception e)
        {
            JOptionPane.showMessageDialog(null, "Ficha no Registrado");
        }
        return false;
       
        
    }

    @Override
    public boolean actualizarficha(Ficha fi) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean eliminarficha(int cod) {
        String sql="delete from programa where codficha="+cod;
        try{
            con=cn.getConnection(); 
            ps=con.prepareStatement(sql); 
            ps.executeUpdate(); 
            JOptionPane.showMessageDialog(null, "Ficha Eliminado");
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Ficha no Eliminado");
        }
        return false;
    }
    
}
