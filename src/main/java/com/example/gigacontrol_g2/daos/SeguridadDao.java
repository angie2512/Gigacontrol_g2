package com.example.gigacontrol_g2.daos;

import com.example.gigacontrol_g2.beans.*;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.ArrayList;

public class SeguridadDao extends BaseDao{


    public ArrayList<Incidencia> obtenerListaDeIncidencias(){
        ArrayList<Incidencia> listaDeIncidencias= new ArrayList<>();

        String sql = "select * from incidencia";

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
                        usuario.setNombre(usuar.getNombre());
                        usuario.setApellido(usuar.getApellido());
                        usuario.setCodigo(usuar.getCodigo());
                        usuario.setCategoria(usuar.getCategoria());
                    }
                }
                incidencia.setUsuario(usuario);
                TipoDeIncidencia tipoDeIncidencia = new TipoDeIncidencia();
                for (TipoDeIncidencia tdi : this.obtenerListaTipoDeIncidencias()){
                    if(tdi.getIdTipoDeIncidencia()==rs.getInt(8)){
                        tipoDeIncidencia.setIdTipoDeIncidencia(rs.getInt(8));
                        tipoDeIncidencia.setNombre(tdi.getNombre());
                    }
                }
                incidencia.setTipoDeIncidencia(tipoDeIncidencia);
                NivelDeUrgencia nivelDeUrgencia = new NivelDeUrgencia();
                for (NivelDeUrgencia nivelUrgencia : this.obtenerListaNivelesDeUrgencia()){
                    if(nivelUrgencia.getIdNivelDeUrgencia()==rs.getInt(9)){
                        nivelDeUrgencia.setIdNivelDeUrgencia(rs.getInt(9));
                        nivelDeUrgencia.setNombre(nivelUrgencia.getNombre());
                    }
                }
                incidencia.setNivelDeUrgencia(nivelDeUrgencia);
                Estado estado = new Estado();
                for (Estado est: daoDatosFijos.obtenerListaEstados()){
                    if(est.getIdEstado()==rs.getInt(10)){
                        estado.setIdEstado(rs.getInt(10));
                        estado.setNombre(est.getNombre());
                    }
                }
                incidencia.setEstado(estado);
                listaDeIncidencias.add(incidencia);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaDeIncidencias;
    }
// Para Ver la Incidencia
    public Incidencia buscarIncidencia(int idIncidencia) {

        Incidencia incidencia = null;

        String sql = "select * from incidencia WHERE idIncidencia = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idIncidencia);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    incidencia = new Incidencia();
                    DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
                    UsersDao usersDao = new UsersDao();
                    incidencia.setIdIncidencia(idIncidencia);
                    incidencia.setNombreDeIncidencia(rs.getString(2));
                    incidencia.setDescripcion(rs.getString(3));
                    incidencia.setZonaPucp(rs.getString(4));
                    incidencia.setUbicacion(rs.getString(5));
                    BUsuarios usuario1 = new BUsuarios();
                    for (BUsuarios usuar : usersDao.getUsersList()){
                        if(usuar.getIdUsuario()==rs.getInt(7)){
                            usuario1.setIdUsuario(rs.getInt(7));
                            usuario1.setNombre(usuar.getNombre());
                            usuario1.setApellido(usuar.getApellido());
                            usuario1.setCodigo(usuar.getCodigo());
                            usuario1.setCategoria(usuar.getCategoria());
                        }
                    }
                    incidencia.setUsuario(usuario1);
                    TipoDeIncidencia tipoDeIncidencia1 = new TipoDeIncidencia();
                    for (TipoDeIncidencia tdi : daoDatosFijos.obtenerListaTipoDeIncidencias()){
                        if(tdi.getIdTipoDeIncidencia()==rs.getInt(8)){
                            tipoDeIncidencia1.setIdTipoDeIncidencia(rs.getInt(8));
                            tipoDeIncidencia1.setNombre(tdi.getNombre());
                        }
                    }
                    incidencia.setTipoDeIncidencia(tipoDeIncidencia1);
                    NivelDeUrgencia nivelDeUrgencia1 = new NivelDeUrgencia();
                    for (NivelDeUrgencia nivelUrgencia : daoDatosFijos.obtenerListaNivelesDeUrgencia()){
                        if(nivelUrgencia.getIdNivelDeUrgencia()==rs.getInt(9)){
                            nivelDeUrgencia1.setIdNivelDeUrgencia(rs.getInt(9));
                            nivelDeUrgencia1.setNombre(nivelUrgencia.getNombre());
                        }
                    }
                    incidencia.setNivelDeUrgencia(nivelDeUrgencia1);
                    Estado estado1 = new Estado();
                    for (Estado est: daoDatosFijos.obtenerListaEstados()){
                        if(est.getIdEstado()==rs.getInt(10)){
                            estado1.setIdEstado(rs.getInt(10));
                            estado1.setNombre(est.getNombre());
                        }
                    }
                    incidencia.setEstado(estado1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return incidencia;
    }

    public void guardarComentario(int idIncidencia, String comentario){

        String sql="insert into comentarincidencia (idUsuario,idIncidencia,ComentarioIncidencia) " +
                "values (?,?,?)";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1,Types.INTEGER); //idUsuario
            pstmt.setInt(2, idIncidencia);
            pstmt.setString(3, comentario);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

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

        return listaTipoDeIncidencias;
    }

//Para el buscador
    public ArrayList<Incidencia> buscarPorIncidencia(String nombreDeIncidencia){

        String sql = "select * from incidencia where NombreDeIncidencia like ?";

        ArrayList<Incidencia> listaFiltrada1 = new ArrayList<>();

        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);){

            pstmt.setString(1,"%"+nombreDeIncidencia+"%");
            try(ResultSet rs = pstmt.executeQuery();){

                while(rs.next()){
                    Incidencia incidencia = new Incidencia();
                    BUsuarios bUsuarios = new BUsuarios();
                    Estado estado = new Estado();
                    NivelDeUrgencia nivelDeUrgencia = new NivelDeUrgencia();
                    TipoDeIncidencia tipoDeIncidencia = new TipoDeIncidencia();

                    incidencia.setNombreDeIncidencia(rs.getString("NombreDeIncidencia"));
                    incidencia.setDescripcion(rs.getString("Descripcion"));
                    incidencia.setZonaPucp(rs.getString("ZonaPUCP"));
                    incidencia.setUbicacion(rs.getString("Ubicacion"));
                    incidencia.setFoto(rs.getString("Foto"));
                    bUsuarios.setIdUsuario(rs.getInt("idUsuario"));
                    tipoDeIncidencia.setIdTipoDeIncidencia(rs.getInt("idTipoIncidencia"));
                    nivelDeUrgencia.setIdNivelDeUrgencia(rs.getInt("idNivelUrgencia"));
                    estado.setIdEstado(rs.getInt("idEstado"));

                    incidencia.setUsuario(bUsuarios);
                    incidencia.setTipoDeIncidencia(tipoDeIncidencia);
                    incidencia.setNivelDeUrgencia(nivelDeUrgencia);
                    incidencia.setEstado(estado);

                    listaFiltrada1.add(incidencia);
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return listaFiltrada1;
    }

    public void editarFoto(int id, InputStream FotoPerfil){
        String sql="UPDATE centro.usuario SET FotoPerfil = ?" +
                "where idPersona = ?";

        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setBlob(1,FotoPerfil);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }

    public void mostrarImagen(int id, HttpServletResponse response){
        String sql= "select u.FotoPerfil from usuario u where idUsuario=?";

        response.setContentType("image/*");
        InputStream inputStream=null;
        OutputStream outputStream;

        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setInt(1, id);

            try(ResultSet rs= pstmt.executeQuery();){
                outputStream= response.getOutputStream();
                if(rs.next()){
                    inputStream= rs.getBinaryStream(1);
                }
                byte[] datosImagen= new byte[inputStream.available()];
                inputStream.read(datosImagen,0,inputStream.available());
                outputStream.write(datosImagen);
                inputStream.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
