###----------------------------------------------------------------------------
BIG_SEQUENCE='04_basketball'

DATA_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/common/raw_from_cameras/${BIG_SEQUENCE}"
OUTPUT_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main/${BIG_SEQUENCE}"

###-------------for basketball---------------
CAMERAS="aria01--aria02--aria03--aria04" ## 4 arias
START_TIMESTAMPS="01688--01815--01777--01818" ##this 00001.jpg for the exo cameras

# # ###--------------------------------
# # SEQUENCE='basketball_calibration'

# ## pick the sequence start and end times with respect to an ego camera
# SEQUENCE_CAMERA_NAME='aria01'
# SEQUENCE_START_TIMESTAMP='04320' ## this includes the image name
# # SEQUENCE_END_TIMESTAMP='05320' ## this is also inclusive

## the crash happens at 5360-5400

# # ###--------------------------------
# SEQUENCE='001_basketball'

# ## pick the sequence start and end times with respect to an ego camera
# SEQUENCE_CAMERA_NAME='aria01'
# SEQUENCE_START_TIMESTAMP='02800' ## this includes the image name
# SEQUENCE_END_TIMESTAMP='03400' ## this is also inclusive

# # ###--------------------------------
# SEQUENCE='002_basketball'
# SEQUENCE_CAMERA_NAME='aria01'
# SEQUENCE_START_TIMESTAMP='04200' ## this includes the image name
# SEQUENCE_END_TIMESTAMP='04800' ## this is also inclusive

# # ###--------------------------------
# SEQUENCE='003_basketball'
# SEQUENCE_CAMERA_NAME='aria01'
# SEQUENCE_START_TIMESTAMP='04800' ## this includes the image name
# SEQUENCE_END_TIMESTAMP='05370' ## this is also inclusive

# # # ###--------------------------------
# SEQUENCE='004_basketball'
# SEQUENCE_CAMERA_NAME='aria01'
# # SEQUENCE_START_TIMESTAMP='05700' ## this includes the image name
# # SEQUENCE_END_TIMESTAMP='06300' ## this is also inclusive

# SEQUENCE_START_TIMESTAMP='05700' ## this includes the image name
# SEQUENCE_END_TIMESTAMP='05810' ## this is also inclusive

# # # ###------------extra ----------
# SEQUENCE='013_basketball'
# SEQUENCE_CAMERA_NAME='aria01'
# SEQUENCE_START_TIMESTAMP='06138' ## this includes the image name
# SEQUENCE_END_TIMESTAMP='06300' ## this is also inclusive

# # ###--------------------------------
# SEQUENCE='005_basketball'
# SEQUENCE_CAMERA_NAME='aria01'
# SEQUENCE_START_TIMESTAMP='06760' ## this includes the image name
# SEQUENCE_END_TIMESTAMP='07260' ## this is also inclusive

# # # ###--------------------------------
# SEQUENCE='006_basketball'
# SEQUENCE_CAMERA_NAME='aria01'
# SEQUENCE_START_TIMESTAMP='07520' ## this includes the image name
# SEQUENCE_END_TIMESTAMP='07699' ## this is also inclusive

# # ###--------------------------------
# SEQUENCE='007_basketball'
# SEQUENCE_CAMERA_NAME='aria01'
# SEQUENCE_START_TIMESTAMP='08350' ## this includes the image name
# SEQUENCE_END_TIMESTAMP='08950' ## this is also inclusive

# # ###--------------------------------
# SEQUENCE='008_basketball'
# SEQUENCE_CAMERA_NAME='aria01'
# SEQUENCE_START_TIMESTAMP='08950' ## this includes the image name
# SEQUENCE_END_TIMESTAMP='09350' ## this is also inclusive

# # # ###--------------------------------
# SEQUENCE='009_basketball'
# SEQUENCE_CAMERA_NAME='aria01'
# SEQUENCE_START_TIMESTAMP='09640' ## this includes the image name
# # SEQUENCE_END_TIMESTAMP='10240' ## this is also inclusive
# SEQUENCE_END_TIMESTAMP='09819' ## this is also inclusive

# # # ###-----------extra-------------
# SEQUENCE='014_basketball'
# SEQUENCE_CAMERA_NAME='aria01'
# SEQUENCE_START_TIMESTAMP='09951' ## this includes the image name
# SEQUENCE_END_TIMESTAMP='10169' ## this is also inclusive

# # # ###--------------------------------
SEQUENCE='010_basketball'
SEQUENCE_CAMERA_NAME='aria01'
SEQUENCE_START_TIMESTAMP='10500' ## this includes the image name
# SEQUENCE_END_TIMESTAMP='11200' ## this is also inclusive
SEQUENCE_END_TIMESTAMP='10806' ## this is also inclusive

# # # ###--------------------------------
# SEQUENCE='011_basketball'
# SEQUENCE_CAMERA_NAME='aria01'
# SEQUENCE_START_TIMESTAMP='11700' ## this includes the image name
# SEQUENCE_END_TIMESTAMP='12300' ## this is also inclusive

# # # ###--------------------------------
# SEQUENCE='012_basketball'
# SEQUENCE_CAMERA_NAME='aria01'
# SEQUENCE_START_TIMESTAMP='12300' ## this includes the image name
# SEQUENCE_END_TIMESTAMP='12800' ## this is also inclusive

###----------------------------------------------------------------------------
OUTPUT_IMAGE_DIR=$OUTPUT_DIR/$SEQUENCE/'ego'


###----------------------------------------------------------------------------
cd ../../../tools/misc
python ego_time_sync_restructure.py --sequence $SEQUENCE --cameras $CAMERAS \
                            --start-timestamps $START_TIMESTAMPS \
                            --sequence-camera-name $SEQUENCE_CAMERA_NAME \
                            --sequence-start-timestamp $SEQUENCE_START_TIMESTAMP --sequence-end-timestamp $SEQUENCE_END_TIMESTAMP \
                            --data-dir $DATA_DIR --output-dir $OUTPUT_IMAGE_DIR \