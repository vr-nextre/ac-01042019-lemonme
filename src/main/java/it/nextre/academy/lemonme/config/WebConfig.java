package it.nextre.academy.lemonme.config;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.resource.PathResourceResolver;

import java.util.Locale;



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

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
                .addResourceHandler("/res/**")
                .addResourceLocations("/WEB-INF/static/")
                .setCachePeriod(0) //solo in sviluppo
                .resourceChain(false)  //enable in production mode
                .addResolver(new PathResourceResolver());
    }


    @Bean
    public Logger getLogger(){
        return LogManager.getLogger();
    }



    //change default location of i18n
    /*
    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasename("classpath:/i18/messages");
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }
    */



    @Bean
    public LocaleResolver localeResolver() {
        //In session
        SessionLocaleResolver slr = new SessionLocaleResolver();
        slr.setDefaultLocale(Locale.ITALIAN);
        //In cookie
        //CookieLocaleResolver resolver = new CookieLocaleResolver();
        //resolver.setDefaultLocale(Locale.ITALIAN);
        //resolver.setCookieName("localeCookie");
        //resolver.setCookieMaxAge(86400*15); //15gg

        return slr;
    }

    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
        lci.setParamName("language");
        return lci;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());
    }





}//end class
