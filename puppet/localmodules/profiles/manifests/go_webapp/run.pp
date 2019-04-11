# Run the "webapp"
class profiles::go_webapp::run {
  exec {'build-go_webapp':
    cwd     => '/vagrant/app',
    command => '/usr/bin/go build /vagrant/app/go-webapp.go',
    creates => '/vagrant/app/go-webapp'
  }

  systemd::unit_file { 'webapp.service':
    content => template('data/webapp/webapp.service.erb'),
    enable  => true,
    active  => true,
    notify  => Service['webapp'],
    require => Exec['build-go_webapp'],
  }

  -> service { 'webapp':
      ensure => running,
      enable => true,
    }
}
