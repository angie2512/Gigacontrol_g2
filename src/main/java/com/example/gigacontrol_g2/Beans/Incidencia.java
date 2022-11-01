package com.example.gigacontrol_g2.Beans;

public class Incidencia {
    private int idIncidencia;
    private String nombreDeIncidencia;
    private String descripcion;
    private String zonaPucp;
    private String ubicacion;
    private String foto;
    private int idUsuario;
    private int idTipoIncidencia;
    private int idNivelUrgencia;

    public int getIdIncidencia() {
        return idIncidencia;
    }

    public void setIdIncidencia(int idIncidencia) {
        this.idIncidencia = idIncidencia;
    }

    public String getNombreDeIncidencia() {
        return nombreDeIncidencia;
    }

    public void setNombreDeIncidencia(String nombreDeIncidencia) {
        this.nombreDeIncidencia = nombreDeIncidencia;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getZonaPucp() {
        return zonaPucp;
    }

    public void setZonaPucp(String zonaPucp) {
        this.zonaPucp = zonaPucp;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdTipoIncidencia() {
        return idTipoIncidencia;
    }

    public void setIdTipoIncidencia(int idTipoIncidencia) {
        this.idTipoIncidencia = idTipoIncidencia;
    }

    public int getIdNivelUrgencia() {
        return idNivelUrgencia;
    }

    public void setIdNivelUrgencia(int idNivelUrgencia) {
        this.idNivelUrgencia = idNivelUrgencia;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }

    private int idEstado;
}
