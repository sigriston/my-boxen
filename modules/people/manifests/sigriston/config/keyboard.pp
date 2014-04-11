class people::sigriston::config::keyboard {
  require people::sigriston::config

  $kbd_id = 15000
  $kbd_name = "USInternational-PC"
  $kbd_plist_key = "KeyboardSetup"
  $kbd_unless = "/usr/bin/defaults read ${people::sigriston::config::plist} ${kbd_plist_key} | grep 1"

  exec { "Install KeyboardLayout ${kbd_name}":
    provider => shell,
    command  => "defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>${kbd_id}</integer><key>KeyboardLayout Name</key><string>${kbd_name}</string></dict>'",
    cwd      => $people::sigriston::config::home_dir,
    user     => $::boxen_user
    unless   => $kbd_unless,
  }
  ->
  exec { 'Confirm Keyboard Setup':
    provider => shell,
    command  => "defaults write ${people::sigriston::config::plist} ${kbd_plist_key} -bool true",
    cwd      => $people::sigriston::config::home_dir,
    user     => $::boxen_user
    unless   => $kbd_unless,
  }
}
