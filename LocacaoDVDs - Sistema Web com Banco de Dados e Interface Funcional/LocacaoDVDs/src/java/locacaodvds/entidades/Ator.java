package locacaodvds.entidades;

import java.util.Date;

public class Ator {
    private int id;
    private String nome;
    private String sobrenome;
    private Date data_estreia;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public Date getData_estreia() {
        return data_estreia;
    }

    public void setData_estreia(Date data_estreia) {
        this.data_estreia = data_estreia;
    }
    
}
