package com.example.gigacontrol_g2.daos;

import com.example.gigacontrol_g2.beans.*;

import java.sql.*;
import java.util.ArrayList;

public class UsersDao extends BaseDao{
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
                newUser.setContrasena(resultSet.getString(5));
                newUser.setCodigo(resultSet.getString(6));
                newUser.setDni(resultSet.getString(7));
                newUser.setCelular(resultSet.getString(8));
                newUser.setCategoria(resultSet.getString(9));
                newUser.setRolId(resultSet.getInt(11));

                usersList.add(newUser);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usersList;
    }
    public ArrayList<Incidencia> obtenerListaDeIncidencias(){
        ArrayList<Incidencia> listaDeIncidencias= new ArrayList<>();

        String sql = "select  u.Nombre, u.Codigo, u.Rol_idRol from destacarincidencia dest inner join incidencia i on dest.idIncidencia = i.idIncidencia\n" +
                "inner join usuario u on dest.idUsuario = u.idUsuario";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Incidencia incidencia = new Incidencia();
                DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
                incidencia.setIdIncidencia(rs.getInt(1));
                incidencia.setNombreDeIncidencia(rs.getString(2));
                incidencia.setDescripcion(rs.getString(3));
                incidencia.setZonaPucp(rs.getString(4));
                incidencia.setUbicacion(rs.getString(5));
                UsersDao userDao = new UsersDao();
                BUsuarios usuario = new BUsuarios();
                for (BUsuarios usuar : userDao.getUsersList()){
                    if(usuar.getIdUsuario()==rs.getInt(7)){
                        usuario.setIdUsuario(rs.getInt(7));
                        usuario.setRolId(rs.getInt(7));
                        usuario.setNombre(usuar.getNombre());
                        usuario.setApellido(usuar.getApellido());
                        usuario.setCodigo(usuar.getCodigo());
                        usuario.setCategoria(usuar.getCategoria());
                    }
                }
                incidencia.setUsuario(usuario);

                listaDeIncidencias.add(incidencia);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaDeIncidencias;
    }
    public ArrayList<Incidencia> BuscarIncidencia(String incidencia){

        String sql = "select * from incidencia where NombreDeIncidencia like ?";
        ArrayList<Incidencia> listaFiltrada = new ArrayList<>();

        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);){
            pstmt.setString(1,"%"+incidencia+"%");
            try(ResultSet rs = pstmt.executeQuery();){
                while(rs.next()){
                    Incidencia incidencia1 = new Incidencia();
                    incidencia1.setIdIncidencia(rs.getInt("idIncidencia"));
                    incidencia1.setNombreDeIncidencia(rs.getString("NombreDeIncidencia"));
                    incidencia1.setDescripcion(rs.getString("Descripcion"));
                    incidencia1.setZonaPucp(rs.getString("ZonaPUCP"));
                    incidencia1.setUbicacion(rs.getString("Ubicacion"));
                    incidencia1.setFoto(rs.getString("Foto"));
                    listaFiltrada.add(incidencia1);
                }}
        }catch (SQLException e){
            e.printStackTrace();
        }
        return listaFiltrada;
    }

    public BUsuarios buscarPorId(String userID) {
        BUsuarios user = null;

        String sql = "select * from usuario WHERE idUsuario = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            System.out.println("entro a buscar");

            pstmt.setString(1, userID);

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
                    user.setRolId(rs.getInt(11));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }
    public void actualizar(int userID, String nombre, String apellido, String DNI, String codigo, String correo, String categoria, int rolID) {

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

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void guardar(BUsuarios user) {

        String sql = "INSERT INTO usuario (Nombre,Apellido,Correo,Codigo,DNI,Celular,Categoria,Rol_idRol,Contrasenia) VALUES (?,?,?,?,?,?,?,?,sha2(?,256))";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, user.getNombre());
            pstmt.setString(2, user.getApellido());
            pstmt.setString(3, user.getCorreo());
            pstmt.setString(4, user.getCodigo());
            pstmt.setString(5, user.getDni());
            pstmt.setString(6, user.getCelular());
            switch (user.getCategoria()){
                case "1":
                    pstmt.setString(7,"Alumno");
                    break;
                case "2":
                    pstmt.setString(7,"Profesor");
                    break;
                case "3":
                    pstmt.setString(7,"Jefe de practica");
                    break;
                case "4":
                    pstmt.setString(7,"Administrativo");
                    break;
            }
            pstmt.setInt(8,user.getRolId());
            pstmt.setString(9,user.getContrasena());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void borrar(String userID) {

        String sql = "DELETE FROM usuario WHERE idUsuario = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, userID);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    //public ArrayList<Usuario> obtenerListaDeUsuarios() {
    //        ArrayList<Usuario> listaDeUsuarios = new ArrayList<>();
    //
    //        //Conexion a base de datos
    //
    //        String sql = "select * from usuario";
    //
    //
    //        try (Connection conn = this.getConnection();
    //             Statement stmt = conn.createStatement();
    //             ResultSet rs = stmt.executeQuery(sql)) {
    //
    //            while (rs.next()) {
    //                Usuario usuario = new Usuario();
    //                usuario.setIdUsuario(rs.getInt(1));
    //                usuario.setNombre(rs.getString(2));
    //                usuario.setApellido(rs.getString(3));
    //                usuario.setCodigo(rs.getString(6));
    //                usuario.setCategoria(rs.getString(9));
    //                listaDeUsuarios.add(usuario);
    //            }
    //
    //
    //        } catch (SQLException throwables) {
    //            throwables.printStackTrace();
    //        }
    //
    //        return listaDeUsuarios;
    //    }
    //
       public BUsuarios obtenerUsuario(int idUsuario) {

           BUsuarios usuario = null;

           String sql = "select * from usuario WHERE idUsuario = ?";
           try (Connection connection = this.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql)) {

              pstmt.setInt(1, idUsuario);

               try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                       usuario = new BUsuarios();
                       usuario.setIdUsuario(idUsuario);
                       usuario.setNombre(rs.getString(2));
                       usuario.setApellido(rs.getString(3));
                       usuario.setCodigo(rs.getString(6));
                       usuario.setCategoria(rs.getString(9));
                       usuario.setRolId(rs.getInt(11));
                       //se podria tambien agregar una columna de facultad en la tabla usuario
                       //debido a la vista del perfil de usuario pucp
                   }
               }
           } catch (SQLException e) {
               throw new RuntimeException(e);
           }

           return usuario;
       }


    public ArrayList<BUsuarios> buscarPorApellido(String apellido) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/gigacontrol";
        ArrayList<BUsuarios> lista = new ArrayList<>();
        String sql = "select * from usuario where lower(apellido) like ?";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, "%"+apellido+"%");

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    BUsuarios usuario = new BUsuarios();
                    usuario.setIdUsuario(rs.getInt(1));
                    usuario.setNombre(rs.getString(2));
                    usuario.setApellido(rs.getString(3));
                    usuario.setCategoria(rs.getString("Categoria"));
                    usuario.setCodigo(rs.getString("Codigo"));
                    lista.add(usuario);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

}
