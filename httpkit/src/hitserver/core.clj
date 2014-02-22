(ns hitserver.core)

(use 'org.httpkit.server)

(defn server [req]
  {:status  200
   :headers {"Content-Type" "text/plain"}
   :body    (.toString (. System currentTimeMillis))})

(defn -main [& args]
  (run-server server {:port 8080}))
