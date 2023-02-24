# Find

- For the sizer program, what would happen if you did not create a new actor for each link you wanted to follow? What would happen to the performance of the application?
  I struggled with this issue at first, since I had to configure [SBT](https://www.scala-sbt.org) to access the Actors API. If you don't create an Actor for each link then the application behaves as in the sequence example. Each size calculation will wait until the previous one to finish.

# Do

- [x] Take the sizer app and add a message to count the number of links on the page.
- Bonus: Make the sizer follow the links on a given page, and load them as well. For example, a sizer for "google.com" would compute the size for Google and all the pages it links to.
