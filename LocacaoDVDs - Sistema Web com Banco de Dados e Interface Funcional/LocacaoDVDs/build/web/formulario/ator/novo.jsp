<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
    <head>
        <title>Novo Ator</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${cp}/css/index.css"/>
        <link rel="stylesheet" href="${cp}/css/Ator Css/listagemAtor.css"/>
        <link rel="stylesheet" href="${cp}/css/Ator Css/novoAtor.css"/>
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
            <h2>Novo Ator</h2>

            <form method="post" action="${cp}/processaAtor">
                <input name="acao" type="hidden" value="inserir"/>

                <table class="form-table">
                    <tr>
                        <td class="alinharDireita">Nome:</td>
                        <td>
                            <input name="nome" type="text" size="20" maxlength="50" required class="form-input"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Sobrenome:</td>
                        <td>
                            <input name="sobrenome" type="text" size="20" maxlength="50" required class="form-input"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Data de Estreia:</td>
                        <td>
                            <input name="data_estreia" type="date" required class="form-input"/>
                        </td>
                    </tr>
                </table>

                <!-- Botões no final -->
                <div class="button-container-inline">
                    <a href="${cp}/formulario/ator/listagem.jsp" class="button-secondary">Voltar</a>
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
