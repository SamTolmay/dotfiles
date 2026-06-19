# Put nvm's active node bin on PATH for ALL shells (interactive + non-
# interactive). Needed because Claude Code's shell snapshot captures PATH from
# the parent process env (whatever PATH the terminal was launched with), not
# from post-.zshrc state — so nvm needs to be on PATH before Claude Code spawns.
#
# This reads the `default` alias and prepends the resolved bin dir. Doing it
# this way (instead of sourcing full nvm.sh) keeps non-interactive shell
# startup cheap.
export NVM_DIR="$HOME/.nvm"
if [ -f "$NVM_DIR/alias/default" ]; then
  _nvm_default=$(cat "$NVM_DIR/alias/default")
  # Resolve alias chain (e.g. "default" -> "24" -> "v24.14.0").
  while [ -f "$NVM_DIR/alias/$_nvm_default" ]; do
    _nvm_default=$(cat "$NVM_DIR/alias/$_nvm_default")
  done
  # The alias may be "v24.14.0" or "24"; find a matching versions/node/v* dir.
  _nvm_bin="$NVM_DIR/versions/node/v${_nvm_default#v}"
  if [ ! -d "$_nvm_bin" ]; then
    _nvm_bin=$(ls -d "$NVM_DIR/versions/node/v${_nvm_default#v}"* 2>/dev/null | sort -V | tail -1)
  fi
  [ -d "$_nvm_bin/bin" ] && export PATH="$_nvm_bin/bin:$PATH"
  unset _nvm_default _nvm_bin
fi
