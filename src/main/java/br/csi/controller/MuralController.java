package br.csi.controller;

import br.csi.dao.FavoritoDao;
import br.csi.dao.ForumMedicoDao;
import br.csi.dao.MuralDao;
import br.csi.model.ForumMedico;
import br.csi.model.Mural;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

@Controller
public class MuralController {

    @RequestMapping("CadastrarMural")
    public String adiciona (Mural m) throws ClassNotFoundException, SQLException {

        boolean retorno = new MuralDao().cadastraMural(m);
        if(retorno){
            return "medico/Mural";
        }else{
            return "medico/Mural";
        }
    }

    @RequestMapping("CadastrarMuralUsu")
    public String adicionaMuralUsu (Mural m) throws ClassNotFoundException, SQLException {

        boolean retorno = new MuralDao().cadastraMural(m);
        if(retorno){
            return "usuario/Mural";
        }else{
            return "usuario/Mural";
        }
    }



    @RequestMapping("RemoverMuralMedico")
    public String DeletaMuralMedico(int idMural , HttpServletRequest rq) throws SQLException, Exception{

        MuralDao mD = new MuralDao();


        System.out.println("mural :  "+idMural);

        boolean retorno = mD.deletarMural(idMural);
        if(retorno){
            rq.setAttribute("mural", mD.getPostsMural());
            return "medico/MuralMedico";
        }else{
            rq.setAttribute("msg","roblema pra excluir");
            return "medico/Medico";
        }
    }



    @RequestMapping("RemoverMuralUsuario")
    public String DeletaMuralUsu(int idMural , HttpServletRequest rq) throws SQLException, Exception{

        MuralDao mD = new MuralDao();


        System.out.println("mural :  "+idMural);

        boolean retorno = mD.deletarMural(idMural);
        if(retorno){
            rq.setAttribute("mural", mD.getPostsMural());
            return "usuario/MuralUsuario";
        }else{
            rq.setAttribute("msg","roblema pra excluir");
            return "usuario/MuralUsuario";
        }
    }

}
