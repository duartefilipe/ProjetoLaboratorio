package br.csi.controller;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import br.csi.model.Avaliacao;
import br.csi.util.Connect;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import br.csi.dao.UsuarioDao;
import br.csi.model.Usuario;

@Controller
public class UsuarioController {
	
	@RequestMapping("login")
	public String AutenticaUsuario(String login, String senha , HttpServletRequest rq) throws ClassNotFoundException, SQLException {
		
		
		System.out.println("controller atuenticar");
		HttpSession sessao = rq.getSession(true);
		try{

			Usuario u = new Usuario();
			UsuarioDao uD = new UsuarioDao();
			
			u = uD.autenticar(login, senha);
			
			if(u != null){

				if(u.getTipo().equals("medico")){
					rq.getSession().invalidate();
					sessao = rq.getSession();
					sessao.setAttribute("usuario", u);

	                return "medico/Medico";
				}
				else{
					rq.getSession().invalidate();
					sessao = rq.getSession();
			        sessao.setAttribute("usuario", u);
					return "usuario/Usuario";
				}
				
				
			}else{
					rq.setAttribute("msg","Problemas ao Logar");
					return "Login";

			}
			
			}catch(Exception e){
				e.printStackTrace();
			}

		return "Login";
	}
	
	@RequestMapping("logout")
	public String logout (HttpServletRequest rq){
		rq.getSession().invalidate();
		return "Login";
	}
	
	@RequestMapping ("CadastrarUsuario")
	public String adiciona (Usuario usuario, HttpServletRequest rq) throws ClassNotFoundException, SQLException{
		boolean retorno = new UsuarioDao().cadastraUsuario(usuario);
		if(retorno){
			rq.setAttribute("mensagem", "Usuario cadastrado como favorito");
			return "Login";
		}else{
			return "Login";
		}
	}

	@RequestMapping ("CadastrarAvaliacao")
	public String adiciona (Avaliacao avaliacao) throws ClassNotFoundException, SQLException{
		boolean retorno = new UsuarioDao().cadastraAvaliacao(avaliacao);
		if(retorno){
			return "medico/Profissionais";
		}else{
			return "medico/Profissionais";
		}
	}

	@RequestMapping ("CadastrarAvaliacaoUsu")
	public String adicionaAvaUsu (Avaliacao avaliacao) throws ClassNotFoundException, SQLException{
		boolean retorno = new UsuarioDao().cadastraAvaliacao(avaliacao);
		if(retorno){
			return "usuario/Profissionais";
		}else{
			return "usuario/Profissionais";
		}
	}

	@RequestMapping("AlterarMedico")
	public String AlteraPerfilMedico(Usuario u, HttpServletRequest rq) throws NoSuchAlgorithmException, ClassNotFoundException, SQLException{

		UsuarioDao uD = new UsuarioDao();
		HttpSession sessao = rq.getSession(true);
		boolean retorno = uD.alteraMedico(u);

		System.out.println("No Altera usuario  :   "+retorno);
		if(retorno){
			sessao = rq.getSession();
			sessao.setAttribute("usuario", u);
			return "medico/Medico";
		}else{
			rq.setAttribute("msg","problemas ao alterar professor");
			return "erro";
		}
	}

	@RequestMapping("AlterarUsuario")
	public String AlteraPerfilUsuario(Usuario u, HttpServletRequest rq) throws NoSuchAlgorithmException, ClassNotFoundException, SQLException{

		UsuarioDao uD = new UsuarioDao();
		HttpSession sessao = rq.getSession(true);
		boolean retorno = uD.alteraUsuario(u);

		System.out.println("No Altera usuario  :   "+retorno);
		if(retorno){
			sessao = rq.getSession();
			sessao.setAttribute("usuario", u);
			return "usuario/Usuario";
		}else{
			rq.setAttribute("msg","problemas ao alterar usuario");
			return "erro";
		}
	}

}
