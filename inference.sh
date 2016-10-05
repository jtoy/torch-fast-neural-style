#!/bin/bash
OUTPUT="/data/output/$(date +%s).jpg"
#script
th fast_neural_style.lua $@ -output_dir "$OUTPUT"
