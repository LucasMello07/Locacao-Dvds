<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="generos" class="locacaodvds.dao.GeneroDAO" scope="request" />
<jsp:useBean id="classificacoes" class="locacaodvds.dao.ClassificacaoDAO" scope="request" />
<jsp:useBean id="atores" class="locacaodvds.dao.AtorDAO" scope="request" />
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
    <head>
        <title>Novo DVD</title>
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
            <h2>Adicionar Novo DVD</h2>

            <form method="post" action="${cp}/processaDvd">
                <input type="hidden" name="acao" value="inserir" />

                <table class="form-table">
                    <tr>
                        <td class="alinharDireita">Título:</td>
                        <td>
                            <input type="text" id="titulo" name="titulo" required class="form-input"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Ano de Lançamento:</td>
                        <td>
                            <input type="number" id="ano_lancamento" name="ano_lancamento" required class="form-input" min="1800"/>
                        </td>

                    </tr>
                    <tr>
                        <td class="alinharDireita">Duração (minutos):</td>
                        <td>
                            <input type="number" id="duracao_minutos" name="duracao_minutos" required class="form-input"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Data de Lançamento:</td>
                        <td>
                            <input type="date" id="data_lancamento" name="data_lancamento" required class="form-input"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Gênero:</td>
                        <td>
                            <select id="genero_id" name="genero_id" required class="form-input">
                                <c:forEach var="genero" items="${generos.listarTodos()}">
                                    <option value="${genero.id}">${genero.descricao}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Classificação Etária:</td>
                        <td>
                            <select id="classificacao_etaria_id" name="classificacao_etaria_id" required class="form-input">
                                <c:forEach var="classificacao" items="${classificacoes.listarTodos()}">
                                    <option value="${classificacao.id}">${classificacao.descricao}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Ator Principal:</td>
                        <td>
                            <select id="ator_principal_id" name="ator_principal_id" required class="form-input">
                                <c:forEach var="ator" items="${atores.listarTodos()}">
                                    <option value="${ator.id}">${ator.nome} ${ator.sobrenome}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Ator Coadjuvante:</td>
                        <td>
                            <select id="ator_coadjuvante_id" name="ator_coadjuvante_id" required class="form-input">
                                <c:forEach var="ator" items="${atores.listarTodos()}">
                                    <option value="${ator.id}">${ator.nome} ${ator.sobrenome}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                </table>

                <div class="button-container-inline">
                    <button onclick="window.location.href = '${cp}/formulario/dvds/listagem.jsp'" class="button-secondary">Voltar</button>
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
