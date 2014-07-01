import io.netty.handler.codec.http.DefaultFullHttpResponse;
import io.netty.handler.codec.http.FullHttpRequest;
import io.netty.handler.codec.http.FullHttpResponse;
import io.netty.handler.codec.http.HttpHeaders;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpResponseStatus;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.codec.http.HttpVersion;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import reactor.core.Environment;
import reactor.core.Reactor;
import reactor.core.composable.Stream;
import reactor.core.spec.Reactors;
import reactor.net.NetServer;
import reactor.net.config.ServerSocketOptions;
import reactor.net.netty.NettyServerSocketOptions;
import reactor.net.netty.tcp.NettyTcpServer;
import reactor.net.tcp.spec.TcpServerSpec;
import reactor.spring.context.config.EnableReactor;

import java.util.concurrent.CountDownLatch;


/**
 * @author Jakub Kulhan <jakub.kulhan@gmail.com>
 */
@EnableAutoConfiguration
@Configuration
@ComponentScan
@EnableReactor
public class ReactorExample {

    @Bean
    public Reactor reactor(Environment environment) {
        return Reactors.reactor(environment, Environment.THREAD_POOL);
    }

    @Bean
    public ServerSocketOptions serverSocketOptions() {
        return new NettyServerSocketOptions()
            .pipelineConfigurer(
                pipeline ->
                    pipeline
                        .addLast(new HttpServerCodec())
                        .addLast(new HttpObjectAggregator(16 * 1024 * 1024))
            );
    }

    @Bean
    public NetServer<FullHttpRequest, FullHttpResponse> server(Environment environment,
                                                               ServerSocketOptions serverSocketOptions,
                                                               Reactor reactor) throws Exception {
        NetServer<FullHttpRequest, FullHttpResponse> server =
            new TcpServerSpec<FullHttpRequest, FullHttpResponse>(NettyTcpServer.class)
                .env(environment)
                .dispatcher("sync")
                .options(serverSocketOptions)
                .consume(ch -> {
                    Stream<FullHttpRequest> in = ch.in();

                    in.consume(req -> {
                        DefaultFullHttpResponse response = new DefaultFullHttpResponse(
                            HttpVersion.HTTP_1_1,
                            HttpResponseStatus.OK
                        );

                        response.content().writeBytes(Long.toString(System.currentTimeMillis()).getBytes());
                        response.headers().set(HttpHeaders.Names.CONTENT_TYPE, "text/plain");
                        response.headers().set(HttpHeaders.Names.CONTENT_LENGTH, response.content().readableBytes());
                        ch.send(response);
                    });
                })
                .listen(8080)
                .get();

        server.start().await();

        return server;
    }

    @Bean
    public CountDownLatch latch() {
        return new CountDownLatch(1);
    }

    public static void main(String[] args) throws Exception {
        ApplicationContext ctx = SpringApplication.run(ReactorExample.class, args);
        ctx.getBean(CountDownLatch.class).await();
    }

}
