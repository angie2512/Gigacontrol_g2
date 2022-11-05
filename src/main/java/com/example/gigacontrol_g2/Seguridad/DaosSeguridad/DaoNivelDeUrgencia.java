package com.example.gigacontrol_g2.Seguridad.DaosSeguridad;

import com.example.gigacontrol_g2.Seguridad.DaosSeguridad.DaoNivelDeUrgencia;

import java.sql.*;
import java.util.ArrayList;
import com.example.gigacontrol_g2.Seguridad.BeansSeguridad.NivelDeUrgencia;

public class DaoNivelDeUrgencia {

    public ArrayList<NivelDeUrgencia> obtenerListaNivelesDeUrgencia() {
        ArrayList<NivelDeUrgencia> listaNivelesDeUrgencia = new ArrayList<>();

        //Registro de driver

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        //Parametros de conexion

        String user = "root";
        String password = "root";
        String url = "jdbc:mysql://127.0.0.1:3306/gigacontrol";


        //Conexion  a base de datos

        String sql = "select * from nivelurgencia";

        try (Connection conn = DriverManager.getConnection(url, user, password);
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
}