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
    
    <div id="entrada">
        <h1>OFFICE PARK</h1>
        <form id="login" action="loginFun.jsp" method="post">
            Login:
            <input type="text" name="log" required>
            <br><br>Senha:
            <input type="password" name="senha" required>
            <br><br>
            <input type="submit" id="entrar" value="Entrar">
        </form>
    </div>
    <footer>
        <p id="copy">&copy; 2019 - Office Park</p>
    </footer>
</body>
</html>
