<%@page import="classes.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@page contentType="text/xml"%>
<%
    
    String cpf = request.getParameter("cpf");
    

    
    
    Cliente c = new Cliente();
    c = new ClienteDAO().getCli(cpf);
    
    
    out.println("<comercial>");
    out.println("AAAAAAAAAAAAA");
    out.println("</comercial>");
    out.println("<farmaco>");
    
    out.println("</farmaco>");
    out.println("<apresentacao>");
    
    out.println("</apresentacao>");
    
    
    
%>