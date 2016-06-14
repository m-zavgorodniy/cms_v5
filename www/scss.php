<?
// to use scss, just say <link href="/scss/styles.css" rel="stylesheet">
// /scss/styles.css is a "virtual" css generated from /css/styles.scss
// see .htaccess: RewriteRule ^scss\/(.*)\.css$ /scss.php/$1.scss [L]

require "lib/external/scssphp/scss.inc.php";
scss_server::serveFrom('css');
?>