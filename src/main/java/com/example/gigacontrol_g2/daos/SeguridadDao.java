package com.example.gigacontrol_g2.daos;

import com.example.gigacontrol_g2.Servlets.NuevaIncidencia;
import com.example.gigacontrol_g2.beans.*;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.ArrayList;

public class SeguridadDao extends BaseDao{

    DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
    UsersDao usersDao = new UsersDao();

    public ArrayList<Incidencia> obtenerListaDeIncidencias(){
        ArrayList<Incidencia> listaDeIncidencias= new ArrayList<>();
        //DaoDatosFijos daoDatosFijos = new DaoDatosFijos();

        String sql = "select * from incidencia";
        UsersDao userDao = new UsersDao();

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
                BUsuarios usuario = new BUsuarios();
                for (BUsuarios usuar : usersDao.getUsersList()){
                    if(usuar.getIdUsuario()==rs.getInt(7)){
                        usuario.setIdUsuario(rs.getInt(7));
                        usuario.setNombre(usuar.getNombre());
                        usuario.setApellido(usuar.getApellido());
                        usuario.setCodigo(usuar.getCodigo());
                        usuario.setCategoria(usuar.getCategoria());
                        usuario.setCorreo(usuar.getCorreo());
                    }
                }
                incidencia.setUsuario(usuario);
                TipoDeIncidencia tipoDeIncidencia = new TipoDeIncidencia();
                for (TipoDeIncidencia tdi : daoDatosFijos.obtenerListaTipoDeIncidencias()){
                    if(tdi.getIdTipoDeIncidencia()==rs.getInt(8)){
                        tipoDeIncidencia.setIdTipoDeIncidencia(rs.getInt(8));
                        tipoDeIncidencia.setNombre(tdi.getNombre());
                    }
                }
                incidencia.setTipoDeIncidencia(tipoDeIncidencia);
                NivelDeUrgencia nivelDeUrgencia = new NivelDeUrgencia();
                for (NivelDeUrgencia nivelUrgencia : daoDatosFijos.obtenerListaNivelesDeUrgencia()){
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
        Incidencia incidencia1 = new Incidencia();

        String sql = "select * from incidencia where idIncidencia = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idIncidencia);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    incidencia1.setIdIncidencia(rs.getInt(1));
                    incidencia1.setNombreDeIncidencia(rs.getString(2));
                    incidencia1.setDescripcion(rs.getString(3));
                    incidencia1.setZonaPucp(rs.getString(4));
                    incidencia1.setUbicacion(rs.getString(5));
                    BUsuarios usuario1 = new BUsuarios();
                    for (BUsuarios usuar : usersDao.getUsersList()){
                        if(usuar.getIdUsuario()==rs.getInt(7)){
                            usuario1.setIdUsuario(rs.getInt(7));
                            usuario1.setNombre(usuar.getNombre());
                            usuario1.setApellido(usuar.getApellido());
                            usuario1.setCodigo(usuar.getCodigo());
                            usuario1.setCategoria(usuar.getCategoria());
                            usuario1.setCorreo(usuar.getCorreo());
                        }
                    }
                    incidencia1.setUsuario(usuario1);
                    TipoDeIncidencia tipoDeIncidencia1 = new TipoDeIncidencia();
                    for (TipoDeIncidencia tdi : daoDatosFijos.obtenerListaTipoDeIncidencias()){
                        if(tdi.getIdTipoDeIncidencia()==rs.getInt(8)){
                            tipoDeIncidencia1.setIdTipoDeIncidencia(rs.getInt(8));
                            tipoDeIncidencia1.setNombre(tdi.getNombre());
                        }
                    }
                    incidencia1.setTipoDeIncidencia(tipoDeIncidencia1);
                    NivelDeUrgencia nivelDeUrgencia1 = new NivelDeUrgencia();
                    for (NivelDeUrgencia nivelUrgencia : daoDatosFijos.obtenerListaNivelesDeUrgencia()){
                        if(nivelUrgencia.getIdNivelDeUrgencia()==rs.getInt(9)){
                            nivelDeUrgencia1.setIdNivelDeUrgencia(rs.getInt(9));
                            nivelDeUrgencia1.setNombre(nivelUrgencia.getNombre());
                        }
                    }
                    incidencia1.setNivelDeUrgencia(nivelDeUrgencia1);
                    Estado estado1 = new Estado();
                    for (Estado est: daoDatosFijos.obtenerListaEstados()){
                        if(est.getIdEstado()==rs.getInt(10)){
                            estado1.setIdEstado(rs.getInt(10));
                            estado1.setNombre(est.getNombre());
                        }
                    }
                    incidencia1.setEstado(estado1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return incidencia1;
    }

    public void guardarComentario(int idUsuario,int idIncidencia, String comentario){

        String sql="insert into comentarincidencia (idUsuario,idIncidencia,ComentarioIncidencia,FechaDeComentario) " +
                "values (?,?,?,CURRENT_TIMESTAMP) ";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1,idUsuario); //idUsuario
            pstmt.setInt(2, idIncidencia);
            pstmt.setString(3, comentario);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void actualizarEstado(int idEstado, int idIncidencia) {

        String sql = "UPDATE incidencia set idEstado = ? WHERE idIncidencia = ? ";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1,idEstado);
            pstmt.setInt(2, idIncidencia);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


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
                    incidencia.setFoto(rs.getBinaryStream("Foto"));
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

    public void editarFoto(int id, InputStream fotoPerfil){
        String sql="UPDATE gigacontrol.usuario SET FotoPerfil = ? where idUsuario = ?";

        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setBlob(1,fotoPerfil);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Error en la conexión!");
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

   /*public ArrayList<TipoDeIncidencia> busquedaTipoIncidencia(String nombre){

        String sql1 = "select * from tipoincidencia where nombre like ?";
        String sql2 = "select * from tipoincidencia";

        ArrayList<TipoDeIncidencia> listaFiltraTipoIncidencia = new ArrayList<>();

        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql1)){
            pstmt.setString(1,"%"+nombre+"%");

            try(ResultSet rs = pstmt.executeQuery();){
                while(rs.next()){
                    TipoDeIncidencia tipoDeIncidencia  = new TipoDeIncidencia();
                    tipoDeIncidencia.setIdTipoDeIncidencia(rs.getInt("idTipoIncidencia"));
                    tipoDeIncidencia.setNombre(rs.getString("nombreIncidencia"));

                    try (Connection connection2 = this.getConnection();
                         Statement stmt2 = connection2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                         ResultSet rs1 = stmt2.executeQuery(sql2);) {

                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    listaFiltraTipoIncidencia.add(tipoDeIncidencia);
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        return listaFiltraTipoIncidencia;
    }
    */


    /* public ArrayList<NivelDeUrgencia> busquedaNivelUrgencia(String nombre){

        String sql1 = "select * from nivelurgencia where nombre like ?";
        String sql2 = "select * from nivelurgencia";

        ArrayList<NivelDeUrgencia> listaFiltradaNivelUrgencia = new ArrayList<>();

        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql1);){
            pstmt.setString(1,"%"+nombre+"%");

            try(ResultSet rs = pstmt.executeQuery();){
                while(rs.next()){
                    NivelDeUrgencia nivelDeUrgencia = new NivelDeUrgencia();
                    nivelDeUrgencia.setIdNivelDeUrgencia(rs.getInt("idNivelUrgencia"));
                    nivelDeUrgencia.setNombre(rs.getString("nombreNivelUrgencia"));

                    try (Connection connection2 = this.getConnection();
                         Statement stmt2 = connection2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                         ResultSet rs1 = stmt2.executeQuery(sql2);) {

                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }

                    listaFiltradaNivelUrgencia.add(nivelDeUrgencia);
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return listaFiltradaNivelUrgencia;
    } */

    /*public ArrayList<Estado> busquedaPorEstado(String nombre){
        String sql = "select * from estado where nombre like ?";
        //String sql1 = "select * from estado";

        ArrayList<Estado> listaFiltradaEstado = new ArrayList<>();

        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);){
            pstmt.setString(1,"%"+nombre+"%");

            try(ResultSet rs = pstmt.executeQuery();){
                while(rs.next()){
                    Estado estado = new Estado();
                    estado.setIdEstado(rs.getInt("idEstado"));
                    estado.setNombre(rs.getString("nombreEstado"));

                    try (Connection connection2 = this.getConnection();
                         Statement stmt2 = connection2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                         ResultSet rs1 = stmt2.executeQuery(sql1);) {

                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    listaFiltradaEstado.add(estado);
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        return listaFiltradaEstado;
    }*/

    public ArrayList<Incidencia> busquedaPorEstado(int idEstado){
        String sql = "select * from incidencia where idEstado = ? ";

        ArrayList<Incidencia> listaFiltradaPorEstado = new ArrayList<>();

        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idEstado);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Incidencia incidencia = new Incidencia();
                    incidencia.setIdIncidencia(rs.getInt(1));
                    incidencia.setNombreDeIncidencia(rs.getString(2));
                    incidencia.setDescripcion(rs.getString(3));
                    incidencia.setZonaPucp(rs.getString(4));
                    incidencia.setUbicacion(rs.getString(5));
                    BUsuarios usuario = new BUsuarios();
                    for (BUsuarios usuar : usersDao.getUsersList()) {
                        if (usuar.getIdUsuario() == rs.getInt(7)) {
                            usuario.setIdUsuario(rs.getInt(7));
                            usuario.setNombre(usuar.getNombre());
                            usuario.setApellido(usuar.getApellido());
                            usuario.setCodigo(usuar.getCodigo());
                            usuario.setCategoria(usuar.getCategoria());
                            usuario.setCorreo(usuar.getCorreo());
                        }
                    }
                    incidencia.setUsuario(usuario);
                    TipoDeIncidencia tipoDeIncidencia = new TipoDeIncidencia();
                    for (TipoDeIncidencia tdi : daoDatosFijos.obtenerListaTipoDeIncidencias()) {
                        if (tdi.getIdTipoDeIncidencia() == rs.getInt(8)) {
                            tipoDeIncidencia.setIdTipoDeIncidencia(rs.getInt(8));
                            tipoDeIncidencia.setNombre(tdi.getNombre());
                        }
                    }
                    incidencia.setTipoDeIncidencia(tipoDeIncidencia);
                    NivelDeUrgencia nivelDeUrgencia = new NivelDeUrgencia();
                    for (NivelDeUrgencia nivelUrgencia : daoDatosFijos.obtenerListaNivelesDeUrgencia()) {
                        if (nivelUrgencia.getIdNivelDeUrgencia() == rs.getInt(9)) {
                            nivelDeUrgencia.setIdNivelDeUrgencia(rs.getInt(9));
                            nivelDeUrgencia.setNombre(nivelUrgencia.getNombre());
                        }
                    }
                    incidencia.setNivelDeUrgencia(nivelDeUrgencia);
                    Estado estado = new Estado();
                    estado.setIdEstado(idEstado);
                    for (Estado est : daoDatosFijos.obtenerListaEstados()) {
                        if (est.getIdEstado() == idEstado) {
                            estado.setNombre(est.getNombre());
                        }
                    }
                    incidencia.setEstado(estado);
                    listaFiltradaPorEstado.add(incidencia);

                }

            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaFiltradaPorEstado;
    }

    public ArrayList<Incidencia> busquedaPorNivelDeUrgencia(int idNivelDeUrgencia){
        String sql = "select * from incidencia where idNivelUrgencia = ? ";

        ArrayList<Incidencia> listaFiltradaPorNivelDeUrgencia = new ArrayList<>();

        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idNivelDeUrgencia);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Incidencia incidencia = new Incidencia();
                    incidencia.setIdIncidencia(rs.getInt(1));
                    incidencia.setNombreDeIncidencia(rs.getString(2));
                    incidencia.setDescripcion(rs.getString(3));
                    incidencia.setZonaPucp(rs.getString(4));
                    incidencia.setUbicacion(rs.getString(5));
                    BUsuarios usuario = new BUsuarios();
                    for (BUsuarios usuar : usersDao.getUsersList()) {
                        if (usuar.getIdUsuario() == rs.getInt(7)) {
                            usuario.setIdUsuario(rs.getInt(7));
                            usuario.setNombre(usuar.getNombre());
                            usuario.setApellido(usuar.getApellido());
                            usuario.setCodigo(usuar.getCodigo());
                            usuario.setCategoria(usuar.getCategoria());
                            usuario.setCorreo(usuar.getCorreo());
                        }
                    }
                    incidencia.setUsuario(usuario);
                    TipoDeIncidencia tipoDeIncidencia = new TipoDeIncidencia();
                    for (TipoDeIncidencia tdi : daoDatosFijos.obtenerListaTipoDeIncidencias()) {
                        if (tdi.getIdTipoDeIncidencia() == rs.getInt(8)) {
                            tipoDeIncidencia.setIdTipoDeIncidencia(rs.getInt(8));
                            tipoDeIncidencia.setNombre(tdi.getNombre());
                        }
                    }
                    incidencia.setTipoDeIncidencia(tipoDeIncidencia);
                    NivelDeUrgencia nivelDeUrgencia = new NivelDeUrgencia();
                    for (NivelDeUrgencia nivelUrgencia : daoDatosFijos.obtenerListaNivelesDeUrgencia()) {
                        if (nivelUrgencia.getIdNivelDeUrgencia() == rs.getInt(9)) {
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
                    listaFiltradaPorNivelDeUrgencia.add(incidencia);

                }

            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaFiltradaPorNivelDeUrgencia;
    }

    public ArrayList<Incidencia> busquedaPorTipoDeIncidencia(int idTipoDeIncidencia){
        String sql = "select * from incidencia where idTipoIncidencia = ? ";

        ArrayList<Incidencia> listaFiltradaPorTipoDeIncidencia = new ArrayList<>();

        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idTipoDeIncidencia);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Incidencia incidencia = new Incidencia();
                    incidencia.setIdIncidencia(rs.getInt(1));
                    incidencia.setNombreDeIncidencia(rs.getString(2));
                    incidencia.setDescripcion(rs.getString(3));
                    incidencia.setZonaPucp(rs.getString(4));
                    incidencia.setUbicacion(rs.getString(5));
                    BUsuarios usuario = new BUsuarios();
                    for (BUsuarios usuar : usersDao.getUsersList()) {
                        if (usuar.getIdUsuario() == rs.getInt(7)) {
                            usuario.setIdUsuario(rs.getInt(7));
                            usuario.setNombre(usuar.getNombre());
                            usuario.setApellido(usuar.getApellido());
                            usuario.setCodigo(usuar.getCodigo());
                            usuario.setCategoria(usuar.getCategoria());
                            usuario.setCorreo(usuar.getCorreo());
                        }
                    }
                    incidencia.setUsuario(usuario);
                    TipoDeIncidencia tipoDeIncidencia = new TipoDeIncidencia();
                    tipoDeIncidencia.setIdTipoDeIncidencia(idTipoDeIncidencia);
                    for (TipoDeIncidencia tdi : daoDatosFijos.obtenerListaTipoDeIncidencias()) {
                        if (tdi.getIdTipoDeIncidencia() == idTipoDeIncidencia) {
                            tipoDeIncidencia.setNombre(tdi.getNombre());
                        }
                    }
                    incidencia.setTipoDeIncidencia(tipoDeIncidencia);

                    NivelDeUrgencia nivelDeUrgencia = new NivelDeUrgencia();
                    for (NivelDeUrgencia nivelUrgencia : daoDatosFijos.obtenerListaNivelesDeUrgencia()) {
                        if (nivelUrgencia.getIdNivelDeUrgencia() == rs.getInt(9)) {
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
                    listaFiltradaPorTipoDeIncidencia.add(incidencia);

                }

            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaFiltradaPorTipoDeIncidencia;
    }
}


