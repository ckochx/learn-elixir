# Erlang

Install KERL https://github.com/kerl/kerl

cd ~/
curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl
chmod a+x kerl
cp kerl /usr/local/bin

Kerl shell completion? if you want that.
curl -O https://github.com/kerl/kerl/raw/master/zsh_completion/_kerl

kerl list releases
kerl build 20.3 20.3
mkdir -p ~/erlang/20.3
kerl install 20.3 ~/erlang/20.3
source "~/erlang/20.3/activate"

# Add this line to you .zshrc file
[ -s "/Users/ckoch/erlang/20.3/activate" ] && source "/Users/ckoch/erlang/20.3/activate"


# Elixir

Install KIEX
\curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s
# In .bashrc (or .zshrc if you use z shell), add the following
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

kiex list known
kiex install 1.6.4
kiex use 1.6.4
kiex default 1.6.4
