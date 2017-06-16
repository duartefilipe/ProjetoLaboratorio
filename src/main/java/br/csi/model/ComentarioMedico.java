package br.csi.model;

public class ComentarioMedico {

	private int idcomentarioforummedico;
	private int idusuario;
	private String titulocomentario;
	private String textocomentario;
	private String comentarioforummedico;
	private int idpostforummedico;

	public int getIdcomentarioforummedico() {
		return idcomentarioforummedico;
	}

	public void setIdcomentarioforummedico(int idcomentarioforummedico) {
		this.idcomentarioforummedico = idcomentarioforummedico;
	}

	public int getIdusuario() {
		return idusuario;
	}

	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
	}

	public String getTitulocomentario() {
		return titulocomentario;
	}

	public void setTitulocomentario(String titulocomentario) {
		this.titulocomentario = titulocomentario;
	}

	public String getTextocomentario() {
		return textocomentario;
	}

	public void setTextocomentario(String textocomentario) {
		this.textocomentario = textocomentario;
	}

	public String getComentarioforummedico() {
		return comentarioforummedico;
	}

	public void setComentarioforummedico(String comentarioforummedico) {
		this.comentarioforummedico = comentarioforummedico;
	}

	public int getIdpostforummedico() {
		return idpostforummedico;
	}

	public void setIdpostforummedico(int idpostforummedico) {
		this.idpostforummedico = idpostforummedico;
	}
}


