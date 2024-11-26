package locacaodvds.servicos;

import locacaodvds.dao.DvdsDAO;
import locacaodvds.entidades.Dvds;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DvdsServices {

    public List<Dvds> getTodos() {
        List<Dvds> lista = new ArrayList<>();
        DvdsDAO dao = null;

        try {
            dao = new DvdsDAO();
            lista = dao.listarTodos();
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

        return lista;
    }
}
