package com.example.gigacontrol_g2.daos;

import com.example.gigacontrol_g2.beans.BUsuarios;

import java.sql.*;
import java.util.ArrayList;

public class UsersDao {
    public ArrayList<BUsuarios> getUsersList() {
        ArrayList<BUsuarios> usersList = new ArrayList<>();
        try {
            String user = "root";
            String passw = "root";
            String url = "jdbc:mysql://localhost:3306/gigacontrol";
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(url, user, passw);
            Statement statement = connection.createStatement();
            String sql = "select * from usuario";
            ResultSet resultSet = statement.executeQuery(sql);
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

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return usersList;
    }

    public BUsuarios getAdmin() {
        BUsuarios admin = new BUsuarios();
        try {
            String user = "root";
            String passw = "root";
            String url = "jdbc:mysql://localhost:3306/gigacontrol";
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(url, user, passw);
            Statement statement = connection.createStatement();
            String sql = "SELECT * FROM gigacontrol.usuario\n" +
                    "where Rol_idRol=3";
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                admin.setNombre(resultSet.getString(2));
                admin.setApellido(resultSet.getString(3));
                admin.setCorreo(resultSet.getString(4));
                admin.setContrasena(resultSet.getString(5));
                admin.setCodigo(resultSet.getString(6));
                admin.setDni(resultSet.getString(7));
                admin.setCelular(resultSet.getString(8));
                admin.setCategoria(resultSet.getString(9));
                admin.setRolId(resultSet.getInt(11));
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
    public BUsuarios buscarPorId(String userID) {
        BUsuarios user = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/gigacontrol";



        String sql = "select * from usuario WHERE idUsuario = ?";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
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
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/gigacontrol";
        String sql = "UPDATE usuario SET Nombre = ?, Apellido = ?, Correo = ?, Codigo = ?, DNI = ?, Categoria = ?, ROl_idRol = ? WHERE idUsuario = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
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
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/gigacontrol";
        String sql = "INSERT INTO usuario (Nombre,Apellido,Correo,Codigo,DNI,Celular,Categoria,Rol_idRol,Contrasenia) VALUES (?,?,?,?,?,?,?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
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
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/gigacontrol";
        String sql = "DELETE FROM usuario WHERE idUsuario = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, userID);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
