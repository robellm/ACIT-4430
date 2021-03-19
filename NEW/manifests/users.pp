class users {
        group { 'developers':
                ensure => present,
        }

        user { 'bob':
                ensure => present,
                comment => 'This is BOBBYs account',
                shell => '/bin/bash',
                home => '/home/bob',
                groups => ['sudo'],
                managehome => 'true',
                password => '$1$u7o3O9lw$TU7rwH55qm6VfPCKaviuR.',
        }
        user { 'janet':
                ensure => present,
                comment => 'JANET, FROM DEVELOPERS GROUP',
                shell => '/bin/bash',
                home => '/home/janet',
                groups => ['sudo', 'developers'],
                managehome => 'true',
                password => '$1$7RTvKFvl$E6B0/5SAmJJPGZVKMZCo71',
        }
        user { 'alice':
                ensure => present,
                comment => 'ALICE FROM WONDERLAND',
                shell => '/bin/bash',
                home => '/home/alice',
                groups => ['sudo'],
                managehome => 'true',
                password => '$1$chU8epv4$gqEyE7wmRGOF85WO1Q06Y1',
        }
        user { 'tim':
                ensure => present,
                comment => 'TIM, FROM DEVELOPERS GROUP',
                shell => '/bin/bash',
                home => '/home/tim',
                groups => ['sudo', 'developers'],
                managehome => 'true',
                password => '$1$xSXKSBo8$2ekmfp7mwsjcnmE.iCTHg/',
        }
}
