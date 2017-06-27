<%@ page import="br.csi.model.Usuario" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt">

    <head>

	
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>LabMed </title>


        <link href="resources/css/bootstrap.css" rel="stylesheet">
        <link href="resources/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">
        <link rel="stylesheet" href="resources/css/AdminLTE.min.css">
        <link rel="stylesheet" href="resources/css/_all-skins.min.css">
        <link rel="stylesheet" href="resources/css/AdminLTE.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href=resources/css/ionicons.min.css">



    </head>

    <body>


    <c:out value="${requestScope.usuario}" />

    <jsp:useBean id="log3" class="br.csi.dao.MuralDao" />
    <c:set var="posts" value="${log3.getPostsMural1()}" />

    <jsp:useBean id="LogFavId" class="br.csi.dao.FavoritoDao" />
    <c:set var="favIdTeste" value="${LogFavId.getFavoritosId(usuario.id)}" />

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

                <div class="collapse navbar-collapse navbar-ex1-collapse" >
                    <ul class="nav navbar-nav side-nav">
                        <li class="active"><a href="RedMedico"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="RedProfissionais"><i class="fa fa-table"></i> Profissionais</a></li>
                        <li><a href="RedMural"><i class="fa fa-edit"></i> Anuncios </a></li>
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
                                <li><a href="RedMuralMedico"><i class="fa fa-book"></i> Anuncios </a></li>
                                <li><a href="RedPostsForumMedico"><i class="fa fa-inbox"></i>  Posts Forum Medico </a></li>
                                <li><a href="RedPostsForumMedicoGeral"><i class="fa fa-edit"></i> Posts Forum Geral </a></li>
                                <li class="divider"></li>
                                <li><a href="logout"><i class="fa fa-power-off"></i> Log Out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </nav>

            <div id="page-wrapper">

                <div class="row">
                    <ol class="breadcrumb">
                        <li class="active" style="color: black">
                            <i class="fa fa-dashboard"></i> Home
                        </li>
                    </ol>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <h2>Favoritos </h2>
                        <div class="table-responsive" >
                            <table class="table table-bordered table-hover tablesorter text-center" >
                                <thead>
                                    <tr>
                                        <th class="header headerSortUp text-center">Nome <i class="fa fa-sort"></i></th>
                                        <th class="header headerSortUp text-center">Sobrenome <i class="fa fa-sort"></i></th>
                                        <th class="header headerSortUp text-center">Profissão <i class="fa fa-sort"></i></th>
                                        <th class="header headerSortUp text-center">Email </th>
                                        <th class="header headerSortUp text-center">Excluir </th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach var="favId" items="${favIdTeste}">
                                        <tr>
                                            <input type="hidden" name="idusuario2" value="${favId.idusuario2 }">
                                            <td>${favId.nome}</td>
                                            <td>${favId.sobrenome}</td>
                                            <td>${favId.tipo}</td>
                                            <td align="center">
                                                <a href="#" data-toggle="modal" data-target="#modalemail" onclick="setaDadosModal('${favId.email}', '${favId.nome}', ${favId.idusuario2 })"><i class="fa fa-envelope-o" style="color: black"></i></a>
                                            </td>
                                            <!--<td align="center"><a href="#" data-toggle="modal" data-target="#myModal_${favId.idusuario2}"><img src="resources/images/email.png" style="width:150; height:30px;" /></a></td>-->
                                            <!--<td align="center"><a href="#" data-toggle="modal" data-target="#modalemail"><img src="resources/images/email.png" style="width:150; height:30px;" /></a></td>-->
                                            <td align="center"><a href="RemoverFavorito?idusuario2=${favId.idusuario2}"><i class="fa fa-trash" style="color: black"></i></a></td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <h2 align="center">Anuncios recentes</h2>
                        <div class="jumbotron" style="padding-top: 1px; background-color: white">
                            <c:forEach var="posts" items="${posts}">

                                <div class="thumbnail" style=" background-color: #e0e0e0; border-color: black">
                                    <input type="hidden" name="posts" value="${posts.idUsuario }">
                                    <p>
                                    <h3>
                                        <b> ${posts.titulo} </b>
                                    </h3>
                                    </p>
                                    <hr>
                                    <p>${posts.texto}...</p>
                                </div>

                            </c:forEach>

                            <p align="right"> <a href="RedMural"> ver mais </a> </p>
                        </div>

                    </div>

                </div>
            </div><!-- /.row -->
        </div><!-- /#page-wrapper -->


    <!-- modal email inicio -->
    <script>
        function setaDadosModal(emailDest, nomeDest, idDest) {
            document.getElementById('emailDest').value = emailDest;
            document.getElementById('nomeDest').value = nomeDest;
            document.getElementById('idDest').value = idDest;
        }
    </script>

    <div class="modal fade" id="modalemail" tabindex="-1" role="dialog" aria-labelledby="myModalEmail">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalEmail">Enviar email</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="mandarEmailMedico" method="post">
                        <input type="hidden" name="nomeDest" id="nomeDest" value="nomeDest">
                        <input type="hidden" name="idDest" id="idDest" value="idDest">

                        <!--<input type="text" name="campo" id="campo" value="campo">-->
                        <div class="form-group">
                            <label class="control-label col-sm-2" >Destinatario:</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="email" id="emailDest" value="emailDest" disabled>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="control-label col-sm-2" >Texto:</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" name="mensagem"  placeholder="Digite aqui sua mensagem"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-default" id="enviar">Enviar</button>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">

                </div>
            </div>
        </div>
    </div>

    <!-- modal email fim -->





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
