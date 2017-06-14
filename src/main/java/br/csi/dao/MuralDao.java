package br.csi.dao;

import br.csi.model.Mural;
import br.csi.util.Connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by anakin on 28/05/17.
 */


public class MuralDao {

    public boolean cadastraMural(Mural m) throws SQLException {
        Connection c = null;
        PreparedStatement stmt = null;
        boolean retorno = false;

        try {
            c = Connect.getConexao();
            String sql="INSERT INTO mural (idusuario, titulo, texto) values(?,?,?)";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, m.getIdUsuario());
            stmt.setString(2, m.getTitulo());
            stmt.setString(3,m.getTexto());
            stmt.execute();
            stmt.close();
            retorno = true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return retorno;
        }
        return retorno;
    }

    public ArrayList<Mural> getPostsMural() throws ClassNotFoundException {

        ArrayList<Mural> log2 = new ArrayList<Mural>();
        Connection con = Connect.getConexao();
        Mural mu = null;

        try {
            //String sql = "SELECT * FROM mural ORDER BY idmural DESC ";
            String sql = "SELECT usuario.idusuario, usuario.nome as nomeusu, titulo, texto, usuario.email as emailusu FROM mural, usuario where usuario.idusuario = mural.idusuario order by idmural DESC";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                mu = new Mural();
                mu.setIdUsuario(rs.getInt("idusuario"));
                mu.setNome(rs.getString("nomeusu"));
                mu.setTitulo(rs.getString("titulo"));
                mu.setTexto(rs.getString("texto"));
                mu.setEmail(rs.getString("emailusu"));
                log2.add(mu);
                System.out.println("ID dos posts na pagina de anuncios Adicionado no Array = " +mu.getIdUsuario());
                System.out.println("nome dos posts na pagina de anuncios Adicionado no Array = " +mu.getNome());
                System.out.println("titulo dos posts na pagina de anuncios Adicionado no Array = " +mu.getTitulo());

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return log2;
    }

    public ArrayList<Mural> getPostsMural1() throws ClassNotFoundException {

        ArrayList<Mural> log3 = new ArrayList<Mural>();
        Connection con = Connect.getConexao();
        Mural m = null;

        try {
            String sql = "SELECT * FROM mural ORDER BY idmural DESC LIMIT 2";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                m = new Mural();
                m.setIdUsuario(rs.getInt("idusuario"));
                m.setTitulo(rs.getString("titulo"));
                m.setTexto(rs.getString("texto"));
                log3.add(m);
                System.out.println("titulo do Post no mural do medico = " +m.getTitulo());

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return log3;
    }

    public ArrayList<Mural> getPostsMural2(int id) throws ClassNotFoundException {

        ArrayList<Mural> log4 = new ArrayList<Mural>();
        Connection con = Connect.getConexao();
        Mural m = null;

        try {
            String sql = "SELECT * FROM mural where idusuario = '"+id+"' ORDER BY idmural DESC ";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                m = new Mural();
                m.setIdUsuario(rs.getInt("idusuario"));
                m.setIdMural(rs.getInt("idMural"));
                m.setTitulo(rs.getString("titulo"));
                m.setTexto(rs.getString("texto"));
                log4.add(m);
                System.out.println("titulo do Post no mural especifico do medico = " +m.getTitulo());
                System.out.println("titulo do Post no mural especifico do medico = " +m.getTexto());

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return log4;
    }

    public boolean deletarMural(int id) throws SQLException, Exception {
        boolean deletar = false;
        Connection c = null;
        PreparedStatement stmt = null;

        c = Connect.getConexao();
        String sql=" delete from mural where idmural=?";
        stmt = c.prepareStatement(sql);
        stmt.setInt(1,id);
        stmt.execute();
        stmt.close();
        deletar = true;

        return deletar;
    }

}
