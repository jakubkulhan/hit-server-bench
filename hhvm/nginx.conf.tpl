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

    server {
        server_name localhost:8080;
        listen 8080;

        root <<PWD>>;

        index index.php;
        try_files $uri $uri/ /index.php?$args;

        location ~ \.php$ {
            include fastcgi_params.conf;
            fastcgi_pass localhost:10001;
        }
    }
}
