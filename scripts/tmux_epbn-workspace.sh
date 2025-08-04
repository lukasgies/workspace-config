#!/bin/bash

### TMUX WORKSPACE STARTER BY LUKAS GIES ###

EPBN_POSTGRES_PATH="/home/lgies/projects/epbn/infrastructure/docker/postgres"
EPBN_SERVER_PATH="/home/lgies/epbn1/server33"
EPBN_PROJECT_TARGET_PATH="/home/lgies/projects/epbn/module-ear/target/"
EPBN_SERVER_DEPLOYMENT_PATH="/home/lgies/epbn1/server33/standalone/deployments/"

# 1
tmux new-session -d -s "ePBN-workspace" -n "ePBN Server"
tmux send-keys -t ePBN-workspace:1 "cd $EPBN_SERVER_PATH && clear" C-m

# 2
tmux new-window -t ePBN-workspace:2 -n "Docker Postgres"
tmux send-keys -t ePBN-workspace:2 "cd $EPBN_POSTGRES_PATH" C-m

# 3
tmux new-window -t ePBN-workspace:3 -n "Copy Panel"
tmux split-window -h -t ePBN-workspace:3
tmux send-keys -t ePBN-workspace:3.1 "cd $EPBN_PROJECT_TARGET_PATH" C-m    # Left
tmux send-keys -t ePBN-workspace:3.2 "cd $EPBN_SERVER_DEPLOYMENT_PATH" C-m # Right

# Attach to the tmux session
tmux attach-session -t ePBN-workspace
