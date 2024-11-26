<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
    <head>
        <title>Alterar Gênero</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${cp}/css/Classificacao Css/alterarClassificacao.css"/>
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
            <h1>Alterar Gênero</h1>

            <form method="post" action="${cp}/processaGenero">
                <input name="acao" type="hidden" value="alterar"/>
                <input name="id" type="hidden" value="${requestScope.genero.id}"/>

                <table>
                    <tr>
                        <td class="alinharDireita">Descrição:</td>
                        <td>
                            <input name="descricao" type="text" size="20" maxlength="30" value="${requestScope.genero.descricao}"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="button-container">
                            <a href="${cp}/formulario/genero/listagem.jsp" class="button-secondary">Voltar</a>
                        </td>
                        <td class="alinharDireita">
                            <input type="submit" value="Alterar"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>

    </body>
</html>
