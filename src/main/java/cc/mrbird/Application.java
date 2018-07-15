package cc.mrbird;

import cc.mrbird.common.config.FebsProperies;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
@MapperScan("cc.mrbird.*.dao")
@EnableConfigurationProperties({FebsProperies.class})
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
        System.out.println("complete");
    }
}
