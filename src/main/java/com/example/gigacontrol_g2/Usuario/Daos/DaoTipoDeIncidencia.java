package com.example.gigacontrol_g2.Usuario.Daos;

import com.example.gigacontrol_g2.Seguridad.DaosSeguridad.BaseDao;
import com.example.gigacontrol_g2.Usuario.Beans.TipoDeIncidencia;

import java.sql.*;
import java.util.ArrayList;

public class DaoTipoDeIncidencia extends BaseDao {
    public ArrayList<TipoDeIncidencia> obtenerListaTipoDeIncidencias(){
        ArrayList<TipoDeIncidencia> listaTipoDeIncidencias = new ArrayList<>();

        //Conexion a base de datos

        String sql = "select * from tipoincidencia";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                TipoDeIncidencia tipoDeIncidencia = new TipoDeIncidencia();
                tipoDeIncidencia.setIdTipoDeIncidencia(rs.getInt(1));
                tipoDeIncidencia.setNombre(rs.getString(2));
                listaTipoDeIncidencias.add(tipoDeIncidencia);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        //comentario de christian

        return listaTipoDeIncidencias;
    }

}
