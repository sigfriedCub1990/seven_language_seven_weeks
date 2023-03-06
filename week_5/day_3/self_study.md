# Find

- An OTP service that will restart a process if it dies.
  - [Supervisor](https://www.erlang.org/doc/design_principles/sup_princ.html)
- Documentation for building a simple OTP server.
  - [Simple OTP server](./docs/ch3.erl)
  - [Docs](https://www.erlang.org/doc/design_principles/gen_server_concepts.html)

# Do

- Supervise the `translate_service` and restart it should it die.
  - [Translate with supervisor](./translate_supervisor.erl)
- Make the `Doctor` process restart itself if it should die.
  - We can hack something like [this](https://web.archive.org/web/20150106104442/https://blog.plagelao.com/7languages7weeks/erlang/2011/07/17/erlang-day-three.html). That will not work as you expect, as suggested in this [SO answer](https://stackoverflow.com/questions/8464369/erlang-process-monitoring-itself), so we should do it with a [Supervisor](https://www.erlang.org/doc/design_principles/sup_princ.html#supervision-principles).
  - [Supervisor example](./supervisors/doctor_as_supervisor.erl)
- Make a supervisor for the `Doctor` supervisor. If either supervisor dies, restart it.
  - Similar in spirit to the previous exercise. The whole point of Erlang is to design your system in such a way that if something fails you have something else [supervising it](https://www.erlang.org/doc/design_principles/des_princ.html#supervision-trees).

# Bonus

- Create a basic OTP server that logs messages to a file.
  - [File logger](./supervisors/file_logger.erl)
- Make the `translate_service` work across a network. (TODO: Interested in giving this a try!)
