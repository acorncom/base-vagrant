class apache ( $server_name, $document_root, $logs_dir, $env_key, $env_key_value ) {

    include apache::service
    class { "apache::install" :
        server_name   => $server_name,
        document_root => $document_root,
        logs_dir      => $logs_dir,
        env_key       => $env_key,
        env_key_value => $env_key_value,
    } ~> Class['apache::service']

}
