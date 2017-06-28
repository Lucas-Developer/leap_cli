#
# Ensure we require the local version and not one we might have installed already
#
require File.join([File.dirname(__FILE__),'lib','leap_cli','version.rb'])

spec = Gem::Specification.new do |s|

  ##
  ## ABOUT THIS GEM
  ##
  s.name = 'leap_cli'
  s.version = LeapCli::VERSION
  s.author = 'LEAP Encryption Access Project'
  s.email = 'root@leap.se'
  s.homepage = 'https://leap.se'
  s.platform = Gem::Platform::RUBY
  s.summary = LeapCli::SUMMARY
  s.description = LeapCli::DESCRIPTION
  s.license = "MIT"

  ##
  ## GEM FILES
  ##

  s.files = `find lib -name '*.rb'`.split("\n")
  s.files += ["bin/leap"]
  s.files += `find vendor -name '*.rb'`.split("\n")
  s.files += `find vendor/vagrant_ssh_keys -name '*.pub' -o -name '*.key'`.split("\n")
  s.require_paths += LeapCli::LOAD_PATHS
  s.bindir = 'bin'
  s.executables << 'leap'

  ##
  ## DOCUMENTATION
  ##

  #s.has_rdoc = true
  #s.extra_rdoc_files = ['README.rdoc','leap_cli.rdoc']
  #s.rdoc_options << '--title' << 'leap_cli' << '--main' << 'README.rdoc' << '-ri'

  ##
  ## DEPENDENCIES
  ##

  # test
  s.add_development_dependency('minitest', '~> 5.0')
  s.add_development_dependency('rake', '~> 11.0')

  # console gems
  s.add_runtime_dependency('gli','~> 2.12', '>= 2.12.0')
  # note: gli version is also pinned in leap_cli.rb.

  # network gems
  s.add_runtime_dependency('sshkit', '~> 1.11')

  # crypto gems
  # s.add_runtime_dependency('gpgme')    # << does not build on debian jessie, so now optional.
                                         # also, there is a ruby-gpgme package anyway.

  s.add_runtime_dependency('acme-client', '~> 0.6')

  # misc gems
  s.add_runtime_dependency('ya2yaml', '~> 0.31')    # pure ruby yaml, so we can better control output. see https://github.com/afunai/ya2yaml
  s.add_runtime_dependency('json_pure', '~> 1.8')   # pure ruby json, so we can better control output.
end
