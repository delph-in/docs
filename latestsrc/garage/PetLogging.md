{% raw %}# Overview

Since [revision 498 in the main
branch](https://pet.opendfki.de/browser/pet/main?rev=498) PET employs a
logging framework for configurable log output. Instead of controlling
the logging output in the various conceptual modules of PET (like
packing/unpacking, generics, lexical processing, parsing, etc.) with a
single option (namely, the old -verbose option), the new logging
framework allows you to set the verbosity level for each module
separately. In addition, it allows you to specify a printer for this
module and level, which will print the log message in a specific format.
The logging configuration will be read from a configuration file.

# Dependencies

Two incarnations of the logging framework are available in PET. The
"simple logging" framework and the "extended logging" framework via
[Log4cpp](http://log4cpp.sourceforge.net/). The configure script uses
the extended logging framework if available. Otherwise the simple
logging framework will be used, which has no further dependencies.

# Logging Explained

Several loggers are defined in PET which correspond to various
conceptual modules like packing/unpacking, generics, lexical processing,
parsing, etc. Log messages belonging to these modules are sent to the
corresponding loggers. The loggers are identified by the **log
categories**. The possible log categories are:

- rootCategory
- logAppl
- logApplC
- logChart
- logChartMapping
- logGenerics
- logGrammar
- logLexproc
- logMorph
- logPack
- logParse
- logSM
- logSemantic
- logSyntax
- logTsdb
- logUnpack
- logXML

The rootCategory is special. It is used to configure the root logger,
which is the default for all other loggers, if they don't specify
anything else.

The **log levels** determine whether a log message is printed by a
logger or not. If the log level of the message has the same or a higher
priority than the configured log level of the responsible logger, then
the log message is printed. The possible log levels are (log levels with
highest priority first):

- FATAL
- ALERT
- CRIT
- ERROR
- WARN
- NOTICE
- INFO
- DEBUG

The **printers** specify the output destination and **layout** of each
log message, e.g. whether a log message ends with a newline or whether
it is prefixed with a date string. The extended logging framework
supplies several **appenders** which are responsible for the actual
output of the logging message.

# Configuration

## Simple Logging Framework

The simple logging framework will look up the configuration file
simplelog.properties in the directory of the loaded grammar. An [example
file](https://pet.opendfki.de/browser/pet/main/simplelog.properties) is
provided with the PET source code. Copy this file to your grammar
directory and adapt it accordingly.

Each line in simplelog.properties specifies the log category, the log
level and a printer, using the following syntax:

    <category>=[<level>][,<printer>]

The log categories and levels are specified as listed above. The
possible printers are:

- simple
- simplest
- empty

They all print to the standard error stream, using different layouts for
the message.

An example simplelog.properties may look like the following:

    rootCategory=WARN, simple
    logParse=DEBUG
    logSyntax=, simplest

The first line sets the default log level to WARN and the default
printer to simple. The following line sets the parse logger to log level
DEBUG, keeping the default printer of the root logger. The last line
specifies a printer for the syntax logger, keeping the default log level
of the root logger.

## Extended Logging Framework

The extended logging framework will look up the configuration file
logging.properties in the directory of the loaded grammar. An [example
file](https://pet.opendfki.de/browser/pet/main/logging.properties) is
provided with the PET source code. Copy this file to your grammar
directory and adapt it accordingly.

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/PetLogging/_edit)]{% endraw %}