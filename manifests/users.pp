$users = ['bob', 'janet', 'alice', 'tim']
user { $users:
        ensure => present,
        shell => '/bin/bash',
        managehome => 'true',
}

$developers = ['janet', 'tim']
group { $developers:
        ensure => present,
        gid => 500,
}
