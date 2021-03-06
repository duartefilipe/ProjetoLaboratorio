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

<jsp:useBean id="log2" class="br.csi.dao.MuralDao" />
<c:set var="posts" value="${log2.getPostsMural()}" />

<c:if  test="${usuario != null}">

    <c:if  test="${usuario.tipo == 'outro'}">

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
                <li><a href="RedUsu"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="RedProfissionaisUsu"><i class="fa fa-table"></i> Profissionais</a></li>
                <li class="active"><a href="RedMuralUsu"><i class="fa fa-edit"></i> Anuncios</a></li>
                <li><a href="RedForumUsu"> <i class="fa fa-caret-square-o-down"></i> Forum</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right navbar-user">
                <li class="dropdown user-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${usuario.nome} ${usuario.sobrenome} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <!--    <li><a href="RedAlteraUsu?id=${usuarios.id}"><i class="fa fa-user"></i> Perfil </a></li> -->
                        <li><a href="RedPerfilAlteraUsu?id=${usuario.id}"><i class="fa fa-user"></i>  Perfil </a></li> <!-- ?id=${usuario.id}" -->
                        <li><a href="RedMuralUsuario"><i class="fa fa-book"></i> Anuncios </a></li>
                        <li><a href="RedPostsForumUsuario"><i class="fa fa-inbox"></i> Posts no Forum </a></li>
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
                <li class="active"  style="color: black">
                    <i class="fa fa-book"></i> Anuncios
                </li>
            </ol>
        </div>

        <div class="row">

            <div class="jumbotron" style="padding-top: 1px; background-color: white">
                <p align="left">
                    <a href="#" class="btn btn-success" data-toggle="modal" data-target="#modalcadmur" style="color: white"> Criar anuncio  </a>
                </p>

                <c:forEach var="posts" items="${posts}">

                    <div class="thumbnail" style=" background-color: #e0e0e0; border-color: black">
                        <input type="hidden" name="posts" value="${posts.idUsuario }">
                        <input type="hidden" name="posts" value="${posts.nome }">
                        <input type="hidden" name="posts" value="${posts.email }">
                        <p>
                        <h3>
                            <b> ${posts.titulo} </b>
                        </h3>
                        </p>
                        <hr>
                        <p> ${posts.texto}.</p>
                        <p align="right">Autor: ${posts.nome}</p>
                        <hr>
                        <div class="container-fluid">
                            <div class="row text-right">
                                <div class="btn btn-primary" data-toggle="modal" data-target="#modalemail"  onclick="setaDadosModal('${posts.email }', '${posts.nome }' , ${posts.idUsuario})"> Enviar Email </div>
                            </div>
                        </div>
                    </div>
                    <hr><br>
                </c:forEach>
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
                <form action="CadastrarMuralUsu" method="post">
                    <input type="hidden" name="idUsuario" value="${usuario.id }">

                    <label>Titulo:</label>
                    <input type="text" class="form-control" name="titulo" placeholder="titulo">

                    <label>Texto:</label>
                    <textarea type="text" class="form-control" name="texto" id="texto" placeholder="texto"></textarea>
                    <hr>
                    <button type="submit" class="btn btn-primary pull-right">Cadastrar</button><br>
                </form>
            </div>
        </div>
    </div>
</div>


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
                <form class="form-horizontal" action="mandarEmailUsuario" method="post">
                    <input type="hidden" name="nomeDest" id="nomeDest" value="nomeDest">
                    <input type="hidden" name="idDest" id="idDest" value="idDest">

                    <!--<input type="text" name="campo" id="campo" value="campo">-->
                    <div class="form-group">
                        <label class="control-label col-sm-2" >Destinatario:</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" id="emailDest" value="emailDest">
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
                            <button type="submit" class="btn btn-success" id="enviar">Enviar</button>
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

            </div>
        </div>
    </div>
</div>

    </c:if>
    <c:if  test="${usuario.tipo != 'outro'}">
        <% response.sendRedirect("logout");  %>
    </c:if>
</c:if>

<c:if  test="${sessionScope['usuario'] == null}">
    <%
        response.sendRedirect("logout");

    %>
</c:if>

</body>
</html>
