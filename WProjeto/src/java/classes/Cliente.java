
package classes;


public class Cliente {
    
    private int id_tipo_cli;
    private boolean bloqueado;
    private boolean pcd;
    private String emailCli;
    private String senhaCli;
    private String nomeCli;
    private String cpfCli;
    private String celularCli;

    /**
     * @return the id_tipo_cli
     */
    public int getId_tipo_cli() {
        return id_tipo_cli;
    }

    /**
     * @param id_tipo_cli the id_tipo_cli to set
     */
    public void setId_tipo_cli(int id_tipo_cli) {
        this.id_tipo_cli = id_tipo_cli;
    }

    /**
     * @return the bloqueado
     */
    public boolean isBloqueado() {
        return bloqueado;
    }

    /**
     * @param bloqueado the bloqueado to set
     */
    public void setBloqueado(boolean bloqueado) {
        this.bloqueado = bloqueado;
    }

    /**
     * @return the pcd
     */
    public boolean isPcd() {
        return pcd;
    }

    /**
     * @param pcd the pcd to set
     */
    public void setPcd(boolean pcd) {
        this.pcd = pcd;
    }

    /**
     * @return the emailCli
     */
    public String getEmailCli() {
        return emailCli;
    }

    /**
     * @param emailCli the emailCli to set
     */
    public void setEmailCli(String emailCli) {
        this.emailCli = emailCli;
    }

    /**
     * @return the senhaCli
     */
    public String getSenhaCli() {
        return senhaCli;
    }

    /**
     * @param senhaCli the senhaCli to set
     */
    public void setSenhaCli(String senhaCli) {
        this.senhaCli = senhaCli;
    }

    /**
     * @return the nomeCli
     */
    public String getNomeCli() {
        return nomeCli;
    }

    /**
     * @param nomeCli the nomeCli to set
     */
    public void setNomeCli(String nomeCli) {
        this.nomeCli = nomeCli;
    }

    /**
     * @return the cpfCli
     */
    public String getCpfCli() {
        return cpfCli;
    }

    /**
     * @param cpfCli the cpfCli to set
     */
    public void setCpfCli(String cpfCli) {
        this.cpfCli = cpfCli;
    }

    /**
     * @return the celularCli
     */
    public String getCelularCli() {
        return celularCli;
    }

    /**
     * @param celularCli the celularCli to set
     */
    public void setCelularCli(String celularCli) {
        this.celularCli = celularCli;
    }
    
    
    
}
