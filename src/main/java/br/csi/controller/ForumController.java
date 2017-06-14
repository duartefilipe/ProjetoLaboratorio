package br.csi.controller;

import java.sql.SQLException;

import br.csi.dao.ForumMedicoDao;
import br.csi.model.ForumMedico;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
