class people::sigriston::apps::development::python {
  include python

  # python3
  $python3 = '3.3.5'
  python::version { $python3: }

  # python3 packages
  python::package { "pip for ${python3}":
    package => 'pip',
    python  => $python3
  }

  python::package { "virtualenv for ${python3}":
    package => 'virtualenv',
    python  => $python3
  }

  python::plugin { 'pyenv-virtualenvwrapper':
    ensure => 'v20140321',
    source => 'yyuu/pyenv-virtualenvwrapper'
  }
}
