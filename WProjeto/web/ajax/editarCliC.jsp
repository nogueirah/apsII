<%@page import="org.json.JSONObject"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="classes.Cliente"%>
<%
    
    String senha = request.getParameter("senhaCliC").toString();
    String email = request.getParameter("emailCliC").toString();
    String nome = request.getParameter("nomeCliC").toString();
    String cpf = request.getParameter("senhaCliC").toString();
    String celular = request.getParameter("celCliC").toString();
    
    Cliente cli = new Cliente();
    cli.setEmailCli(email);
    cli.setSenhaCli(senha);
    cli.setNomeCli(nome);
    cli.setCelularCli(celular);
    cli.setCpfCli(cpf);
    
    String resp = new ClienteDAO().editCliC(cli);
    
    

    
    JSONObject json = new JSONObject();

    out.clear();
    if (resp.equals("ok")) {
        json.put("sucesso", true);
        json.put("mensagem", "Cadastro editado com sucesso");
    } else {
        json.put("sucesso", false);
        json.put("mensagem", "Erro na edição: " + resp);
    }

    out.println(json.toString());
    out.flush();

%>