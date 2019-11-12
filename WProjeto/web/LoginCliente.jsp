<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1">
    <title>Office Park</title>
    <link rel="stylesheet" type="text/css" href="home.css">
    <script>
        
    </script>
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
    <div id="entrada">
        <h1>OFFICE PARK</h1>
        <form id="login" action="loginCli.jsp">
            
            E-mail:
            <input type="text" id="log" name="login" required>
            <br><br>Senha:
            <input type="password" id="senha" name="senha" required>
            <br><br>
            <a href="reserva.jsp">
            <input type="submit" id="loginCli" value="Entrar"></a>
            <input type="button" id="cad" value="Cadastrar" onclick=" location.href = 'Cadastro.jsp'">
        </form>
    </div>
    
    <footer>
        <p id="copy">&copy; 2019 - Office Park</p>
    </footer>
</body>
</html>