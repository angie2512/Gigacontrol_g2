package com.example.gigacontrol_g2.daos;

import com.example.gigacontrol_g2.beans.*;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import sun.font.CodePointIterator;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class DaoDatosFijos extends BaseDao {
    public ArrayList<Estado> obtenerListaEstados() {
        ArrayList<Estado> listaEstados = new ArrayList<>();

        //Conexion a base de datos
        String sql = "select * from estado";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Estado estado = new Estado();
                estado.setIdEstado(rs.getInt(1));
                estado.setNombre(rs.getString(2));
                listaEstados.add(estado);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaEstados;
    }

    public ArrayList<TipoDeIncidencia> obtenerListaTipoDeIncidencias() {
        ArrayList<TipoDeIncidencia> listaTipoIncidencias = new ArrayList<>();

        //Conexion a base de datos

        String sql = "select * from tipoincidencia ";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                TipoDeIncidencia tipoDeIncidencia = new TipoDeIncidencia();
                tipoDeIncidencia.setIdTipoDeIncidencia(rs.getInt(1));
                tipoDeIncidencia.setNombre(rs.getString(2));
                listaTipoIncidencias.add(tipoDeIncidencia);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        //comentario de christian

        return listaTipoIncidencias;
    }

    public ArrayList<NivelDeUrgencia> obtenerListaNivelesDeUrgencia() {

        ArrayList<NivelDeUrgencia> listaNivelesDeUrgencia = new ArrayList<>();

        //Conexion  a base de datos

        String sql = "select * from nivelurgencia";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {


            while (rs.next()) {
                NivelDeUrgencia nivelDeUrgencia = new NivelDeUrgencia();
                nivelDeUrgencia.setIdNivelDeUrgencia(rs.getInt(1));
                nivelDeUrgencia.setNombre(rs.getString(2));
                listaNivelesDeUrgencia.add(nivelDeUrgencia);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listaNivelesDeUrgencia;
    }

    public BUsuarios buscarPorId(int userID) {
        BUsuarios user = null;

        String sql = "select * from usuario WHERE idUsuario = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {


            pstmt.setInt(1, userID);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new BUsuarios();
                    user.setIdUsuario(rs.getInt(1));
                    user.setNombre(rs.getString(2));
                    user.setApellido(rs.getString(3));
                    user.setCorreo(rs.getString(4));
                    user.setCodigo(rs.getString(6));
                    user.setDni(rs.getString(7));
                    user.setCelular(rs.getString(8));
                    user.setCategoria(rs.getString(9));
                    user.setFotoPerfil(rs.getString(10));
                    user.setRolId(rs.getInt(11));
                    user.setEstado((char) rs.getInt(12));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    public BUsuarios validUserPassword(String codigo, String password) {
        BUsuarios user = null;
        String sql = "SELECT * FROM validacionusuarionuevo where Codigo = ? and Contrasenia= sha2(?,256)";

        try (Connection conn = this.getConnection();
             PreparedStatement pstm = conn.prepareStatement(sql);) {
            pstm.setString(1, codigo);
            pstm.setString(2, password);
            try (ResultSet rs = pstm.executeQuery();) {
                if (rs.next()) {
                    int userID = rs.getInt(3);
                    user = this.buscarPorId(userID);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    //Metodo PARA OBTENER LOS COMENTARIOS DE USUARIO Y SEGURIDAD POR CADA INCIDENCIA

    public ArrayList<ComentarIncidencia> obtenerComentariosDeIncidencia(int idIncidencia) {

        ArrayList<ComentarIncidencia> comentariosDeIncidencia = new ArrayList<>();

        String sql = "select * from comentarincidencia where idIncidencia=? ";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idIncidencia); //idUsuario

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    ComentarIncidencia comentarIncidencia = new ComentarIncidencia();
                    comentarIncidencia.setIdComentario(rs.getInt(1));
                    comentarIncidencia.setIdUsuario(rs.getInt(2));
                    comentarIncidencia.setIdIncidencia(idIncidencia);
                    comentarIncidencia.setComentarioIncidencia(rs.getString(4));
                    comentarIncidencia.setFechaDeComentario(rs.getTimestamp(5));
                    comentariosDeIncidencia.add(comentarIncidencia);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return comentariosDeIncidencia;
    }

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "SELECT i.Foto FROM incidencia i where idIncidencia=?";
        response.setContentType("image/*");
        InputStream inputStream = null;
        OutputStream outputStream;
        try (Connection conn = this.getConnection();
             PreparedStatement pstm = conn.prepareStatement(sql);) {
            pstm.setInt(1, id);
            try (ResultSet rs = pstm.executeQuery();) {
                outputStream = response.getOutputStream();
                if (rs.next()) {
                    inputStream = rs.getBinaryStream(1);
                }
                byte[] imagen = new byte[inputStream.available()];
                inputStream.read(imagen, 0, inputStream.available());
                outputStream.write(imagen);
                inputStream.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public HashMap<Integer, Integer> numDestacadosPorIncidencia() {
        HashMap<Integer, Integer> destPorInc = new HashMap<Integer, Integer>();
        destPorInc.put(0, 0);
        String sql = "select idIncidencia, count(*) from destacarincidencia group by idIncidencia";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    destPorInc.put(rs.getInt(1), rs.getInt(2));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return destPorInc;
    }


    public BUsuarios validarCorreoContraseniaUsuario(String codigo, String correo) {
        BUsuarios user = null;
        String sql = "SELECT * FROM usuario where Codigo = ? and Correo= ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstm = conn.prepareStatement(sql);) {
            pstm.setString(1, codigo);
            pstm.setString(2, correo);
            try (ResultSet rs = pstm.executeQuery();) {
                if (rs.next()) {
                    int userID = rs.getInt(1);
                    user = this.buscarPorId(userID);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }


    public void changeStateRegisterUser(int idUsuario) {

        String sql = "update usuario set estado = 1 where idUsuario = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void registerUserValidation(int idUsuario, String codigo){

        String sql = "update validacionusuarionuevo set usuario_idUsuario = ?, Codigo = ?, Contrasenia = sha2(?,256)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);
            pstmt.setString(2, codigo);
            pstmt.setString(3, codigo);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void changeNewPassUser(String oldpassword, String newpassword) {

        String sql = "update validacionusuarionuevo set Contrasenia = sha2(?,256) where Contrasenia = sha2(?,256)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, newpassword);
            pstmt.setString(2, oldpassword);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



}
