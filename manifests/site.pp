require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  include nodejs::v0_6
  include nodejs::v0_8
  include nodejs::v0_10

  # default ruby versions
  ruby::version { '1.9.3': }
  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }
  ruby::version { '2.1.1': }

  # my packages
  include vagrant
  include phantomjs::1_9_0
  include virtualbox
  include firefox
  include packer
  include flux
  include iterm2::dev
  include iterm2::colors::solarized_dark
  include iterm2::colors::solarized_light
  include wget
  include transmission
  include chrome
  include macvim
  include mou
  include mou::themes
  include dockutil
  include ctags
  include git-flow
  include python
  include zsh
  include prezto

  # osx settings
  include osx::dock::autohide

  # TODO: hiera?
  #mou::preferences { 'Mou':
  #  theme => 'Solarized (Dark)+',
  #  css => 'GitHub2'
  #}

  # Dock customization
  dockutil::item { 'Remove Contacts':
    item   => '/Applications/Contacts.app',
    label  => 'Contacts',
    action => 'remove'
  }

  dockutil::item { 'Remove Calendar':
    item   => '/Applications/Calendar.app',
    label  => 'Calendar',
    action => 'remove'
  }

  dockutil::item { 'Remove Notes':
    item   => '/Applications/Notes.app',
    label  => 'Notes',
    action => 'remove'
  }

  dockutil::item { 'Remove Maps':
    item   => '/Applications/Maps.app',
    label  => 'Maps',
    action => 'remove'
  }

  dockutil::item { 'Remove FaceTime':
    item   => '/Applications/FaceTime.app',
    label  => 'FaceTime',
    action => 'remove'
  }

  dockutil::item { 'Remove Photo Booth':
    item   => '/Applications/Photo Booth.app',
    label  => 'Photo Booth',
    action => 'remove'
  }

  dockutil::item { 'Remove iBooks':
    item   => '/Applications/iBooks.app',
    label  => 'iBooks',
    action => 'remove'
  }

  dockutil::item { 'Remove System Preferences':
    item   => '/Applications/System Preferences.app',
    label  => 'System Preferences',
    action => 'remove'
  }

  dockutil::item { 'Add iTerm':
    item   => '/Applications/iTerm.app',
    label  => 'iTerm',
    action => 'add'
  }

  # default to node v0.10
  class { 'nodejs::global':
    version => 'v0.10'
  }

  # NPM packages
  nodejs::module { 'bower':
    node_version => 'v0.10'
  }

  nodejs::module { 'coffee-script':
    node_version => 'v0.10'
  }

  nodejs::module { 'coffeelint':
    node_version => 'v0.10'
  }

  nodejs::module { 'grunt-cli':
    node_version => 'v0.10'
  }

  nodejs::module { 'jake':
    node_version => 'v0.10'
  }

  nodejs::module { 'js-beautify':
    node_version => 'v0.10'
  }

  nodejs::module { 'js-yaml':
    node_version => 'v0.10'
  }

  nodejs::module { 'js2coffee':
    node_version => 'v0.10'
  }

  nodejs::module { 'jshint':
    node_version => 'v0.10'
  }

  nodejs::module { 'jsonlint':
    node_version => 'v0.10'
  }

  nodejs::module { 'less':
    node_version => 'v0.10'
  }

  nodejs::module { 'LiveScript':
    node_version => 'v0.10'
  }

  nodejs::module { 'npm-check-updates':
    node_version => 'v0.10'
  }

  nodejs::module { 'sloc':
    node_version => 'v0.10'
  }

  # ruby packages
  ruby::gem { 'terminal-notifier for system':
    gem  => 'terminal-notifier',
    ruby => 'system'
  }

  # python3
  $python3 = '3.3.5'
  python::version { $python3: }

  # python3 packages
  python::package { "pip for ${python3}":
    package => 'pip',
    python  => $python3
  }

  python::package { 'virtualenv for ${python3}':
    package => 'virtualenv',
    python  => $python3
  }

  python::plugin { 'pyenv-virtualenvwrapper':
    source => 'yyuu/pyenv-virtualenvwrapper',
    ensure => 'v20140321'
  }

  # common, useful packages
  package {
    [
      'the_silver_searcher',
      'findutils',
      'gnu-tar'
    ]:
  }

  # boxen repodir link
  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  # powerline fonts
  $powerlinefonts = "${boxen::config::srcdir}/powerline-fonts"
  repository { $powerlinefonts:
    source  => "Lokaltog/powerline-fonts",
    require => File[$boxen::config::srcdir]
  }
  $fontsdest = '/Library/Fonts'
  exec { 'Install DejaVuSansMono Font':
    command => "cp ${powerlinefonts}/DejaVuSansMono/*.ttf ${fontsdest}",
    creates => "${fontsdest}/DejaVu Sans Mono for Powerline.ttf"
  }
}
