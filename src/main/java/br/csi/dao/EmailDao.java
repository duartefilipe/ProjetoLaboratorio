package br.csi.dao;

import br.csi.util.Connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

/**
 * Created by anakin on 01/06/17.
 */
public class EmailDao {

    public boolean cadastraEmail(int remt, int dest, String assunto, String mensag, Timestamp data) throws ClassNotFoundException {

        boolean cadastrado = false;
        Connection conn = Connect.getConexao();
        try{
            String sql = "INSERT INTO email values(default, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, remt);
            stmt.setInt(2, dest);
            stmt.setString(3, assunto);
            stmt.setString(4, mensag);
            stmt.setTimestamp(5, data);

            int cadastrou = stmt.executeUpdate();
            if(cadastrou >0){
                System.out.println("--------------------cadastrou email com sucesso!");
                cadastrado = true;
                return cadastrado;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return cadastrado;
    }

}
