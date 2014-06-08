#!/bin/sh

# remove .lock files
rm -f {Gemfile,Puppetfile}.lock

# Regenerates Gemfile.lock and installs new Gems
bundle install --without development

# Regenerates Puppetfile.lock and caches tarballs
bundle exec librarian-puppet install --clean --path ./shared
