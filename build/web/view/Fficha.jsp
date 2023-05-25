<%-- 
    Document   : FLibros
    Created on : 15/05/2023, 6:34:06 p. m.
    Author     : APRENDIZ
--%>



<%@page import="model.Aprendiz"%>
<%@page import="modeldao.AprendizDao"%>
<%@page import="java.util.List"%>
<%@page import="model.Programa"%>
<%@page import="modeldao.ProgramaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Ficha</title>
    </head>
    <body>
        <h1>Ingrese Ficha</h1>
        <div class="container">    
            <div class col-lg-6">
                <form action="../ControladorFicha">
                    
                 <label for="codficha">codigo ficha</label>
                 <input type="number" id="codficha" name="txtcodficha"> 
                 
                  <br>
                  
                <label for="cantiaprendices">cantidad de los aprendices</label>
                <input type="text" id="cantiaprendices" name="txtnumapre">

                
                <div class="form-group">
                    <label>Nombre Programa:</label>
                    <select name="listapro" class="custom-select">
                        <option value="0"></option>
                        <%ProgramaDao pro= new ProgramaDao();
                          List<Programa> lista = pro.listadopro(); 
                          
                        %>
                        <%for(Programa li:lista){%>
                        <option value="<%=li.getCodprograma()%>"><%=li.getNomprograma()%></option>
                        <%}%>                        
                        
                    </select>
                </div>

                <div class="form-group">
                    <label >Lista Aprendices</label>
                    <select name="listapre" class="custom-select">
                        <option value="0"></option>
                        <%AprendizDao adao= new AprendizDao();
                          List<Aprendiz> list = adao.listadoA(); 
                          
                        %>
                        <%for(Aprendiz li:list){%>
                        <option value="<%=li.getId()%>"><%=li.getNombrea()%></option>
                        <%}%>                        
                        
                        
                    </select>
                </div>


                
                <input class="btn-btn-primary" type="submit" name="accion" value="Agregarf">

                

               </form>
            </div>
       </div>
    </body>
</html>
