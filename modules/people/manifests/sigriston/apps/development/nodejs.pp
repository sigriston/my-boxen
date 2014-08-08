class people::sigriston::apps::development::nodejs {

  include nodejs::v0_10

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

  nodejs::module { 'eslint':
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
}
