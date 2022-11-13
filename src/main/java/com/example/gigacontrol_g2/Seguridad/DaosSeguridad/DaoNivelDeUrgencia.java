package com.example.gigacontrol_g2.Seguridad.DaosSeguridad;


import java.sql.*;
import java.util.ArrayList;
import com.example.gigacontrol_g2.Seguridad.BeansSeguridad.NivelDeUrgencia;

public class DaoNivelDeUrgencia extends BaseDao{

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
}
