package locacaodvds.controladores.filtros;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter(filterName = "ConfigurarEncodingFilter", urlPatterns = {"/*"})
public class ConfigurarEncodingFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // Configura o encoding das requisições para UTF-8
        request.setCharacterEncoding("UTF-8");
        // Continua o processamento da requisição
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Método de inicialização (não utilizado neste caso)
    }

    @Override
    public void destroy() {
        // Método de destruição (não utilizado neste caso)
    }
}