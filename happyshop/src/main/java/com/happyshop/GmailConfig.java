package com.happyshop;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class GmailConfig {
	@Bean
	public JavaMailSender getJavaMailSender() {
		JavaMailSenderImpl sender=new JavaMailSenderImpl();
		sender.setDefaultEncoding("utf-8");
		sender.setHost("smtp.gmail.com");
		sender.setPort(587);
		sender.setUsername("happyshopsuport2024@gmail.com");
		sender.setPassword("lyryrjimpuryyqzl");
		Properties props=sender.getJavaMailProperties();
		props.setProperty("mail.transport.protocol","smtp");
		props.setProperty("mail.smtp.auth","true");
		props.setProperty("mail.smtp.starttls.enable","true");
		props.setProperty("mail.debug","true");
		return sender;
	}
}
