package com.example.gigacontrol_g2.mailcorreo;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.File;
import java.util.Properties;

//NO BORRAR AUN

public class MyEmail {

    public static void main(String[] args) throws Exception{
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", true);
        properties.put("mail.smtp.host","smtp.gmail.com");
        properties.put("mail.smtp.port", 587);
        properties.put("mail.smtp.starttls.enable",true);
        properties.put("mail.transport.protocol", "smtp");

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication("serviciocorreogigacontrol@gmail.com","hlbldqnwfvsxasdv");
            }
        });
        Message message = new MimeMessage(session);
        message.setSubject("Correo PRUEBA");
        message.setContent("<h1>Giga control Mensaje</h1>","text/html");

        Address addressTo = new InternetAddress("anaissalvadorrodriguez@gmail.com");
        message.setRecipient(Message.RecipientType.TO, addressTo);

        MimeMultipart multipart = new MimeMultipart();

        MimeBodyPart attachment = new MimeBodyPart();
        attachment.attachFile(new File("archivo_prueba/Descarga.pdf"));
        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent("<h1>Giga control Mensaje 2</h1>","text/html");

        multipart.addBodyPart(messageBodyPart);
        multipart.addBodyPart(attachment);

        message.setContent(multipart);
        Transport.send(message);

    }

}
