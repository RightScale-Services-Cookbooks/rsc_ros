rsc_ros CHANGELOG
=================

This file is used to list changes made in each version of the rsc_ros cookbook.

0.7.0
-----
- remove ruby install, use chef embedded ruby instead
- fix region attribute.  send to ros.rb only when set 

0.6.0
-----
- pin fog-profitblocks to support ruby 1.9.3

0.5.0
-----
- add attribute to provider for timeout.  default is 1200s

0.4.0
-----
- Add region support for upload and download.

0.3.0
-----
- Update fog to 1.36.0 to fix net/ssh errors.
