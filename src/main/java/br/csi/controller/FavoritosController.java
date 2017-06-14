package br.csi.controller;

import java.sql.SQLException;

import br.csi.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.csi.dao.FavoritoDao;
import br.csi.model.Favorito;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class FavoritosController {

	@RequestMapping ("CadastrarFavorito")
	public String adiciona (Favorito f, HttpServletRequest rq) throws ClassNotFoundException, SQLException{

		HttpSession sessao = rq.getSession(true);
		Usuario usuario =(Usuario) sessao.getAttribute("usuario");
		System.out.println("Usuario ID: " + usuario.getId());

        System.out.print("ID do usuario logado: "+ usuario.getId() +"\n");
        System.out.print("ID do usuario que vai adicionar na tabela: "+f.getIdusuario2()+"\n");

		boolean retorno = new FavoritoDao().cadastraFavorito(f, usuario.getId());

		if(retorno){
			return "medico/Profissionais";
		}else{
			return "medico/Medico";
		}
	}

	@RequestMapping ("CadastrarFavoritoUsu")
	public String adicionaFavUsu (Favorito f, HttpServletRequest rq) throws ClassNotFoundException, SQLException{

		HttpSession sessao = rq.getSession(true);
		Usuario usuario = (Usuario) sessao.getAttribute("usuario");
		System.out.println("Usuario ID: " + usuario.getId());

		System.out.print("ID do usuario logado: "+ usuario.getId() +"\n");
		System.out.print("ID do usuario que vai adicionar na tabela: "+f.getIdusuario2()+"\n");

		boolean retorno = new FavoritoDao().cadastraFavorito(f, usuario.getId());

		if(retorno){
			return "usuario/Profissionais";
		}else{
			return "usuario/Profissionais";
		}
	}

	@RequestMapping("RemoverFavorito")
	public String DeletaFavorito(int idusuario2 , HttpServletRequest rq) throws SQLException, Exception{

		FavoritoDao fD = new FavoritoDao();


		System.out.println("favorito :  "+idusuario2);

		boolean retorno = fD.deletarFavorito(idusuario2);
		if(retorno){
			rq.setAttribute("favoritos", fD.getFavoritos());
			return "medico/Medico";
		}else{
			rq.setAttribute("msg","roblema pra excluir");
			return "medico/Medico";
		}
	}

	@RequestMapping("RemoverFavoritoUsu")
	public String DeletaFavoritoUsu(int idusuario2 , HttpServletRequest rq) throws SQLException, Exception{

		FavoritoDao fD = new FavoritoDao();


		System.out.println("favorito :  "+idusuario2);

		boolean retorno = fD.deletarFavorito(idusuario2);
		if(retorno){
			rq.setAttribute("favoritos", fD.getFavoritos());
			return "usuario/Usuario";
		}else{
			rq.setAttribute("msg","roblema pra excluir");
			return "usuario/Usuario";
		}
	}


}
