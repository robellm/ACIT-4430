user { "bob":
        ensure => present,
        home => '/home/bob',
        shell => '/bin/bash',
        managehome => 'true',
}
user { "janet":
        ensure => present,
        home => '/home/present',
        shell => '/bin/bash',
        managehome => 'true',
}
user { "alice":
        ensure => present,
        home => '/home/alice',
        shell => '/bin/bash',
        managehome => 'true',
}
user { "tim":
        ensure => present,
        home => '/home/tim',
        shell => '/bin/bash',
        managehome => 'true',
}

group {"developers":
        ensure => present,
        members => 'janet', 'tim'
}
