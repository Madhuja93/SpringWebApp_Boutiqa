package com.lithan.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan("com.lithan")
public class WebMvcConfig {
	@Bean(name = "viewResolver")
	public InternalResourceViewResolver getViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		 registry.addResourceHandler("/js/**")
		         .addResourceLocations("WEB-INF/resources/js/");
		
		 registry.addResourceHandler("/images/**")
		         .addResourceLocations("WEB-INF/resources/images/");
		 
		 registry.addResourceHandler("/styles/**")
			.addResourceLocations("WEB-INF/resources/styles/");
	}
}