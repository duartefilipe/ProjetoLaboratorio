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

<jsp:useBean id="log4" class="br.csi.dao.MuralDao" />
<c:set var="posts" value="${log4.getPostsMural2(usuario.id)}" />

<c:if  test="${sessionScope['usuario'] != null}">

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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-caret-square-o-down"></i> F�rum <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="RedForum">M�dicos</a></li>
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
                <li class="active"  style="color: black">
                    <i class="fa fa-book"></i> Meus anuncios
                </li>
            </ol>
        </div>

        <div class="row">
            <div class="table-responsive">
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
                    <c:forEach var="posts" items="${posts}">
                        <tr>
                            <td align="center">${posts.titulo}</td>
                            <td align="center">${posts.texto}</td>
                            <td align="center">
                                <a href="#" data-toggle="modal" data-target="#modalavaliacao" onclick="setaDadosModalAltera('${posts.idMural}', '${posts.titulo}', '${posts.texto}')"> <i class="fa fa-edit" style="color: black"></i> </a>
                            </td>
                            <td align="center"><a href="RemoverMuralMedico?idMural=${posts.idMural}"><i class="fa fa-remove" style="color: black"></i></a></td>


                        </tr>
                    </c:forEach>


                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</div><!-- /#page-wrapper -->




<!--modal alterar inicio-->
<script>
    function setaDadosModalAltera(idMural, titulo, texto) {
        document.getElementById('idMural').value = idMural;
        document.getElementById('titulo').value = titulo;
        document.getElementById('texto').value = texto;

    }
</script>

<div class="modal fade" id="modalavaliacao" tabindex="-1" role="dialog" aria-labelledby="myModalavaliacao">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalavaliacao">Realizar Altera�ao no anuncio</h4>

            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="AlteraMuralMed" method="post">
                    <input type="hidden" name="idMural" id="idMural" value="idMural">
                    <div class="form-group">
                        <label class="control-label" >Titulo:</label>
                            <input class="form-control" name="titulo" id="titulo" value="titulo"/>

                        <label class="control-label " >Texto:</label>

                        <textarea class="form-control" rows="5" name="texto" id="texto" value="texto"></textarea>

                    </div>
                    <button type="submit" class="btn btn-default">Alterar</button>

                </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<!--modal alterar fim-->


<!-- JavaScript -->
<script src="resources/js/jquery-1.10.2.js"></script>
<script src="resources/js/bootstrap.js"></script>

<!-- Page Specific Plugins -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script>
<script src="resources/js/morris/chart-data-morris.js"></script>
<script src="resources/js/tablesorter/jquery.tablesorter.js"></script>
<script src="resources/js/tablesorter/tables.js"></script>
<script src="resources/js/jquery-1.9.js"></script>
<script src="resources/js//bootstrap.js"></script>
<script src="resources/js/bootstrap-confirmation.js"></script>
<script src="resources/js/bootstrap-confirmation.min.js"></script>
<script src="resources/js/Gruntfile.js"></script>
<script>
    $('[data-toggle=confirmation]').confirmation({
        rootSelector: '[data-toggle=confirmation]',
        // other options
    });
</script>

<script>
    console.log('Bootstrap ' + $.fn.tooltip.Constructor.VERSION);
    console.log('Bootstrap Confirmation ' + $.fn.confirmation.Constructor.VERSION);

    $('[data-toggle=confirmation]').confirmation({
        rootSelector: '[data-toggle=confirmation]',
        container: 'body'
    });
    $('[data-toggle=confirmation-singleton]').confirmation({
        rootSelector: '[data-toggle=confirmation-singleton]',
        container: 'body'
    });
    $('[data-toggle=confirmation-popout]').confirmation({
        rootSelector: '[data-toggle=confirmation-popout]',
        container: 'body'
    });

    $('#confirmation-delegate').confirmation({
        selector: 'button'
    });

    var currency = '';
    $('#custom-confirmation').confirmation({
        rootSelector: '#custom-confirmation',
        container: 'body',
        title: null,
        onConfirm: function(currency) {
            alert('You choosed ' + currency);
        },
        buttons: [
            {
                class: 'btn btn-danger',
                icon: 'glyphicon glyphicon-usd',
                value: 'US Dollar'
            },
            {
                class: 'btn btn-primary',
                icon: 'glyphicon glyphicon-euro',
                value: 'Euro'
            },
            {
                class: 'btn btn-warning',
                icon: 'glyphicon glyphicon-bitcoin',
                value: 'Bitcoin'
            },
            {
                class: 'btn btn-default',
                icon: 'glyphicon glyphicon-remove',
                cancel: true
            }
        ]
    });

    $('#custom-confirmation-links').confirmation({
        rootSelector: '#custom-confirmation-link',
        container: 'body',
        title: null,
        buttons: [
            {
                label: 'Twitter',
                attr: {
                    href: 'https://twitter.com'
                }
            },
            {
                label: 'Facebook',
                attr: {
                    href: 'https://facebook.com'
                }
            },
            {
                label: 'Pinterest',
                attr: {
                    href: 'https://pinterest.com'
                }
            }
        ]
    });
</script>

<script>
    document.write('<script src="//' + location.host.split(':')[0] + ':35729/livereload.js" async defer><' + '/script>');
</script>

</c:if>

<c:if  test="${sessionScope['usuario'] == null}">
    <% response.sendRedirect("Login");  %>
</c:if>

</body>
</html>
