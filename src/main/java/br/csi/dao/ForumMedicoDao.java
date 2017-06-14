package br.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
			String sql = "SELECT * FROM forummedico";
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
}
