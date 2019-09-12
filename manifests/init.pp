# Base class for agents. Installs packages from common in hieradata
class base {
  case $::osfamily {
    'RedHat': { include base::linux }
    'Debian': { include base::linux }
    'windows': { fail('no') }
    default: { include base::linux }
  }
}
