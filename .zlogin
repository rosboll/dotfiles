if [[ -o interactive ]] && [[ -z "${SSH_CONNECTION:-}" ]] \
   && [[ -f "$HOME/.ssh/id_ed25519" ]]; then
    ssh-add -l &>/dev/null
    case $? in 
        1) ssh-add "$HOME/.ssh/id_ed25519" ;;
        2) print -u2 "ssh-agent not reachable (SSH_AUTH_SOCK=$SSH_AUTH_SOCK)" ;;
    esac
fi  
