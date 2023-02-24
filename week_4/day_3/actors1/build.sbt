ThisBuild / scalaVersion := "2.13.8"
ThisBuild / organization := "com.example"

val AkkaVersion = "2.7.0"
lazy val hello = (project in file("."))
.settings(
    name := "Hello",
    libraryDependencies += "org.scalatest" %% "scalatest" % "3.2.7" % Test,
    libraryDependencies ++= Seq(
      "com.typesafe.akka" %% "akka-actor" % AkkaVersion,
      "com.typesafe.akka" %% "akka-testkit" % AkkaVersion % Test
    )
)
