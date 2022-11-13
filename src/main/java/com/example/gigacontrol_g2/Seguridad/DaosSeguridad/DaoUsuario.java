package com.example.gigacontrol_g2.Seguridad.DaosSeguridad;

import com.example.gigacontrol_g2.Seguridad.BeansSeguridad.Usuario;
import java.util.ArrayList;
import java.sql.*;

public class DaoUsuario extends BaseDao{
    public ArrayList<Usuario> obtenerListaDeUsuarios(){
        ArrayList<Usuario> listaDeUsuarios = new ArrayList<>();

        //Conexion a base de datos

        String sql = "select * from usuario";


        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setApellido(rs.getString(3));
                usuario.setCodigo(rs.getString(6));
                usuario.setCategoria(rs.getString(9));
                listaDeUsuarios.add(usuario);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaDeUsuarios;
    }

}
