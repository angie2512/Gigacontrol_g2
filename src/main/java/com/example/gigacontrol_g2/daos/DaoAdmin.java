package com.example.gigacontrol_g2.daos;

import com.example.gigacontrol_g2.beans.BUsuarios;
import jakarta.servlet.http.HttpServletResponse;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
    public void borrar(String userID) {

        String sql = "UPDATE usuario SET estado=? WHERE idUsuario = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, "2");
            pstmt.setString(2, userID);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void guardar(BUsuarios user) throws IOException {

        String sql = "INSERT INTO usuario (Nombre,Apellido,Correo,Codigo,DNI,Celular,Categoria,Rol_idRol,estado) VALUES (?,?,?,?,?,?,?,?,?)";

/*
       // String directorio = new File (".").getAbsolutePath() + "\\src\\main\\main\\resources\\Images\\usu.png";
        String directorio = new File ("src/main/main/resources/Images/usu.png").getPath();
        InputStream is = null;
        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        is = loader.getResourceAsStream(directorio);


        File imagen = new File(directorio);
        FileInputStream   fis = new FileInputStream(imagen);
*/

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
                    pstmt.setString(7,"Seguridad");
                    break;
            }
            //pstmt.setBinaryStream(8, fis, (int) imagen.length());
            //pstmt.setBlob(8,is);
            pstmt.setInt(8,user.getRolId());
            pstmt.setString(9,"3");

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
