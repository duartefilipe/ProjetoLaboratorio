package br.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.csi.model.ComentarioMedico;
import br.csi.model.ForumMedico;
import br.csi.util.Connect;

public class ForumMedicoDao {

	public boolean CadastrarForumMedico(ForumMedico fm) throws SQLException {
		Connection c = null;
		PreparedStatement stmt = null;
		boolean retorno = false;
		System.out.println("entrou no cadastrar posts forum");
		System.out.println("id do usuario: "+fm.getIdusuario());
		System.out.println("titulo do post do usuario: "+fm.getIdusuario());
		System.out.println("texto do post do usuario: "+fm.getIdusuario());

		try {
			c = Connect.getConexao();
			String sql="INSERT INTO forummedico (idusuario, titulo, texto, tipo) values(?,?,?,?)";
			stmt = c.prepareStatement(sql);
			stmt.setInt(1, fm.getIdusuario());
			stmt.setString(2, fm.getTituloForum());
			stmt.setString(3,fm.getTextoForum());
			stmt.setString(4, fm.getTipo());
			stmt.execute();
			stmt.close();
			retorno = true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return retorno;
		}
		return retorno;
	}



	public boolean CadastrarComentForumMedico(ComentarioMedico cm) throws SQLException {
		Connection c = null;
		PreparedStatement stmt = null;
		boolean retorno = false;
		System.out.println("no cadastra comentario medico");

		try {
			c = Connect.getConexao();
			String sql="insert into comentarioforummedico (comentario, idpostforummedico, idusuario) values (?, ?, ?)";
			stmt = c.prepareStatement(sql);

			stmt.setString(1, cm.getComentarioforummedico());
			System.out.println("comentario que vai cadastrar: "+cm.getComentarioforummedico());
			stmt.setInt(2, cm.getIdpostforummedico());
			System.out.println("idpostforummedico que vai cadastrar: "+cm.getIdpostforummedico());
			stmt.setInt(3, cm.getIdusuario());
			System.out.println("idusuario que vai cadastrar: "+cm.getIdusuario());

			stmt.execute();
			stmt.close();
			retorno = true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return retorno;
		}
		return retorno;
	}

	public ArrayList<ForumMedico> getPostsForumMedico() throws ClassNotFoundException {

		ArrayList<ForumMedico> logposts = new ArrayList<ForumMedico>();
		Connection con = Connect.getConexao();
		ForumMedico fm = null;

		try {
			String sql = "SELECT * FROM forummedico where tipo = 'medico' ORDER BY idforummedico DESC";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				fm = new ForumMedico();
				fm.setId(rs.getInt("idforummedico"));
				fm.setIdusuario(rs.getInt("idusuario"));
				fm.setTituloForum(rs.getString("titulo"));
				fm.setTextoForum(rs.getString("texto"));
				logposts.add(fm);
				System.out.println("id do Post no forum do medico = " + fm.getId());
				System.out.println("id do usuario do Post no forum do medico = " + fm.getIdusuario());
				System.out.println("titulo do Post no forum do medico = " + fm.getTituloForum());
				System.out.println("texto do Post no forum do medico = " + fm.getTextoForum());

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return logposts;
	}

	public ArrayList<ForumMedico> getPostsForumGeral() throws ClassNotFoundException {

		ArrayList<ForumMedico> logpostsgeral = new ArrayList<ForumMedico>();
		Connection con = Connect.getConexao();
		ForumMedico fm = null;

		try {
			String sql = "SELECT * FROM forummedico where tipo = 'usuario' ORDER BY idforummedico DESC";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				fm = new ForumMedico();
				fm.setId(rs.getInt("idforummedico"));
				fm.setIdusuario(rs.getInt("idusuario"));
				fm.setTituloForum(rs.getString("titulo"));
				fm.setTextoForum(rs.getString("texto"));
				logpostsgeral.add(fm);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return logpostsgeral;
	}

	public ArrayList<ComentarioMedico> getPostsForum2(int id) throws ClassNotFoundException {
		//mostra os comentarios dos posts
		ArrayList<ComentarioMedico> logpostsforum2 = new ArrayList<ComentarioMedico>();
		Connection con = Connect.getConexao();
		ComentarioMedico cfm = null;

		try {
			//String sql = "SELECT * FROM comentarioforummedico where comentarioforummedico = '"+id+"' ORDER BY idpostforummedico DESC ";
			String sql = "select idpostforummedico, idcomentarioforummedico, usuario.idusuario as idusuario, titulo, texto, comentario \n" +
					"\tfrom comentarioforummedico, usuario, forummedico \n" +
					"\t\twhere comentarioforummedico.idusuario = usuario.idusuario\n" +
					"        \tand comentarioforummedico.idpostforummedico = forummedico.idforummedico\n" +
					"\t\t\tand idforummedico = '"+id+"' ORDER BY idcomentarioforummedico DESC";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			System.out.println("aqui no array comentarios: "+id);

			while (rs.next()) {
				cfm = new ComentarioMedico();
				cfm.setIdpostforummedico(rs.getInt("idpostforummedico"));
				System.out.println("id do post do forum do medico: " +cfm.getIdpostforummedico());

				cfm.setIdcomentarioforummedico(rs.getInt("idcomentarioforummedico"));
				System.out.println("id do comentario do post do forum: " +cfm.getComentarioforummedico());

				cfm.setIdusuario(rs.getInt("idusuario"));
				System.out.println("id do usuario que comentou: "+cfm.getIdusuario());

				cfm.setTitulocomentario(rs.getString("titulo"));
				System.out.println("titulo do post comentado: "+cfm.getTitulocomentario());

				cfm.setTextocomentario(rs.getString("texto"));
				System.out.println("texto do post comentado: "+cfm.getTextocomentario());

				cfm.setComentarioforummedico(rs.getString("comentario"));
				System.out.println("comentario no array list: "+cfm.getComentarioforummedico());

				logpostsforum2.add(cfm);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return logpostsforum2;
	}

	public ArrayList<ForumMedico> getPostsForumMedico4(int id) throws ClassNotFoundException {

		ArrayList<ForumMedico> logforummed = new ArrayList<ForumMedico>();
		Connection con = Connect.getConexao();
		ForumMedico fm = null;

		try {
			String sql = "SELECT * FROM forummedico where idusuario = '"+id+"' and tipo = 'medico' ORDER BY idforummedico DESC ";

			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				fm = new ForumMedico();
				fm.setId(rs.getInt("idforummedico"));
				fm.setIdusuario(rs.getInt("idUsuario"));
				fm.setTituloForum(rs.getString("titulo"));
				fm.setTextoForum(rs.getString("texto"));
				logforummed.add(fm);


			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return logforummed;
	}

	public ArrayList<ForumMedico> getPostsForumMedicoGeral(int id) throws ClassNotFoundException {

		ArrayList<ForumMedico> logforummedGeral = new ArrayList<ForumMedico>();
		Connection con = Connect.getConexao();
		ForumMedico fm = null;

		try {
			String sql = "SELECT * FROM forummedico where idusuario = '"+id+"' and tipo = 'usuario' ORDER BY idforummedico DESC ";

			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				fm = new ForumMedico();
				fm.setId(rs.getInt("idforummedico"));
				fm.setIdusuario(rs.getInt("idUsuario"));
				fm.setTituloForum(rs.getString("titulo"));
				fm.setTextoForum(rs.getString("texto"));
				logforummedGeral.add(fm);


			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return logforummedGeral;
	}

	public ArrayList<ForumMedico> getPostsForumUsuario5(int id) throws ClassNotFoundException {

		ArrayList<ForumMedico> logforumusu = new ArrayList<ForumMedico>();
		Connection con = Connect.getConexao();
		ForumMedico fm = null;

		try {
			String sql = "SELECT * FROM forummedico where idusuario = '"+id+"' and tipo = 'usuario' ORDER BY idforummedico DESC ";

			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				fm = new ForumMedico();
				fm.setId(rs.getInt("idforummedico"));
				fm.setIdusuario(rs.getInt("idUsuario"));
				fm.setTituloForum(rs.getString("titulo"));
				fm.setTextoForum(rs.getString("texto"));
				logforumusu.add(fm);


			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return logforumusu;
	}

	public boolean RemoverPostForum(int id) throws SQLException, Exception {
		boolean deletar = false;
		Connection c = null;
		PreparedStatement stmt = null;

		c = Connect.getConexao();
		String sql=" delete from forummedico where idforummedico=?";

		stmt = c.prepareStatement(sql);
		stmt.setInt(1,id);
		stmt.execute();
		stmt.close();
		deletar = true;

		return deletar;
	}

	public boolean RemoverComentForum(int id) throws SQLException, Exception {
		boolean deletar = false;
		Connection c = null;
		PreparedStatement stmt = null;

		c = Connect.getConexao();
		String sql=" DELETE FROM comentarioforummedico \n" +
				"\tUSING forummedico \n" +
				"    \tWHERE comentarioforummedico.idpostforummedico = forummedico.idforummedico \n" +
				"        \tAND idforummedico = ?";

		stmt = c.prepareStatement(sql);
		stmt.setInt(1,id);
		stmt.execute();
		stmt.close();
		deletar = true;

		return deletar;
	}



	public ForumMedico pesquisaForumMedico(int id ) throws ClassNotFoundException, SQLException{

		ForumMedico fm = null;

		Connection c = Connect.getConexao();
		String sql = "select * from forummedico where idforummedico=?";
		PreparedStatement stmtPre = c.prepareStatement(sql);

		System.out.println("ID NO DAO DO forum medico "+id);


		stmtPre.setInt(1, id);


		ResultSet rs= stmtPre.executeQuery();
		while(rs.next()){
			fm = new ForumMedico();

			fm.setId(rs.getInt("idforummedico"));
			fm.setIdusuario(rs.getInt("idusuario"));
			fm.setTituloForum(rs.getString("titulo"));
			fm.setTextoForum(rs.getString("texto"));
		}
		return fm;
	}

	public boolean alteraForum(ForumMedico fm) throws ClassNotFoundException, SQLException {
		boolean retorno = false;
		Connection c = null;
		PreparedStatement stmt = null;

		c = Connect.getConexao();

		String sql="UPDATE forummedico SET titulo=?, texto=? WHERE idforummedico=?";
		stmt = c.prepareStatement(sql);

		stmt.setString(1, fm.getTituloForum());
		stmt.setString(2, fm.getTextoForum());
		stmt.setInt(3, fm.getId());

		stmt.execute();
		stmt.close();
		retorno = true;

		return retorno;
	}

}