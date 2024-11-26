package locacaodvds.entidades;

import java.util.Date;

public class Dvds {
     private int id;
     private int ano_lancamento;
     private int duracao_minutos;
     private Date data_lancamento;
     private String titulo;
     private Genero genero;
     private Classificacao classificacao_etaria;
     private Ator ator_principal;
     private Ator ator_coadjuvante;

    public int getId() {
        return id;
    }

    public int getAno_lancamento() {
        return ano_lancamento;
    }

    public int getDuracao_minutos() {
        return duracao_minutos;
    }

    public Date getData_lancamento() {
        return data_lancamento;
    }

    public String getTitulo() {
        return titulo;
    }

    public Genero getGenero() {
        return genero;
    }

    public Classificacao getClassificacao_etaria() {
        return classificacao_etaria;
    }

    public Ator getAtor_principal() {
        return ator_principal;
    }

    public Ator getAtor_coadjuvante() {
        return ator_coadjuvante;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setAno_lancamento(int ano_lancamento) {
        this.ano_lancamento = ano_lancamento;
    }

    public void setDuracao_minutos(int duracao_minutos) {
        this.duracao_minutos = duracao_minutos;
    }

    public void setData_lancamento(Date data_lancamento) {
        this.data_lancamento = data_lancamento;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setGenero(Genero genero) {
        this.genero = genero;
    }

    public void setClassificacao_etaria(Classificacao classificacao_etaria) {
        this.classificacao_etaria = classificacao_etaria;
    }

    public void setAtor_principal(Ator ator_principal) {
        this.ator_principal = ator_principal;
    }

    public void setAtor_coadjuvante(Ator ator_coadjuvante) {
        this.ator_coadjuvante = ator_coadjuvante;
    }
}
