This method shows the traditional, and slightly more configurable way to set up arguments.

Let's first check out the help:
```bash
$ 01b_quick_example --help
MyApp 1.0

Kevin K. <kbknapp@gmail.com>

Does awesome things

USAGE:
    01b_quick_example[EXE] [OPTIONS] [output] [SUBCOMMAND]

ARGS:
    <output>    Sets an optional output file

OPTIONS:
    -c, --config <FILE>    Sets a custom config file
    -d, --debug            Turn debugging information on
    -h, --help             Print help information
    -V, --version          Print version information

SUBCOMMANDS:
    help    Print this message or the help of the given subcommand(s)
    test    does testing things
```

By default, the program does nothing:
```bash
$ 01b_quick_example
Debug mode is off
```

But you can mix and match the various features
```bash
$ 01b_quick_example -dd test
Debug mode is on
Not printing testing lists...
```