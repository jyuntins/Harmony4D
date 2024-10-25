cd ../..

DEVICES=1
declare -A big_sequences=(
    # ["13_hugging"]="1"
    # ["15_grappling2"]="1 2 5 10 12 14 17 19 21 23 24 26 28 29 31 32 34 35 37 38 40 41 42 43 44 45 46 47 48 49 50 51 53 54 55"
    # ["16_grappling3"]="1 3 4 5 8 9 10 12 13 14 15 16 17 20 21 24"
    ["18_sword"]="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19"
    # ["19_sword2"]="1 2 3 4 5 6 7 8"
    ["21_ballroom"]="1 2 3 4 5 6 7 8 9 10 11 12 13"
    ["23_ballroom3"]="1 4 5 6"
    # ["28_karate"]="4 5 6 7 8 9 10 12 13 15"
    # ["29_karate2"]="1 2 3 4 5 7 9"
    ["30_karate3"]="1"
    ["31_mma"]="1 2"
    ["32_mma2"]="1"
    # ["33_mma3"]="1 2 3 5 7 8 14"
    # ["34_mma4"]="1 2 4 5 6 10 13 14 17 19 20 21 22 23 25"
)
big_sequences_order=("13_hugging" "15_grappling2" "16_grappling3" "18_sword" "19_sword2" "21_ballroom" "23_ballroom3" "28_karate" "29_karate2" "30_karate3" "31_mma" "32_mma2" "33_mma3" "34_mma4")

SEQUENCE_ROOT_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main"
for big_sequence in "${big_sequences_order[@]}"; do
        training_numbers="${big_sequences[$big_sequence]}"
        name_base="${big_sequence##*_}"
        for number in $training_numbers; do
                padded_number=$(printf "%03d" $number)
                sequence="${padded_number}_${name_base}"
        
                OUTPUT_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main/$big_sequence/$sequence/processed_data"
                SEQUENCE_PATH=$SEQUENCE_ROOT_DIR/$big_sequence/$sequence
                # mkdir -p ${OUTPUT_DIR}; 
                echo $OUTPUT_DIR
                RUN_FILE='tools/process_smpl/obtain_smpl_2d_joints_45.py'
                START_TIME=1
                END_TIME=-1
                
                VIS_CAMS='cam01'
                CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
                                --sequence_path ${SEQUENCE_PATH} \
                                --output_path $OUTPUT_DIR \
                                --start_time $START_TIME \
                                --end_time $END_TIME \
                                --vis_cams $VIS_CAMS
                wait
        done
done








# BIG_SEQUENCE="23_ballroom3"
# SEQUENCE_LIST="001_ballroom3"
# SEQUENCE_ROOT_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main"
# for SEQUENCE in $SEQUENCE_LIST
# do      
#     OUTPUT_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main/$BIG_SEQUENCE/$SEQUENCE/processed_data"
#     mkdir -p ${OUTPUT_DIR}; 
#     SEQUENCE_PATH=$SEQUENCE_ROOT_DIR/$BIG_SEQUENCE/$SEQUENCE
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
    # RUN_FILE='tools/process_contact_smpl/0_get_contact_pose3d.py'
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

    # ##-------------------------4_refine_poses3d.py-------------------------
    # echo "Running 4_refine_poses3d.py"
    # echo "Sequence: $SEQUENCE"
    # RUN_FILE='tools/process_smpl/2_refine_poses3d.py'
    # LOG_DIR="$(echo "${OUTPUT_DIR}/logs/refine_poses3d")"
    # mkdir -p ${OUTPUT_DIR}; mkdir -p ${LOG_DIR}; 

    # START_TIME=1
    # END_TIME=-1

    # LOG_FILE="$(echo "${LOG_DIR}/log_start_${START_TIME}_end_${END_TIME}.txt")"; touch ${LOG_FILE}
    # CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
    #                 --sequence_path ${SEQUENCE_PATH} \
    #                 --output_path $OUTPUT_DIR \
    #                 --start_time $START_TIME \
    #                 --end_time $END_TIME \

    # ##-------------------------5_get_init_smpl.py-------------------------
    # echo "Running 5_fit_poses3d.py"
    # echo "Sequence: $SEQUENCE"
    # RUN_FILE='tools/process_smpl/3_fit_poses3d.py'
    # LOG_DIR="$(echo "${OUTPUT_DIR}/logs/fit_poses3d")"
    # mkdir -p ${OUTPUT_DIR}; mkdir -p ${LOG_DIR}; 

    # START_TIME=1
    # END_TIME=-1

    # LOG_FILE="$(echo "${LOG_DIR}/log_start_${START_TIME}_end_${END_TIME}.txt")"; touch ${LOG_FILE}
    # CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
    #                 --sequence_path ${SEQUENCE_PATH} \
    #                 --output_path $OUTPUT_DIR \
    #                 --start_time $START_TIME \
    #                 --end_time $END_TIME \
    
    ##-------------------------6_get_init_smpl.py-------------------------
#     echo "Running 6_get_init_smpl.py"
#     echo "Sequence: $SEQUENCE"
#     RUN_FILE='tools/process_smpl/4_get_init_smpl.py'
#     CHOOSEN_CAMS='cam01:rgb---cam02:rgb---cam03:rgb---cam04:rgb---cam05:rgb---cam06:rgb---cam07:rgb---cam08:rgb---cam09:rgb---cam10:rgb---cam11:rgb---cam12:rgb---cam13:rgb---cam14:rgb---cam15:rgb---cam16:rgb---cam17:rgb---cam18:rgb---cam19:rgb---cam20:rgb'
#     mkdir -p ${OUTPUT_DIR};
#     NUM_JOBS=4
#     SEQUENCE_LENGTH=$(find $SEQUENCE_ROOT_DIR/$BIG_SEQUENCE/$SEQUENCE/'exo'/'cam01'/'images' -maxdepth 1 -name '*.jpg' | wc -l)
#     echo SEQUENCE_LENGTH: $SEQUENCE_LENGTH
#     PER_JOB=$((SEQUENCE_LENGTH/NUM_JOBS))
#     echo PER_JOB: $PER_JOB
#     LAST_JOB_ITER=$((NUM_JOBS-1))
#     echo LAST_JOB_ITER: $LAST_JOB_ITER

#     for (( i=0; i < $NUM_JOBS; ++i ))
#     do
#             echo "i: $i"
#             START_TIME=$((i*PER_JOB + 1))
#             END_TIME=$((i*PER_JOB + PER_JOB))
#             echo "START_TIME: $START_TIME"
#             echo "END_TIME: $END_TIME"

#             if [ $i == $LAST_JOB_ITER ]
#             then
#                     END_TIME=-1

#             echo "START_TIME: $START_TIME"
#             echo "END_TIME: $END_TIME"

#             fi
            
#             CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
#                             --sequence_path ${SEQUENCE_PATH} \
#                             --output_path $OUTPUT_DIR \
#                             --start_time $START_TIME \
#                             --end_time $END_TIME \
#                             --choosen_cams $CHOOSEN_CAMS &


#     done
#     wait


#     ##-------------------------7_get_smpl.py-------------------------
#     echo "Running 7 get_smpl.py"
#     echo "Sequence: $SEQUENCE"
#     RUN_FILE='tools/process_smpl/5_get_smpl_trajectory.py'
#     LOG_DIR="$(echo "${OUTPUT_DIR}/logs/smpl")"
#     mkdir -p ${OUTPUT_DIR}; mkdir -p ${LOG_DIR}; 

#     START_TIME=1
#     END_TIME=-1

#     CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
#                     --sequence_path ${SEQUENCE_PATH} \
#                     --output_path $OUTPUT_DIR \
#                     --start_time $START_TIME \
#                     --end_time $END_TIME
#     wait
#     ##-------------------------8_get_collision_smpl.py-------------------------
#     RUN_FILE='tools/process_contact_smpl/1_get_smpl_trajectory_collision.py'
#     mkdir -p ${OUTPUT_DIR}; 

#     START_TIME=1
#     END_TIME=-1

#     CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
#                         --sequence_path ${SEQUENCE_PATH} \
#                         --output_path $OUTPUT_DIR \
#                         --start_time $START_TIME \
#                         --end_time $END_TIME
#     wait


#     RUN_FILE='tools/process_smpl/8_shape_matching.py'
#     START_TIME=1
#     END_TIME=-1
    
#     CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
#                         --sequence_path ${SEQUENCE_PATH} \
#                         --output_path $OUTPUT_DIR \
#                         --start_time $START_TIME \
#                         --end_time $END_TIME

#     wait



#     RUN_FILE='tools/process_contact_smpl_no_aria/replace_beta.py'
#     INIT_SMPL_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main/$BIG_SEQUENCE/$SEQUENCE/processed_data/init_smpl"
#     SMPL_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main/$BIG_SEQUENCE/$SEQUENCE/processed_data/smpl"
    
#     START_TIME=1
#     END_TIME=-1
    
#     CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
#                         --init_smpl_dir $INIT_SMPL_DIR \
#                         --smpl_dir $SMPL_DIR \
#                         --start_time $START_TIME \
#                         --end_time $END_TIME
#     wait



#     RUN_FILE='tools/process_smpl/9_freeze_betas.py'
#     START_TIME=1
#     END_TIME=-1
    
#     CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
#                     --sequence_path ${SEQUENCE_PATH} \
#                     --output_path $OUTPUT_DIR \
#                     --start_time $START_TIME \
#                     --end_time $END_TIME
#     wait
    # RUN_FILE='tools/process_smpl/obtain_extrinsics.py'
    # OUTPUT_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main/$BIG_SEQUENCE/$SEQUENCE/processed_data"
    # mkdir -p ${OUTPUT_DIR}; 
    # START_TIME=1
    # END_TIME=-1
    # CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
    #                     --sequence_path ${SEQUENCE_PATH} \
    #                     --output_path $OUTPUT_DIR \
    #                     --start_time $START_TIME \
    #                     --end_time $END_TIME \

    # wait

    # RUN_FILE='tools/process_smpl/obtain_smpl_2d_joints.py'
    # VIS_CAMS='cam01'
    # OUTPUT_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main/$BIG_SEQUENCE/$SEQUENCE/processed_data"
    # mkdir -p ${OUTPUT_DIR}; 
    # START_TIME=1
    # END_TIME=-1

    # CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
    #                     --sequence_path ${SEQUENCE_PATH} \
    #                     --output_path $OUTPUT_DIR \
    #                     --start_time $START_TIME \
    #                     --end_time $END_TIME \
    #                     --vis_cams $VIS_CAMS
    # wait

    # RUN_FILE='tools/process_smpl/obtain_bbox.py'
    # VIS_CAMS='cam01'
    # OUTPUT_DIR="/media/rawalk/disk1/rawalk/datasets/ego_exo/main/$BIG_SEQUENCE/$SEQUENCE/processed_data"
    # mkdir -p ${OUTPUT_DIR}; 
    # START_TIME=1
    # END_TIME=-1
    # CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
    #                     --sequence_path ${SEQUENCE_PATH} \
    #                     --output_path $OUTPUT_DIR \
    #                     --start_time $START_TIME \
    #                     --end_time $END_TIME \
    #                     --vis_cams $VIS_CAMS
    # wait
#     RUN_FILE='tools/process_smpl/cam_smpl.py'
#     START_TIME=1
#     END_TIME=-1

#     CUDA_VISIBLE_DEVICES=${DEVICES} python $RUN_FILE \
#                         --sequence_path ${SEQUENCE_PATH} \
#                         --output_path $OUTPUT_DIR \
#                         --start_time $START_TIME \
#                         --end_time $END_TIME \
#                         # --vis \

#     wait
# done










