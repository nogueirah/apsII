<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1">
    <title>Office Park</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    <script src="script.js"></script>
</head>

<body>
    <header>
        <h1 id="homePage" class="float-l"><a href="HomePage.jsp">OFFICE PARK</a></h1>
        <nav class="float-r">
            <ul class="list-auto">
                <li>
                    <a href="LoginCliente.jsp" title="Cliente">Cliente</a>
                </li>
                <li>
                    <a href="LoginAdm.jsp" title="Adm">Adm</a>
                </li>
            </ul>



        </nav>

    </header>
    <div class="homeCad">
        <h1>OFFICE PARK</h1>
        <form id="cadastro" action="cadastrar.jsp">
            E-mail:
            <input type="email" id="emailCli" name="emailCli" required>
            <br><br>
            Senha:
            <input type="password" id="senhaCli" name="senhaCli" required>
            <br><br>
            Confirmar senha:
            <input type="password" id="confirma" required>
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
            <input type="submit" id="cadastrarCli" value="Cadastrar">
            
             <%
            String resp = request.getParameter("resp");
            if(resp != null){
                out.println(resp);
            }
        %>
        </form>
       
    </div>
    <footer>
        <p id="copy">&copy; 2019 - Office Park</p>
    </footer>
</body>
    
<script>
    var password = document.getElementById("senhaCli")
    , confirma = document.getElementById("confirma");
    
    function validaPassword(){
        if(password.value != confirma.value) {
            confirma.setCustomValidity("Senhas diferentes!");
        } else{
            confirma.setCustomValidity('');
        }
    }
    
    password.onchange = validaPassword;
    confirma.onkeyup = validaPassword;
    
</script>    

</html>