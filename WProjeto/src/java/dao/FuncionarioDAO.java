
package dao;

import classes.Funcionario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class FuncionarioDAO {
      public String loginFun(Funcionario funcionario){
         String resp = "";

        try {
            Connection con = Conecta.getConexao();
            String sql = "select * from funcionario where login=? and senha=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, funcionario.getLogin());
            ps.setString(2, funcionario.getSenha());
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                funcionario.setLogin(rs.getString("login"));
                funcionario.setSenha(rs.getString("senha"));
               
                 resp="ok";
            }
            
            
            
            rs.close();
            ps.close();
            con.close();
        
    } catch(Exception e){
        resp = "k";
    
}
        return resp;
    }
}
