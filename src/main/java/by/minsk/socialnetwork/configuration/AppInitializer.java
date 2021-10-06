package by.minsk.socialnetwork.configuration;

import by.minsk.socialnetwork.filter.AbstractFilter;
import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.*;
import java.util.EnumSet;

public class AppInitializer implements WebApplicationInitializer {
    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        WebApplicationContext applicationContext =createWebApplicationContext(servletContext);
        servletContext.setSessionTrackingModes(EnumSet.of(SessionTrackingMode.COOKIE));
        servletContext.addListener(new ContextLoaderListener(applicationContext));
        registerFilters(servletContext, applicationContext);
        registerSpringMVCDispatcherServlet(servletContext, applicationContext);

    }

    private WebApplicationContext createWebApplicationContext(ServletContext servletContext){
        AnnotationConfigWebApplicationContext applicationContext  = new AnnotationConfigWebApplicationContext();
        applicationContext.scan("by.minsk.socialnetwork.configuration");
        applicationContext.setServletContext(servletContext);
        applicationContext.refresh();
        return applicationContext;

    }

    private void registerFilters(ServletContext container, WebApplicationContext ctx) {
        registerFilter(container, new CharacterEncodingFilter("UTF-8", true));
        registerFilter(container, ctx.getBean(AbstractFilter.class));
        registerFilter(container, buildConfigurableSiteMeshFilter(), "sitemesh");
    }

    private void registerFilter(ServletContext container, Filter filter, String... filterNames) {
        String filterName = filterNames.length > 0 ? filterNames[0] : filter.getClass().getSimpleName();
        container.addFilter(filterName, filter).addMappingForUrlPatterns(null, true, "/*");
    }

    private void registerServlet(ServletContext container, Servlet servletInstance, String url) {
        ServletRegistration.Dynamic servlet = container.addServlet(servletInstance.getClass().getSimpleName(), servletInstance);
        servlet.setLoadOnStartup(1);
        servlet.addMapping(url);
    }

    private void registerSpringMVCDispatcherServlet(ServletContext container, WebApplicationContext ctx) {
        ServletRegistration.Dynamic servlet = container.addServlet("dispatcher", new DispatcherServlet(ctx));
        servlet.setLoadOnStartup(1);
        servlet.addMapping("/");
    }


    private ConfigurableSiteMeshFilter buildConfigurableSiteMeshFilter() {
        return new ConfigurableSiteMeshFilter() {
            @Override
            protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
                builder
                        .addDecoratorPath("/*", "/WEB-INF/template/page-template.jsp");
            }
        };
    }
}
