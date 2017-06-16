package br.csi.controller;

import java.sql.SQLException;

import br.csi.dao.ForumMedicoDao;
import br.csi.dao.MuralDao;
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

	@RequestMapping("RemoverPostForumMedico")
	public String DeletaPostForumMedico(int id , HttpServletRequest rq) throws SQLException, Exception{

		ForumMedicoDao fmD = new ForumMedicoDao();


		System.out.println("post forum medico :  "+id);

		boolean retorno = fmD.RemoverPostForumMedico(id);
		if(retorno){
			rq.setAttribute("postsforum", fmD.getPostsForum());
			return "medico/PostsForumMedico";
		}else{
			rq.setAttribute("msg","roblema pra excluir");
			return "medico/PostsForumMedico";
		}
	}

}
