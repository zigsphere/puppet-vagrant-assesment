# Base profile, all common resources go here
class profiles::base {

  include ::epel

  class { 'timezone':
    region   => 'Europe',
    locality => 'London',
  }

  class { 'firewall':
    ensure => 'stopped',
  }

  file { '/etc/motd':
    ensure  => file,
    mode    => '0644',
    content => "Hostname: ${facts['fqdn']}\nRole: ${facts['role']}\n",
  }

}
