class people::sigriston::apps::development::ruby {
  # ruby packages
  ruby_gem { 'terminal-notifier for system':
    gem          => 'terminal-notifier',
    ruby_version => '*'
  }
}
