class developers {
        package { "emacs":
                ensure => present,
        }
        package { "jed":
                ensure => present,
        }
        package { "subversion":
                ensure => present,
        }
        package { "git":
                ensure => present,
        }
}
