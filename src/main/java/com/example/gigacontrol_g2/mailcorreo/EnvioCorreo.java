package com.example.gigacontrol_g2.mailcorreo;

import com.example.gigacontrol_g2.beans.BUsuarios;
import com.example.gigacontrol_g2.beans.Incidencia;

import java.util.Properties;
import java.util.Random;
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

    //Avance de Doble Autenticacion Seguridad

    public int generarCodigoDeAutenticacion(){
        int codigo = 1;
        while(true){
            Random r=new Random();
            codigo=r.nextInt();
            int cantidad=(int)Math.abs(Math.log10(codigo)+1);

            if(cantidad<8) codigo=r.nextInt();
            else if(cantidad>8) codigo=r.nextInt();
            else{
                System.out.println(codigo);
                {break;}
            }
        }
        return codigo;
    }

    //Avance de Doble Autenticacion Seguridad
    public void enviarCodigoDeAutenticacion(int codigoAutenticacion,String correoDeDestino){
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
            String asunto="GIGACONTROL: CÓDIGO DE AUTENTICACIÓN PARA INICIO DE SESIÓN - SEGURIDAD";
            String mensajeDeTexto="Estimado Usuario Seguridad de GIGACONTROL: \n" +
                    "\n" +
                    "Su Código de Autenticación para su Inicio de Sesion es: "+codigoAutenticacion;
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
            String asunto="SE ACTUALIZÓ EL ESTADO DE SU INCIDENCIA :"+ incidencia.getNombreDeIncidencia()+" ";
            String mensajeDeTexto="Estimado Usuario PUCP de GIGACONTROL: "+ incidencia.getUsuario().getNombre()+" "+incidencia.getUsuario().getApellido()+" \n" +
                                  "\n" +
                                  "Su Incidencia de Nombre: "+ incidencia.getNombreDeIncidencia()+" \n" +
                                  "Con Descripción: " +incidencia.getDescripcion()+" \n" +
                                  "\n" +
                                  "Actualizó su Estado de (Registrado) a (Atendido) \n" +
                                  "\n" +
                                  "Puede Visualizar la Resolución (Comentario) emitido por el Personal de Seguridad ,Ingresando a su Incidencia en su lista de (MisIncidencias) \n" +
                                  "\n" +
                                  "Si considera que No se ha Resuelto la Incidencia podrá también Añadir un Comentario de Respuesta a la Resolución del Personal de Seguridad , (Dentro de Su Incidencia) \n" +
                                  "Caso Contrario: Puede Dar Click al Botón: (Aceptar Resolución) \n" +
                                  "\n" +
                                  "NOTA: RECUERDE QUE PUEDE ENTRAR A SU INCIDENCIA EN UN MÁXIMO DE 5 VECES \n" +
                                  "POR LO CUAL PUEDE HACER 5 COMENTARIOS MAXIMO POR INCIDENCIA , PARA RESPONDER AL PERSONAL DE SEGURIDAD \n" +
                                  "PASADO ESE NUMERO , NO PODRÁ INGRESAR A SU INCIDENCIA PARA AÑADIR MÁS COMENTARIOS PERO SE LE NOTIFICARÁ DE IGUAL FORMA A SU CORREO CUANDO EL ESTADO DE SU INCIDENCIA PASE A (RESUELTO) \n" +
                                  "\n" +
                                  "Saludos";
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