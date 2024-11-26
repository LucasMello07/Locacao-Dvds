<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="generos" class="locacaodvds.servicos.GeneroServices" scope="page" />
<jsp:useBean id="classificacoes" class="locacaodvds.servicos.ClassificacaoServices" scope="page" />
<jsp:useBean id="atores" class="locacaodvds.servicos.AtorServices" scope="page" />
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
    <head>
        <title>Alterar DVD</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${cp}/css/Ator Css/alterarAtor.css"/>
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
            <h2>Alterar DVD</h2>

            <form method="post" action="${cp}/processaDvd">
                <input name="acao" type="hidden" value="alterar"/>
                <input name="id" type="hidden" value="${requestScope.dvd.id}"/>

                <table class="form-table">
                    <tr>
                        <td class="alinharDireita">Título:</td>
                        <td>
                            <input name="titulo" type="text" maxlength="100" value="${requestScope.dvd.titulo}" required class="form-input"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Ano de Lançamento:</td>
                        <td>
                            <input name="ano_lancamento" type="number" value="${requestScope.dvd.ano_lancamento}" required class="form-input"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Duração (min):</td>
                        <td>
                            <input name="duracao_minutos" type="number" value="${requestScope.dvd.duracao_minutos}" required class="form-input"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Data de Lançamento:</td>
                        <td>
                            <input name="data_lancamento" type="date" value="${requestScope.dvd.data_lancamento}" required class="form-input"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Gênero:</td>
                        <td>
                            <select name="genero_id" class="form-input">
                                <c:forEach items="${generos.todos}" var="genero">
                                    <option value="${genero.id}" 
                                            <c:if test="${requestScope.dvd.genero.id eq genero.id}">selected</c:if>>
                                        ${genero.descricao}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Classificação Etária:</td>
                        <td>
                            <select name="classificacao_etaria_id" class="form-input">
                                <c:forEach items="${classificacoes.todos}" var="classificacao">
                                    <option value="${classificacao.id}" 
                                            <c:if test="${requestScope.dvd.classificacao_etaria.id eq classificacao.id}">selected</c:if>>
                                        ${classificacao.descricao}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Ator Principal:</td>
                        <td>
                            <select name="ator_principal_id" class="form-input">
                                <c:forEach items="${atores.todos}" var="ator">
                                    <option value="${ator.id}" 
                                            <c:if test="${requestScope.dvd.ator_principal.id eq ator.id}">selected</c:if>>
                                        ${ator.nome}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="alinharDireita">Ator Coadjuvante:</td>
                        <td>
                            <select name="ator_coadjuvante_id" class="form-input">
                                <c:forEach items="${atores.todos}" var="ator">
                                    <option value="${ator.id}" 
                                            <c:if test="${requestScope.dvd.ator_coadjuvante.id eq ator.id}">selected</c:if>>
                                        ${ator.nome}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                </table>

                <div class="button-container-inline">
                    <a href="${cp}/formulario/dvds/listagem.jsp" class="button-secondary">Voltar</a>
                    <input type="submit" value="Alterar" class="button-primary"/>
                </div>
            </form>
        </div>

        <script>
            function toggleSidebar() {
                var sidebar = document.getElementById('sidebar');
                sidebar.classList.toggle('collapsed');
            }
        </script>
    </body>
</html>
