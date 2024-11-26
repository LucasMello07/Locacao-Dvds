package locacaodvds.dao;

import locacaodvds.entidades.Dvds;
import locacaodvds.entidades.Genero;
import locacaodvds.entidades.Classificacao;
import locacaodvds.entidades.Ator;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class DvdsDAO extends DAO<Dvds> {
    
    public DvdsDAO() throws SQLException {
    }
    
    @Override
    public void salvar(Dvds obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
            "INSERT INTO dvd(titulo, ano_lancamento, duracao_minutos, data_lancamento, "
            + "genero_id, classificacao_etaria_id, ator_principal_id, ator_coadjuvante_id) "
            + "VALUES(?, ?, ?, ?, ?, ?, ?, ?);"
        );
        stmt.setString(1, obj.getTitulo());
        stmt.setInt(2, obj.getAno_lancamento());
        stmt.setInt(3, obj.getDuracao_minutos());
        stmt.setDate(4, new Date(obj.getData_lancamento().getTime()));
        stmt.setInt(5, obj.getGenero().getId());
        stmt.setInt(6, obj.getClassificacao_etaria().getId());
        stmt.setInt(7, obj.getAtor_principal().getId());
        stmt.setInt(8, obj.getAtor_coadjuvante().getId());
        stmt.executeUpdate();
        stmt.close();
    }
    
    @Override
    public void atualizar(Dvds obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
            "UPDATE dvd SET titulo = ?, ano_lancamento = ?, duracao_minutos = ?, data_lancamento = ?, "
            + "genero_id = ?, classificacao_etaria_id = ?, ator_principal_id = ?, ator_coadjuvante_id = ? "
            + "WHERE id = ?;"
        );
        stmt.setString(1, obj.getTitulo());
        stmt.setInt(2, obj.getAno_lancamento());
        stmt.setInt(3, obj.getDuracao_minutos());
        stmt.setDate(4, new Date(obj.getData_lancamento().getTime()));
        stmt.setInt(5, obj.getGenero().getId());
        stmt.setInt(6, obj.getClassificacao_etaria().getId());
        stmt.setInt(7, obj.getAtor_principal().getId());
        stmt.setInt(8, obj.getAtor_coadjuvante().getId());
        stmt.setInt(9, obj.getId());
        stmt.executeUpdate();
        stmt.close();
    }
    
    @Override
    public void excluir(Dvds obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
            "DELETE FROM dvd WHERE id = ?;"
        );
        stmt.setInt(1, obj.getId());
        stmt.executeUpdate();
        stmt.close();
    }
    
    @Override
    public List<Dvds> listarTodos() throws SQLException {
        List<Dvds> lista = new ArrayList<>();
        PreparedStatement stmt = getConnection().prepareStatement(
            "SELECT * FROM dvd ORDER BY titulo;"
        );
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Dvds dvd = new Dvds();
            dvd.setId(rs.getInt("id"));
            dvd.setTitulo(rs.getString("titulo"));
            dvd.setAno_lancamento(rs.getInt("ano_lancamento"));
            dvd.setDuracao_minutos(rs.getInt("duracao_minutos"));
            dvd.setData_lancamento(rs.getDate("data_lancamento"));
            
            // Relacionando as entidades associadas
            Genero genero = new GeneroDAO().obterPorId(rs.getInt("genero_id"));
            Classificacao classificacao = new ClassificacaoDAO().obterPorId(rs.getInt("classificacao_etaria_id"));
            Ator atorPrincipal = new AtorDAO().obterPorId(rs.getInt("ator_principal_id"));
            Ator atorCoadjuvante = new AtorDAO().obterPorId(rs.getInt("ator_coadjuvante_id"));
            
            dvd.setGenero(genero);
            dvd.setClassificacao_etaria(classificacao);
            dvd.setAtor_principal(atorPrincipal);
            dvd.setAtor_coadjuvante(atorCoadjuvante);
            
            lista.add(dvd);
        }
        rs.close();
        stmt.close();
        return lista;
    }
    
    @Override
    public Dvds obterPorId(int id) throws SQLException {
        Dvds dvd = null;
        PreparedStatement stmt = getConnection().prepareStatement(
            "SELECT * FROM dvd WHERE id = ?;"
        );
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            dvd = new Dvds();
            dvd.setId(rs.getInt("id"));
            dvd.setTitulo(rs.getString("titulo"));
            dvd.setAno_lancamento(rs.getInt("ano_lancamento"));
            dvd.setDuracao_minutos(rs.getInt("duracao_minutos"));
            dvd.setData_lancamento(rs.getDate("data_lancamento"));
            
            // Relacionando as entidades associadas
            Genero genero = new GeneroDAO().obterPorId(rs.getInt("genero_id"));
            Classificacao classificacao = new ClassificacaoDAO().obterPorId(rs.getInt("classificacao_etaria_id"));
            Ator atorPrincipal = new AtorDAO().obterPorId(rs.getInt("ator_principal_id"));
            Ator atorCoadjuvante = new AtorDAO().obterPorId(rs.getInt("ator_coadjuvante_id"));
            
            dvd.setGenero(genero);
            dvd.setClassificacao_etaria(classificacao);
            dvd.setAtor_principal(atorPrincipal);
            dvd.setAtor_coadjuvante(atorCoadjuvante);
        }
        rs.close();
        stmt.close();
        return dvd;
    }
}
