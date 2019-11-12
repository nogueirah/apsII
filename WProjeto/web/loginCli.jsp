<%@page import="dao.ClienteDAO"%>
<%@page import="classes.Cliente"%>
<%
    String login = request.getParameter("login");
    String senha = request.getParameter("senha").toString();
    
    Cliente cli = new Cliente();
    cli.setEmailCli(login);
    cli.setSenhaCli(senha);
    
    
   
    cli = new ClienteDAO().loginCli(cli);
    
    if(cli.getEmailCli().equals("invalido")){
    
       response.sendRedirect("LoginCliente.jsp?Email-ou-senha-incorretos");
        
        
    }else{
        
        request.getSession().setAttribute("cpf", cli.getCpfCli());
        request.getSession().setAttribute("nome", cli.getNomeCli());
        request.getSession().setAttribute("email", cli.getEmailCli());
        request.getSession().setAttribute("senha", cli.getSenhaCli());
        request.getSession().setAttribute("celular", cli.getCelularCli());
        response.sendRedirect("reservarVagas.jsp");
    }
    
%>