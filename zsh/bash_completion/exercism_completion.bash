__from_exercism_config() {
  COMPREPLY=()
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=($(compgen -W 'current demo fetch login logout restore submit unsubmit whoami help' -- $cur))
}
 
complete -F __from_exercism_config -o default exercism
