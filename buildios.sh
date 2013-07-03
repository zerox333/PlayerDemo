#!/bin/bash 

#set -x

PROJECT_HOME=$PWD
PROJECT_DIRNAME=`basename $PROJECT_HOME`
OUTPUT="$PROJECT_HOME/output"
OUTPUT_BUILD="$OUTPUT/build"
OUTPUT_DIST="$OUTPUT/dist"
XCODEBUILD="/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild"
SDK="iphoneos6.1"
TARGET_iPad="PlayerDemoPad"
TARGET_iPhone="PlayerDemo"

OTADIR="/Library/WebServer/Documents/OTA/EnterpriseApps"
IP=`ifconfig  | grep -E 'inet.[0-9]' | grep -E '172.100' | awk '{ print $2}'`
PLIST_BUDDY="/usr/libexec/PlistBuddy -c"

PARA_COUNT=$#
PARA_CONFIG=$1		#Debug, Release, 	ALL(Debug+Release)
PARA_OPTIONAL=$2	#Generate OTA?

function delete_file()
{
	file_name=$1
	rm -rf $file_name
	echo "delete $file_name"
}

function delete_buildfile()
{
	file_path=$OUTPUT_BUILD
	for file_tmp in $file_path/*;do
		name=`basename $file_tmp`
		if [ "${name##*.}" = "build" ]
		then
			delete_file $file_tmp
		fi
	done
}

function generate_ota()
{
	cp $1 temp.plist
	APP_PLIST=temp.plist
	OTA_PLIST="$OTADIR/$2.plist"
	APP_URL="http://$IP/ota/EnterpriseApps/$2.ipa"
	#Read contents
	BUNDLE_IDENTIFIER=$($PLIST_BUDDY "Print CFBundleIdentifier" $APP_PLIST)
	BUNDLE_NAME=$($PLIST_BUDDY "Print CFBundleDisplayName" $APP_PLIST)
	
	# Clean up
	rm $APP_PLIST
	if [ -f $OTA_PLIST ] # The file already exists
		then rm $OTA_PLIST
	fi

	# Create .plist
	$PLIST_BUDDY "Add :items array" $OTA_PLIST
	$PLIST_BUDDY "Add :items:0:metadata dict" $OTA_PLIST
	$PLIST_BUDDY "Add :items:0:metadata:bundle-identifier string $BUNDLE_IDENTIFIER" $OTA_PLIST
	$PLIST_BUDDY "Add :items:0:metadata:title string $BUNDLE_NAME" $OTA_PLIST
	$PLIST_BUDDY "Add :items:0:metadata:kind string software" $OTA_PLIST
	$PLIST_BUDDY "Add :items:0:assets array" $OTA_PLIST
	$PLIST_BUDDY "Add :items:0:assets:0 dict" $OTA_PLIST
	$PLIST_BUDDY "Add :items:0:assets:0:kind string software-package" $OTA_PLIST
	$PLIST_BUDDY "Add :items:0:assets:0:url string $APP_URL" $OTA_PLIST

	echo "Created $OTA_PLIST with values:"
	echo "Bundle identifier: $BUNDLE_IDENTIFIER"
	echo "Title:             $BUNDLE_NAME"
	echo "URL to app:        $APP_URL"
}

function package_application()
{
	echo "start pack"
	app_name_path="$OUTPUT_BUILD/$1-iphoneos"
	for file_tmp in $app_name_path/*;do
		name=`basename $file_tmp`
		if [ "${name##*.}" = "app" -a ! -f "${file_tmp%.*}.ipa" ]
		then
		{
			xcrun -sdk iphoneos PackageApplication -v "$file_tmp" -o "${file_tmp%.*}.ipa"
			if [ $PARA_COUNT -eq 2 -a "$PARA_OPTIONAL" = "-genota" ]
			then
			{
				cp "${file_tmp%.*}.ipa" $OTADIR/"${name%.*}.ipa"
				generate_ota "$file_tmp/Info.plist" "${name%.*}"
			}
			fi
		}
		fi
	done
}

function build_ios()
{
    cd $PROJECT_HOME
		para_path="$OUTPUT_BUILD"
		
		para_target=$1	#IPTV_iPhone, IPTV_iPad
		para_configuration=$2		#Debug, Release
		$XCODEBUILD -sdk $SDK -target $para_target -configuration $para_configuration SYMROOT=$para_path
		
		package_application $2
		
		delete_buildfile
}


function help()
{
	echo -e "buildios [Debug:debug build Release:release build All:all build(debug+release)]\nIf you need OTA Distribution, append parameter \"-genota\""
}

function build()
{
	if [ $PARA_CONFIG = "Debug" ]
	then
	{
		build_ios $TARGET_iPad Debug
		build_ios $TARGET_iPhone Debug
	}
	elif [ $PARA_CONFIG = "Release" ] 
	then
	{
		build_ios $TARGET_iPad Release
		build_ios $TARGET_iPhone Release
	}
	elif [ $PARA_CONFIG = "All" ]
	then 
	{
		build_ios $TARGET_iPad Debug
		build_ios $TARGET_iPhone Debug
		build_ios $TARGET_iPad Release
		build_ios $TARGET_iPhone Release
	}
	fi
}


function main()
{
	if [ $PARA_CONFIG = "help" ];then
		help
	else
	{
		if [ ! -d "$OUTPUT" ]
		then
			echo "Creat output directory"
			mkdir $OUTPUT
		fi
		
		if [ -d "$OUTPUT_BUILD" ]
		then
			echo "clear"
			delete_file $OUTPUT_BUILD
		fi
		
		build
	}
	fi
}

main