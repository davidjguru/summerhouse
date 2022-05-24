<?php

/**
 * @file
 * #ddev-generated: Automatically generated Drupal settings file.
 * ddev manages this file and may delete or overwrite the file unless this
 * comment is removed.  It is recommended that you leave this file alone.
 */

$host = "db";
$port = 3306;
$driver = "mysql";

// If DDEV_PHP_VERSION is not set but IS_DDEV_PROJECT *is*, it means we're running (drush) on the host,
// so use the host-side bind port on docker IP
if (empty(getenv('DDEV_PHP_VERSION') && getenv('IS_DDEV_PROJECT') == 'true')) {
  $host = "127.0.0.1";
  $port = 49192;
}

$databases['default']['default'] = array(
  'database' => "db",
  'username' => "db",
  'password' => "db",
  'host' => $host,
  'driver' => $driver,
  'port' => $port,
  'prefix' => "",
);

$settings['hash_salt'] = 'dgaXelgdDBMaVFCKYZPrZJCWEnSTTIpNcJOuPMDxAKmSmxIyizDSRDWzAlnBNPfM';
$settings['skip_permissions_hardening'] = TRUE;
$settings['trusted_host_patterns'] = ['.*'];
$settings['class_loader_auto_detect'] = FALSE;

if (empty($settings['config_sync_directory'])) {
  $settings['config_sync_directory'] = 'sites/default/files/sync';
}
