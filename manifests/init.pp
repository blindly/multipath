class multipath ($devices) {

    package { "device-mapper-multipath": }

    file { "/etc/multipath.conf":
        mode    => "644",
        content => template("multipath/multipath.conf.erb"),
        notify  => Service["multipathd"],
        require => Package["device-mapper-multipath"],
    } # file

    service { "multipathd":
        ensure  => running,
        enable  => true,
        require => Package["device-mapper-multipath"],
    } # service
}