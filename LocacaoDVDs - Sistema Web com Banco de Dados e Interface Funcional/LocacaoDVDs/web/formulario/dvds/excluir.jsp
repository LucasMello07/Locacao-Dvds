<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
    <head>
        <title>Excluir DVD</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${cp}/css/Dvd Css/excluirDvd.css"/>
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
            <a href="${cp}/formulario/genero/listagem.jsp"><i class="fas fa-tags"></i> Genêros</a>
        </div>

        <!-- Main content -->
        <div class="main-content">
            <h1>Excluir DVD</h1>

            <form method="post" action="${cp}/processaDvd">
                <input name="acao" type="hidden" value="excluir"/>
                <input name="id" type="hidden" value="${requestScope.dvd.id}"/>
                <table>
                    <tr>
                        <td class="alinharDireita">Título:</td>
                        <td>${requestScope.dvd.titulo}</td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Ano de Lançamento:</td>
                        <td>${requestScope.dvd.ano_lancamento}</td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Duração (min):</td>
                        <td>${requestScope.dvd.duracao_minutos}</td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Data de Lançamento:</td>
                        <td>
                            <fmt:formatDate value="${requestScope.dvd.data_lancamento}" pattern="dd/MM/yyyy"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Gênero:</td>
                        <td>${requestScope.dvd.genero.descricao}</td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Classificação Etária:</td>
                        <td>${requestScope.dvd.classificacao_etaria.descricao}</td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Ator Principal:</td>
                        <td>${requestScope.dvd.ator_principal.nome} ${requestScope.dvd.ator_principal.sobrenome}</td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Ator Coadjuvante:</td>
                        <td>${requestScope.dvd.ator_coadjuvante.nome} ${requestScope.dvd.ator_coadjuvante.sobrenome}</td>
                    </tr>
                </table>

                <div class="button-container">
                    <a href="${cp}/formulario/dvds/listagem.jsp" class="button-secondary"><i></i> Voltar</a>
                    <input type="submit" value="Excluir"/>
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
