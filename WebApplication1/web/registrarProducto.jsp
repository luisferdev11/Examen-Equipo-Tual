<%-- 
    Document   : registrarProducto
    Created on : 1/05/2021, 09:58:16 AM
    Author     : EMOA1
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"  language="java" import="java.sql.*, java.util.*, java.text.*,java.lang.Integer.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro productos</title>
    </head>
    <body>
         <% 
            //aqui va codigo java
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost/ben_y_jerrys";
            userName = "root";
            password = "Edgar777";
            driver = "com.mysql.jdbc.Driver";
            //voy a lanzar una vista para cuando hace la insercion, cuando 
            //hay error en la lectura de la tabla
            //hay error por parte de bd
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                
                try{
                    String nombre, tamaño, presentacion, q;
                    int precio, gramos;
                    nombre = request.getParameter("nombre");
                    tamaño = request.getParameter("tamaño");
                    gramos = Integer.parseInt(request.getParameter("gramos"));
                    presentacion = request.getParameter("presentacion");
                    precio = Integer.parseInt(request.getParameter("precio"));
                    set = con.createStatement();
                    
                    q = "insert into MProductos(nom_pro, tam_pro, gra_pro, pre_pro, cos_pro) "
                            + "values ('"+nombre+"', '"+tamaño+"', '"+gramos+"', '"+presentacion+"', '"+precio+"' )";
                    int registro = set.executeUpdate(q);
                    
                    %>
        <h1>Registro Exitoso</h1>            
                    <%
                        set.close();
                
                }catch(SQLException ed){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(ed.getMessage());
                    %>
        <h1>Registro No Exitoso, error en la lectura de la tabla</h1>            
                    <%
                
                }
                con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            %>
        <h1>Sitio en Construcción</h1>            
                    <%
            }
            %>
        
        
            <a href="index.html" >Regresar al menú principal</a>
            <br>
            <a href="consultarProductos.jsp" >Administrar Productos</a>
    </body>
</html>
