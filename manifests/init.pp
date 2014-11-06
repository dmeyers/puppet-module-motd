# == Class: motd
#
# Module to manage motd
#
class motd (

) {

  #$banner = "Don't be stupid.\n" #No major mistakes in ${::uptime}.\n"

  #  $banner = $::role ? {
  #  'puppetmaster' => "Bow down before the master.\n",
  #  'puppetslave'  => "I am but a lowly client.\n",
  #  default        => "Don't be stupid.\n",
  #}

  case $::role {
    'puppetmaster': {
      $banner = "Bow down before the master.\n"
    }
    'puppetslave': {
      $banner = "I am but a lowly client.\n"
    }
    default: {
      #$banner = "Don't be stupid.\n"
      fail("role is <${::role}>, not puppetmaster nor puppetslave")
    }
  }

  file { '/etc/motd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    #source => 'puppet:///modules/motd/motd',
    content => $banner,
  }

  # potentially include/require other modules

  # validate all params

}
