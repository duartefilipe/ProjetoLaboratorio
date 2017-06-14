package br.csi.model;

/**
 * Created by anakin on 28/05/17.
 */
public class Mural {

    private int idMural;
    private String nome;
    private String titulo;
    private String texto;
    private String email;
    private int idUsuario;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public int getIdMural() {
        return idMural;
    }

    public void setIdMural(int idMural) {
        this.idMural = idMural;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
}
