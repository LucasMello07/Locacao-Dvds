package locacaodvds.controladores;

import locacaodvds.dao.GeneroDAO;
import locacaodvds.entidades.Genero;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "GeneroServlet", urlPatterns = {"/processaGenero"})
public class GeneroServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        GeneroDAO dao = null;
        RequestDispatcher disp = null;

        try {
            dao = new GeneroDAO();

            if (acao.equals("inserir")) {
                String descricao = request.getParameter("descricao");

                Genero genero = new Genero();
                genero.setDescricao(descricao);

                dao.salvar(genero);
                disp = request.getRequestDispatcher("/formulario/genero/listagem.jsp");

            } else if (acao.equals("alterar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String descricao = request.getParameter("descricao");

                Genero genero = new Genero();
                genero.setId(id);
                genero.setDescricao(descricao);

                dao.atualizar(genero);
                disp = request.getRequestDispatcher("/formulario/genero/listagem.jsp");

            } else if (acao.equals("excluir")) {
                int id = Integer.parseInt(request.getParameter("id"));

                Genero genero = new Genero();
                genero.setId(id);
                dao.excluir(genero);
                disp = request.getRequestDispatcher("/formulario/genero/listagem.jsp");

            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                Genero genero = dao.obterPorId(id);
                request.setAttribute("genero", genero);

                if (acao.equals("prepararAlteracao")) {
                    disp = request.getRequestDispatcher("/formulario/genero/alterar.jsp");
                } else if (acao.equals("prepararExclusao")) {
                    disp = request.getRequestDispatcher("/formulario/genero/excluir.jsp");
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
        return "GeneroServlet";
    }
}
