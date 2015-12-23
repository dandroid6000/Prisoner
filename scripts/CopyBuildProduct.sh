#!/bin/sh

#  CopyBuildProduct.sh
#
#  Copyright (c) 2015 The Nerdery, LLC. All rights reserved.
#
#  Automates the copying of the seed database to the main project.
#
#  Inspired by:
#    Script by incanus:
#    https://gist.github.com/1186990
#
#    Which was rewritten by martijnthe:
#    https://gist.github.com/1379127
#
# =====================================================================================================================
# OPTIONAL CONFIGURATION:
#
# Uncomment this line to enable loading Console.app to see the log statements below
 SHOW_DEBUG_CONSOLE="YES"
#
# =====================================================================================================================

# Setup logging
LOG="/tmp/copySeedDB.log"
/bin/rm -f "${LOG}"
exec > "${LOG}" 2>&1

echo "Starting Copy of Compiled Binary\n"

# Show the console, if enabled
if [ "$SHOW_DEBUG_CONSOLE" = "YES" ]; then
    /usr/bin/open -a /Applications/Utilities/Console.app "${LOG}"
fi

# Switch focus back to Xcode (from the Simulator/Console.app)
osascript -e "activate application \"Xcode\""

APP_BUILD_PATH="${TARGET_BUILD_DIR}/${EXECUTABLE_NAME}"
APP_DESTINATION_PATH="${SRCROOT}/bin"

if [ ! -f "${APP_BUILD_PATH}" ]; then
    echo "APP_BUILD_PATH is not a file: ${APP_BUILD_PATH}"
	exit 1
fi


# Do the replacement
/bin/rm -f "${APP_DESTINATION_PATH}"
/bin/mkdir -p "${APP_DESTINATION_PATH}"
/bin/cp "${APP_BUILD_PATH}" "${APP_DESTINATION_PATH}/prisoner"

echo "Copied file from ${TARGET_BUILD_DIR}/${EXECUTABLE_NAME} to ${APP_DESTINATION_PATH}/prisoner\n"

exit 0