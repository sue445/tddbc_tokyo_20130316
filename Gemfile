source 'http://rubygems.org'

group :development do
  gem 'rspec', '~> 2.13.0'
  gem 'rspec-parameterized', git: "git://github.com/tomykaira/rspec-parameterized.git", ref: "7cf95fceb02ff45b082b3ce0b8323db88a4bef98"
  gem 'guard-rspec'

  # ref. https://github.com/guard/guard#efficient-filesystem-handling
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false

  # Runs on Mac OS X
  gem 'growl'

  # Runs on Linux, FreeBSD, OpenBSD and Solaris
  #gem 'libnotify'

  # Runs on Windows
  #gem 'rb-notifu'

  gem 'coveralls', require: false
end
