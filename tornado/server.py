import tornado.ioloop
import tornado.web
import tornado.gen
import tornado.httpserver
import time

class MainHandler(tornado.web.RequestHandler):

    @tornado.gen.coroutine
    def get(self):
        self.write(str(int(round(time.time() * 1000))))

app = tornado.web.Application([
    (r"/", MainHandler),
])

if __name__ == "__main__":
    server = tornado.httpserver.HTTPServer(app)
    server.bind(8080)
    server.start(0) # forks number of child processes accoring to cores
    tornado.ioloop.IOLoop.instance().start()
