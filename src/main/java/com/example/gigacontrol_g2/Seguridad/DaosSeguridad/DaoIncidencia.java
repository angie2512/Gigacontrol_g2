package com.example.gigacontrol_g2.Seguridad.DaosSeguridad;
import com.example.gigacontrol_g2.Seguridad.BeansSeguridad.*;

import java.sql.*;
import java.util.ArrayList;
import com.example.gigacontrol_g2.Seguridad.BeansSeguridad.Incidencia;
import com.example.gigacontrol_g2.Seguridad.BeansSeguridad.TipoDeIncidencia;
import com.example.gigacontrol_g2.Seguridad.BeansSeguridad.Estado;
public class DaoIncidencia {
    public ArrayList<Incidencia> obtenerListaDeIncidencias(){
        ArrayList<Incidencia> listaDeIncidencias= new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        //Parametros de Conexion

        String user = "root";
        String password = "root";
        String url = "jdbc:mysql://127.0.0.1:3306/gigacontrol";

        //Conexion a base de datos

        String sql = "select * from incidencia";


        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {


            while (rs.next()) {
                Incidencia incidencia = new Incidencia();
                incidencia.setIdIncidencia(rs.getInt(1));
                incidencia.setNombreIncidencia(rs.getString(2));
                incidencia.setDescripcion(rs.getString(3));
                incidencia.setZonaPUCP(rs.getString(4));
                incidencia.setUbicacion(rs.getString(5));
                DaoUsuario daoUsuario = new DaoUsuario();
                Usuario usuario = new Usuario();
                for (Usuario usuar : daoUsuario.obtenerListaDeUsuarios()){
                    if(usuar.getIdUsuario()==rs.getInt(7)){
                        usuario.setIdUsuario(rs.getInt(7));
                        usuario.setNombre(usuar.getNombre());
                        usuario.setApellido(usuar.getApellido());
                        usuario.setCodigo(usuar.getCodigo());
                        usuario.setCategoria(usuar.getCategoria());
                    }
                }
                incidencia.setUsuario(usuario);
                DaoTipoDeIncidencia daoTipoDeIncidencia = new DaoTipoDeIncidencia();
                TipoDeIncidencia tipoDeIncidencia = new TipoDeIncidencia();
                for (TipoDeIncidencia tdi: daoTipoDeIncidencia.obtenerListaTipoDeIncidencias()){
                    if(tdi.getIdTipoDeIncidencia()==rs.getInt(8)){
                        tipoDeIncidencia.setIdTipoDeIncidencia(rs.getInt(8));
                        tipoDeIncidencia.setNombre(tdi.getNombre());
                    }
                }
                incidencia.setTipoDeIncidencia(tipoDeIncidencia);
                DaoNivelDeUrgencia daoNivelDeUrgencia= new DaoNivelDeUrgencia();
                NivelDeUrgencia nivelDeUrgencia = new NivelDeUrgencia();
                for (NivelDeUrgencia nivelUrgencia : daoNivelDeUrgencia.obtenerListaNivelesDeUrgencia()){
                    if(nivelUrgencia.getIdNivelDeUrgencia()==rs.getInt(9)){
                        nivelDeUrgencia.setIdNivelDeUrgencia(rs.getInt(9));
                        nivelDeUrgencia.setNombre(nivelUrgencia.getNombre());
                    }
                }
                incidencia.setNivelDeUrgencia(nivelDeUrgencia);
                DaoEstado daoEstado= new DaoEstado();
                Estado estado = new Estado();
                for (Estado est: daoEstado.obtenerListaEstados()){
                    if(est.getIdEstado()==rs.getInt(10)){
                        estado.setIdEstado(rs.getInt(10));
                        estado.setNombre(est.getNombre());
                    }
                }
                incidencia.setEstado(estado);
                System.out.println(incidencia.getIdIncidencia());
                listaDeIncidencias.add(incidencia);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaDeIncidencias;
    }

    public Incidencia buscarIncidencia(int idIncidencia) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/gigacontrol";

        Incidencia incidencia = null;

        String sql = "select * from incidencia WHERE idIncidencia = ?";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, idIncidencia);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    incidencia = new Incidencia();
                    incidencia.setIdIncidencia(rs.getInt(1));
                    incidencia.setNombreIncidencia(rs.getString(2));
                    incidencia.setDescripcion(rs.getString(3));
                    incidencia.setZonaPUCP(rs.getString(4));
                    incidencia.setUbicacion(rs.getString(5));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return incidencia;
    }

    public void guardarComentario(int idIncidencia, String comentario){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/gigacontrol";

        String sql="insert into comentarincidencia (idUsuario,idIncidencia,ComentarioIncidencia) " +
                    "values (?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setNull(1,Types.INTEGER); //idUsuario
            pstmt.setInt(2, idIncidencia);
            pstmt.setString(3, comentario);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
