package com.example.gigacontrol_g2.mailcorreo;

import com.example.gigacontrol_g2.beans.Incidencia;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

public class EnvioCorreo {

    private String correoDeOrigen="serviciocorreogigacontrol@gmail.com";
    private String contraseña16Digitos="hlbldqnwfvsxasdv";

    public void correoActualizacionEstadoDeIncidencia(Incidencia incidencia, String correoDeDestino){
        try{
            Properties p = new Properties();
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.setProperty("mail.smtp.starttls.enable", "true");
            p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
            p.setProperty("mail.smtp.port", "587");
            p.setProperty("mail.smtp.user",correoDeOrigen);
            p.setProperty("mail.smtp.auth", "true");
            Session s = Session.getDefaultInstance(p);
            MimeMessage mensaje = new MimeMessage(s);
            mensaje.setFrom(new InternetAddress(correoDeOrigen));
            mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(correoDeDestino));
            String asunto=" SE ACTUALIZO DE ESTADO SU INCIDENCIA "+incidencia.getNombreDeIncidencia()+" ";
            String mensajeDeTexto=" Se actualizo de Regitrado a Atendido";
            mensaje.setSubject(asunto);
            mensaje.setText(mensajeDeTexto);

            Transport t = s.getTransport("smtp");
            t.connect(correoDeOrigen,contraseña16Digitos);
            t.sendMessage(mensaje, mensaje.getAllRecipients());
            t.close();
            //JOptionPane.showMessageDialog(null,"Mensaje enviado");
        } catch (MessagingException e) {

        }
    }
}