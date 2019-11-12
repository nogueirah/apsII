<%@page import="dao.FuncionarioDAO"%>
<%@page import="classes.Funcionario"%>
<%
    String login = request.getParameter("log");
    String senha = request.getParameter("senha").toString();
    
    Funcionario fun = new Funcionario();
    fun.setLogin(login);
    fun.setSenha(senha);
    
    String resp = new FuncionarioDAO().loginFun(fun);
    
    if(resp.equals("ok")){
        response.sendRedirect("homeAdm.jsp");
    }else{
        response.sendRedirect("LoginAdm.jsp?Login-ou-senha-incorretos");
    }
    
%>