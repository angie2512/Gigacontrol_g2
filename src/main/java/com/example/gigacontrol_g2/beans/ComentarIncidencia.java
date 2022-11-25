package com.example.gigacontrol_g2.beans;

import javax.print.attribute.DateTimeSyntax;
import java.sql.Timestamp;

public class ComentarIncidencia {
    private int idComentario;
    private int idUsuario;
    private int idIncidencia;
    private String ComentarioIncidencia;
    private java.sql.Timestamp fechaDeComentario;
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


    public String getComentarioIncidencia() {
        return ComentarioIncidencia;
    }

    public void setComentarioIncidencia(String comentarioIncidencia) {
        ComentarioIncidencia = comentarioIncidencia;
    }

    public Timestamp getFechaDeComentario() {
        return fechaDeComentario;
    }

    public void setFechaDeComentario(Timestamp fechaDeComentario) {
        this.fechaDeComentario = fechaDeComentario;
    }
}
