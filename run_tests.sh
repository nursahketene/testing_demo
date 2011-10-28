#!/bin/bash -x
source "/usr/local/rvm/scripts/rvm"
rvm use 1.9.2
ruby -v
bundle install
bundle exec rake db:migrate
bundle exec rake cucumber
bundle exec rake db:reset
thin start -d
/usr/local/bin/pybot robot_tests
thin stop
