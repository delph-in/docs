{% raw %}## SMAF XML Interface to the LKB

- The function parse will take SMAF XML as input directly.
- Read the conf file with (lkb::read-smaf-conf "/path/to/smaf.conf").
- The function run-parse-server will cause the LKB to enter a socket
server mode.
  
  - Input: SMAF XML or sentence strings.
  - Output: XML containing RMRS analyses.
  - Input/output segment delimiter: CONTROL-Q.
  - The default port is 9876

Last update: 2007-11-23 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/SmafLkb/_edit)]{% endraw %}