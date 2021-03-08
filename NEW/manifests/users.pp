class users {
        group { "developer":
                ensure => present,
                comment => "JANET & TIM GROUP",
                shell => "/bin/bash",
                home => "/home/developer",
                managehome => "true",
        }

        user { "bob":
                ensure => present,
                comment => "This is BOBBY's account",
                shell => "/bin/bash",
                home => "/home/bob",
                groups => ["sudo"],
                managehome => "true",
                password => "bob",
        }
        user { "janet":
                ensure => present,
                comment => "JANET, FROM DEVELOPERS GROUP",
                shell => "/bin/bash",
                home => "/home/janet",
                groups => ["sudo", "developer"],
                managehome => "true",
                password => "janet",
        }
        user { "alice":
                ensure => present,
                comment => "ALICE FROM WONDERLAND",
                shell => "/bin/bash",
                home => "/home/alice",
                groups => ["sudo"],
                managehome => "true",
                password => "alice",
        }
        user { "tim":
                ensure => present,
                comment => "TIM, FROM DEVELOPERS GROUP",
                shell => "/bin/bash",
                home => "/home/tim",
                groups => ["sudo", "developer"],
                managehome => 'true',
                password => "tim",
        }
}
