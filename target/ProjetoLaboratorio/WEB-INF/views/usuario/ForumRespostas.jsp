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
    <jsp:useBean id="logpostsforum2" class="br.csi.dao.ForumMedicoDao" />
    <c:set var="respsForum" value="${logpostsforum2.getPostsForum2(forum.id)}" />

    <c:if  test="${usuario != null}">

        <c:if  test="${usuario.tipo == 'outro'}">

    <div id="wrapper">

        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
                    <li class="active" style="color: black">
                        <i class="fa fa-caret-square-o-down"></i> Respostas
                    </li>
                </ol>
            </div>
            <div class="row">

                <div class="jumbotron" style="padding-top: 1px; background-color: white">
                        <div class="thumbnail"style=" background-color: #e0e0e0; border-color: black">
                            <!-- <p align="right"><a href="#"><i style="color: #000000;" class="fa fa-close"></i></a></p> <h3>${postsForum.tituloForum}  </h3> -->

                            <h3> ${forum.tituloForum }  </h3>
                            <hr>
                            <h4> ${forum.textoForum}</h4>
                            <br>
                            <hr>
                            <p align="center"><u>Respostas</u></p>
                            <p align="left"> <a href="#" class="btn btn-primary" style="color: white" data-toggle="modal" data-target="#modalcadcoment"> Responder </a></p>
                            <c:forEach var="respsForum" items="${respsForum}">
                                <div class="container-fluid text-right">
                                    <input type="hidden" name="idusuario" value="${respsForum.idusuario }">
                                    <!-- <p align="right"><a href="#"><i style="color: #000000;" class="fa fa-close"></i></a></p> <h3>${postsForum.tituloForum}  </h3> -->
                                    <h3>${respsForum.comentarioforummedico}  </h3>
                                    <hr>
                                </div>
                            </c:forEach>

                        </div>
                </div>
            </div>
        </div>
    </div>
    </div><!-- /#page-wrapper -->

    <!--modal novo comentario no post no forum do medico inicio-->
    <div class="modal fade" id="modalcadcoment" tabindex="-1" role="dialog" aria-labelledby="myModalcadcomentmed">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalcadcomentmed">Comentar</h4>
                </div>
                <div class="modal-body">
                    <form action="CadastrarComentForumUsuario" method="post">
                        <input type="hidden" name="idusuario" value="${usuario.id}">
                        <input type="hidden" name="idpostforummedico" value="${forum.id}">

                        <label>Comentario:</label>
                        <textarea class="form-control" rows="5" name="comentarioforummedico" placeholder="Digite o seu comentario"></textarea>

                        <hr>
                        <button type="submit" class="btn btn-primary pull-right">Comentar</button><br>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--modal novo comentario no post no forum do medico fim-->


    <!-- JavaScript -->
    <script src="resources/js/jquery-1.10.2.js"></script>
    <script src="resources/js/bootstrap.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script>
    <script src="resources/js/morris/chart-data-morris.js"></script>
    <script src="resources/js/tablesorter/jquery.tablesorter.js"></script>
    <script src="resources/js/tablesorter/tables.js"></script>

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
