#!/bin/bash

SESSION_NAME="default"

# Start a new tmux session with the specified name
tmux new-session -s "$SESSION_NAME" -d

# Split the window horizontally and vertically
tmux split-window -h
tmux split-window -v

# Attach to the tmux session
tmux -2 attach-session -d -t "$SESSION_NAME"

