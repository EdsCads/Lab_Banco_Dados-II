package com.labcenario1ii;
/*
 * @author Cadilhe
 */

import java.util.ArrayList;

public class Times {
    private int Id;
    private String nome;
    private ArrayList <Campeonato> campeonato = new  ArrayList <Campeonato>();

    public Times() {    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    } 

    public ArrayList<Campeonato> getCampeonato() {
        return campeonato;
    }

    public void add(Campeonato champ) {
        this.campeonato.add(champ);
    }
    
}
