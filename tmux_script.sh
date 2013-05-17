#!/bin/sh

tmux start-server
tmux new-session -d -s main -n mutt
tmux split-window -tmain:1 -v 
tmux new-window -tmain:2 -n vimwiki
tmux new-window -tmain:3 -n code
tmux new-window -tmain:4 -n shell

tmux send-keys -tmain:1 'mutt' C-m
tmux select-pane -tmain:1.0
tmux send-keys -tmain:1 'bitlbee -D && weechat-curses' C-m
tmux send-keys -tmain:2 'vim ~/vimwiki/index.wiki' C-m
tmux send-keys -tmain:3 'cd galois' C-m
tmux send-keys -tmain:4 'cd galois' C-m
 
tmux select-window -tmain:1
tmux attach-session -d -tmain
