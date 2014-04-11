class people::sigriston::apps::development::ruby {
  # ruby packages
  ruby::gem { 'terminal-notifier for system':
    gem  => 'terminal-notifier',
    ruby => 'system'
  }
}
