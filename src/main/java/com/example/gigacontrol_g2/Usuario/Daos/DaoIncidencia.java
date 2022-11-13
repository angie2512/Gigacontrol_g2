package com.example.gigacontrol_g2.Usuario.Daos;

import com.example.gigacontrol_g2.Seguridad.DaosSeguridad.BaseDao;
import com.example.gigacontrol_g2.Usuario.Beans.Incidencia;

import java.sql.*;
import java.util.ArrayList;

public class DaoIncidencia extends BaseDao {
    public ArrayList<Incidencia> obtenerListaDeIncidencias(){
        ArrayList<Incidencia> listaDeIncidencias = new ArrayList<>();

        //Conexion a base de datos
        String sql = "select * from incidencia";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {


            while (rs.next()) {
                Incidencia incidencia = new Incidencia();
                incidencia.setIdIncidencia(rs.getInt(1));
                incidencia.setNombreDeIncidencia(rs.getString(2));
                incidencia.setDescripcion(rs.getString(3));
                incidencia.setZonaPucp(rs.getString(4));
                incidencia.setUbicacion(rs.getString(5));
                incidencia.setIdUsuario(rs.getInt(7));
                incidencia.setIdTipoIncidencia(rs.getInt(8));
                incidencia.setIdNivelUrgencia(rs.getInt(9));
                incidencia.setIdEstado(rs.getInt(10));
                listaDeIncidencias.add(incidencia);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaDeIncidencias;
    }
}