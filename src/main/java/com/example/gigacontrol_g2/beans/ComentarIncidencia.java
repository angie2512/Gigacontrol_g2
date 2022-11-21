package com.example.gigacontrol_g2.beans;

public class ComentarIncidencia {

    public int getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(int idComentario) {

        this.idComentario = idComentario;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdIncidencia() {
        return idIncidencia;
    }

    public void setIdIncidencia(int idIncidencia) {
        this.idIncidencia = idIncidencia;
    }


    private int idComentario;
    private int idUsuario;
    private int idIncidencia;
    private String ComentarioIncidencia;

    public String getComentarioIncidencia() {
        return ComentarioIncidencia;
    }

    public void setComentarioIncidencia(String comentarioIncidencia) {
        ComentarioIncidencia = comentarioIncidencia;
    }
}
