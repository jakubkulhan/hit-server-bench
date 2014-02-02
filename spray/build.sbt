name := "server"

version := "1.0-SNAPSHOT"

resolvers += "Spray Repository" at "http://repo.spray.io"

resolvers += "Typesafe Repository" at "http://repo.typesafe.com/typesafe/releases/"

libraryDependencies += "io.spray" % "spray-can" % "1.2.0"

libraryDependencies += "com.typesafe.akka" %% "akka-actor" % "2.2.3"
