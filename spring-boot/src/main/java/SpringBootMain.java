import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Jakub Kulhan <jakub.kulhan@gmail.com>
 */
@RestController
@EnableAutoConfiguration
public class SpringBootMain {

    @RequestMapping("/")
    public String index() {
        return Long.toString(System.currentTimeMillis());
    }

    public static void main(String[] args) {
        SpringApplication.run(SpringBootMain.class, args);
    }

}
