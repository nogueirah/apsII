<%@page import="java.util.ArrayList"%>
<%@page import="classes.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%
    //Recupera valor de pesquisa e usa default como vazio
    String pesq = request.getParameter("pesq");
    pesq = pesq == null ? "" : pesq;
    
    //Recupera os medicamentos
    ArrayList<Cliente> lista = new ClienteDAO().getLista(pesq);

    //Imprime tabela com resultados
    out.println("<table border='1' width=300px>");
    
    for (Cliente cli : lista) {
        out.println("<tr>");
        
        out.println("<td><a onclick='getCli(" + cli.getCpfCli().toString() +  ");'> " + cli.getNomeCli() +"</a></td>");
        
        out.println("</tr>");
    }
    out.println("</table>");
%>