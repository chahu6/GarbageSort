package cn.lxsir.uniapp;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author 罗祥
 */
@SpringBootApplication
@EnableTransactionManagement
@MapperScan(basePackages = {"cn.lxsir.uniapp.mapper"})
@EnableAsync
public class UniappApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(UniappApiApplication.class, args);
	}

}
