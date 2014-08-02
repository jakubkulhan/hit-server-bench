worker_processes 32;
daemon off;

events {
    worker_connections 1024;
}

http {
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;


    upstream server {
        server localhost:8081;
        server localhost:8082;
        server localhost:8083;
        server localhost:8084;
        server localhost:8085;
        server localhost:8086;
        server localhost:8087;
        server localhost:8088;
        server localhost:8089;
        server localhost:8090;
        server localhost:8091;
        server localhost:8092;
        server localhost:8093;
        server localhost:8094;
        server localhost:8095;
        server localhost:8096;
    }

    server {
        server_name localhost:8080;
        listen 8080;

        root <<PWD>>;

        location / {
            proxy_pass http://server;
        }
    }
}
