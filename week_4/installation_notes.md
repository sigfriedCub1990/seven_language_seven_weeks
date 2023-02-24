# Installation Notes

To install Scala you can use [sdkman](https://sdkman.io/). After installing `sdkman` do:

```bash
sdk install scala 2.12.17
```

**IMPORTANT**

- Keep in mind that the Scala version you install should be compatible with the SDK version you have installed. Check this handy [reference](https://docs.scala-lang.org/overviews/jdk-compatibility/overview.html).
- To try the concurrency on Day 3 you'll need to install `sbt` since Actors is not in the Scala API since version 2.10
