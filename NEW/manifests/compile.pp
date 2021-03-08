class compile {
        package { "gcc":
                ensure => installed,
        }
        package { "make":
                ensure => installed,
        }
        package { "binutils":
                ensure => installed,
        }
}
