<?php

/*
	used both for subsciption and sending presentation + subscription
*/

require $_SERVER['DOCUMENT_ROOT'] . "/lib/functions.php";
require $_SERVER['DOCUMENT_ROOT'] . "/lib/mail.php";
// lame, I know
if (false !== strpos($_SERVER['HTTP_HOST'] . '/services/', $_SERVER['HTTP_REFERER']) || !$_POST['email']) {
	header('HTTP/1.1 500 Internal Server Error');
	exit;
}

$email = $_POST['email'];
$link = $_POST['link'];

$subject = 'Презентация Delovoy';

$message = 'Здравствуйте!

Благодарим Вас за интерес к услугам ОЦ «ДЕЛОВОЙ»!

Вы можете просмотреть презентацию по ссылке:
' . $link . '


С уважением к Вам и Вашему делу
Сеть офисных центров "Деловой"
www.delovoy.su

+7 495 988 07 36';

// if no 'link' in the request send nothing, just add the email to mailchimp
$no_send = !$link;

if ($no_send || (true === @mail_send($email, $subject, $message))) {

	// on the production only
	if ('www.delovoy.su' != $_SERVER['HTTP_HOST']) {
		exit;
	}

	$ch = curl_init();

	// send the email to mailchimp via the wordpress subscription widget on the blog page
	curl_setopt($ch, CURLOPT_URL,"http://" . $_SERVER['HTTP_HOST'] . "/blog/?mailchimp_signup=1");
	curl_setopt($ch, CURLOPT_POST, 1);

	// params from the widget's form
	curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query(array('mailchimp_email' => $email, 'submit' => 1, 'widget_id' => 'wp_subscribe-3')));
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, false);

	curl_exec($ch);

	curl_close ($ch);
} else { 
	header('HTTP/1.1 500 Internal Server Error');
}
exit;
?>