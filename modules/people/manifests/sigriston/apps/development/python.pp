class people::sigriston::apps::development::python {
  include python

  # python3
  $python3 = '3.4.1'
  python::version { $python3: }

  # python3 packages
  python::package { "virtualenv for ${python3}":
    package => 'virtualenv',
    python  => $python3
  }

  python::plugin { 'pyenv-virtualenvwrapper':
    ensure => 'v20140609',
    source => 'yyuu/pyenv-virtualenvwrapper'
  }
}
