$users = ['bob', 'janet', 'alice', 'time']
user { $users:
        ensure => present,
        shell => '/bin/bash',
        managehome => 'true',
}

package { 'emacs':
        ensure => installed
}
package { 'jed':
        ensure => installed
}
package { 'subversion':
        ensure => installed
}
package { 'git':
        ensure => installed
}
