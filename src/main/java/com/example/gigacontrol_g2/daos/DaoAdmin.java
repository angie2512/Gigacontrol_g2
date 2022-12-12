package com.example.gigacontrol_g2.daos;

import com.example.gigacontrol_g2.beans.BUsuarios;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.apache.commons.compress.archivers.ar.ArArchiveEntry;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.io.InputStream;
import java.io.IOException;
import java.io.OutputStream;

public class DaoAdmin extends BaseDao {
    public void viewImage(int id, HttpServletResponse response) {
        String sql = "select FotoPerfil from usuario where idUsuario=?";
        response.setContentType("image/*");
        InputStream inputStream = null;
        OutputStream outputStream;
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery();) {
                outputStream = response.getOutputStream();
                if (rs.next()) {
                    inputStream = rs.getBinaryStream(1);
                }
                byte[] datosImagen = new byte[inputStream.available()];
                inputStream.read(datosImagen, 0, inputStream.available());
                outputStream.write(datosImagen);
                inputStream.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void banear(String userID) {

        String sql = "UPDATE usuario SET estado=? WHERE idUsuario = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, "5");
            pstmt.setString(2, userID);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void changeStatus(String status, String userID){
        String sql = "UPDATE usuario SET estado=? WHERE idUsuario = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1,status);
            pstmt.setString(2, userID);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public String createPasswordAdmin(String id){
        String password;
        BUsuarios user = buscarPorId(id);
        password = user.getNombre() + user.getDni();
        System.out.println("contra" + password);
        return password;
    }

    public void crearCredencialesAdmin(String codigoPUCP,int idUsuarioNuevo){
        String sql = "insert into validacionusuarionuevo values (sha2(?,256),?,?)";
        try (Connection conn = this.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)){
            String password = createPasswordAdmin(Integer.toString(idUsuarioNuevo));
            pstmt.setString(1,password);
            pstmt.setString(2,codigoPUCP);
            pstmt.setInt(3,idUsuarioNuevo);
            pstmt.executeUpdate();
            changeStatus("1",Integer.toString(idUsuarioNuevo));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void borrar(String userID) {

        changeStatus("2",userID);

        String sql = "DELETE from validacionusuarionuevo  WHERE usuario_idUsuario = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, userID);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    public void reactivar(String userID) {

        String sql = "UPDATE usuario SET estado=? WHERE idUsuario = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, "1");
            pstmt.setString(2, userID);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updatePhoto(int id, InputStream fotoPerfil){
        String sql="UPDATE usuario SET FotoPerfil = ? where idUsuario = ?";

        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setBlob(1,fotoPerfil);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Error en la conexión!");
            e.printStackTrace();
        }
    }


    public void update(int userID, String nombre, String apellido, String DNI, String codigo, String correo, String categoria, int rolID) {

        String sql = "UPDATE usuario SET Nombre = ?, Apellido = ?, Correo = ?, Codigo = ?, DNI = ?, Categoria = ?, ROl_idRol = ? WHERE idUsuario = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            System.out.println(nombre);
            pstmt.setString(1,nombre);
            pstmt.setString(2,apellido);
            pstmt.setString(3,correo);
            pstmt.setString(4,codigo);
            pstmt.setString(5,DNI);
            pstmt.setString(6,categoria);
            pstmt.setInt(7,rolID);
            pstmt.setInt(8,userID);

            pstmt.executeUpdate();
            System.out.println("ejecuta");
        } catch (SQLException e) {
            System.out.println("PROBLEMA");
            throw new RuntimeException(e);
        }
    }



    public void guardar(BUsuarios user){

        String sql = "INSERT INTO usuario (Nombre,Apellido,Correo,Codigo,DNI,Celular,Categoria,Rol_idRol,estado) VALUES (?,?,?,?,?,?,?,?,?)";


        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, user.getNombre());
            pstmt.setString(2, user.getApellido());
            pstmt.setString(3, user.getCorreo());
            pstmt.setString(4, user.getCodigo());
            pstmt.setString(5, user.getDni());
            pstmt.setString(6, user.getCelular());
            pstmt.setString(7, user.getCategoria());
            pstmt.setInt(8,user.getRolId());
            if(user.getRolId()==3){
                pstmt.setString(9,"9");
            }else{
                pstmt.setString(9,"3");
            }
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<BUsuarios> buscarPorApellido(String apellido) {

        ArrayList<BUsuarios> lista = new ArrayList<>();
        String sql = "select * from usuario where lower(apellido) = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, apellido);

            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {

                    BUsuarios newUser = new BUsuarios();
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
                    lista.add(newUser);

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public ArrayList<BUsuarios> buscarPorNombre(String nombre) {
        ArrayList<BUsuarios> lista = new ArrayList<>();
        String sql = "select * from usuario where lower(Nombre) = ?";
        try (Connection connection = this.getConnection();  PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, nombre);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    BUsuarios newUser = new BUsuarios();
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
                    lista.add(newUser);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public ArrayList<BUsuarios> buscarPorCodigo(String codigo) {

        ArrayList<BUsuarios> lista = new ArrayList<>();
        String sql = "select * from usuario where lower(Codigo) = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, codigo);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    BUsuarios newUser = new BUsuarios();
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
                    lista.add(newUser);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }


    public String contarApellido(String apellido) {
        String nro_filas_total_busqueda_apellido = null;
        String sql = "select count(*) as conteo from usuario where lower(apellido) = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, apellido);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    nro_filas_total_busqueda_apellido = rs.getString("conteo");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return nro_filas_total_busqueda_apellido;
    }
    public String contarNombre(String nombre) {
        String nro_filas_total_busqueda_apellido = null;
        String sql = "select count(*) as conteo from usuario where lower(Nombre) = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, nombre);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    nro_filas_total_busqueda_apellido = rs.getString("conteo");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return nro_filas_total_busqueda_apellido;
    }
    public String contarCodigo(String codigo) {
        String nro_filas_total_busqueda_apellido = null;
        String sql = "select count(*) as conteo from usuario where lower(Codigo) = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, codigo);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    nro_filas_total_busqueda_apellido = rs.getString("conteo");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return nro_filas_total_busqueda_apellido;
    }
    public ArrayList<BUsuarios> getUsersList() {
        ArrayList<BUsuarios> usersList = new ArrayList<>();
        String sql = "select * from usuario";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            while (resultSet.next()) {
                BUsuarios newUser = new BUsuarios();
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
                usersList.add(newUser);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usersList;
    }
    public boolean validarDNI(String dni){
        ArrayList<BUsuarios> listaUsuarios = getUsersList();
        boolean valid  = true;
        for(BUsuarios u : listaUsuarios){
            if(u.getDni().equalsIgnoreCase(dni)){
                valid=false;
                break;
            }
        }
        return valid;
    }
    public boolean validarCodigo(String codigo){
        ArrayList<BUsuarios> listaUsuarios = getUsersList();
        boolean valid  = true;
        for(BUsuarios u : listaUsuarios){
            if(u.getCodigo().equalsIgnoreCase(codigo)){
                valid=false;
                break;
            }
        }
        return valid;
    }

    public BUsuarios buscarPorId(String userID) {
        String sql = "select * from usuario WHERE idUsuario = ?";
        BUsuarios newUser = new BUsuarios();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, Integer.parseInt(userID));
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


}
