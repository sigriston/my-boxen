class people::sigriston::apps::editors {
  require people::sigriston::config

  include macvim
  include mou
  include mou::themes

  # {,g}vimrc
  file { "${people::sigriston::config::home_dir}/.vimrc":
    ensure  => link,
    target  => "${people::sigriston::config::dotfiles_dir}/vim/vimrc",
    require => Repository[$people::sigriston::config::dotfiles_dir]
  }
  file { "${people::sigriston::config::home_dir}/.gvimrc":
    ensure  => link,
    target  => "${people::sigriston::config::dotfiles_dir}/vim/gvimrc",
    require => Repository[$people::sigriston::config::dotfiles_dir]
  }

  # TODO: set mou preferences
  #mou::preferences { 'Mou':
  #  theme => 'Solarized (Dark)+',
  #  css => 'GitHub2'
  #}
}
