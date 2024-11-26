package locacaodvds.controladores;

import locacaodvds.dao.AtorDAO;
import locacaodvds.entidades.Ator;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AtorServlet", urlPatterns = {"/processaAtor"})
public class AtorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        AtorDAO dao = null;
        RequestDispatcher disp = null;

        try {
            dao = new AtorDAO();

            if (acao.equals("inserir")) {
                String nome = request.getParameter("nome");
                String sobrenome = request.getParameter("sobrenome");
                String dataEstreiaStr = request.getParameter("data_estreia");

                // Parse the debut date (assuming the date is in yyyy-MM-dd format)
                java.sql.Date dataEstreia = java.sql.Date.valueOf(dataEstreiaStr);

                Ator ator = new Ator();
                ator.setNome(nome);
                ator.setSobrenome(sobrenome);
                ator.setData_estreia(dataEstreia);

                dao.salvar(ator);
                disp = request.getRequestDispatcher("/formulario/ator/listagem.jsp");

            } else if (acao.equals("alterar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String nome = request.getParameter("nome");
                String sobrenome = request.getParameter("sobrenome");
                String dataEstreiaStr = request.getParameter("data_estreia");

                java.sql.Date dataEstreia = java.sql.Date.valueOf(dataEstreiaStr);

                Ator ator = new Ator();
                ator.setId(id);
                ator.setNome(nome);
                ator.setSobrenome(sobrenome);
                ator.setData_estreia(dataEstreia);

                dao.atualizar(ator);
                disp = request.getRequestDispatcher("/formulario/ator/listagem.jsp");

            } else if (acao.equals("excluir")) {
                int id = Integer.parseInt(request.getParameter("id"));

                Ator ator = new Ator();
                ator.setId(id);
                dao.excluir(ator);
                disp = request.getRequestDispatcher("/formulario/ator/listagem.jsp");

            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                Ator ator = dao.obterPorId(id);
                request.setAttribute("ator", ator);

                if (acao.equals("prepararAlteracao")) {
                    disp = request.getRequestDispatcher("/formulario/ator/alterar.jsp");
                } else if (acao.equals("prepararExclusao")) {
                    disp = request.getRequestDispatcher("/formulario/ator/excluir.jsp");
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
        return "AtorServlet";
    }
}
