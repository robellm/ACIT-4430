class users {
        group { 'developer':
                ensure => present,
        }

        user { 'bob':
                ensure => present,
                comment => 'This is 4 BOBBY',
                shell => '/bin/bash',
                home => '/home/bob',
                groups => ['sudo'],
                managehome => 'true',
        }
        user { 'janet':
                ensure => present,
                comment => 'JANET, FROM DEVELOPERS GROUP',
                shell => '/bin/bash',
                home => '/home/janet',
                groups => ['sudo', 'developer'],
                managehome => 'true',
        }
        user { 'alice':
                ensure => present,
                comment => 'ALICE FROM WONDERLAND',
                shell => '/bin/bash',
                home => '/home/alice',
                groups => ['sudo'],
                managehome => 'true',
        }
        user { 'tim':
                ensure => present,
                comment => 'TIM, FROM DEVELOPERS GROUP',
                shell => '/bin/bash',
                home => '/home/bob',
                groups => ['sudo', 'developer'],
                managehome => 'true',
        }
}
