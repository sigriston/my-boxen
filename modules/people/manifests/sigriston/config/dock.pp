class people::sigriston::config::dock {
  require people::sigriston::config

  # autohide
  include osx::dock::autohide

  # Dock customizations
  include dockutil
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
}
