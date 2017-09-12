#!/system/bin/sh
#
# Modified work Copyright (c) 2017 UpInTheAir. All rights reserved.
#
# Authors:	lyapota
#		UpInTheAir (status check)
#
# This software and associated documentation files (the "Software")
# is proprietary of UpInTheAir. No part of this Software, either
# material or conceptual may be copied or distributed, transmitted,
# transcribed, stored in a retrieval system or translated into any
# human or computer language in any form by any means, electronic,
# mechanical, manual or otherwise, or disclosed to third parties
# without the express written permission of UpInTheAir.
#
# Alternatively, this program is free software in case of open
# source project:
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this Software, to redistribute the Software
# and/or modify it under the terms of the GNU General Public
# License as published by the Free Software Foundation; either
# version 3 of the License, or (at your option) any later version,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

# KNOX warranty status
if [ "$(getprop ro.boot.warranty_bit)" != "0" ] || [ "$(getprop ro.warranty_bit)" != "0" ]; then
	/sbin/resetprop_UITA -v -n ro.boot.warranty_bit 0;
	/sbin/resetprop_UITA -v -n ro.warranty_bit 0;
fi;
