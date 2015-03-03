class tools::phpmyadmin {

    package { "phpmyadmin":
        ensure  => latest,
        require => [ Class['server'], Package['apache2'] ],
    }

    file { '/etc/apache2/conf-available/phpmyadmin.conf':
        ensure => 'link',
        target => '/etc/phpmyadmin/apache.conf',
        require => [ Class['server'], Package['apache2'], Package['phpmyadmin'] ],
    }

    exec { 'enable phpmyadmin':
        onlyif  => 'test `ls -l /etc/apache2/conf-enabled/ 2> /dev/null | grep phpmyadmin | wc -l` -ne 1',
        command => 'sudo a2enconf phpmyadmin',
        notify  => Service['apache2'],
        require => [ Class['server'], Package['apache2'], Package['phpmyadmin'] ],
    }
}
