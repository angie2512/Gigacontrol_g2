package com.example.gigacontrol_g2.Usuario.Daos;

import com.example.gigacontrol_g2.Usuario.Beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class UsuarioDao extends BaseDao {
    public ArrayList<Usuario> obtenerListaDeNombres(){
        ArrayList<Usuario> listaDeNombres = new ArrayList<>();


        String sql = "select * from usuario";

        try (Connection conn = this.getConnection();
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
