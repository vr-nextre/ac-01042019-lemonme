package it.nextre.academy.lemonme.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

/*
*
* IMPORTANT: Many developers, especially who have a lot of experience with Spring Web MVC, tend to annotate the @Configuration class with @EnableWebMvc. It’s crucial to notice that @EnableWebMvc will switch off all default Spring Boot auto-configuration for Spring Web MVC. That means, JSP files and other resources might not be served correctly without extra configurations.
*
* */

/*
* se attiviamo @EnableWebMvc dovrò:
* - dire dove cercare i @Component con @ComponentScan
* - dire come configurare il view resolver
* */

@Configuration
//@EnableWebMvc
//@ComponentScan("it.nextre.academy.lemonme")
public class WebConfig implements WebMvcConfigurer {

    String s="";


    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
                .addResourceHandler("/res/**")
                .addResourceLocations("/WEB-INF/static/")
                .setCachePeriod(0) //solo in sviluppo
                .resourceChain(false)  //enable in production mode
                .addResolver(new PathResourceResolver());


    }



}//end class
