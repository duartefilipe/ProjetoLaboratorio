<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>LabMed</title>

        <link href="resources/css/bootstrap.css" rel="stylesheet">
        <link href="resources/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">
    </head>

    <body>
    <c:out value="${requestScope.usuario}" />

    <jsp:useBean id="logpostsgeral" class="br.csi.dao.ForumMedicoDao" />
    <c:set var="postsForum" value="${logpostsgeral.getPostsForumGeral()}" />

        <div id="wrapper">

            <!-- Sidebar -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="RedUsu">LabMed</a>
                </div>

                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li class="active"><a href="RedUsu"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="RedProfissionaisUsu"><i class="fa fa-table"></i> Profissionais</a></li>
                        <li><a href="RedMuralUsu"><i class="fa fa-edit"></i> Anuncios</a></li>
                        <li><a href="RedForumUsu">Forum</a></li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right navbar-user">
                        <li class="dropdown user-dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${usuario.nome} ${usuario.sobrenome} <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                        <!--    <li><a href="RedAlteraUsu?id=${usuarios.id}"><i class="fa fa-user"></i> Perfil </a></li> -->
                                <li><a href="RedPerfilAlteraUsu?id=${usuario.id}"><i class="fa fa-user"></i>  Perfil </a></li> <!-- ?id=${usuario.id}" -->
                                <li><a href="RedMuralUsuario"><i class="fa fa-edit"></i>  Meus Anuncios </a></li>
                                <li><a href="RedPostsForumUsuario"><i class="fa fa-edit"></i>  Meus Posts no Forum </a></li>
                                <li class="divider"></li>
                                <li><a href="logout"><i class="fa fa-power-off"></i> Log Out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </nav>

		<div id="page-wrapper">
			<div class="row">

                <div class="jumbotron" style="padding-top: 1px">
                    <h2 align="center"><u>Forum</u></h2>
                    <br>
                    <button type="button" class="btn btn-md btn-default" href="#" class="btn btn-default" data-toggle="modal" data-target="#modalcadformed">Criar novo Post no forum</button>
                    <br><br>

                    <c:forEach var="postsForum" items="${postsForum}">
                        <div class="thumbnail">
                            <input type="hidden" name="idusuario" value="${postsForum.idusuario }">
                            <!-- <p align="right"><a href="#"><i style="color: #000000;" class="fa fa-close"></i></a></p> <h3>${postsForum.tituloForum}  </h3> -->
                            <h3>${postsForum.tituloForum}  </h3>
                            <hr>
                            <h4>${postsForum.textoForum}</h4>
                            <p align="right"><a href="redRespForumUsu?id=${postsForum.id}" style="color: black">responder</a></p>
                        </div>
                    </c:forEach>
				</div>
            </div>
		</div>
    </div>
	</div><!-- /#page-wrapper -->

    <!--modal cadastra novo post no forum do usuario inicio-->
    <div class="modal fade" id="modalcadformed" tabindex="-1" role="dialog" aria-labelledby="myModalcadformed">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalcadformed">Cadastrar</h4>
                </div>
                <div class="modal-body">
                    <form action="CadastrarForumGeralUsuario" method="post">
                        <input type="hidden" name="idusuario" value="${usuario.id}">
                        <input type="hidden" name="tipo" value="usuario">
                        <label>Titulo:</label>
                        <input type="text" class="form-control" name="tituloForum" placeholder="titulo">

                        <label>Texto:</label>
                        <textarea class="form-control" rows="5" name="textoForum" placeholder="texto"></textarea>
                        <hr>
                        <button type="submit" class="btn btn-primary pull-right">Cadastrar</button><br>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--modal cadastra novo post no forum do usuario fim-->


<!-- JavaScript -->
<script src="resources/js/jquery-1.10.2.js"></script>
<script src="resources/js/bootstrap.js"></script>

<!-- Page Specific Plugins -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script>
<script src="resources/js/morris/chart-data-morris.js"></script>
<script src="resources/js/tablesorter/jquery.tablesorter.js"></script>
<script src="resources/js/tablesorter/tables.js"></script>

</body>
</html>
