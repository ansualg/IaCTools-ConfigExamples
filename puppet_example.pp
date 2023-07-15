package { 'openssh-server':
	ensure => installed,
}
file { '/etc/ssh/sshd_config':
	source => 'puppet:///modules/sshd/sshd_config',
	notify => Service['sshd'],
	require=> Package['openssh-server'],
}
service { 'sshd':
	ensure     => running,
	enable     => true,
}
