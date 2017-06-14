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
    <jsp:useBean id="log1" class="br.csi.dao.ForumMedicoDao" />
	<c:set var="post" value="${log1.getPosts()}" />

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
                        <li><a href="Mural.jsp"><i class="fa fa-edit"></i> Mural</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-caret-square-o-down"></i> Fórum <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="RedForum">Médicos</a></li>
                                <li><a href="#">Geral</a></li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right navbar-user">
                        <li class="dropdown user-dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Filipe Duarte <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                        <!--    <li><a href="RedAlteraUsu?id=${usuarios.id}"><i class="fa fa-user"></i> Perfil </a></li> -->
                        		<li><a href="RedPerfil"><i class="fa fa-user"></i> Perfil </a></li>  
                                <li class="divider"></li>
                                <li><a href="Login.jsp"><i class="fa fa-power-off"></i> Log Out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </nav>

            <div id="page-wrapper">

                <div class="row">
                    <div class="col-lg-12">
                        <ol class="breadcrumb">
                            <li class="active"><i class="fa fa-dashboard"></i> Home</li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->


            </div><!-- /#wrapper -->

		<div id="page-wrapper">
			<div class="row">

				<div class="jumbotron">
										
					<c:forEach var="post" items="${post}">
					<div class="thumbnail">
						<p>
						<h3>
							<b>${post.tituloForum}</b>
						</h3>
						</p>
						<hr>
						<p>${post.textoForum}.</p>
							<p align="right"> <a href="#" style="color: black"> Responder </a> </p>
					</div>
					</c:forEach>
					<h1>Respostas aqui</h1>

				</div>

			</div>
		</div>
		<!-- /.row -->
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

</body>
</html>
