package br.csi.util;



import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Mail {

    private String mailSMTPServer;
    private String mailSMTPServerPort;
    private String mailSenha;

    public boolean enviarEmail(String from, String to, String subject, String message){
        System.out.println("entrando no enviar email (MAIL)");
        System.out.println(from);
        System.out.println(to);
        System.out.println(subject);
        System.out.println(message);

        boolean enviado;
        Properties props =  new Properties();

        mailSMTPServer = "smtp.gmail.com";
        mailSMTPServerPort = "465";
        mailSenha = "projetolaboratorio";

        props.put("mail.transport.protocol", "smtp"); //define protocolo de envio
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", mailSMTPServer); //server smtp do gmail
        props.put("mail.smtp.auth", "true"); //ativa autenticacao
        props.put("mail.smtp.user", from); //conta que ta enviando o email
        props.put("mail.debug", "true");
        props.put("mail.smtp.port", mailSMTPServerPort); //porta
        props.put("mail.smtp.socketFactory.port", mailSMTPServerPort); //mesma porta
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");
        props.put("mail.mime.charset", "TYPE_TEXT_HTML");

        SimpleAuth auth =  null;
        auth = new SimpleAuth(from,mailSenha);

        Session session = Session.getDefaultInstance(props, auth);
        session.setDebug(true);

        Message msg = new MimeMessage(session);

        try{
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            msg.setFrom(new InternetAddress(from));
            msg.setSubject(subject);
            msg.setText(message);
            enviado = true;
        }catch(Exception e){
            System.out.println("------------------Erro: Completar mensagem");
            enviado = false;
        }

        Transport tr;
        try{
            tr = session.getTransport("smtp");
            tr.connect(mailSMTPServer, from, mailSenha);
            msg.saveChanges();
            tr.sendMessage(msg, msg.getAllRecipients());
            tr.close();
        }catch(Exception e){
            System.out.println("-----------------Erro: Envio da mensagem " + e);
        }

        return enviado;
    }
}

class SimpleAuth extends Authenticator{

    public String username = null;
    public String password = null;

    public SimpleAuth(String user, String pwd){
        username = user;
        password = pwd;
    }

    @Override
    protected PasswordAuthentication getPasswordAuthentication(){
        return new PasswordAuthentication (username, password);
    }

}

