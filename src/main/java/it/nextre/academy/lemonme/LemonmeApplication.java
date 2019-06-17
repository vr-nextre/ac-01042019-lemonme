package it.nextre.academy.lemonme;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.annotation.PostConstruct;
import java.util.TimeZone;

@SpringBootApplication
public class LemonmeApplication {

	@PostConstruct
	public void init(){
		TimeZone.setDefault(TimeZone.getTimeZone("Europe/Rome"));
	}

	public static void main(String[] args) {
		SpringApplication.run(LemonmeApplication.class, args);
	}

}
