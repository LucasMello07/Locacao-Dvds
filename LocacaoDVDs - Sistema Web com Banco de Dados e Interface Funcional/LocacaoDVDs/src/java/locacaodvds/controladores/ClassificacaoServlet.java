package locacaodvds.controladores;

import locacaodvds.dao.ClassificacaoDAO;
import locacaodvds.entidades.Classificacao;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ClassificacaoServlet", urlPatterns = {"/processaClassificacao"})
public class ClassificacaoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        ClassificacaoDAO dao = null;
        RequestDispatcher disp = null;

        try {
            dao = new ClassificacaoDAO();

            if (acao.equals("inserir")) {
                String descricao = request.getParameter("descricao");

                Classificacao classificacao = new Classificacao();
                classificacao.setDescricao(descricao);

                dao.salvar(classificacao);
                disp = request.getRequestDispatcher("/formulario/classificacao/listagem.jsp");

            } else if (acao.equals("alterar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String descricao = request.getParameter("descricao");

                Classificacao classificacao = new Classificacao();
                classificacao.setId(id);
                classificacao.setDescricao(descricao);

                dao.atualizar(classificacao);
                disp = request.getRequestDispatcher("/formulario/classificacao/listagem.jsp");

            } else if (acao.equals("excluir")) {
                int id = Integer.parseInt(request.getParameter("id"));

                Classificacao classificacao = new Classificacao();
                classificacao.setId(id);
                dao.excluir(classificacao);
                disp = request.getRequestDispatcher("/formulario/classificacao/listagem.jsp");

            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                Classificacao classificacao = dao.obterPorId(id);
                request.setAttribute("classificacao", classificacao);

                if (acao.equals("prepararAlteracao")) {
                    disp = request.getRequestDispatcher("/formulario/classificacao/alterar.jsp");
                } else if (acao.equals("prepararExclusao")) {
                    disp = request.getRequestDispatcher("/formulario/classificacao/excluir.jsp");
                }
            }
        } catch (SQLException exc) {
            exc.printStackTrace();
        } finally {
            if (dao != null) {
                try {
                    dao.fecharConexao();
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
        return "ClassificacaoServlet";
    }
}
