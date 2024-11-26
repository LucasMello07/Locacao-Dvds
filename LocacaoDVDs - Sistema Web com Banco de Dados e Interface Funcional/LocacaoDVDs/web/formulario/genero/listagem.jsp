<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<c:set var="prefixo" value="processaGenero?acao=preparar"/>

<!DOCTYPE html>
<html>
    <head>
        <title>Gêneros Cadastrados</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${cp}/css/index.css"/>
        <link rel="stylesheet" href="${cp}/css/Classificacao Css/listagemClassificacao.css"/>
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
            <h2>Gêneros Cadastrados</h2>

            <div class="button-container">
                <a href="${cp}/formulario/genero/novo.jsp" class="button-primary-ator"><i class="fas fa-plus-circle"></i> Novo Gênero</a>
            </div>

            <table class="tabelaListagem">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Descrição</th>
                        <th>Alterar</th>
                        <th>Excluir</th>
                    </tr>
                </thead>
                <tbody>

                    <jsp:useBean id="servicos" scope="page" class="locacaodvds.servicos.GeneroServices"/>

                    <c:forEach items="${servicos.todos}" var="genero">
                        <tr>
                            <td>${genero.id}</td>
                            <td>${genero.descricao}</td>
                            <td>
                                <a href="${cp}/${prefixo}Alteracao&id=${genero.id}" class="button-secondary"><i class="fas fa-edit"></i> Alterar</a>
                            </td>
                            <td>
                                <a href="${cp}/${prefixo}Exclusao&id=${genero.id}" class="button-danger"><i class="fas fa-trash"></i> Excluir</a>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>

            <!-- Botões "Tela Principal" e "Novo Gênero" na mesma linha -->
            <div class="button-container-inline">
                <a href="${cp}/index.jsp" class="button-primary"><i class="fas fa-home"></i> Tela Principal</a>
                <a href="${cp}/formulario/genero/novo.jsp" class="button-primary"><i class="fas fa-plus-circle"></i> Novo Gênero</a>
            </div>

        </div>

        <script>
            // Função para alternar a classe de colapso na sidebar
            function toggleSidebar() {
                var sidebar = document.getElementById('sidebar');
                sidebar.classList.toggle('collapsed');
            }

            // Adicionando interatividade na tabela
            document.querySelectorAll('.tabelaListagem tr').forEach(row => {
                row.addEventListener('mouseover', () => {
                    row.style.backgroundColor = '#ecf0f1'; // Cor de fundo quando passa o mouse
                });

                row.addEventListener('mouseout', () => {
                    row.style.backgroundColor = ''; // Remover cor de fundo ao sair
                });
            });
        </script>
    </body>
</html>
