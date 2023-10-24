package Modelo;
/*
 * @author Cadilhe
 */
public class Frete {
        int cod_Fre,cod_Cid,cod_Cli;
        float peso, valor;
        String descri;

    public Frete(int cod_Fre, int cod_Cid, int cod_Cli) {
        this.cod_Fre = cod_Fre;
        this.cod_Cid = cod_Cid;
        this.cod_Cli = cod_Cli;
    }
        
    public int getCod_Fre() {
        return cod_Fre;
    }

    public void setCod_Fre(int cod_Fre) {
        this.cod_Fre = cod_Fre;
    }

    public int getCod_Cid() {
        return cod_Cid;
    }

    public void setCod_Cid(int cod_Cid) {
        this.cod_Cid = cod_Cid;
    }

    public int getCod_Cli() {
        return cod_Cli;
    }

    public void setCod_Cli(int cod_Cli) {
        this.cod_Cli = cod_Cli;
    }

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public String getDescri() {
        return descri;
    }

    public void setDescri(String descri) {
        this.descri = descri;
    }
}
