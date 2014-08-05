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

    upstream hhvm {
        server localhost:10001;
        server localhost:10002;
        server localhost:10003;
        server localhost:10004;
        server localhost:10005;
        server localhost:10006;
        server localhost:10007;
        server localhost:10008;
    }

    server {
        server_name localhost:8080;
        listen 8080;

        root <<PWD>>;

        index index.php;
        try_files $uri $uri/ /index.php?$args;

        location ~ \.php$ {
            include fastcgi_params.conf;
            fastcgi_pass hhvm;
        }
    }
}
