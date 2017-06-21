package br.csi.controller;

import java.sql.SQLException;

import br.csi.dao.ForumMedicoDao;
import br.csi.dao.MuralDao;
import br.csi.model.ComentarioMedico;
import br.csi.model.ForumMedico;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ForumController {

	@RequestMapping ("CadastrarForumMedico")
	public String cadastraForumMedico (ForumMedico forummedico) throws ClassNotFoundException, SQLException{
		boolean retorno = new ForumMedicoDao().CadastrarForumMedico(forummedico);
		if(retorno){
			return "medico/Forum";
		}else{
			return "medico/Forum";
		}
	}

	@RequestMapping ("CadastrarForumGeralMedico")
	public String cadastraForumGeralMedico (ForumMedico forummedico) throws ClassNotFoundException, SQLException{
		boolean retorno = new ForumMedicoDao().CadastrarForumMedico(forummedico);
		if(retorno){
			return "medico/ForumGeral";
		}else{
			return "medico/ForumGeral";
		}
	}

	@RequestMapping ("CadastrarForumGeralUsuario")
	public String cadastraForumGeralUsuario (ForumMedico forummedico) throws ClassNotFoundException, SQLException{
		boolean retorno = new ForumMedicoDao().CadastrarForumMedico(forummedico);
		if(retorno){
			return "usuario/Forum";
		}else{
			return "usuario/Forum";
		}
	}

	@RequestMapping ("CadastrarComentForumMedico")
	public String cadastraComentarioForumMedico (ComentarioMedico cm) throws ClassNotFoundException, SQLException{
		boolean retorno = new ForumMedicoDao().CadastrarComentForumMedico(cm);
		if(retorno){
			return "medico/Forum";
		}else{
			return "medico/Forum";
		}
	}

	@RequestMapping ("CadastrarComentForumUsuario")
	public String cadastraComentarioForumUsuario (ComentarioMedico cm) throws ClassNotFoundException, SQLException{
		boolean retorno = new ForumMedicoDao().CadastrarComentForumMedico(cm);
		if(retorno){
			return "usuario/Forum";
		}else{
			return "usuario/Forum";
		}
	}

	@RequestMapping("RemoverPostForumMedico")
	public String DeletaPostForumMedico(int id , HttpServletRequest rq) throws SQLException, Exception{

		ForumMedicoDao fmD = new ForumMedicoDao();


		System.out.println("post forum medico :  "+id);

		boolean retorno = fmD.RemoverPostForumMedico(id);
		if(retorno){
			rq.setAttribute("postsforum", fmD.getPostsForumMedico());
			return "medico/PostsForumMedico";
		}else{
			rq.setAttribute("msg","roblema pra excluir");
			return "medico/PostsForumMedico";
		}
	}

	@RequestMapping("RemoverPostForumUsuario")
	public String DeletaPostForumUsuario(int id , HttpServletRequest rq) throws SQLException, Exception{

		ForumMedicoDao fmD = new ForumMedicoDao();


		System.out.println("post forum medico :  "+id);

		boolean retorno = fmD.RemoverPostForumMedico(id);
		if(retorno){
			rq.setAttribute("postsforum", fmD.getPostsForumMedico());
			return "usuario/PostsForumUsuario";
		}else{
			rq.setAttribute("msg","roblema pra excluir");
			return "usuario/PostsForumUsuario";
		}
	}

	@RequestMapping("AlteraForumlMed")
	public String alteraForumlMed (ForumMedico fm) throws ClassNotFoundException, SQLException {

		boolean retorno = new ForumMedicoDao().alteraForum(fm);
		if(retorno){
			return "medico/PostsForumMedico";
		}else{
			return "medico/PostsForumMedico";
		}
	}

	@RequestMapping("AlteraForumlMedGeral")
	public String alteraForumlMedGeral (ForumMedico fm) throws ClassNotFoundException, SQLException {

		boolean retorno = new ForumMedicoDao().alteraForum(fm);
		if(retorno){
			return "medico/PostsForumMedicoGeral";
		}else{
			return "medico/PostsForumMedicoGeral";
		}
	}

	@RequestMapping("AlteraForumlUsu")
	public String alteraForumlUsu (ForumMedico fm) throws ClassNotFoundException, SQLException {

		boolean retorno = new ForumMedicoDao().alteraForum(fm);
		if(retorno){
			return "usuario/PostsForumUsuario";
		}else{
			return "usuario/PostsForumUsuario";
		}
	}

}
