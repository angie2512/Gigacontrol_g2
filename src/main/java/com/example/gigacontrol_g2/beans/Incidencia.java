package com.example.gigacontrol_g2.beans;

import java.io.InputStream;

public class Incidencia {
    private int idIncidencia;
    private String nombreDeIncidencia;
    private String descripcion;
    private String zonaPucp;
    private String ubicacion;

    private InputStream foto;
    private BUsuarios usuario;
    private TipoDeIncidencia tipoDeIncidencia;
    private NivelDeUrgencia nivelDeUrgencia;

    private Estado estado;

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

    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }




    public BUsuarios getUsuario() {
        return usuario;
    }

    public void setUsuario(BUsuarios usuario) {
        this.usuario = usuario;
    }

    public TipoDeIncidencia getTipoDeIncidencia() {
        return tipoDeIncidencia;
    }

    public void setTipoDeIncidencia(TipoDeIncidencia tipoDeIncidencia) {
        this.tipoDeIncidencia = tipoDeIncidencia;
    }

    public NivelDeUrgencia getNivelDeUrgencia() {
        return nivelDeUrgencia;
    }

    public void setNivelDeUrgencia(NivelDeUrgencia nivelDeUrgencia) {
        this.nivelDeUrgencia = nivelDeUrgencia;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }
}
