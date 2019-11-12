<%@page import="dao.ClienteDAO"%>
<%@page import="classes.Cliente"%>
<%
        String pcd = request.getParameter("pcdCli").toString();
        String email = request.getParameter("emailCli").toString();
        String senha = request.getParameter("senhaCli").toString();
        String nome = request.getParameter("nomeCli");
        String cpf = request.getParameter("cpfCli");
        String cel = request.getParameter("celCli");
        

        Cliente cliente = new Cliente();
        
        cliente.setCelularCli(cel);
        cliente.setCpfCli(cpf);
        cliente.setEmailCli(email);
        cliente.setNomeCli(nome);
        cliente.setSenhaCli(senha);
        
        if(pcd.equals("Nao")){
            cliente.setPcd(false);
        } else{
            cliente.setPcd(true);
        }

        String resp = new ClienteDAO().cadastrarCli(cliente);
        
        response.sendRedirect("Cadastro.jsp?" + resp);
    

%>