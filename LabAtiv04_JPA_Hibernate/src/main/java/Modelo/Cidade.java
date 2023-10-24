package Modelo;
/*
 * @author Cadilhe
 */
public class Cidade {
        private int codigo_cidade;
        private String nome;
        private String UF;
        private float taxa;

        public Cidade(int codigo_cidade, String nome) {
            this.codigo_cidade = codigo_cidade;
            this.nome = nome;
        }
        
        public int getCodigo() {
            return codigo_cidade;
        }

        public void setCodigo(int codigo_cidade) {
            this.codigo_cidade = codigo_cidade;
        }

        public String getNome() {
            return nome;
        }

        public void setNome(String nome) {
            this.nome = nome;
        }

        public String getUF() {
            return UF;
        }

        public void setUF(String UF) {
            this.UF = UF;
        }

        public float getTaxa() {
            return taxa;
        }

        public void setTaxa(float taxa) {
            this.taxa = taxa;
        }
        
        
        
        
}
