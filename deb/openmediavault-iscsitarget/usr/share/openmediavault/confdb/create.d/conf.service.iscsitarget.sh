#!/bin/sh
#
# This file is part of OpenMediaVault.
#
# @license   http://www.gnu.org/licenses/gpl.html GPL Version 3
# @author    Volker Theile <volker.theile@openmediavault.org>
# @copyright Copyright (c) 2009-2017 Volker Theile
#
# OpenMediaVault is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# OpenMediaVault is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with OpenMediaVault. If not, see <http://www.gnu.org/licenses/>.

set -e

. /usr/share/openmediavault/scripts/helper-functions

########################################################################
# Update the configuration.
# <config>
#   <services>
#     <iscsitarget>
#       <enable>0</enable>
#       <extraoptions></extraoptions>
#       <authentication>
#         <user>
#           <uuid>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</uuid>
#           <type>incoming|outgoing</type>
#           <username>xxx</username>
#           <password>xxx</password>
#         </user>
#         <user>
#           ...
#         </user>
#       </authentication>
#       <targets>
#         <target>
#           <uuid>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</uuid>
#           <activation>jjjj-mm</activation>
#           <identifier>xxx</identifier>
#           <alias></alias>
#           <headerdigest>CRC32C|None</headerdigest>
#           <datadigest>CRC32C|None</datadigest>
#           <maxconnections>1</maxconnections>
#           <maxsessions>0</maxsessions>
#           <initialr2t>0|1</initialr2t>
#           <immediatedata>0|1</immediatedata>
#           <maxrecvdatasegmentlength>8192</maxrecvdatasegmentlength>
#           <maxxmitdatasegmentlength>8192</maxxmitdatasegmentlength>
#           <maxburstlength>262144</maxburstlength>
#           <firstburstlength>65536</firstburstlength>
#           <maxoutstandingr2t>1</maxoutstandingr2t>
#           <datapduinorder>0|1</datapduinorder>
#           <datasequenceinorder>0|1</datasequenceinorder>
#           <errorrecoverylevel>0</errorrecoverylevel>
#           <nopinterval>0</nopinterval>
#           <noptimeout>0</noptimeout>
#           <wthreads>8</wthreads>
#           <queuedcommands>32</queuedcommands>
#           <comment></comment>
#           <extraoptions></extraoptions>
#           <authentication>
#             <user>
#               <uuid>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</uuid>
#               <type>incoming|outgoing</type>
#               <username>xxx</username>
#               <password>xxx</password>
#             </user>
#             <user>
#               ...
#             </user>
#           </authentication>
#           <luns>
#             <lun>
#               <uuid>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</uuid>
#               <id>[0...2^14-1]</id>
#               <type>fileio|blockio</type>
#               <iomode>wt|wb|ro</iomode>
#               <devicefile>/dev/xxx</devicefile>
#               <scsiid></scsiid>
#               <scsisn></scsisn>
#             </lun>
#             <lun>
#               ...
#             </lun>
#           </luns>
#         </target>
#       </targets>
#     <iscsitarget>
#   </services>
# </config>
########################################################################
if ! omv_config_exists "/config/services/iscsitarget"; then
	omv_config_add_node "/config/services" "iscsitarget"
	omv_config_add_key "/config/services/iscsitarget" "enable" "0"
	omv_config_add_key "/config/services/iscsitarget" "authentication" ""
	omv_config_add_key "/config/services/iscsitarget" "extraoptions" ""
	omv_config_add_node "/config/services/iscsitarget" "targets"
fi

exit 0
