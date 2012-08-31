#!/usr/bin/env bash
infile=$1
filename=${infile%.*}
echo $filename
outfile="${filename#*=}"_odom.csv
echo Extracting imu data...
rostopic echo -p -b $filename.bag /xbow440_node/imu/data > "${filename#*=}"_imu.csv
echo Extracting odom data...
rostopic echo -p -b $filename.bag /atrv_node/odom > "${filename#*=}"_odom.csv
echo Extracting front encoder data...
rostopic echo -p -b $filename.bag /atrv_node/front/encoders > "${filename#*=}"_front_encoder.csv
echo Extracting rear encoder data...
rostopic echo -p -b $filename.bag /atrv_node/rear/encoders > "${filename#*=}"_rear_encoder.csv
echo Extracting lidar scans data...
rostopic echo -p -b $filename.bag /scan > "${filename#*=}"_scan.csv
echo Extraction finished.

