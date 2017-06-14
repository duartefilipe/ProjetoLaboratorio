package br.csi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.csi.model.ComentarioMedico;
import br.csi.util.Connect;


public class ComentarioMedicoDao {
	
	public boolean cadastraComentarioMedico(ComentarioMedico cm) throws SQLException{
		Connection c = null;
		PreparedStatement stmt = null;
		boolean retorno = false;
		
		String comentario = cm.getComentarioMedico();

		
		try {
			c = Connect.getConexao();
			String sql="INSERT INTO comentarioforum (comentario) values(?)";
			stmt = c.prepareStatement(sql);
			stmt.setString(1, comentario);

			
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
