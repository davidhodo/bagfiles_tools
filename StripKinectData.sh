#!/bin/bash
# remove kinect data from a bag file

# make sure we got two arguments
if [ $# -ne 2 ]; then
	echo "Usage: ./StripKinectData.sh inputfile.bag {outputfile.bag}"
	exit 1
fi

rosbag filter $1 $2 'topic!="/cloud_throttled" and not topic.startswith("/camera")'

