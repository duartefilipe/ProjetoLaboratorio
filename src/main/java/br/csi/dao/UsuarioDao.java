package br.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.csi.model.Avaliacao;
import br.csi.model.Usuario;
import br.csi.util.Connect;

public class UsuarioDao {

	public Usuario autenticar(String login, String senha) throws ClassNotFoundException, SQLException {

		Connection con = Connect.getConexao();

		System.out.println("Autenticando...");

			String sql = "SELECT * FROM usuario where login =? and senha=?";
			PreparedStatement stmt = con.prepareStatement(sql);
			
			Usuario u = null;
			
			stmt.setString(1, login);
			stmt.setString(2, senha);
			
			
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				u = new Usuario();

				u.setId(rs.getInt("idusuario"));
				System.out.print("Id do usuario: "+u.getId());

				u.setLogin(rs.getString("login"));
				System.out.println("login: " +u.getLogin());

				u.setSenha(rs.getString("senha"));
				System.out.println("senha: " +u.getSenha());

				u.setTipo(rs.getString("tipo"));
				System.out.println("tipo: " +u.getTipo());

				u.setNome(rs.getString("nome"));
				System.out.println("nome: " +u.getNome());

				u.setEmail(rs.getString("email"));
				System.out.println("email: " +u.getEmail());

				u.setSobrenome(rs.getString("sobrenome"));
				System.out.println("sobrenome: " +u.getSobrenome());

				u.setCidade(rs.getString("cidade"));
				System.out.println("cidade: " +u.getCidade());

				u.setTrabant(rs.getString("trabant"));
				System.out.println("trabalho aterior: " +u.getTrabant());

				u.setTrabatual(rs.getString("trabatual"));
				System.out.println("trabaho atual: " +u.getTrabatual());

				u.setCrm(rs.getString("CRM"));
				System.out.println("CRM: " +u.getCrm());

				u.setCpf(rs.getString("cpf"));
				System.out.println("cpf: " +u.getCpf());


				
			}
		return u;
	}

	public boolean cadastraUsuario(Usuario u) throws SQLException{
		Connection c = null;
		PreparedStatement stmt = null;
		boolean retorno = false;
		
		String nome = u.getNome();
		String sobrenome = u.getSobrenome();
		String login = u.getLogin();
		String senha = u.getSenha();
		String tipo = u.getTipo();

		
		try {
			c = Connect.getConexao();
			String sql="INSERT INTO usuario (nome, sobrenome, login, senha, tipo) values(?,?,?,?,?)";
			stmt = c.prepareStatement(sql);
			stmt.setString(1, nome);
			stmt.setString(2, sobrenome);
			stmt.setString(3, login);
			stmt.setString(4, senha);
			stmt.setString(5, tipo);
			
			stmt.execute();
			stmt.close();
			retorno = true;
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return retorno;
		}
		return retorno;
	}

	public boolean alteraMedico(Usuario u) throws ClassNotFoundException, SQLException {
		boolean retorno = false;
		Connection c = null;
		PreparedStatement stmt = null;

		System.out.print("ta aqui no altera medico do usuario dao id = "+u.getId());
		c = Connect.getConexao();

		String sql="UPDATE usuario SET nome=?, sobrenome=?, tipo=?, email=?, login=?, senha=?, cidade=?, trabatual=?, trabant=?, crm=? WHERE idusuario=?";
		stmt = c.prepareStatement(sql);

		stmt.setString(1, u.getNome());
		stmt.setString(2, u.getSobrenome());
		stmt.setString(3, u.getTipo());
		stmt.setString(4, u.getEmail());
		stmt.setString(5, u.getLogin());
		stmt.setString(6, u.getSenha());
		stmt.setString(7, u.getCidade());
		stmt.setString(8, u.getTrabatual());
		stmt.setString(9, u.getTrabant());
		stmt.setString(10, u.getCrm());
		stmt.setInt(11, u.getId());

		stmt.execute();
		stmt.close();
		retorno = true;
		System.out.println("AQUI NO ALTERAR DAO -- "+u.getId());

		return retorno;
	}
	
	public boolean alteraUsuario(Usuario u) throws ClassNotFoundException, SQLException {
	    boolean retorno = false;
        Connection c = null;
		PreparedStatement stmt = null;

			c = Connect.getConexao();
		String sql="UPDATE usuario SET nome=?, sobrenome=?, tipo=?, email=?, login=?, senha=?, cidade=?, trabatual=?, trabant=?, cpf=? WHERE idusuario=?";
		stmt = c.prepareStatement(sql);

		stmt.setString(1, u.getNome());
		stmt.setString(2, u.getSobrenome());
		stmt.setString(3, u.getTipo());
		stmt.setString(4, u.getEmail());
		stmt.setString(5, u.getLogin());
		stmt.setString(6, u.getSenha());
		stmt.setString(7, u.getCidade());
		stmt.setString(8, u.getTrabatual());
		stmt.setString(9, u.getTrabant());
		stmt.setString(10, u.getCpf());
		stmt.setInt(11, u.getId());
					
			stmt.execute();
			stmt.close();
			retorno = true;
			System.out.println("AQUI NO ALTERAR DAO -- "+u.getId());
			System.out.println("AQUI NO ALTERAR DAO -- "+u.getNome());
		
 return retorno;
}



	public ArrayList<Usuario> getUsuarios() throws ClassNotFoundException {

		ArrayList<Usuario> log = new ArrayList<Usuario>();
		Connection con = Connect.getConexao();
		Usuario usu;

		try {
			String sql = "select usuario.idusuario, AVG(nota) as media, usuario.nome, usuario.sobrenome, usuario.tipo,\n" +
					"\tusuario.cidade, usuario.trabatual, usuario.trabant, usuario.email\n" +
					"      from usuario,  avaliacao\n" +
					"        where avaliacao.idusurec = usuario.idusuario\n" +
					"            group by usuario.idusuario, usuario.nome, usuario.sobrenome, usuario.tipo, usuario.cidade,\n" +
					"            usuario.trabatual, usuario.trabant, usuario.email\n" +
					"UNION\n" +
					"\n" +
					"select usuario.idusuario, NULL as media, usuario.nome, usuario.sobrenome, usuario.tipo,\n" +
					"\tusuario.cidade, usuario.trabatual, usuario.trabant, usuario.email\n" +
					"      from usuario  WHERE not exists (select * from avaliacao where avaliacao.idusurec = usuario.idusuario)\n" +
					"ORDER BY sobrenome;";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				usu = new Usuario();
				usu.setId(rs.getInt("idusuario"));
				usu.setNome(rs.getString("nome"));
				usu.setSobrenome(rs.getString("sobrenome"));
				usu.setTipo(rs.getString("tipo"));
				usu.setCidade(rs.getString("cidade"));
				usu.setTrabatual(rs.getString("trabatual"));
				usu.setTrabant(rs.getString("trabant"));
				usu.setEmail(rs.getString("email"));
				usu.setNota(rs.getFloat("media"));

				log.add(usu);
				System.out.println("Nome Adicionado no Array = " +usu.getNome());

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return log;
	}

	public Usuario getusuario(int id) throws ClassNotFoundException {
		Connection con = Connect.getConexao();
		Usuario usu = new Usuario();
		
		try {
			String sql = "SELECT * FROM usuario WHERE idusuario = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				usu.setId(rs.getInt("idusuario"));
				usu.setNome(rs.getString("nome"));
				usu.setSobrenome(rs.getString("sobrenome"));
				usu.setCidade(rs.getString("cidade"));
				usu.setTrabatual(rs.getString("trabatual"));
				usu.setTrabant(rs.getString("trabant"));
				usu.setNota(rs.getFloat("media"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return usu;
	}
	
	public Usuario pesquisaUsuario(int id ) throws ClassNotFoundException, SQLException{
		
		Usuario u = null;
		
		Connection c = Connect.getConexao();
		String sql = "select * from usuario where idusuario=?";
		PreparedStatement stmtPre = c.prepareStatement(sql);
		
		System.out.println("ID NO DAO DO USUARIO "+id);


		stmtPre.setInt(1, id);

		
		ResultSet rs= stmtPre.executeQuery();
		while(rs.next()){
				u = new Usuario();	    

			u.setId(rs.getInt("idusuario"));

			u.setLogin(rs.getString("login"));

			u.setSenha(rs.getString("senha"));

			u.setTipo(rs.getString("tipo"));

			u.setNome(rs.getString("nome"));

			u.setEmail(rs.getString("email"));

			u.setSobrenome(rs.getString("sobrenome"));

			u.setCidade(rs.getString("cidade"));

			u.setTrabant(rs.getString("trabant"));

			u.setTrabatual(rs.getString("trabatual"));

			u.setCrm(rs.getString("CRM"));

			u.setCpf(rs.getString("CPF"));


		}
		return u;
	}
	
	public Usuario pesquisaUsuario2(int id ) throws ClassNotFoundException, SQLException{
		
		Usuario u = null;
		
		Connection c = Connect.getConexao();
		String sql = "select * from usuario where idusuario=?";
		PreparedStatement stmtPre = c.prepareStatement(sql);
		
		System.out.println("ID NO DAO DO USUARIO "+id);
		
		stmtPre.setInt(1, id);
		
		ResultSet rs= stmtPre.executeQuery();
		while(rs.next()){
				u = new Usuario();	    
				
				u.setId(rs.getInt("idusuario"));
				u.setNome(rs.getString("nome"));
				u.setSobrenome(rs.getString("sobrenome"));
				u.setCidade(rs.getString("cidade"));
				u.setTrabatual(rs.getString("trabatual"));
				u.setTrabant(rs.getString("trabant"));
				
				System.out.println("USUARIO DAO nome Usuario----"+u.getNome());
		}
		return u;
	}
	
	public boolean deletarUsuario(int id) throws SQLException, Exception {
        boolean deletar = false;
        Connection c = null;
		PreparedStatement stmt = null;
		
		c = Connect.getConexao();
		String sql=" delete from  usuario where idusuario=?";
		stmt = c.prepareStatement(sql);
		stmt.setInt(1,id); 
		stmt.execute();
		stmt.close();
		deletar = true;
        
		return deletar;
    }

	public boolean cadastraAvaliacao(Avaliacao a) throws SQLException {
		Connection c = null;
		PreparedStatement stmt = null;
		boolean retorno = false;

		try {
			c = Connect.getConexao();
			String sql="insert into avaliacao (nota, idusuatrib, idusurec) values (?, ?, ?)";
			stmt = c.prepareStatement(sql);
			stmt.setFloat(1, a.getNota());
			stmt.setInt(2, a.getIdusuatrib());
			stmt.setInt(3, a.getIdusurec());
			stmt.execute();
			stmt.close();
			retorno = true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return retorno;
		}
		return retorno;
	}
}
