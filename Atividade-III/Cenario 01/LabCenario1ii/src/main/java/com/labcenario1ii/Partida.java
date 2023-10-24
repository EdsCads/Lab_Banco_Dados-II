package com.labcenario1ii;
/*
 * @author Cadilhe
 */

public class Partida {
    private Times timeMandante;
    private Times timeVisitante;
    private Estadio estadio;
    
    private int id;
    private String data;
    
    

    public Partida(Times timeMandante, Times timeVisitante, Estadio estadio) {
        this.timeMandante = timeMandante;
        this.timeVisitante = timeVisitante;
        this.estadio = estadio;
    }

    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public void setTimeMandante(Times timeMandante) {
        this.timeMandante = timeMandante;
    }
    
    public Times getTimeMandante() {
        return timeMandante;
    }

    public void setTimeVisitante(Times timeVisitante) {
        this.timeVisitante = timeVisitante;
    }

    public Times getTimeVisitante() {
        return timeVisitante;
    }

    public void setEstadio(Estadio estadio) {
        this.estadio = estadio;
    }

    public Estadio getEstadio() {
        return estadio;
    }
  
    
}
