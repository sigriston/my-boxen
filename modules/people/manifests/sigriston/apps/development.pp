class people::sigriston::apps::development {
  require people::sigriston::config
  require homebrew

  include vagrant
  include phantomjs::1_9_0
  include virtualbox
  include packer
  include ctags
  include sequel_pro
  include java
  include jmeter
  include docker
  include fig

  # .gitconfig
  file { "${people::sigriston::config::home_dir}/.gitconfig":
    ensure  => link,
    target  => "${people::sigriston::config::dotfiles_dir}/git/gitconfig",
    require => Repository[$people::sigriston::config::dotfiles_dir]
  }

  # homebrew packages
  package { 'jq': }

  include people::sigriston::apps::development::nodejs
  include people::sigriston::apps::development::ruby
  include people::sigriston::apps::development::python
}
