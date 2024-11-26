<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Locação de DVDs</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${cp}/css/index.css"/>
        <!-- Link para ícones, usando Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
    </head>
    <body>
        <div class="sidebar" id="sidebar">
            <div class="sidebar-logo">
                <i class="fas fa-film"></i> Locadora
            </div>
            <a href="${cp}/formulario/dvds/listagem.jsp"><i class="fas fa-compact-disc"></i> Dvds</a>
            <a href="${cp}/formulario/ator/listagem.jsp"><i class="fas fa-user"></i> Atores</a>
            <a href="${cp}/formulario/classificacao/listagem.jsp"><i class="fas fa-star"></i> Classificações</a>
            <a href="${cp}/formulario/genero/listagem.jsp"><i class="fas fa-tags"></i> Gêneros</a>
        </div>

        <div class="main-content">
            <h2>Bem-vindo ao Sistema de Locação de DVDs</h2>
            <div class="feature-box">
                <img src="Figuras/dvds150x150.jfif" alt="Imagem de DVD">
                <div>
                    <h3>Gerencie seus DVDs</h3>
                    <p>Gerencie seus DVDs com facilidade e mantenha seu acervo organizado.</p>
                    <a href="${cp}/formulario/dvds/listagem.jsp" class="button-primary">Gerenciar</a>
                </div>
            </div>
            <div class="feature-box">
                <img src="Figuras/atores150x150.jfif" alt="Imagem de Ator">
                <div>
                    <h3>Gerencie seus Atores</h3>
                    <p>Cadastre atores e organize seu acervo com informações como nome, sobrenome e data de estreia.</p>
                    <a href="${cp}/formulario/ator/listagem.jsp" class="button-primary">Gerenciar</a>
                </div>
            </div>
            <div class="feature-box">
                <img src="Figuras/classificacao150x150.jfif" alt="Imagem de Classificação">
                <div>
                    <h3>Gerencie suas Classificações</h3>
                    <p>Cadastre classificações etárias e associe a cada DVD para informações completas.</p>
                    <a href="${cp}/formulario/classificacao/listagem.jsp" class="button-primary">Gerenciar</a>
                </div>
            </div>
            <!-- Novo bloco para "Cadastro de Gênero" -->
            <div class="feature-box">
                <img src="Figuras/generos150x150.jfif" alt="Imagem de Gênero">
                <div>
                    <h3>Gerencie seus Gêneros</h3>
                    <p>Cadastre gêneros de filmes e associe-os aos DVDs para organizar seu acervo de forma eficiente.</p>
                    <a href="${cp}/formulario/genero/listagem.jsp" class="button-primary">Gerenciar</a>
                </div>
            </div>
        </div>
    </body>
</html>
