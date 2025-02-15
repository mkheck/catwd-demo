package com.thehecklers.catwd_demo;

import org.springframework.boot.SpringApplication;

public class TestCatwdDemoApplication {

	public static void main(String[] args) {
		SpringApplication.from(CatwdDemoApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
