package com.example.gigacontrol_g2.daos;

import com.example.gigacontrol_g2.beans.*;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
        String sql = "select * from usuario WHERE idUsuario = ?";
        BUsuarios newUser = new BUsuarios();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, userID);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    newUser.setIdUsuario(resultSet.getInt(1));
                    newUser.setNombre(resultSet.getString(2));
                    newUser.setApellido(resultSet.getString(3));
                    newUser.setCorreo(resultSet.getString(4));
                    newUser.setCodigo(resultSet.getString(5));
                    newUser.setDni(resultSet.getString(6));
                    newUser.setCelular(resultSet.getString(7));
                    newUser.setCategoria(resultSet.getString(8));
                    newUser.setFotoPerfil(resultSet.getString(9));
                    newUser.setRolId(resultSet.getInt(10));
                    newUser.setEstado((char) resultSet.getInt(11));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return newUser;
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
                    BUsuarios bUsuarios = new BUsuarios();
                    ComentarIncidencia comentarIncidencia = new ComentarIncidencia();
                    comentarIncidencia.setIdComentario(rs.getInt(1));
                    bUsuarios.setIdUsuario(rs.getInt("idUsuario"));
                    comentarIncidencia.setIdIncidencia(idIncidencia);
                    comentarIncidencia.setComentarioIncidencia(rs.getString(4));
                    comentarIncidencia.setFechaDeComentario(rs.getTimestamp(5));
                    comentariosDeIncidencia.add(comentarIncidencia);
                    comentarIncidencia.setUsuario(bUsuarios);

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

    public void listarImgPerfil(int id, HttpServletResponse response) {
        String sql = "SELECT u.FotoPerfil FROM usuario u where idUsuario=?";
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
    public void mostrarImagenUsuario(int id, HttpServletResponse response){
        String sql= "select u.FotoPerfil from usuario u where idUsuario=?";
        response.setContentType("image/*");
        InputStream inputStream=null;
        OutputStream outputStream;
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setInt(1, id);

            try(ResultSet rs= pstmt.executeQuery();){
                outputStream= response.getOutputStream();
                if(rs.next()){
                    inputStream= rs.getBinaryStream(1);
                }
                byte[] datosImagen= new byte[inputStream.available()];
                inputStream.read(datosImagen,0,inputStream.available());
                outputStream.write(datosImagen);
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
        return destPorInc; /////
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


    public void changeStateRegisterUser(int idUsuario, int num_estado) {
        System.out.println(idUsuario);
        System.out.println(num_estado);

        String sql = "update usuario set estado = ? where idUsuario = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, num_estado);
            pstmt.setInt(2, idUsuario);
            pstmt.executeUpdate();



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void registerUserValidation(String codigo,String Contrasenia,int idusuario){

        String sql = "insert into validacionusuarionuevo values (sha2(?,256),?,?)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, Contrasenia);
            pstmt.setString(2, codigo);
            pstmt.setInt(3, idusuario);
            pstmt.executeUpdate();

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
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }




    public String contarIncidencias() {

        String nro_filas_total = null;
        String sql = "select count(*) from incidencia";
        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            if(rs.next()){
                nro_filas_total = rs.getString(1);
            }



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return nro_filas_total;
    }



}
