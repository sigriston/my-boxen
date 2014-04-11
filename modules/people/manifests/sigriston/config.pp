class people::sigriston::config {
  $home_dir = "/Users/${::boxen_user}"
  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"

  $fonts_dir = "${home_dir}/Library/Fonts"
  $prefs_dir = "${home_dir}/Library/Preferences"
  $plist = "com.${::boxen_user}.boxen"

  # boxen repodir link
  file { "${boxen::config::srcdir}/boxen":
    ensure  => link,
    target  => $boxen::config::repodir,
    require => File[$boxen::config::srcdir]
  }

  # dotfiles
  repository { $dotfiles_dir:
    source  => "${::github_login}/dotfiles",
    require => File[$boxen::config::srcdir]
  }

  include people::sigriston::config::keyboard
  include people::sigriston::config::dock
  include people::sigriston::config::shell
}
