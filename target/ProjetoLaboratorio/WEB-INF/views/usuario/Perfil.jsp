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

<c:if  test="${sessionScope['usuario'] != null}">

        <div id="wrapper">
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
                        <li><a href="RedMuralUsu"><i class="fa fa-edit"></i> Anuncios</a></li>
                        <li><a href="RedForumUsu"> <i class="fa fa-caret-square-o-down"></i> Forum</a></li>
                    </ul>



                    <ul class="nav navbar-nav navbar-right navbar-user">
                        <li class="dropdown user-dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${usuario.nome} ${usuario.sobrenome} <b class="caret"></b></a>
                            <ul class="dropdown-menu">
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
                            <i class="fa fa-user"></i> Perfil
                        </li>
                    </ol>
                </div>

                <div class="list-group">
                    <nav class="navbar navbar-default navbar-static-top">
                        <div class="container">
						<form action="AlterarUsuario" method="post">
							<div class="form-group">
								<input type="hidden" name="id" value="${usuario.id }">
								<label>Nome:</label>
								<input class="form-control" type="text" name="nome" value="${usuario.nome }"/>
								<br />
								<label>sobrenome:</label>
								<input class="form-control" type="text" name="sobrenome" value="${usuario.sobrenome }"/>
								<br>
                                <label>Profissao:</label>
                                <input class="form-control" type="text" name="tipo" value="${usuario.tipo }"/>
                                <br>
								<label>email:</label>
								<input class="form-control" type="email" name="email" value="${usuario.email }" />
								<br />
								<label>Login:</label>
								<input class="form-control" type="text" name="login" value="${usuario.login}" />
								<br />
								<label>Senha:</label>
								<input class="form-control" type="password" name="senha" value="${usuario.senha }" />
								<br />
								<label>Cidade:</label>
								<input class="form-control" type="text" name="cidade" value="${usuario.cidade }" />
								<br />
								<label>Trabaho Atual:</label>
								<input class="form-control" type="text" name="trabatual" value="${usuario.trabatual}" />
								<br />
								<label>Trabalho Anterior:</label>
								<input class="form-control" type="text" name="trabant" value="${usuario.trabant}" />
								<br />
								<label>CPF:</label>
								<input class="form-control" type="text" name="cpf" value="${usuario.cpf}" />
								<br />
								<button class="btn btn-primary" type="submit">Alterar</button>

							</div>
						</form>
                            </div>
                    </nav>
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

</c:if>

    <c:if  test="${sessionScope['usuario'] == null}">
        <% response.sendRedirect("Login");  %>
    </c:if>

</body>
</html>
