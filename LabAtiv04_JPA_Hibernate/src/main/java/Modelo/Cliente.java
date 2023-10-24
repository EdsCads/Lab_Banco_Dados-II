package Modelo;
/*
 * @author Cadilhe
 */

@Entity
public class Cliente {
         @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
        int codigo;
         
         @Column(nullable = false)
        String nome;
         
         @Column(nullable = false)        
        String endereco;
         
         @Column(nullable = false)        
        String telefone;

    public Cliente(int codigo, String nome, String endereco, String telefone) {
        this.codigo = codigo;
        this.nome = nome;
        this.endereco = endereco;
        this.telefone = telefone;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
        
        
}
