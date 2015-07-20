import akka.actor.{ Actor, ActorSystem, Props }
import akka.io.IO
import spray.can.Http
import spray.http._

object Main extends App {

  class ServerActor extends Actor {

    def receive = {
      case _: Http.Connected =>
        sender ! Http.Register(self)

      case _: HttpRequest => 
        sender ! HttpResponse(StatusCodes.OK, entity = System.currentTimeMillis().toString)
    }

  }

  implicit val system = ActorSystem()
  val server = system.actorOf(Props[ServerActor])

  val interface = system.settings.config.getString("app.interface")
  val port = system.settings.config.getInt("app.port")

  IO(Http) ! Http.Bind(server, interface, port)

}
