<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
    <head>
        <title>Excluir Gênero</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            /* Sidebar */
            .sidebar {
                height: 100vh;
                width: 250px;
                background-color: #2c3e50;
                color: #fff;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding-top: 20px;
                position: fixed;
                left: 0;
                top: 0;
                overflow-y: auto;
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            }

            /* Logo */
            .sidebar-logo {
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5em;
                font-weight: bold;
                margin-bottom: 20px;
                color: #f1c40f;
            }

            .sidebar-logo i {
                margin-right: 10px;
                font-size: 1.8em;
            }

            .sidebar a {
                text-decoration: none;
                color: #fff;
                background-color: #34495e;
                padding: 15px 20px;
                margin: 8px 0;
                border-radius: 5px;
                font-size: 1.1em;
                font-weight: bold;
                width: 85%;
                display: flex;
                align-items: center;
                justify-content: flex-start;
                transition: background-color 0.3s;
            }

            .sidebar a:hover {
                background-color: #1abc9c;
            }

            .sidebar a i {
                margin-right: 10px;
                font-size: 1.2em;
            }

            /* Main content */
            .main-content {
                margin-left: 270px;
                padding: 20px;
                width: calc(100% - 270px);
            }

            h1 {
                text-align: center;
                color: #2c3e50;
                margin-bottom: 20px;
            }

            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 80%;
                margin: 0 auto;
            }

            table {
                width: 100%;
                border-collapse: collapse; /* Remove as bordas internas */
                margin-bottom: 20px;
            }

            table td {
                padding: 10px;
                border: none; /* Remove a borda das células */
            }

            .alinharDireita {
                text-align: right;
                font-weight: bold;
                color: #34495e;
            }

            .button-container {
                display: flex;
                justify-content: space-between;
            }

            .button-secondary, input[type="submit"], .button-delete {
                display: inline-block;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                font-size: 1em;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s, opacity 0.3s;
            }

            .button-secondary {
                background-color: #3498db;
                color: #fff;
                text-decoration: none;
                border-bottom: none;
            }

            .button-secondary:hover {
                background-color: #2980b9;
                opacity: 0.8;
                color: #fff;
            }

            input[type="submit"] {
                background-color: #e74c3c;
                color: #fff;
            }

            input[type="submit"]:hover {
                background-color: #c0392b;
            }

            .button-delete {
                background-color: #e74c3c;
                color: #fff;
                cursor: pointer;
            }

            .button-delete:hover {
                background-color: #c0392b;
            }

            input[type="text"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 1em;
                color: #34495e;
                background-color: #ecf0f1;
            }
        </style>
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
            <h1>Excluir Gênero</h1>

            <form method="post" action="${cp}/processaGenero">
                <input name="acao" type="hidden" value="excluir"/>
                <input name="id" type="hidden" value="${requestScope.genero.id}"/>
                <table>
                    <tr>
                        <td class="alinharDireita">Descrição:</td>
                        <td>${requestScope.genero.descricao}</td>
                    </tr>
                    <tr>
                        <td>
                            <a href="${cp}/formulario/genero/listagem.jsp" class="button-secondary"><i class="fas fa-arrow-left"></i> Voltar</a>
                        </td>
                        <td class="alinharDireita">
                            <input type="submit" value="Excluir" class="button-delete"/>
                        </td>
                    </tr>
                </table>
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
