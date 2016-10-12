class cloudpassage::config {

  if $cloudpassage::tags != undef {
    $configure_command = "/opt/cloudpassage/bin/configure --api-key=${cloudpassage::agentkey} --tag=${cloudpassage::tags} --server_label=${cloudpassage::server_label}"
  } else {
    $configure_command = "/opt/cloudpassage/bin/configure --api-key=${cloudpassage::agentkey}"
  }


  exec { 'initialize cloudpassage':
    command     => $configure_command,
    path        => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
    logoutput   => on_failure,
    refreshonly => true,
  }

}
