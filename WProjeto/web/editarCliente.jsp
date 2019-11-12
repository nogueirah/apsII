<%-- 
    Document   : editarCliente
    Created on : 17/10/2019, 19:44:44
    Author     : logonpta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="home.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
         <script>
            $(document).ready(function () {
                $("#procuraCli").keyup(function () {
                    var pesq = $("#procuraCli").val();
                    $.ajax({
                        url: "ajax/getCli.jsp",
                        type: "GET",
                        data: {
                            pesq: pesq
                        },
                        beforeSend: function () {
                            $("#listaclientes").html("Carregando...");
                        },
                        success: function (data) {
                            $("#listaclientes").html(data);
                        },
                        error: function (xhr) {
                            $("#listaclientes").html(xhr.responseText);
                        }
                    });
                });
            });
            
            function getCli(a){
                var cpf = a;
                $.ajax({
                    url: "ajax/getcliente.jsp",
                    type: "GET",
                    data: {
                        cpf : cpf
                    },
                    success: function (data) {
                        comerc = $(data).find("comercial").text();
                        alert(comerc);
                    }
                });
            } 
        </script>
        <title>Home ADM</title>
    </head>
    <body>
            <header>
                <h1 id="homePage" class="float-l"><a href="HomePage.jsp">OFFICE PARK</a></h1>
                <nav class="float-r">
                </nav>
            </header>
    
        
        <div class="formReserva" align="center">
            <font color="red"> Digite o CPF: </font>
            <input type="text" name="procuraCli" id="procuraCli" placeholder="CPF do Cliente">
        <br>
        <div id="listaclientes"></div>
        
        <div class="homeCad">
        <form id="editarCliForm" action="editarCadCli.jsp">
            <br><br>
            E-mail:
            <input type="email" id="emailCli" name="emailCli" required>
            <br><br>
            Senha:
            <input type="password" id="senhaCli" name="senhaCli" required>
            <br><br>
            Nome completo:
            <input type="text" id="nomeCli" name="nomeCli" required>
            <br><br>
            CPF:
            <input type="text" id="cpfCli" name="cpfCli" required>
            <br><br>
            Celular:
            <input type="text" id="celCli" name="celCli" required>
            <br><br>
            PCD:
            <input type="radio" name="pcdCli" value="Sim">Sim
            <input type="radio" name="pcdCli" value="Nao" checked="true">Não
            <br><br>
            Tipo Cliente:
            <select name="tipoCli" id="tipoCli">
                <option value="1">Avulso</option>
                <option value="2">Mensalsita</option>
                
            </select>
            <br><br>
            Bloqueado:
            <input type="radio" name="bloqCli" value="nao">Não
            <input type="radio" name="bloqCli" value="sim">Sim
            <br>
            
            <input type="submit" id="editarCli" value="Editar">
            
            
        </form>
       
    </div>
        </div>
        
    <footer>
        <p id="copy">&copy; 2019 - Office Park</p>
    </footer>
    </body>
</html>
