# Class: varnish::params
#
# This class defines default parameters used by the main module class varnish
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to varnish class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class varnish::params {

  ### Module specific parameters

  # Maximum number of open files (for ulimit -n)
  $nfiles = $::operatingsystem ? {
    default => "131072",
  }

  # Maximum locked memory size (for ulimit -l)
  $memlock = $::operatingsystem ? {
    default => "82000",
  }

  # Backend host
  $backendhost = $::operatingsystem ? {
    default => "127.0.0.1",
  }

  # Backend port
  $backendport = $::operatingsystem ? {
    default => "8080",
  }

  # Defaults taken from /etc/default/varnish on Debian Squeeze
  $admin_listen_address = "localhost"
  $admin_listen_port    = 6081
  $ttl                  = 120
  $min_threads          = 1
  $max_threads          = 1000
  $thread_timeout       = 120
 
  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'varnish',
  }

  $service = $::operatingsystem ? {
    default => 'varnish',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'varnishd',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'varnish',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/varnish',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/varnish/default.vcl',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/varnish',
    default                   => '/etc/sysconfig/varnish',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/varnish.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/lib/varnish',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/varnish',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/varnish/varnish.log',
  }

  $port = '80'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = 'varnish/default.vcl.erb'
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
