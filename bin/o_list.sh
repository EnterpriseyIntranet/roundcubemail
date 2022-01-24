#!/usr/bin/env php
<?php
/*
 +-----------------------------------------------------------------------+
 | This file is just script test                                         |
 +-----------------------------------------------------------------------+
 | Author: <ondrej.rozum108@gmail.com>                                   |
 +-----------------------------------------------------------------------+
*/

define('INSTALL_PATH', realpath(__DIR__ . '/..') . '/' );

require_once INSTALL_PATH.'program/include/clisetup.php';
ini_set('memory_limit', -1);


$help = 0;
for ($x = 0; $x <= 100; $x++) {
  $vypis = new rcube_user($x);
  $pokus = $vypis->list_identities();
  if ($pokus[0] <> NULL) {
    var_dump("identity_id=" . $pokus[0]["identity_id"]);
    if ($help == 0) {
        print_r(array_keys($pokus[0]));
        $help = 1;
    }
  }    
}
echo "\nWanted identity_id number: ";
$identity_id = rtrim(fgets(STDIN));
echo "Set identity_id:\n" . $identity_id . "\n";
$vypis = new rcube_user($identity_id);
$pokus = $vypis->list_identities();
echo "Wanted property of identity: ";
$property = rtrim(fgets(STDIN));
echo "Set property:\n" . $property . "\n";
if ($pokus[0] <> NULL) {
  var_dump("value of property=" . $pokus[0][$property]);
}
echo "Wanted user of identity: ";
$user = rtrim(fgets(STDIN));
echo "Wanted host of identity: ";
$host = rtrim(fgets(STDIN));
$value = rcube_user::create($user, $host);
# $new_identity = $vypis->insert_identity(2,13);
# $value->delete_identity($iid=6);
