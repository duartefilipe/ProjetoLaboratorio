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

<jsp:useBean id="logforummed" class="br.csi.dao.ForumMedicoDao" />
<c:set var="postsforum" value="${logforummed.getPostsForumMedico4(usuario.id)}" />

<c:if  test="${usuario != null}">

    <c:if  test="${usuario.tipo == 'medico'}">

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
                <li><a href="RedMedico"><i class="fa fa-dashboard"></i> Home</a></li>
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
                        <li><a href="RedMuralMedico"><i class="fa fa-book"></i> Anuncios </a></li>
                        <li><a href="RedPostsForumMedico"><i class="fa fa-inbox"></i> Posts Forum Medico </a></li>
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
                    <i class="fa fa-inbox"></i> Posts no forum de medicos
                </li>
            </ol>
        </div>

        <div class="row">
            <div class="table-responsive text-center">
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
                            <td><a href="#" data-toggle="modal" data-target="#modalalterapost" onclick="setaDadosModalAltera('${postsforum.id}', '${postsforum.tituloForum}', '${postsforum.textoForum}')"><i class="fa fa-undo" style="color: black"></i></a></td>
                            <td align="center"><a href="RemoverPostForumMedico?id=${postsforum.id}"><i class="fa fa-remove" style="color: black"></i></a></td>

                        </tr>
                    </c:forEach>


                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</div><!-- /#page-wrapper -->

<!--modal alterar post forum inicio-->
<script>
    function setaDadosModalAltera(id, tituloForum, textoForum) {
        document.getElementById('id').value = id;
        document.getElementById('tituloForum').value = tituloForum;
        document.getElementById('textoForum').value = textoForum;

    }
</script>

<div class="modal fade" id="modalalterapost" tabindex="-1" role="dialog" aria-labelledby="myModalalterapost">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalalterapost">Realizar Alteraçao no post do forum</h4>

            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="AlteraForumlMed" method="post">
                    <input type="hidden" name="id" id="id" value="id">
                    <div class="form-group">
                        <label class="control-label" >Titulo:</label>
                        <input class="form-control" name="tituloForum" id="tituloForum" value="tituloForum"/>

                        <label class="control-label " >Texto:</label>

                        <textarea class="form-control" rows="5" name="textoForum" id="textoForum" value="textoForum"></textarea>

                    </div>
                    <button type="submit" class="btn btn-default">Alterar</button>

                </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<!--modal alterar post forum fim-->


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
    <c:if  test="${usuario.tipo != 'medico'}">
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
