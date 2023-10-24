package com.labcenario1ii;
/*
 * @author Cadilhe
 */
public class Resultado {
    int numGolsMandante,numGolsVisitante;
    Partida partida;
    
    public Resultado(int golsMandante,int golsVisitante,Partida partida){
        this.numGolsMandante=golsMandante;
        this.numGolsVisitante=golsVisitante;
        this.partida=partida;
    }

    public int getNumGolsMandante() {
        return numGolsMandante;
    }

    public void setNumGolsMandante(int numGolsMandante) {
        this.numGolsMandante = numGolsMandante;
    }

    public int getNumGolsVisitante() {
        return numGolsVisitante;
    }

    public void setNumGolsVisitante(int numGolsVisitante) {
        this.numGolsVisitante = numGolsVisitante;
    }
    
    public boolean jogoSaiuEmpatado(){
        return (this.numGolsMandante==this.numGolsVisitante);
    }
}
