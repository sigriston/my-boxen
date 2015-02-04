# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.10.0"

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.5"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.2.0"
github "git",         "2.7.2"
github "go",          "2.1.0"
github "homebrew",    "1.11.2"
github "hub",         "1.3.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.5"
github "nodejs",      "4.0.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.3.0"
github "stdlib",      "4.2.2", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "property_list_key", "0.2.1", :repo => "glarizza/puppet-property_list_key"
github "vagrant",           "3.2.2"
github "osx",               "2.8.0"
github "virtualbox",        "1.0.13"
github "firefox",           "1.2.3"
github "packer",            "1.3.0"
github "flux",              "1.0.1"
github "iterm2",            "1.2.4"
github "wget",              "1.0.1"
github "transmission",      "1.1.0"
github "chrome",            "1.2.0"
github "macvim",            "1.0.0"
github "mou",               "1.1.3"
github "dockutil",          "0.2.1"
github "ctags",             "1.0.0"
github "python",            "2.0.3", :repo => "sigriston/puppet-python"
github "zsh",               "1.0.0"
github "prezto",            "1.0.1", :repo => "archfear/puppet-prezto"
github "tmux",              "1.0.2"
github "alfred",            "1.3.1"
github "vlc",               "1.1.0"
github "skype",             "1.1.0"
github "sequel_pro",        "1.0.1"
github "java",              "1.8.0"
github "spectacle",         "1.0.0"
github "jmeter",            "0.1.5"
github "docker",            "0.8.0"
github "fig",               "1.0.0"
