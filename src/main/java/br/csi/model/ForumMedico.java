package br.csi.model;

public class ForumMedico {
	private int id;
	private int idusuario;
	private String textoForum;
	private String tituloForum;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdusuario() {
		return idusuario;
	}

	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
	}

	public String getTextoForum() {
		return textoForum;
	}

	public void setTextoForum(String textoForum) {
		this.textoForum = textoForum;
	}

	public String getTituloForum() {
		return tituloForum;
	}

	public void setTituloForum(String tituloForum) {
		this.tituloForum = tituloForum;
	}
}
