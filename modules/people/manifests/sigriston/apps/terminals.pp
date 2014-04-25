class people::sigriston::apps::terminals {
  require people::sigriston::config

  include iterm2::dev

  # iTerm2 config
  $it2plist = 'com.googlecode.iterm2.plist'
  $it2plsrc = "puppet:///modules/people/sigriston/plists/${it2plist}"
  $it2pldst = "${people::sigriston::config::prefs_dir}/${it2plist}"
  file { $it2pldst:
    ensure  => file,
    replace => false,
    mode    => '0600',
    source  => $it2plsrc
  }
  ~>
  exec { 'persist iTerm2 Preference changes':
    command     => 'killall cfprefsd && sleep 3',
    refreshonly => true
  }
}
