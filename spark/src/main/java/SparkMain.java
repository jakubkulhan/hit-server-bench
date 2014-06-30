import static spark.Spark.get;
import static spark.SparkBase.setPort;

/**
 * @author Jakub Kulhan <jakub.kulhan@gmail.com>
 */
public class SparkMain {

    public static void main(String[] args) {
        setPort(8080);
        get("/", (request, response) -> Long.toString(System.currentTimeMillis()));
    }

}
