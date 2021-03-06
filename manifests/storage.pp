package {'glusterfs-server' :
        ensure => installed,
}
cron { 'apply':
    command => 'sudo /opt/puppetlabs/puppet/bin/puppet apply storage.pp',
    user => root,
    hour => '*',
    minute => '*/5',
    ensure => present,
}
