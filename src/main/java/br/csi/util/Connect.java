package br.csi.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
	public static Connection getConexao() throws ClassNotFoundException{
	Connection c = null;
	try {
		Class.forName("org.postgresql.Driver");
		String url ="jdbc:postgresql://localhost:5432/ProjLab";
		String user="postgres";
		String password = "1234";
		c = DriverManager.getConnection(url, user, password);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return c;
}
}
