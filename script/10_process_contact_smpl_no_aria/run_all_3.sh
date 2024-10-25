cd ../..
DEVICES=3
BIG_SEQUENCE="35_mma5"
SEQUENCE_LIST="001_mma5 002_mma5 003_mma5 004_mma5 005_mma5 009_mma5 011_mma5 013_mma5 016_mma5"
SEQUENCE_ROOT_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main"
for SEQUENCE in $SEQUENCE_LIST
do      
        OUTPUT_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main/$BIG_SEQUENCE/$SEQUENCE/processed_data"
        SEQUENCE_PATH=$SEQUENCE_ROOT_DIR/$BIG_SEQUENCE/$SEQUENCE
        mkdir -p ${OUTPUT_DIR};
        ##-------------------------0_get_bboxes.py-------------------------
        # echo "Running 0_get_bboxes.py"
        # echo "Sequence: $SEQUENCE"
        # RUN_FILE='tools/process_smpl/0_get_bboxes.py'        
        # NUM_JOBS=4 ## if using fasterrcnn, issues when using odd number of jobs, for eg: 5 is glitchy.
        # LOG_DIR="$(echo "${OUTPUT_DIR}/logs/bbox")"
        # mkdir -p ${OUTPUT_DIR}; mkdir -p ${LOG_DIR}; 
        
        # SEQUENCE_LENGTH=$(find $SEQUENCE_ROOT_DIR/$BIG_SEQUENCE/$SEQUENCE/'exo'/'cam01'/'images' -maxdepth 1 -name '*.jpg' | wc -l)
        
        # PER_JOB=$((SEQUENCE_LENGTH/NUM_JOBS))
        # LAST_JOB_ITER=$((NUM_JOBS-1))

        # for (( i=0; i < $NUM_JOBS; ++i ))
        # do
        #     START_TIME=$((i*PER_JOB + 1))
        #     END_TIME=$((i*PER_JOB + PER_JOB))

        #     if [ $i == $LAST_JOB_ITER ]
        #     then
        #         END_TIME=-1
        #     fi
        #     LOG_FILE="$(echo "${LOG_DIR}/log_start_${START_TIME}_end_${END_TIME}.txt")"; touch ${LOG_FILE}
        #     CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
        #                         --sequence_path ${SEQUENCE_PATH} \
        #                         --output_path $OUTPUT_DIR \
        #                         --start_time $START_TIME \
        #                         --end_time $END_TIME | tee ${LOG_FILE} &
        # done
        # wait

        # ##-------------------------1_get_poses2d.py-------------------------
        # echo "Running 1_get_poses2d.py"
        # echo "Sequence: $SEQUENCE"
        # RUN_FILE='tools/process_smpl/0_get_poses2d.py'
        # NUM_JOBS=2 ## if using vitpose huge
        # LOG_DIR="$(echo "${OUTPUT_DIR}/logs/poses2d")"
        # mkdir -p ${OUTPUT_DIR}; mkdir -p ${LOG_DIR}; 

        # SEQUENCE_LENGTH=$(find $SEQUENCE_ROOT_DIR/$BIG_SEQUENCE/$SEQUENCE/'exo'/'cam01'/'images' -maxdepth 1 -name '*.jpg' | wc -l)

        # PER_JOB=$((SEQUENCE_LENGTH/NUM_JOBS))
        # LAST_JOB_ITER=$((NUM_JOBS-1))

        # for (( i=0; i < $NUM_JOBS; ++i ))

        # do
        #     START_TIME=$((i*PER_JOB + 1))
        #     END_TIME=$((i*PER_JOB + PER_JOB))

        #     if [ $i == $LAST_JOB_ITER ]
        #     then
        #         END_TIME=-1
        #     fi
        
        #     LOG_FILE="$(echo "${LOG_DIR}/log_start_${START_TIME}_end_${END_TIME}.txt")"; touch ${LOG_FILE}
        #     CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
        #                         --sequence_path ${SEQUENCE_PATH} \
        #                         --output_path $OUTPUT_DIR \
        #                         --start_time $START_TIME \
        #                         --end_time $END_TIME | tee ${LOG_FILE} &



        # done
        # wait

        # ##-------------------------2_get_poses3d.py-------------------------
        # echo "Running 2_get_poses3d.py"
        # echo "Sequence: $SEQUENCE"
        # RUN_FILE='tools/process_smpl/1_get_poses3d.py'
        # OVERRIDE_SEGPOSE2D_LOAD=True
        # NUM_JOBS=8 
        # LOG_DIR="$(echo "${OUTPUT_DIR}/logs/poses3d")"
        # mkdir -p ${OUTPUT_DIR}; mkdir -p ${LOG_DIR}; 
        # SEQUENCE_LENGTH=$(find $SEQUENCE_ROOT_DIR/$BIG_SEQUENCE/$SEQUENCE/'exo'/'cam01'/'images' -maxdepth 1 -name '*.jpg' | wc -l)

        # PER_JOB=$((SEQUENCE_LENGTH/NUM_JOBS))
        # LAST_JOB_ITER=$((NUM_JOBS-1))

        # for (( i=0; i < $NUM_JOBS; ++i ))
        # do
        #     START_TIME=$((i*PER_JOB + 1))
        #     END_TIME=$((i*PER_JOB + PER_JOB))

        #     if [ $i == $LAST_JOB_ITER ]
        #     then
        #         END_TIME=-1
        #     fi
        
        #     LOG_FILE="$(echo "${LOG_DIR}/log_start_${START_TIME}_end_${END_TIME}.txt")"; touch ${LOG_FILE}
        #     CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
        #                         --sequence_path ${SEQUENCE_PATH} \
        #                         --output_path $OUTPUT_DIR \
        #                         --start_time $START_TIME \
        #                         --end_time $END_TIME | tee ${LOG_FILE} &

        # done
        # wait

        # ##-------------------------3_get_contact_pose3d.py-------------------------
        # echo "Running 3_get_contact_pose3d.py"
        # echo "Sequence: $SEQUENCE"
        # RUN_FILE='tools/process_contact_smpl_no_aria/2_get_contact_pose3d.py'
        # OVERRIDE_CONTACT_SEGPOSE3D=True;
        # mkdir -p ${OUTPUT_DIR}; 

        # START_TIME=1
        # END_TIME=-1

        # CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
        #                 --sequence_path ${SEQUENCE_PATH} \
        #                 --output_path $OUTPUT_DIR \
        #                 --start_time $START_TIME \
        #                 --end_time $END_TIME \
        #                 --override_contact_segpose3d $OVERRIDE_CONTACT_SEGPOSE3D \

        ##-------------------------4_refine_poses3d.py-------------------------
        # echo "Running 4_refine_poses3d.py"
        # echo "Sequence: $SEQUENCE"
        # RUN_FILE='tools/process_contact_smpl_no_aria/3_refine_poses3d.py'
        # LOG_DIR="$(echo "${OUTPUT_DIR}/logs/refine_poses3d")"
        # OUTPUT_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main/$BIG_SEQUENCE/$SEQUENCE/processed_data"
        # SEQUENCE_PATH=$SEQUENCE_ROOT_DIR/$BIG_SEQUENCE/$SEQUENCE

        # mkdir -p ${OUTPUT_DIR}; 

        # START_TIME=1
        # END_TIME=-1

        # CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
        #                     --sequence_path ${SEQUENCE_PATH} \
        #                     --output_path $OUTPUT_DIR \
        #                     --start_time $START_TIME \
        #                     --end_time $END_TIME \
        
        # wait
        # ##-------------------------5_get_init_smpl.py-------------------------
        # echo "Running 5_fit_poses3d.py"
        # echo "Sequence: $SEQUENCE"
        # RUN_FILE='tools/process_contact_smpl_no_aria/4_fit_poses3d.py'
        # LOG_DIR="$(echo "${OUTPUT_DIR}/logs/fit_poses3d")"
        # mkdir -p ${OUTPUT_DIR};   mkdir -p ${LOG_DIR}; 

        # START_TIME=1
        # END_TIME=-1

        # LOG_FILE="$(echo "${LOG_DIR}/log_start_${START_TIME}_end_${END_TIME}.txt")"; touch ${LOG_FILE}
        # CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
        #                     --sequence_path ${SEQUENCE_PATH} \
        #                     --output_path $OUTPUT_DIR \
        #                     --start_time $START_TIME \
        #                     --end_time $END_TIME \
        
        # wait

        # ##-------------------------fit_pose3d_metric-------------------------
        # echo "Running fit_pose3d_metric"
        # RUN_FILE='tools/process_contact_smpl_no_aria/metric_coordinate.py'
        # LOG_DIR="$(echo "${OUTPUT_DIR}/logs/fit_poses3d_metric")"
        # mkdir -p ${OUTPUT_DIR}; mkdir -p ${LOG_DIR}; 
        # START_TIME=1
        # END_TIME=-1

        # LOG_FILE="$(echo "${LOG_DIR}/log_start_${START_TIME}_end_${END_TIME}.txt")"; touch ${LOG_FILE}
        # CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
        #                     --sequence_path ${SEQUENCE_PATH} \
        #                     --output_path $OUTPUT_DIR \
        #                     --start_time $START_TIME \
        #                     --end_time $END_TIME \
                            
        # wait

        # ##-------------------------6_get_init_smpl.py-------------------------
        # echo "Running 6_get_init_smpl.py"
        # echo "Sequence: $SEQUENCE"
        # RUN_FILE='tools/process_contact_smpl_no_aria/5_get_init_smpl.py'
        # CHOOSEN_CAMS='cam01:rgb---cam02:rgb---cam03:rgb---cam04:rgb---cam05:rgb---cam06:rgb---cam07:rgb---cam08:rgb---cam09:rgb---cam10:rgb---cam11:rgb---cam12:rgb---cam13:rgb---cam14:rgb---cam15:rgb---cam16:rgb---cam17:rgb---cam18:rgb---cam19:rgb---cam20:rgb'
        # mkdir -p ${OUTPUT_DIR};
        # NUM_JOBS=4
        # SEQUENCE_LENGTH=$(find $SEQUENCE_ROOT_DIR/$BIG_SEQUENCE/$SEQUENCE/'exo'/'cam01'/'images' -maxdepth 1 -name '*.jpg' | wc -l)
        # echo SEQUENCE_LENGTH: $SEQUENCE_LENGTH
        # PER_JOB=$((SEQUENCE_LENGTH/NUM_JOBS))
        # echo PER_JOB: $PER_JOB
        # LAST_JOB_ITER=$((NUM_JOBS-1))
        # echo LAST_JOB_ITER: $LAST_JOB_ITER

        # for (( i=0; i < $NUM_JOBS; ++i ))
        # do
        #     START_TIME=$((i*PER_JOB + 1))
        #     END_TIME=$((i*PER_JOB + PER_JOB))

        #     if [ $i == $LAST_JOB_ITER ]
        #     then
        #         END_TIME=-1
        #     fi
            
        #     ##--------------run-----------------------------
        #     CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
        #                     --sequence_path ${SEQUENCE_PATH} \
        #                     --output_path $OUTPUT_DIR \
        #                     --start_time $START_TIME \
        #                     --end_time $END_TIME \
        #                     --choosen_cams $CHOOSEN_CAMS &


        # done
        # wait


        ##-------------------------7_get_init_smpl.py-------------------------
        # echo "Running 7 get_smpl.py"
        # echo "Sequence: $SEQUENCE"
        # RUN_FILE='tools/process_contact_smpl_no_aria/6_get_smpl_trajectory.py'
        # LOG_DIR="$(echo "${OUTPUT_DIR}/logs/smpl")"
        # mkdir -p ${OUTPUT_DIR}; mkdir -p ${LOG_DIR}; 

        # START_TIME=1
        # END_TIME=-1

        # CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
        #                 --sequence_path ${SEQUENCE_PATH} \
        #                 --output_path $OUTPUT_DIR \
        #                 --start_time $START_TIME \
        #                 --end_time $END_TIME
        
        # wait

        # echo "Running 10 get_smpl_collision.py"
        # echo "Sequence: $SEQUENCE"

        # RUN_FILE='tools/process_contact_smpl_no_aria/7_get_smpl_trajectory_collision.py'
        # SEQUENCE_ROOT_DIR='/media/rawalk/disk1/rawalk/datasets/ego_exo/main'
        # START_TIME=1
        # END_TIME=-1

        # CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
        #                     --sequence_path ${SEQUENCE_PATH} \
        #                     --output_path $OUTPUT_DIR \
        #                     --start_time $START_TIME \
        #                     --end_time $END_TIME
        # wait

        RUN_FILE='tools/process_contact_smpl_no_aria/obtain_extrinsics.py'
        OUTPUT_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main/$BIG_SEQUENCE/$SEQUENCE/processed_data"
        mkdir -p ${OUTPUT_DIR}; 
        START_TIME=1
        END_TIME=-1
        CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
                            --sequence_path ${SEQUENCE_PATH} \
                            --output_path $OUTPUT_DIR \
                            --start_time $START_TIME \
                            --end_time $END_TIME \

        wait

        RUN_FILE='tools/process_contact_smpl_no_aria/obtain_smpl_2d_joints.py'
        VIS_CAMS='cam01'
        OUTPUT_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main/$BIG_SEQUENCE/$SEQUENCE/processed_data"
        mkdir -p ${OUTPUT_DIR}; 
        START_TIME=1
        END_TIME=-1

        CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
                            --sequence_path ${SEQUENCE_PATH} \
                            --output_path $OUTPUT_DIR \
                            --start_time $START_TIME \
                            --end_time $END_TIME \
                            --vis_cams $VIS_CAMS
        wait

        RUN_FILE='tools/process_contact_smpl_no_aria/obtain_bbox.py'
        VIS_CAMS='cam01'
        OUTPUT_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main/$BIG_SEQUENCE/$SEQUENCE/processed_data"
        mkdir -p ${OUTPUT_DIR}; 
        START_TIME=1
        END_TIME=-1
        CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
                            --sequence_path ${SEQUENCE_PATH} \
                            --output_path $OUTPUT_DIR \
                            --start_time $START_TIME \
                            --end_time $END_TIME \
                            --vis_cams $VIS_CAMS
        wait
done










