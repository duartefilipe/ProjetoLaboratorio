package br.csi.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import br.csi.dao.EmailDao;
import br.csi.util.Mail;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import br.csi.dao.UsuarioDao;
import br.csi.model.Usuario;

@Controller
public class RedirectController {
	
	@RequestMapping("Login")
	public String redirect(HttpServletRequest rq) throws ClassNotFoundException{
		return "Login";
	}
	
	@RequestMapping("RedPerfil")
	public String redirectPerfil(HttpServletRequest rq) throws ClassNotFoundException{
		return "medico/Perfil";
	}
	
	@RequestMapping("RedMedico")
	public String redirectMedico(HttpServletRequest rq) throws ClassNotFoundException{
		return "medico/Medico";
	}

	@RequestMapping("RedUsu")
	public String redirectUsu(HttpServletRequest rq) throws ClassNotFoundException{
		return "usuario/Usuario";
	}
	
	@RequestMapping("RedProfissionais")
	public String redirectProfissional(HttpServletRequest rq) throws ClassNotFoundException{
		return "medico/Profissionais";
	}

	@RequestMapping("RedProfissionaisUsu")
	public String redirectProfissionalUsu(HttpServletRequest rq) throws ClassNotFoundException{
		return "usuario/Profissionais";
	}
	
	@RequestMapping("RedForum")
	public String redirectForum(HttpServletRequest rq) throws ClassNotFoundException{
		return "medico/Forum";
	}

	@RequestMapping("RedPostsForumMedico")
	public String redirectPostsForumMedico(HttpServletRequest rq) throws ClassNotFoundException{
		return "medico/PostsForumMedico";
	}

	@RequestMapping("RedForumUsu")
	public String redirectForumUsu(HttpServletRequest rq) throws ClassNotFoundException{
		return "usuario/Forum";
	}
	
	@RequestMapping("RedResp")
	public String redirectResp(HttpServletRequest rq) throws ClassNotFoundException{
		return "medico/ForumRespostas";
	}

	@RequestMapping("RedMural")
	public String redirectMural(HttpServletRequest rq) throws ClassNotFoundException{
		return "medico/Mural";
	}

	@RequestMapping("RedMuralUsu")
	public String redirectMuralUsu(HttpServletRequest rq) throws ClassNotFoundException{
		return "usuario/Mural";
	}

	@RequestMapping("RedMuralMedico")
	public String redirectMuralMedico(HttpServletRequest rq) throws ClassNotFoundException{
		return "medico/MuralMedico";
	}

	@RequestMapping("RedMuralUsuario")
	public String redirectMuralUsuario(HttpServletRequest rq) throws ClassNotFoundException{
		return "usuario/MuralUsuario";
	}

	@RequestMapping ("RedPerfilAltera")
	public String redirectAlteraImovelAluga(HttpServletRequest rq) throws ClassNotFoundException, SQLException{

		int id = Integer.parseInt(rq.getParameter("id"));

		System.out.println("AQUI NO REDIRECT medico ALTERA "+id);

		Usuario u = new Usuario();
		UsuarioDao uD = new UsuarioDao();

		u = uD.pesquisaUsuario(id);

		rq.setAttribute("usuario", u);
		return "medico/Perfil";
	}

	@RequestMapping ("RedPerfilAlteraUsu")
	public String redirectAlteraPerfilUsu(HttpServletRequest rq) throws ClassNotFoundException, SQLException{

		int id = Integer.parseInt(rq.getParameter("id"));

		System.out.println("AQUI NO REDIRECT usuario ALTERA "+id);

		Usuario u = new Usuario();
		UsuarioDao uD = new UsuarioDao();

		u = uD.pesquisaUsuario(id);

		rq.setAttribute("usuario", u);
		return "usuario/PerfilUsu";
	}

	/* mandar email inicio */

	@RequestMapping("mandarEmailMedico")
	public String mandarEmail(HttpSession session, HttpServletRequest rq){
		Mail email = new Mail();
		EmailDao ed = new EmailDao();

		HttpSession sessao = rq.getSession(true);
		Usuario us = (Usuario) sessao.getAttribute("usuario");

		boolean enviado;

		System.out.println("-------------Entrou no mandar email--------------");
		System.out.println("Nome remetente: "+us.getNome());
		System.out.println("Email remetente: "+us.getEmail());

		String emaildest = rq.getParameter("email");
		System.out.println("email destinatario: " +emaildest);

		String nomedest = rq.getParameter("nomeDest");
		System.out.println("nome destinatario: " + nomedest);


		int id_dest = Integer.parseInt(rq.getParameter("idDest"));
		System.out.println("id destinatario: " + id_dest);

		System.out.println("id_usuario_logado: " + us.getId());

		System.out.println("email usuario logado:" +  us.getEmail());

		String assunto = "Contato sobre anuncio no LabMed";
		System.out.println("assunto: " + assunto);

		String mensagem = rq.getParameter("mensagem");
		System.out.println("mensagem: " + mensagem);

		String mensagemCompleta = mensagem +".\n O meu endereço de email para contato e "+us.getEmail() ;

		enviado = email.enviarEmail("laboratoriosoftware05@gmail.com", emaildest, assunto, mensagemCompleta);

		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Timestamp data = new Timestamp(System.currentTimeMillis());

		//ed.cadastraEmail(u.getId(), id_dest, assunto, mensagem, data);


		if(enviado){
			rq.setAttribute("enviadosim", "enviou");
			return "medico/Medico";
		}else{
			rq.setAttribute("enviadonao", "nao enviou");
			return "medico/Medico";
		}
	}

	/* mandar email fim*/

	/* mandar email inicio */

	@RequestMapping("mandarEmailUsuario")
	public String mandarEmailUsuario(HttpSession session, HttpServletRequest rq){
		Mail email = new Mail();
		EmailDao ed = new EmailDao();

		HttpSession sessao = rq.getSession(true);
		Usuario us = (Usuario) sessao.getAttribute("usuario");

		boolean enviado;

		System.out.println("-------------Entrou no mandar email--------------");
		System.out.println("Nome remetente: "+us.getNome());
		System.out.println("Email remetente: "+us.getEmail());

		String emaildest = rq.getParameter("email");
		System.out.println("email destinatario: " +emaildest);

		String nomedest = rq.getParameter("nomeDest");
		System.out.println("nome destinatario: " + nomedest);


		int id_dest = Integer.parseInt(rq.getParameter("idDest"));
		System.out.println("id destinatario: " + id_dest);

		System.out.println("id_usuario_logado: " + us.getId());

		System.out.println("email usuario logado:" +  us.getEmail());

		String assunto = "Contato sobre anuncio no LabMed";
		System.out.println("assunto: " + assunto);

		String mensagem = rq.getParameter("mensagem");
		System.out.println("mensagem: " + mensagem);

		String mensagemCompleta = mensagem +".\n O meu endereço de email para contato e "+us.getEmail() ;

		enviado = email.enviarEmail("laboratoriosoftware05@gmail.com", emaildest, assunto, mensagemCompleta);

		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Timestamp data = new Timestamp(System.currentTimeMillis());

		//ed.cadastraEmail(u.getId(), id_dest, assunto, mensagem, data);


		if(enviado){
			rq.setAttribute("enviadosim", "enviou");
			return "usuario/Usuario";
		}else{
			rq.setAttribute("enviadonao", "nao enviou");
			return "usuario/Usuario";
		}
	}

	/* mandar email fim*/
		
}
