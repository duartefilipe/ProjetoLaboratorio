package br.csi.model;

public class Favorito {
    private int idfavorito;
    private int idusuario1;
    private int idusuario2;
    private String nome;
    private String sobrenome;
    private String tipo;
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIdfavorito() {
        return idfavorito;
    }

    public void setIdfavorito(int idfavorito) {
        this.idfavorito = idfavorito;
    }

    public int getIdusuario1() {
        return idusuario1;
    }

    public void setIdusuario1(int idusuario1) {
        this.idusuario1 = idusuario1;
    }

    public int getIdusuario2() {
        return idusuario2;
    }

    public void setIdusuario2(int idusuario2) {
        this.idusuario2 = idusuario2;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
