        package br.csi.dao;

        import br.csi.model.Favorito;
        import br.csi.util.Connect;
        import java.sql.Connection;
        import java.sql.PreparedStatement;
        import java.sql.ResultSet;
        import java.sql.SQLException;
        import java.util.ArrayList;

public class FavoritoDao {

    public boolean cadastraFavorito(Favorito f, int idusuario) throws SQLException {
        Connection c = null;
        PreparedStatement stmt = null;
        boolean retorno = false;

        System.out.print("ID do usuario1 no DAO: "+idusuario+"\n");
        System.out.print("ID do usuario2 no DAO: "+f.getIdusuario2()+"\n");

        try {
            c = Connect.getConexao();
            String sql="INSERT INTO favorito (idusuario1, idusuario2) values(?,?)";
            stmt = c.prepareStatement(sql);
            stmt.setInt(1, idusuario);
            stmt.setInt(2, f.getIdusuario2());
            stmt.execute();
            stmt.close();
            retorno = true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return retorno;
        }
        return retorno;
    }
    /*
       public ArrayList<Favorito> getFavoritos() throws ClassNotFoundException {

           ArrayList<Favorito> logfav = new ArrayList<Favorito>();
           Connection con = Connect.getConexao();
           Favorito fav;

           try {
               String sql = "select * from usuario, favorito, usuario as u2 " +
                       "where usuario.idusuario = favorito.idusuario1 and favorito.idusuario2 = u2.idusuario";
               PreparedStatement stmt = con.prepareStatement(sql);
               ResultSet rs = stmt.executeQuery();

               while (rs.next()) {
                   fav = new Favorito();
                   fav.setIdfavorito(rs.getInt("idfavorito"));
                   fav.setIdusuario1(rs.getInt("idusuario1"));
                   fav.setIdusuario2(rs.getInt("idusuario2"));



                   logfav.add(fav);
                   System.out.println("Nome Adicionado no Array = " +fav.getIdusuario1());

               }

           } catch (SQLException e) {
               e.printStackTrace();
           }
           return logfav;
       }
    */
    public ArrayList<Favorito> getFavoritos() throws ClassNotFoundException {

        ArrayList<Favorito> logfav = new ArrayList<Favorito>();
        Connection con = Connect.getConexao();
        Favorito fav;

        try {
            String sql = "select usuario.idusuario, usuario.nome, u2.idusuario as id2, u2.nome as nome_favorito, u2.sobrenome as sobrenome_favorito, u2.tipo as tipo_favorito from usuario, favorito, usuario as u2 where usuario.idusuario = favorito.idusuario1 and favorito.idusuario2 = u2.idusuario";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();


            while (rs.next()) {
                fav = new Favorito();
                fav.setIdusuario2(rs.getInt("id2"));
                fav.setNome(rs.getString("nome_favorito"));
                fav.setSobrenome(rs.getString("sobrenome_favorito"));
                fav.setTipo(rs.getString("tipo_favorito"));

                logfav.add(fav);
                System.out.println("nome do favorito adicionado no Array favoritos = " +fav.getNome());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return logfav;
    }



    public boolean deletarFavorito(int idusuario2) throws SQLException, Exception {
        boolean deletar = false;
        Connection c = null;
        PreparedStatement stmt = null;

        c = Connect.getConexao();
        String sql=" delete from favorito where idusuario2=?";
        stmt = c.prepareStatement(sql);
        stmt.setInt(1,idusuario2);
        stmt.execute();
        stmt.close();
        deletar = true;

        return deletar;
    }
    public ArrayList<Favorito> getFavoritosId(int id) throws ClassNotFoundException {

        ArrayList<Favorito> LogFavId = new ArrayList<Favorito>();
        Connection con = Connect.getConexao();
        Favorito fav;


        try {
            String sql = "select usuario.idusuario, usuario.nome,u2.email as email_favorito, u2.idusuario as id2, u2.nome as nome_favorito, u2.sobrenome as sobrenome_favorito, u2.tipo as tipo_favorito from usuario, favorito, usuario as u2 where usuario.idusuario = favorito.idusuario1 and favorito.idusuario2 = u2.idusuario and idusuario1 = '"+id+"'";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();


            while (rs.next()) {
                fav = new Favorito();
                fav.setIdusuario2(rs.getInt("id2"));
                fav.setNome(rs.getString("nome_favorito"));
                fav.setSobrenome(rs.getString("sobrenome_favorito"));
                fav.setTipo(rs.getString("tipo_favorito"));
                fav.setEmail(rs.getString("email_favorito"));
                //fav.setNota(rs.getFloat("media"));

                LogFavId.add(fav);
                System.out.println("nome do favorito adicionado no Array favoritos = " +fav.getNome());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return LogFavId;
    }

}
