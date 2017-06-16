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
			String sql="INSERT INTO forummedico (idusuario, titulo, texto) values(?,?,?)";
			stmt = c.prepareStatement(sql);
			stmt.setInt(1, fm.getIdusuario());
			stmt.setString(2, fm.getTituloForum());
			stmt.setString(3,fm.getTextoForum());
			stmt.execute();
			stmt.close();
			retorno = true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return retorno;
		}
		return retorno;
	}
	
	public ArrayList<ForumMedico> getPostsForum() throws ClassNotFoundException {

		ArrayList<ForumMedico> logposts = new ArrayList<ForumMedico>();
		Connection con = Connect.getConexao();
		ForumMedico fm = null;

		try {
			String sql = "SELECT * FROM forummedico ORDER BY idforummedico DESC";
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

	public ArrayList<ComentarioMedico> getPostsForum2(int id) throws ClassNotFoundException {

		ArrayList<ComentarioMedico> logpostsforum2 = new ArrayList<ComentarioMedico>();
		Connection con = Connect.getConexao();
		ComentarioMedico cfm = null;

		try {
			//String sql = "SELECT * FROM forummedico where idusuario = '"+id+"' ORDER BY idforummedico DESC ";
			String sql = "select idpostforummedico, idcomentarioforummedico, usuario.idusuario as idusuario, titulo, texto, comentario \n" +
					"\tfrom comentarioforummedico, usuario, forummedico \n" +
					"\t\twhere comentarioforummedico.idusuario = usuario.idusuario\n" +
					"        \tand comentarioforummedico.idpostforummedico = forummedico.idforummedico\n" +
					"\t\t\tand idforummedico = '"+id+"' ORDER BY idforummedico DESC";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				cfm = new ComentarioMedico();
				cfm.setIdpostforummedico(rs.getInt("idpostforummedico"));
				cfm.setIdcomentarioforummedico(rs.getInt("idcomentarioforummedico"));
				cfm.setIdusuario(rs.getInt("idusuario"));
				cfm.setTitulocomentario(rs.getString("titulo"));
				cfm.setTextocomentario(rs.getString("texto"));
				cfm.setComentarioforummedico(rs.getString("comentario"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return logpostsforum2;
	}

/*
	public ArrayList<ComentarioMedico> getRespsForum() throws ClassNotFoundException {

		ArrayList<ComentarioMedico> log9 = new ArrayList<ComentarioMedico>();
		Connection con = Connect.getConexao();
		ComentarioMedico cfm = null;

		try {
			//String sql = "SELECT * FROM mural ORDER BY idmural DESC ";
			String sql = "select idpostforummedico, idcomentarioforummedico, usuario.idusuario as idusuario, titulo, texto, comentario \\n\" +\n" +
					"from comentarioforummedico, usuario, forummedico " +
					"where comentarioforummedico.idusuario = usuario.idusuario" +
					"and comentarioforummedico.idpostforummedico = forummedico.idforummedico" +
					" ORDER BY idforummedico DESC";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				cfm = new ComentarioMedico();
				cfm.setIdpostforummedico(rs.getInt("idpostforummedico"));
				cfm.setIdcomentarioforummedico(rs.getInt("idcomentarioforummedico"));
				cfm.setIdusuario(rs.getInt("idusuario"));
				cfm.setTitulocomentario(rs.getString("titulo"));
				cfm.setTextocomentario(rs.getString("texto"));
				cfm.setComentarioforummedico(rs.getString("comentario"));
				log9.add(cfm);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return log9;
	}

	public boolean RemoverPostForumMedico(int id) throws SQLException, Exception {
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
*/
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

}
