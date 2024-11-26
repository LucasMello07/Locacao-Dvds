<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="classificacoes" class="locacaodvds.dao.ClassificacaoDAO" scope="request" />
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
    <head>
        <title>Nova Classificação</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${cp}/css/estilos.css"/>
        <link rel="stylesheet" href="${cp}/css/Dvd Css/novoDvd.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
    </head>
    <body>
        <!-- Sidebar -->
        <div class="sidebar" id="sidebar">
            <div class="sidebar-logo" onclick="toggleSidebar()">
                <i class="fas fa-film"></i> Locadora
            </div>
            <a href="${cp}/formulario/dvds/listagem.jsp"><i class="fas fa-compact-disc"></i> Dvds</a>
            <a href="${cp}/formulario/ator/listagem.jsp"><i class="fas fa-user"></i> Atores</a>
            <a href="${cp}/formulario/classificacao/listagem.jsp"><i class="fas fa-star"></i> Classificações</a>
            <a href="${cp}/formulario/genero/listagem.jsp"><i class="fas fa-tags"></i> Gêneros</a>
        </div>

        <!-- Main content -->
        <div class="main-content">
            <h2>Nova Classificação</h2>

            <form method="post" action="${cp}/processaClassificacao">
                <input type="hidden" name="acao" value="inserir" />

                <table class="form-table">
                    <tr>
                        <td class="alinharDireita">Descrição:</td>
                        <td>
                            <input type="text" id="descricao" name="descricao" required class="form-input"/>
                        </td>
                    </tr>
                </table>

                <div class="button-container-inline">
                    <button onclick="window.location.href = '${cp}/formulario/classificacao/listagem.jsp'" class="button-secondary">Voltar</button>
                    <input type="submit" value="Salvar" class="button-primary"/>
                </div>

            </form>
        </div>

        <script>
            // Função para alternar a classe de colapso na sidebar
            function toggleSidebar() {
                var sidebar = document.getElementById('sidebar');
                sidebar.classList.toggle('collapsed');
            }
        </script>
    </body>
</html>
