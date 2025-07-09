#!/bin/bash

### TMUX WORKSPACE STARTER BY LUKAS GIES ###

# Define customizable paths here
WORKSPACE_PATH="~"
EPBN_POSTGRES_PATH="/home/lgies/projects/epbn/infrastructure/docker/postgres"
EPBN_SERVER_PATH="/home/lgies/epbn1/server/wildfly23/epbn"
EPBN_PROJECT_PATH="/home/lgies/projects/epbn"

# Start a new tmux session
tmux new-session -d -s "starter_session" -n "Workspace"

# Set up the first window (Workspace) with 1 pane
tmux send-keys -t starter_session:1 "cd $WORKSPACE_PATH && clear" C-m

# Create a new window for "ePBN Servers"
tmux new-window -t starter_session:2 -n "ePBN Servers"

# Split the window into 3 panes
tmux split-window -h -t starter_session:2 # Split vertically for right/left
tmux split-window -v -t starter_session:2 # Split the right pane horizontally for top/bottom

# Set up each pane with its respective paths
tmux send-keys -t starter_session:2.1 "cd $EPBN_POSTGRES_PATH && clear" C-m # Left pane
tmux send-keys -t starter_session:2.2 "cd $EPBN_PROJECT_PATH && clear" C-m  # Right bottom pane
tmux send-keys -t starter_session:2.3 "cd $EPBN_SERVER_PATH && clear" C-m   # Right top pane

# Attach to the tmux session
tmux attach-session -t starter_session
