class people::sigriston::apps::development::nodejs {

  nodejs::version { 'v0.12': }

  # default to node v0.12
  class { 'nodejs::global':
    version => 'v0.12'
  }

  # NPM packages
  nodejs::module { 'babel': node_version => 'v0.12' }
  nodejs::module { 'bower': node_version => 'v0.12' }
  nodejs::module { 'coffee-script': node_version => 'v0.12' }
  nodejs::module { 'coffeelint': node_version => 'v0.12' }
  nodejs::module { 'eslint': node_version => 'v0.12' }
  nodejs::module { 'grunt-cli': node_version => 'v0.12' }
  nodejs::module { 'gulp': node_version => 'v0.12' }
  nodejs::module { 'html2jade': node_version => 'v0.12' }
  nodejs::module { 'jake': node_version => 'v0.12' }
  nodejs::module { 'js-beautify': node_version => 'v0.12' }
  nodejs::module { 'js-yaml': node_version => 'v0.12' }
  nodejs::module { 'js2coffee': node_version => 'v0.12' }
  nodejs::module { 'jsonlint': node_version => 'v0.12' }
  nodejs::module { 'jspm': node_version => 'v0.12' }
  nodejs::module { 'karma-cli': node_version => 'v0.12' }
  nodejs::module { 'less': node_version => 'v0.12' }
  nodejs::module { 'LiveScript': node_version => 'v0.12' }
  nodejs::module { 'npm-check-updates': node_version => 'v0.12' }
  nodejs::module { 'sloc': node_version => 'v0.12' }
  nodejs::module { 'yo': node_version => 'v0.12' }
}
