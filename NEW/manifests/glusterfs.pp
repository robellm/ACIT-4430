class glusterfs {
        package { "glusterfs-server":
                ensure => present,
        }
}
