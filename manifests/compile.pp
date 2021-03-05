package { 'gcc' :
        ensure => present,
}
package { 'build-essential' :
        ensure => present,
}
package { 'binutils' :
        ensure => present,
}
