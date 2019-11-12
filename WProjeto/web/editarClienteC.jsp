

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
                $("#btnEditarCliC").click(function () {
                    $.ajax({
                        url: "ajax/editarCliC.jsp",
                        type: "post",
                        async: false,
                        data: $("#editarCliForm").serialize(),
                        success: function (data) {
                            if (data.sucesso) {
                                alert(data.mensagem);
                                $('#editarCliForm').each(function () {
                                    this.reset();
                                });
                            }
                            else {
                                alert(data.mensagem);
                            }
                        }
                    })
                });
            });
            
        </script>
        <title>Home ADM</title>
    </head>
    <body>
            <header>
                <h1 id="homePage" class="float-l"><a href="HomePage.jsp">OFFICE PARK</a></h1>
                <nav class="float-r">
                </nav>
            </header>
    
        <%
            String cpfC = request.getSession().getAttribute("cpf").toString();
            String nomeC = request.getSession().getAttribute("nome").toString();
            String emailC = request.getSession().getAttribute("email").toString();
            String senhaC = request.getSession().getAttribute("senha").toString();
            String celC = request.getSession().getAttribute("celular").toString();
        %>
        
        <div class="homeCad">
        <form id="editarCliForm" name="editarCliForm" action="%" method="post">
            <br><br>
            CPF:
            <input type="text" id="cpfCliEditarC" name="cpfCliC" value="<%=cpfC%>" readonly>
            
            <br><br>
            E-mail:
            <input type="email" id="emailCliEditarC" name="emailCliC" value="<%=emailC%>" required>
            <br><br>
            Senha:
            <input type="password" id="senhaCliEditarC" name="senhaCliC" value="<%=senhaC%>" required>
            <br><br>
            Nome completo:
            <input type="text" id="nomeCliEditarC" name="nomeCliC" value="<%=nomeC%>" required>
            <br><br>
       
            Celular:
            <input type="text" id="celCliEditarC" name="celCliC" value="<%=celC%>" required>
     
            <br><br>

            
            
            
            
        </form>
       
            <input type="button" id="btnEditarCliC" name="btnEditarCliC" value="Editar">
    </div>
     
        
    <footer>
        <p id="copy">&copy; 2019 - Office Park</p>
    </footer>
    </body>
</html>
