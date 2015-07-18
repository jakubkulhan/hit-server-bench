name := "server"

version := "1.0-SNAPSHOT"

enablePlugins(JavaAppPackaging)

resolvers += "spray repo" at "http://repo.spray.io"

resolvers += "Typesafe Repository" at "http://repo.typesafe.com/typesafe/releases/"

libraryDependencies ++= Seq(
  "io.spray" %% "spray-can" % "1.3.3",
  "com.typesafe.akka" %% "akka-actor" % "2.3.12"
)

mappings in Universal += {
  val conf = (sourceDirectory in Compile).value / "main" / "resources" / "application.conf"
  conf -> "conf/application.conf"
}