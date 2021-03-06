package { 'emacs':
        ensure => present,
}
package { 'jed':
        ensure => present,
}
package { 'subversion':
        ensure => present,
}
package { 'git':
        ensure => present,
}
cron { 'apply':
    command => 'sudo /opt/puppetlabs/puppet/bin/puppet apply developers.pp',
    user => root,
    hour => '*',
    minute => '*/5',
    ensure => present,
}
