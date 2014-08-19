class people::sigriston::apps::browsers {
  class { 'firefox':
    version => '31.0'
  }
  include chrome
}
