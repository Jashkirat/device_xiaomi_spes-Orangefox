#!/system/bin/sh
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2026 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

DEBUG=0;
[ "$DEBUG" = "1" ] && set -o xtrace;

fix_fox_folders_permissions_contexts() {
local fox_folders="/sdcard/Fox /data/recovery/Fox /persist/Fox";
local D;
	for D in $fox_folders
	do
		if [ -d $D ]; then
			echo "I:Correcting the SELinux context and permissions of the $D folder..." >> /tmp/recovery.log;
			chown -R media_rw:media_rw $D;
			chmod -R 0777 $D;
			chcon -R u:object_r:media_rw_data_file:s0 $D;
		fi
	done
	sync;
}

# ---
fix_fox_folders_permissions_contexts;
exit 0;
#
