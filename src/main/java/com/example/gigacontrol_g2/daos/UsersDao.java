package com.example.gigacontrol_g2.daos;

import com.example.gigacontrol_g2.beans.*;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.ArrayList;

public class UsersDao extends BaseDao{
    public ArrayList<BUsuarios> getUsersList() {
        ArrayList<BUsuarios> usersList = new ArrayList<>();
        String sql = "select * from usuario";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {



            while (resultSet.next()) {
                BUsuarios newUser = new BUsuarios();
                newUser.setIdUsuario(resultSet.getInt(1));
                newUser.setNombre(resultSet.getString(2));
                newUser.setApellido(resultSet.getString(3));
                newUser.setCorreo(resultSet.getString(4));
                //newUser.setContrasena(resultSet.getString(5));
                newUser.setCodigo(resultSet.getString(5));
                newUser.setDni(resultSet.getString(6));
                newUser.setCelular(resultSet.getString(7));
                newUser.setCategoria(resultSet.getString(8));
                newUser.setRolId(resultSet.getInt(10));

                usersList.add(newUser);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usersList;
    }
    public ArrayList<Incidencia> obtenerListaDeIncidencias(){
        ArrayList<Incidencia> listaDeIncidencias= new ArrayList<>();

        String sql = "select  * from incidencia";

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
                incidencia.setFoto(rs.getBinaryStream(6));
                UsersDao userDao = new UsersDao();
                BUsuarios usuario = new BUsuarios();
                for (BUsuarios usuar : userDao.getUsersList()){
                    if(usuar.getIdUsuario()==rs.getInt(7)){
                        usuario.setIdUsuario(rs.getInt(7));
                        usuario.setRolId(rs.getInt(7));
                        usuario.setNombre(usuar.getNombre());
                        usuario.setApellido(usuar.getApellido());
                        usuario.setCodigo(usuar.getCodigo());
                        usuario.setCategoria(usuar.getCategoria());
                    }
                }
                incidencia.setUsuario(usuario);

                listaDeIncidencias.add(incidencia);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaDeIncidencias;
    }

    public ArrayList<Incidencia> obtenerIncidenciasDestacadas(int idUsuario){
        ArrayList<Incidencia> listaDeMisIncidencias = new ArrayList<>();

        String sql = "select i.NombreDeIncidencia, u.Nombre, u.Apellido, t.nombre, e.nombre from destacarincidencia\n" +
                "    inner join incidencia i on destacarincidencia.idIncidencia = i.idIncidencia\n" +
                "    inner join usuario u on destacarincidencia.idUsuario = u.idUsuario\n" +
                "    inner join estado e on i.idEstado = e.idEstado\n" +
                "    inner join tipoincidencia t on i.idTipoIncidencia = t.idTipoIncidencia\n" +
                "    where destacarincidencia.idUsuario=?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)){
             stmt.setInt(1,idUsuario);
             try(ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    BUsuarios usuario = new BUsuarios();
                    Incidencia incidencia = new Incidencia();
                    TipoDeIncidencia tipoIncidencia = new TipoDeIncidencia();
                    Estado estadoIncidencia = new Estado();
                    //incidencia.setIdIncidencia(rs.getInt(1));
                    incidencia.setNombreDeIncidencia(rs.getString(1));
                    incidencia.setUsuario(usuario);
                    usuario.setNombre(rs.getString(2));
                    usuario.setApellido(rs.getString(3));
                    tipoIncidencia.setNombre(rs.getString(4));
                    incidencia.setTipoDeIncidencia(tipoIncidencia);
                    estadoIncidencia.setNombre(rs.getString(5));
                    incidencia.setEstado(estadoIncidencia);
                    listaDeMisIncidencias.add(incidencia);
                }
             }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaDeMisIncidencias;
    }

    public ArrayList<Incidencia> obtenerIncidenciasDelUsuario(int idUsuario){
        ArrayList<Incidencia> listaDeMisIncidencias = new ArrayList<>();

        String sql = "select i.idIncidencia, i.NombreDeIncidencia, t.nombre, e.nombre from incidencia i\n" +
                "inner join estado e on i.idEstado = e.idEstado\n" +
                "inner join tipoincidencia t on i.idTipoIncidencia = t.idTipoIncidencia\n" +
                "inner join usuario u on i.idUsuario = u.idUsuario where u.idUsuario =?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)){
             stmt.setInt(1,idUsuario);
             try(ResultSet rs = stmt.executeQuery()){

                while (rs.next()) {
                    BUsuarios usuario = new BUsuarios();
                    Incidencia incidencia = new Incidencia();
                    TipoDeIncidencia tipoIncidencia = new TipoDeIncidencia();
                    Estado estadoIncidencia = new Estado();
                    //  incidencia.setIdIncidencia(rs.getInt(1));
                    incidencia.setNombreDeIncidencia(rs.getString(2));
                    incidencia.setTipoDeIncidencia(tipoIncidencia);
                    tipoIncidencia.setNombre(rs.getString(3));
                    estadoIncidencia.setNombre(rs.getString(4));
                    incidencia.setEstado(estadoIncidencia);

                    listaDeMisIncidencias.add(incidencia);
                }
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaDeMisIncidencias;
    }
    public ArrayList<Incidencia> BuscarIncidencia(String incidenciaFiltr){
        DaoDatosFijos daoDatosFijos = new DaoDatosFijos();
        SeguridadDao seguridadDao = new SeguridadDao();
        String sql = "select * from incidencia where NombreDeIncidencia like ?";
        ArrayList<Incidencia> listaFiltrada = new ArrayList<>();

        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);){
            pstmt.setString(1,"%"+incidenciaFiltr+"%");
            try(ResultSet rs = pstmt.executeQuery();){
                while(rs.next()){
                    Incidencia incidencia = new Incidencia();
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
                    listaFiltrada.add(incidencia);
                }}
        }catch (SQLException e){
            e.printStackTrace();
        }
        return listaFiltrada;
    }

    public BUsuarios buscarPorId(String userID) {
        BUsuarios user = null;

        String sql = "select * from usuario WHERE idUsuario = ? ";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            System.out.println("entro a buscar");

            pstmt.setString(1, userID);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new BUsuarios();
                    user.setIdUsuario(rs.getInt(1));
                    user.setNombre(rs.getString(2));
                    user.setApellido(rs.getString(3));
                    user.setCorreo(rs.getString(4));
                    user.setCodigo(rs.getString(6));
                    user.setDni(rs.getString(7));
                    user.setCelular(rs.getString(8));
                    user.setCategoria(rs.getString(9));
                    user.setRolId(rs.getInt(11));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    /*public BUsuarios buscarPorId(String userID) {
        BUsuarios user = null;

        String sql = "select * from usuario WHERE idUsuario = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            System.out.println("entro a buscar");

            pstmt.setString(1, userID);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new BUsuarios();
                    user.setIdUsuario(rs.getInt(1));
                    user.setNombre(rs.getString(2));
                    user.setApellido(rs.getString(3));
                    user.setCorreo(rs.getString(4));
                    user.setCodigo(rs.getString(6));
                    user.setDni(rs.getString(7));
                    user.setCelular(rs.getString(8));
                    user.setCategoria(rs.getString(9));
                    user.setRolId(rs.getInt(11));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }*/

    /*public BUsuarios generarUsuarioSeg(String correoPUCPSeg , String codigoPUCPSeg ) {

        BUsuarios usuarSeg = null;

        String sql = "select * from usuario WHERE Correo = ? and Codigo = ? ";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, correoPUCPSeg);
            pstmt.setString(2, codigoPUCPSeg);


            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuarSeg = new BUsuarios();
                    usuarSeg.setIdUsuario(rs.getInt(1));
                    usuarSeg.setNombre(rs.getString(2));
                    usuarSeg.setApellido(rs.getString(3));
                    usuarSeg.setCorreo(rs.getString(4));
                    user.setCodigo(rs.getString(6));
                    user.setDni(rs.getString(7));
                    user.setCelular(rs.getString(8));
                    user.setCategoria(rs.getString(9));
                    user.setRolId(rs.getInt(11));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuarSeg;
    }*/
    public void actualizar(int userID, String nombre, String apellido, String DNI, String codigo, String correo, String categoria, int rolID) {

        String sql = "UPDATE usuario SET Nombre = ?, Apellido = ?, Correo = ?, Codigo = ?, DNI = ?, Categoria = ?, ROl_idRol = ? WHERE idUsuario = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            System.out.println(nombre);
            pstmt.setString(1,nombre);
            pstmt.setString(2,apellido);
            pstmt.setString(3,correo);
            pstmt.setString(4,codigo);
            pstmt.setString(5,DNI);
            pstmt.setString(6,categoria);
            pstmt.setInt(7,rolID);
            pstmt.setInt(8,userID);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void guardar(BUsuarios user) {

        String sql = "INSERT INTO usuario (Nombre,Apellido,Correo,Codigo,DNI,Celular,Categoria,Rol_idRol,Contrasenia) VALUES (?,?,?,?,?,?,?,?,sha2(?,256))";

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
                    pstmt.setString(7,"Administrativo");
                    break;
            }
            pstmt.setInt(8,user.getRolId());
            pstmt.setString(9,user.getContrasena());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void borrar(String userID) {

        String sql = "DELETE FROM usuario WHERE idUsuario = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, userID);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public BUsuarios obtenerUsuario(int idUsuario) {

        BUsuarios usuario = null;

        String sql = "select * from usuario WHERE idUsuario = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new BUsuarios();
                    usuario.setIdUsuario(idUsuario);
                    usuario.setNombre(rs.getString(2));
                    usuario.setApellido(rs.getString(3));
                    usuario.setCodigo(rs.getString(6));
                    usuario.setCategoria(rs.getString(9));
                    usuario.setRolId(rs.getInt(11));
                    //se podria tambien agregar una columna de facultad en la tabla usuario
                    //debido a la vista del perfil de usuario pucp
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuario;
    }


    public ArrayList<BUsuarios> buscarPorApellido(String apellido) {

        ArrayList<BUsuarios> lista = new ArrayList<>();
        String sql = "select * from usuario where lower(apellido) = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, apellido);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    BUsuarios usuario = new BUsuarios();
                    usuario.setIdUsuario(rs.getInt(1));
                    usuario.setNombre(rs.getString(2));
                    usuario.setApellido(rs.getString(3));
                    usuario.setCategoria(rs.getString("Categoria"));
                    usuario.setCodigo(rs.getString("Codigo"));
                    lista.add(usuario);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }


    public String contar() {

        String nro_filas_total = null;
        String sql = "select count(*) from usuario";
        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            if(rs.next()){
                nro_filas_total = rs.getString(1);
            }



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return nro_filas_total;
    }



    public String contarxApellido(String apellido) {

        String nro_filas_total_busqueda_apellido = null;
        String sql = "select count(*) as conteo from usuario where lower(apellido) = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, apellido);


            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    nro_filas_total_busqueda_apellido = rs.getString("conteo");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return nro_filas_total_busqueda_apellido;
    }

    public void destacarEstrella(int idu, int idi){
        String sql = "INSERT INTO destacarincidencia VALUES (?,?)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setInt(1, idu);
            pstmt.setInt(2, idi);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void eliminarDestacado(int idu, int idi){
        String sql = "delete from destacarincidencia where (idUsuario=? and idIncidencia=?)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setInt(1, idu);
            pstmt.setInt(2, idi);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public ArrayList<Integer> incidenciasDestacadas(int idUsuario) {
        ArrayList<Integer> listaidincidencias = new ArrayList<>();
        listaidincidencias.add(0);
        String sql = "select idIncidencia from destacarincidencia where idUsuario = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    listaidincidencias.add(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaidincidencias;
    }











}

