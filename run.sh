#!/bin/bash

export CUDA_VISIBLE_DEVICES=5

labels=reddit,facebook,NeteaseMusic,twitter,qqmail,instagram,weibo,iqiyi,
labels+=imdb,TED,douban,amazon,youtube,JD,youku,baidu,google,tieba,taobao,bing


output_dir=../save/teacher

python run.py \
    --do_eval \
    --data_dir ../data \
    --dataset d1 \
    --output_dir ${output_dir} \
    --epochs 5 --labels $labels \
    --batch_size 256 --gpu 0 --gamma 1 \
    --model EBSNN_LSTM --segment_len 16 \
    --embedding_dim 16 \
    --dropout 0.5 \
    --no_bidirectional \
    --log_filename ${output_dir}/plog.log \
    --logging_steps 50 \
    --shuffle
