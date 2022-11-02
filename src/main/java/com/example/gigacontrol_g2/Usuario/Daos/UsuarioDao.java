package com.example.gigacontrol_g2.Usuario.Daos;

import com.example.gigacontrol_g2.Usuario.Beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class UsuarioDao {
    public ArrayList<Usuario> obtenerListaDeNombres(){
        ArrayList<Usuario> listaDeNombres = new ArrayList<>();

        //Registro de Driver

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        //Parametros de Conexion

        String user = "root";
        String password = "root";
        String url = "jdbc:mysql://127.0.0.1:3306/gigacontrol";

        //Conexion a base de datos

        String sql = "select * from usuario";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Usuario nombreUsuario = new Usuario();
                nombreUsuario.setIdUsuario(rs.getInt(1));
                nombreUsuario.setNombre(rs.getString(2));
                nombreUsuario.setApellido(rs.getString(3));
                listaDeNombres.add(nombreUsuario);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaDeNombres;
    }

}
