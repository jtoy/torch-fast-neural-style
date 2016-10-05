#!/bin/bash
OUTPUT="/data/output/$(date +%s).jpg"
#script
/home/ubuntu/torch/install/bin/th fast_neural_style.lua $@ -output_dir "$OUTPUT"
