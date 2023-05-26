<%-- 
    Document   : ListarFi
    Created on : 25/05/2023, 7:13:45 p. m.
    Author     : APRENDIZ
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Ficha"%>
<%@page import="java.util.List"%>
<%@page import="modeldao.FichaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista</h1>
        
        <div class="container">
      
        <table>
            <thead>
            <tr>
                <th class="text-center">codficha</th>
                <th class="text-center">cantiaprendices</th>
                <th class="text-center">codprograma</th>
                <th class="text-center">doapre</th>
                   
            </tr>
            </thead>
            <%
            FichaDao fdao =new FichaDao();
            List <Ficha>listar=fdao.listaFichas();
            Iterator<Ficha>it=listar.iterator();  
            Ficha fifi = null;
            while (it.hasNext()){
                fifi=it.next();
               
           
           
            %>
            <tbody>
                <tr>
            <td class="text-center"><%=fifi.getCodFicha()%></td>
            <td class="text-center"><%=fifi.getCantiaprendices()%></td>
            <td class="text-center"><%=fifi.getCodprograma()%></td>
            <td class="text-center"><%=fifi.getCodaprendiz()%></td>
           
           
            <td class ="text-center" >
                <a class="btn btn-warning" href="../ControladorFicha?accion=editar&id=<%=fifi.getCodFicha()%>">EDITAR</a>  
                <a class="btn btn-danger" href="../ControladorFicha?accion=eliminarfi&id=<%=fifi.getCodFicha()%>">ELIMINAR</a>
           
               
               
            </td>
            </tr>
            <% } %>
            </tbody>  
        </table>
    </div>
    </body>
</html>
