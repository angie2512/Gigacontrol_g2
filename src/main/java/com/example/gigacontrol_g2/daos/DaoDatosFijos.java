package com.example.gigacontrol_g2.daos;

import com.example.gigacontrol_g2.beans.Estado;
import com.example.gigacontrol_g2.beans.NivelDeUrgencia;
import com.example.gigacontrol_g2.beans.TipoDeIncidencia;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DaoDatosFijos extends BaseDao{
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

    public ArrayList<TipoDeIncidencia> obtenerListaTipoDeIncidencias(){
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

    public ArrayList<NivelDeUrgencia> obtenerListaNivelesDeUrgencia(){

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
