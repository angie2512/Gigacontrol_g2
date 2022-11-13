package com.example.gigacontrol_g2.Usuario.Daos;

import com.example.gigacontrol_g2.Seguridad.DaosSeguridad.BaseDao;
import com.example.gigacontrol_g2.Usuario.Beans.Estado;
import java.sql.*;
import java.util.ArrayList;

public class DaoEstado extends BaseDao {
    public ArrayList<Estado> obtenerListaEstados(){
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

}
