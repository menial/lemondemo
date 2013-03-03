# LemonDemo

LemonDemo is a demonstration project showing how to integrate the [Lemon Parser Generator](http://www.hwaci.com/sw/lemon/index.html) with Xcode.

This sample project builds an app which can parse a limited subset of Objective-C protocol definitions.

The blog post accompanying this project is available here: http://menial.co.uk/blog/2013/03/03/parsing-with-lemon/


## Why?

Because sometimes you need to parse a complex text format and there isn't a handy library to do it.


## How do I try it?

1. Open the project in Xcode
2. Click 'Run'
3. Click 'Parse'

Play about with the input text a bit. Add more protocols to the `<NSObject>` part. Add more properties with different modifiers.

As mentioned before, it only parses a subset of what can go in a real protocol. Limit yourself to `@property` definitions with pointer types and it should work fine.

Once you've got a handle on what it's doing, try extending the grammar to handle method definitions. The documentation for the grammar syntax is available from the [Lemon homepage](http://www.hwaci.com/sw/lemon/lemon.html).


## Notes

This project contains the source for the lemon command-line tool and the parser template file. They are included so that the example can be self contained. If you want to have the most up to date versions, you will need to get them from the [SQLite fossil repository](http://www.sqlite.org/cgi/src/dir?name=tool). They are the files named `lemon.c` and `lempar.c` in the `tool` directory.

This project uses [ParseKit](http://parsekit.com/) for string tokenization.
