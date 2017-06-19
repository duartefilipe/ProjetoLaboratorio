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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">

</head>

<body>
<c:out value="${requestScope.usuario}" />

<jsp:useBean id="logposts2" class="br.csi.dao.ForumMedicoDao" />
<c:set var="postsforum" value="${logposts2.getPostsForum2(usuario.id)}" />

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
            <a class="navbar-brand" href="RedMedico">LabMed</a>
        </div>

        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li class="active"><a href="RedMedico"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="RedProfissionais"><i class="fa fa-table"></i> Profissionais</a></li>
                <li><a href="RedMural"><i class="fa fa-edit"></i> Anuncios</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-caret-square-o-down"></i> Fórum <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="RedForum">Médicos</a></li>
                        <li><a href="RedForumGeral">Geral</a></li>
                    </ul>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right navbar-user">
                <li class="dropdown user-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${usuario.nome} ${usuario.sobrenome} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <!--    <li><a href="RedAlteraUsu?id=${usuarios.id}"><i class="fa fa-user"></i> Perfil </a></li> -->
                        <li><a href="RedPerfilAltera?id=${usuario.id}"><i class="fa fa-user"></i>  Perfil </a></li> <!-- ?id=${usuario.id}" -->
                        <li><a href="RedMuralMedico"><i class="fa fa-edit"></i>  Meus Anuncios </a></li>
                        <li><a href="RedPostsForumMedico"><i class="fa fa-edit"></i>  Meus Posts Forum Medico </a></li>
                        <li class="divider"></li>
                        <li><a href="logout"><i class="fa fa-power-off"></i> Log Out</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>

    <div id="page-wrapper">
        <div class="row">
            <div class="table-responsive text-center">
                <h2 align="center">Gerenciar meus Posts no forum dos medicos</h2>
                <hr>
                <table class="table table-bordered table-hover table-striped tablesorter ">
                    <thead>
                    <tr>
                        <th class="header headerSortUp text-center">Titulo</th>
                        <th class="header headerSortUp text-center">Texto</th>
                        <th class="header headerSortUp text-center">Alterar Post</th>
                        <th class="header headerSortUp text-center">Excluir Post</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="postsforum" items="${postsforum}">
                        <tr>
                            <input type="hidden" name="id" value="${postsforum.id}">
                            <td>${postsforum.tituloForum}</td>
                            <td>${postsforum.textoForum}</td>
                            <!--<td><a href="RemoverMuralUsuario?idMural=${posts.idMural}"><img src="resources/images/alterar.jpg" style="width: 150; height: 30px;" /></a></td>-->
                            <td><a href="RemoverPostForumMedico?id=${postsforum.id}"><i class="fa fa-undo" style="color: black"></i></a></td>
                            <td align="center"><a href="RemoverPostForumMedico?id=${postsforum.id}"><i class="fa fa-remove" style="color: black"></i></a></td>
                            <!--<td><a href="RemoverMuralMedico?idMural=${posts.idMural}"><img src="resources/images/excluir.png" style="width: 150; height: 30px;" /></a></td>-->

                        </tr>
                    </c:forEach>


                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</div><!-- /#page-wrapper -->


<!-- JavaScript -->
<script src="resources/js/jquery-1.10.2.js"></script>
<script src="resources/js/bootstrap.js"></script>

<!-- Page Specific Plugins -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script>
<script src="resources/js/morris/chart-data-morris.js"></script>
<script src="resources/js/tablesorter/jquery.tablesorter.js"></script>
<script src="resources/js/tablesorter/tables.js"></script>

<div class="modal fade" id="modalcadmur" tabindex="-1" role="dialog" aria-labelledby="myModalcadmur">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalcadmur">Cadastrar</h4>
            </div>
            <div class="modal-body">
                <form action="CadastrarMural" method="post">
                    <input type="hidden" name="idUsuario" value="${usuario.id }">

                    <label>Titulo:</label>
                    <input type="text" class="form-control" name="titulo" placeholder="titulo">

                    <label>Texto:</label>
                    <textarea type="text" class="form-control" name="texto" id="texto" placeholder="texto"></textarea>
                    <hr>
                    <button type="submit" class="btn btn-primary pull-right">Cadastrar</button>
                </form>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="modalemail" tabindex="-1" role="dialog" aria-labelledby="myModalEmail">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalEmail">Enviar email</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <input type="hidden" name="id" value="${usuarios.id }">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="email1">Remetente:</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email1" value="${usuario.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="email2">Destinatario:</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email2" placeholder="email" value="${usuarios.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="comment">Texto:</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="5" id="comment"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-primary">Enviar Email</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>

</body>
</html>
