package br.csi.model;

import java.sql.Date;

public class Email {

    private int id_email;
    private int id_remetente;
    private int id_destinatario;
    private String assunto;
    private String Mensagem;
    private Date data;

    public int getId_email() {
        return id_email;
    }
    public void setId_email(int id_email) {
        this.id_email = id_email;
    }
    public int getId_remetente() {
        return id_remetente;
    }
    public void setId_remetente(int id_remetente) {
        this.id_remetente = id_remetente;
    }
    public int getId_destinatario() {
        return id_destinatario;
    }
    public void setId_destinatario(int id_destinatario) {
        this.id_destinatario = id_destinatario;
    }
    public String getAssunto() {
        return assunto;
    }
    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }
    public String getMensagem() {
        return Mensagem;
    }
    public void setMensagem(String mensagem) {
        Mensagem = mensagem;
    }
    public Date getData() {
        return data;
    }
    public void setData(Date data) {
        this.data = data;
    }


}