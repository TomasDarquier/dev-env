#!/usr/bin/env bash

SESSION=chtsh

if ! tmux has-session -t $SESSION 2>/dev/null; then
    # Si no existe la sesión, crearla y correr el script
    tmux new-session -s $SESSION -n cheat -d "$HOME/.local/scripts/chtsh-loop.sh"
    # Cambiar fondo gris (solo para esta sesión)
    tmux set-option -t $SESSION window-style 'bg=colour236'
    tmux set-option -t $SESSION window-active-style 'bg=colour236'
    tmux select-pane -t $SESSION:0.0 -P 'bg=colour236'
fi

# Atacharse a la sesión desde kitty
tmux attach-session -t $SESSION
