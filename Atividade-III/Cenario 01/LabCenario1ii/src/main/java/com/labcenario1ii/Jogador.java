package com.labcenario1ii;
/*
 * @author Cadilhe
 */

public class Jogador {
    private int id;
    private int anoNasc;
    private double altura;
    private Times time;
    
    public Jogador(Times timeOndeJoga) {
        this.time=timeOndeJoga;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAnoNasc() {
        return anoNasc;
    }

    public void setAnoNasc(int anoNasc) {
        this.anoNasc = anoNasc;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }
    
    public Times getTimes(){
        return this.time;
    } 
    
    public void setTimes(Times timeMudou){
        this.time=timeMudou;
    }
    
}
