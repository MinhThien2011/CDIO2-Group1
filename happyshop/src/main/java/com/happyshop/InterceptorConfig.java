package com.happyshop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.happyshop.interceptor.Authorizelnterceptor;
import com.happyshop.interceptor.Sharelnterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	@Autowired
	Sharelnterceptor share;

	@Autowired
	Authorizelnterceptor auth;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(share).addPathPatterns("/**");

		registry.addInterceptor(auth).addPathPatterns(
				"/account/change", 
				"/order/checkout", 
				"/account/logout",
				"/account/edit", 
				"/order/list",
				"/order/items",
				"/order/detail",
				"/account/order/**");
	}
}
