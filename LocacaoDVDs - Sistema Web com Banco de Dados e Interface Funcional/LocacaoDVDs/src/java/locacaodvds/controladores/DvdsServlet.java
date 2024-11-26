package locacaodvds.controladores;

import locacaodvds.dao.DvdsDAO;
import locacaodvds.entidades.Dvds;
import locacaodvds.entidades.Genero;
import locacaodvds.entidades.Classificacao;
import locacaodvds.entidades.Ator;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DvdsServlet", urlPatterns = {"/processaDvd"})
public class DvdsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        DvdsDAO dvdsDAO = null;
        RequestDispatcher disp = null;

        try {
            dvdsDAO = new DvdsDAO();

            if ("inserir".equals(acao)) {
                // Extração e conversão dos parâmetros da requisição
                String titulo = request.getParameter("titulo");
                int anoLancamento = Integer.parseInt(request.getParameter("ano_lancamento"));
                int duracaoMinutos = Integer.parseInt(request.getParameter("duracao_minutos"));
                String dataLancamentoStr = request.getParameter("data_lancamento");
                java.sql.Date dataLancamento = java.sql.Date.valueOf(dataLancamentoStr);

                int generoId = Integer.parseInt(request.getParameter("genero_id"));
                int classificacaoId = Integer.parseInt(request.getParameter("classificacao_etaria_id"));
                int atorPrincipalId = Integer.parseInt(request.getParameter("ator_principal_id"));
                int atorCoadjuvanteId = Integer.parseInt(request.getParameter("ator_coadjuvante_id"));

                // Criação e configuração do objeto DVD
                Dvds dvd = new Dvds();
                dvd.setTitulo(titulo);
                dvd.setAno_lancamento(anoLancamento);
                dvd.setDuracao_minutos(duracaoMinutos);
                dvd.setData_lancamento(dataLancamento);

                Genero genero = new Genero();
                genero.setId(generoId);
                dvd.setGenero(genero);

                Classificacao classificacao = new Classificacao();
                classificacao.setId(classificacaoId);
                dvd.setClassificacao_etaria(classificacao);

                Ator atorPrincipal = new Ator();
                atorPrincipal.setId(atorPrincipalId);
                dvd.setAtor_principal(atorPrincipal);

                Ator atorCoadjuvante = new Ator();
                atorCoadjuvante.setId(atorCoadjuvanteId);
                dvd.setAtor_coadjuvante(atorCoadjuvante);

                // Inserção do DVD no banco de dados
                dvdsDAO.salvar(dvd);
                disp = request.getRequestDispatcher("/formulario/dvds/listagem.jsp");

            } else if ("alterar".equals(acao)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String titulo = request.getParameter("titulo");
                int anoLancamento = Integer.parseInt(request.getParameter("ano_lancamento"));
                int duracaoMinutos = Integer.parseInt(request.getParameter("duracao_minutos"));
                String dataLancamentoStr = request.getParameter("data_lancamento");
                java.sql.Date dataLancamento = java.sql.Date.valueOf(dataLancamentoStr);

                int generoId = Integer.parseInt(request.getParameter("genero_id"));
                int classificacaoId = Integer.parseInt(request.getParameter("classificacao_etaria_id"));
                int atorPrincipalId = Integer.parseInt(request.getParameter("ator_principal_id"));
                int atorCoadjuvanteId = Integer.parseInt(request.getParameter("ator_coadjuvante_id"));

                Dvds dvd = new Dvds();
                dvd.setId(id);
                dvd.setTitulo(titulo);
                dvd.setAno_lancamento(anoLancamento);
                dvd.setDuracao_minutos(duracaoMinutos);
                dvd.setData_lancamento(dataLancamento);

                Genero genero = new Genero();
                genero.setId(generoId);
                dvd.setGenero(genero);

                Classificacao classificacao = new Classificacao();
                classificacao.setId(classificacaoId);
                dvd.setClassificacao_etaria(classificacao);

                Ator atorPrincipal = new Ator();
                atorPrincipal.setId(atorPrincipalId);
                dvd.setAtor_principal(atorPrincipal);

                Ator atorCoadjuvante = new Ator();
                atorCoadjuvante.setId(atorCoadjuvanteId);
                dvd.setAtor_coadjuvante(atorCoadjuvante);

                dvdsDAO.atualizar(dvd);
                disp = request.getRequestDispatcher("/formulario/dvds/listagem.jsp");

            } else if ("excluir".equals(acao)) {
                int id = Integer.parseInt(request.getParameter("id"));

                Dvds dvd = new Dvds();
                dvd.setId(id);
                dvdsDAO.excluir(dvd);
                disp = request.getRequestDispatcher("/formulario/dvds/listagem.jsp");

            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                Dvds dvd = dvdsDAO.obterPorId(id);
                request.setAttribute("dvd", dvd);

                if ("prepararAlteracao".equals(acao)) {
                    disp = request.getRequestDispatcher("/formulario/dvds/alterar.jsp");
                } else if ("prepararExclusao".equals(acao)) {
                    disp = request.getRequestDispatcher("/formulario/dvds/excluir.jsp");
                }
            }
        } catch (SQLException exc) {
            exc.printStackTrace();
        } finally {
            if (dvdsDAO != null) {
                try {
                    dvdsDAO.fecharConexao();
                } catch (SQLException exc) {
                    exc.printStackTrace();
                }
            }
        }

        if (disp != null) {
            disp.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "DvdsServlet";
    }
}
