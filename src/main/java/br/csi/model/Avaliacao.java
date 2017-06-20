package br.csi.model;

/**
 * Created by anakin on 20/06/17.
 */
public class Avaliacao {
    private int idavaliacao;
    private int idusuatrib;
    private int idusurec;
    private float nota;

    public int getIdavaliacao() {
        return idavaliacao;
    }

    public void setIdavaliacao(int idavaliacao) {
        this.idavaliacao = idavaliacao;
    }

    public int getIdusuatrib() {
        return idusuatrib;
    }

    public void setIdusuatrib(int idusuatrib) {
        this.idusuatrib = idusuatrib;
    }

    public int getIdusurec() {
        return idusurec;
    }

    public void setIdusurec(int idusurec) {
        this.idusurec = idusurec;
    }

    public float getNota() {
        return nota;
    }

    public void setNota(float nota) {
        this.nota = nota;
    }
}
