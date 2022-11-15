package com.example.gigacontrol_g2.Seguridad.DaosSeguridad;

import com.example.gigacontrol_g2.Seguridad.BeansSeguridad.*;

import java.util.ArrayList;
import java.sql.*;

public class DaoUsuario extends BaseDao {
    public ArrayList<Usuario> obtenerListaDeUsuarios() {
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

    public Usuario obtenerUsuario(int idUsuario) {

        Usuario usuario = null;

        String sql = "select * from usuario WHERE idUsuario = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setIdUsuario(idUsuario);
                    usuario.setNombre(rs.getString(2));
                    usuario.setApellido(rs.getString(3));
                    usuario.setCodigo(rs.getString(6));
                    usuario.setCategoria(rs.getString(9));
                    Rol rol = new Rol();
                    rol.setIdRol(rs.getInt(11));
                    usuario.setRol(rol);
                    //se podria tambien agregar una columna de facultad en la tabla usuario
                    //debido a la vista del perfil de usuario pucp
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuario;
    }

    public Usuario validarUsuarioPasswordHashed(String codigo, String contrasena) {

        Usuario usuario = null;

        String sql = "select * from usuario where Codigo = ? and ContraseniaHashed = SHA2(?,256) ";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, contrasena);
            pstmt.setString(2, contrasena);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int idUsuario = rs.getInt(1);
                    usuario = this.obtenerUsuario(idUsuario);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuario;
    }

}
