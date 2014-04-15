class people::sigriston::config::shell {
  require people::sigriston::config
  require homebrew

  # zsh ftw
  include zsh

  # tmux ftw
  include tmux

  # personal prezto branch
  class { 'prezto': repo => "${::github_login}/prezto" }

  # zsh-notify
  $zshnotify = "${people::sigriston::config::home_dir}/.zsh-notify"
  repository { $zshnotify:
    source  => 'marzocchi/zsh-notify'
  }

  # fasd
  package { 'fasd': }
}
