package dao;

import classes.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClienteDAO {

    public String cadastrarCli(Cliente cliente) {
        String resp = "";

        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO cliente(id_tipo_cliente, bloqueado, pcd, emailCli, senhaCli,"
                    + " nomeCli, cpfCli, celularCli) values(?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, 1);
            ps.setBoolean(2, false);
            ps.setBoolean(3, cliente.isPcd());
            ps.setString(4, cliente.getEmailCli());
            ps.setString(5, cliente.getSenhaCli());
            ps.setString(6, cliente.getNomeCli());
            ps.setString(7, cliente.getCpfCli());
            ps.setString(8, cliente.getCelularCli());

            ps.execute();

            ps.close();

            con.close();

            resp = "Inserido";

        } catch (Exception e) {
            resp = "Erro: " + e.toString();
        }

        return resp;

    }

    public Cliente loginCli(Cliente cliente) {
        Cliente cli = new Cliente();
        String resp = "";

        try {
            Connection con = Conecta.getConexao();
            String sql = "select * from cliente where emailCli=? and senhaCli=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getEmailCli());
            ps.setString(2, cliente.getSenhaCli());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                cli.setEmailCli(rs.getString("emailCli"));
                cli.setSenhaCli(rs.getString("senhaCli"));
                cli.setCpfCli(rs.getString("cpfCli"));
                cli.setNomeCli(rs.getString("nomeCli"));
                cli.setCelularCli(rs.getString("celularCli"));
                resp = "ok";
            } else {
                cli.setEmailCli("invalido");
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            resp = "k";

        }
        return cli;
    }

    public ArrayList<Cliente> getLista(String pesquisa) {
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM cliente WHERE cpfCli LIKE ? ORDER BY nomeCli";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + pesquisa + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cli = new Cliente();
                cli.setNomeCli(rs.getString("nomeCli"));
                cli.setCpfCli(rs.getString("cpfCli"));
                cli.setEmailCli(rs.getString("emailCli"));
                cli.setCelularCli(rs.getString("celularCli"));
                cli.setBloqueado(rs.getBoolean("bloqueado"));
                cli.setId_tipo_cli(rs.getInt("id_tipo_cliente"));
                cli.setSenhaCli(rs.getString("senhaCli"));
                lista.add(cli);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public String editCliC(Cliente cli) {
        String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "set @ID = (select id_cliente from cliente where cpfCli = ?);"
                    + "UPDATE cliente set nomeCli=?, emailCli=?, senhaCli=?, celularCli=? WHERE id_cliente = @ID";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, cli.getCpfCli());
            ps.setString(2, cli.getNomeCli());
            ps.setString(3, cli.getEmailCli());
            ps.setString(4, cli.getSenhaCli());
            ps.setString(5, cli.getCelularCli());

            resp = "ok";

        } catch (Exception e) {
            resp = "Erro";

        }
        return resp;
    }

    public Cliente getCli(String pesquisa) {
        Cliente cli = new Cliente();
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM cliente WHERE cpfCli =?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pesquisa);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                cli.setNomeCli(rs.getString("nomeCli"));
                cli.setCpfCli(rs.getString("cpfCli"));
                cli.setEmailCli(rs.getString("emailCli"));
                cli.setCelularCli(rs.getString("celularCli"));
                cli.setBloqueado(rs.getBoolean("bloqueado"));
                cli.setId_tipo_cli(rs.getInt("id_tipo_cliente"));
                cli.setSenhaCli(rs.getString("senhaCli"));

            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cli;
    }
}
