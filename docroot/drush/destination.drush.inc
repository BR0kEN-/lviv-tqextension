<?php
/**
 * @file
 * Download destination alter.
 */

/**
 * Implements hook_drush_pm_download_destination_alter().
 */
function destination_drush_pm_download_destination_alter(array &$project, array $release) {
  if (function_exists('drupal_get_path')) {
    switch ($project['project_type']) {
      case 'module':
      case 'theme':
        $project['project_install_location'] = sprintf('%s/%ss/contrib', _destination_download_path(), $project['project_type']);
        break;
    }
  }
}

/**
 * Determine downloading destination.
 *
 * @internal
 *
 * @return string
 *   Relative path for downloading.
 */
function _destination_download_path() {
  if (drush_get_option('profile', FALSE)) {
    return drupal_get_path('profile', drupal_get_profile());
  }

  $uri = drush_get_option('uri');
  $path = drush_conf_path($uri);

  // If "--uri" or "-l" parameter specified, then check that configuration
  // path exists or user specially chosen "default" directory.
  if (!isset($path) || ('sites/default' === $path && 'default' !== $uri)) {
    return drush_drupal_sitewide_directory();
  }

  return $path;
}
