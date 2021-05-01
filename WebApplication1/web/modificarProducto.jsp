<%-- 
    Document   : modificarProducto
    Created on : 1/05/2021, 11:06:48 AM
    Author     : EMOA1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tabla de Datos del producto</h1>
        <form method="post" name="formularioeditar" action="actualizarProductos.jsp" >
            <table border="2" >
                
                <%
                    Connection con = null;
                    Statement set = null;
                    ResultSet rs = null;
                    String url, userName, password, driver;
                    url = "jdbc:mysql://localhost/ben_y_jerrys";
                    userName = "root";
                    password = "Edgar777";
                    driver = "com.mysql.jdbc.Driver";
                    try{
                        Class.forName(driver);
                        con = DriverManager.getConnection(url, userName, password);
                        try{
                            int id = Integer.parseInt(request.getParameter("id"));
                            String q = "select id_pro, nom_pro, tam_pro, gra_pro, pre_pro, cos_pro from MProducto"
                                     + "where id_pro ="+id;
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                                %>
            <tr>
                    <td>ID</td>
                    <td> <input type="hidden" name="id2" value="<%=rs.getInt("id_pro")%>" > </td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td> <input type="text" name="nombre2" value="<%=rs.getString("nom_pro")%>" > </td>
                </tr>
                <tr>
                    <td>Tamaño</td>
                    <td> <input type="text" name="ciudad2" value="<%=rs.getString("tam_pro")%>" > </td>
                </tr>
                <tr>
                    <td>Gramos:</td>
                    <td> <input type="text" name="tel2" value="<%=rs.getString("gra_pro")%>" > </td>
                </tr>      
                <tr>
                    <td>Presentación</td>
                    <td> <input type="text" name="ciudad2" value="<%=rs.getString("pre_pro")%>" > </td>
                </tr>
                <tr>
                    <td>Precio</td>
                    <td> <input type="text" name="ciudad2" value="<%=rs.getString("cos_pro")%>" > </td>
                </tr>
                                <%
                            
                            }
                            rs.close();
                            set.close();
                        
                        }catch(SQLException ed){
                            System.out.println("Error al consultar la tabla");
                            System.out.println(ed.getMessage());
                            %>
                <tr>
                    <td>ID</td>
                    <td> <input type="hidden" name="id2" value="" > </td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td> <input type="text" name="nombre2" value="" > </td>
                </tr>
                <tr>
                    <td>Tamaño</td>
                    <td> <input type="text" name="ciudad2" value="" > </td>
                </tr>
                <tr>
                    <td>Telefono:</td>
                    <td> <input type="text" name="tel2" value="" > </td>
                </tr>            
                            <%
                        
                        }
                        con.close();
                    
                    }catch(Exception e){
                        System.out.println("Error al conectar con la bd");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());
                %>
        <h1>Sitio en Construcción</h1>            
                    <%
                    
                    }
                    %>
                
                
            </table>
                    <input type="submit" value="Actualizar Registo" >
                    <input type="reset" value="Borrar Datos" >
            
        </form>
    </body>
</html>
