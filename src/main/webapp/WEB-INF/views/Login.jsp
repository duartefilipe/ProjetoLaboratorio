<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>MedLab</title>
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!--Import materialize.css-->
  <link type="text/css" rel="stylesheet" href="resources/css//materialize/css/materialize1.min.css"  media="screen,projection"/>
  
  <link rel="stylesheet" href="resources/css/style.css">

  
</head>

<body>
  <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#login">Login</a></li>
        <li class="tab"><a href="#signup">Cadastrar</a></li>
      </ul>
      
      <div class="tab-content">
      
        <div id="login">
          <h1>Bem Vindo!</h1>

          <form action="login" method="post">
            <div class="field-wrap">
            <label> Login <span class="req"></span></label>
            <input type="text" id="login" name="login" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label> Senha <span class="req"></span>
            </label> <input type="password" id="senha" name="senha" required autocomplete="off"/>
          </div>
          
          <button class="button button-block"/>Logar</button>
          
          </form>

        </div>
        
        <div id="signup">   
          <h1>Cadastre-se</h1>
          
          <form action="CadastrarUsuario" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
              <label> Nome<span class="req">*</span></label>
              <input type="text" name="nome" required autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              <label> Sobrenome <span class="req">*</span></label>
              <input type="text" name="sobrenome" required autocomplete="off"/>
            </div>
          </div>

            <div class="field-wrap">
              <label> Email <span class="req">*</span> </label>
              <input type="text" name="email" required autocomplete="off"/>
            </div>

          <div class="field-wrap">
            <label> Login <span class="req">*</span> </label>
            <input type="text" name="login" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label> Senha <span class="req">*</span></label>
            <input type="password" name="senha" required autocomplete="off"/>
          </div>
          <!--
          <div class="field-wrap">
            <label> Profissao <span class="req">*</span></label>
            <input type="text" name="tipo" required autocomplete="off"/>
          </div>
-->

            <select name="tipo" class="browser-default">
              <option disabled selected >Escolha a profissao</option>
              <option value="medico">Medico</option>
              <option value="outro">Outro</option>
            </select>

            <br>
          
          <button type="submit" class="button button-block"/>Cadastrar</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->

  <!-- modal aviso cadastro inicio -->

  <div class="modal fade" id="modalacadaviso" tabindex="-1" role="dialog" aria-labelledby="myModalcadaviso">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalcadaviso">Realizar Avaliaçao</h4>
        </div>
        <div class="modal-body">

        </div>
        <div class="modal-footer">

        </div>
      </div>
    </div>
  </div>

  <!-- modal aviso cadastro fim -->


  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="resources/js/index.js"></script>

  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="resources/js/materialize/js/materialize1.min.js"></script>

</body>
</html>