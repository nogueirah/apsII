 <!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reservar Vagas</title>
    <link rel="stylesheet" type="text/css" href="home.css">
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
    <div class="formReserva" align="center">
            <form class ="formulario">
                
                    <%
                        String nomeA = request.getSession().getAttribute("nome").toString();
                    %>
                    Cliente: 
                    <input type="text" id="nomeCli" value="<%=nomeA%>" readonly>
                    <br><br>
                    Veículo: 
                    <input type="radio" name="tipo" value="Carro" checked>Carro
                    <input type="radio" name="tipo" value="Moto">Motocicleta
                    <br><br>
                    Data:
                    <input type="date" id="dataReserva" value="">
                    <br><br>
                    Selecione o Período:
                    <br>
                    <select id="periodo">
                        <option value="manha">Manhã(06:00 - 11:59)</option>
                        <option value="tarde">Tarde(12:00 - 17:59)</option>
                        <option value="noite">Noite(18:00 - 23:59)</option>
                    </select>
                    <br><br>
                    <input type="button" id="btnReserva" value="Reservar">
                    <br>
                    
            
                </form>
        <button id="btnReserva" value="Editar"><a href="editarClienteC.jsp">Editar</a></button>
    </div>
    

    <footer>
        <p id="copy">&copy; 2019 - Office Park</p>
    </footer>

</body>
</html>