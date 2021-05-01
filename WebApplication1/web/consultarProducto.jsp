<%-- 
    Document   : consultarProducto
    Created on : 30/04/2021, 10:57:00 PM
    Author     : EMOA1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD productos</title>
    </head>
    <body>
        <h1>Administración de productos</h1>
        <div class="containerRegistro" >
                <form method="post" name="formularioregistro" action="registrar.jsp">
                    <br>
                    <label>Nombre del Producto:</label>
                    <input type="text" name="nombre" size="30" >
                    <br>
                    <label>Tamaño:</label>
                    <input type="text" name="ciudad" size="30" >
                    <br>
                    <label>Gramos:</label>
                    <input type="text" name="tel" size="30" >
                    <br>
                    <label>Presentación:</label>
                    <input type="text" name="tel" size="30" >
                    <br>
                    <label>Precio:</label>
                    <input type="number" name="tel" size="30" >
                    <br>
                    <input type="submit" value="Registrar Cuenta" >
                    <input type="reset" value="Borrar Datos" >
                </form>
            </div>
        <div class="containerConsultar" >
            <h1>Tabla de Cuentas General</h1>
        <br>
        <table border="2" width="100%" >
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre del producto</th>
                    <th>Tamaño</th>
                    <th>Gramos</th>
                    <th>Presentación</th>
                    <th>Precio</th>
                </tr>
            </thead>
            <tbody>
                
                <% 
                    Connection con = null;
                    Statement set = null;
                    ResultSet rs = null;
                    String url, userName, password, driver;
                    url = "jdbc:mysql://localhost/registroProductos";
                    userName = "root";
                    password = "Edgar777";
                    driver = "com.mysql.jdbc.Driver";
                    
                    try{
                        
                        Class.forName(driver);
                        con = DriverManager.getConnection(url, userName, password);
                        
                        try{
                            String q = "select * from registroProductos order by nom_pro";
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                            
                %>
                <tr>
                    <td> <%=rs.getInt("id_pro")%> </td>
                    <td> <%=rs.getString("nom_pro")%> </td>
                    <td> <%=rs.getString("tam_pro")%> </td>
                    <td> <%=rs.getString("gral_pro")%> </td>
                    <td> <%=rs.getString("pre_pro")%> </td>
                    <td> <%=rs.getString("cos_pro")%> </td>
                    <td> <a href="editarProducto.jsp?id=<%=rs.getInt("id_pro")%>" >Editar</a> </td>
                    <td> <a href="borrarProducto.jsp?id=<%=rs.getInt("id_pro")%>" >Borrar</a> </td>
                </tr>


                <%
                                
                                
                                
                            }
                            rs.close();
                            set.close();
                            
                        
                        }catch(SQLException ed){
                            System.out.println("Error al consultar la tabla");
                            System.out.println(ed.getMessage());
                            %>
            </tbody>
            <h1>Recurso no disponible</h1>
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
                
            </tbody>
        </table>
                    <br>
                    <a href="index.html" >Regresar al Menú Principal</a>
        </div>
        
    </body>
</html>
