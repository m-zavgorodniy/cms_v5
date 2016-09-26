<?

require $_SERVER['DOCUMENT_ROOT'] . '/lib/mail.php';

if ('POST' == $_SERVER['REQUEST_METHOD']) {

	$MY_POST = get_post();

	$about_contacts_email = $MY_POST['about_contacts_email'];
	$about_contacts_name = $MY_POST['about_contacts_name'];
	$about_contacts_message = $MY_POST['about_contacts_message'];
	
	$about_contacts_manager_message_text .= "Здравствуйте,\r\nНа сайте было отправлено новое сообщение через форму контактов на странице «О компании».";
		
	$about_contacts_manager_message_text .= "\r\n";
	
	$about_contacts_manager_message_text .= "\r\nДанные сообщения";
	$about_contacts_manager_message_text .= "\r\nИмя: " . $about_contacts_name;
	$about_contacts_manager_message_text .= "\r\nE-mail: " . $about_contacts_email;
	$about_contacts_manager_message_text .= "\r\nСообщение: " . $about_contacts_message;
	
	$about_contacts_customer_message_text .= "Здравствуйте,\r\nВаше сообщение, отправленное через форму контактов на странице «О компании», было принято.";
	
	if ($about_contacts_email && $about_contacts_name && $about_contacts_message) {

		if (true === mail_send($_SITE['settings']['email_feedback'], 'Новое сообщение с сайта «Деловой»', $about_contacts_manager_message_text)) {
			mail_send($about_contacts_email, 'Ваше сообщение принято', $about_contacts_customer_message_text);
			echo 'Спасибо, ваше сообщение принято';
		} else {
			echo 'Ошибка при приеме сообщения. Пожалуйста, попробуйте еще раз чуть позже';
		}
		
	}

	exit;

}

if (isset($_DATA['article']['items'])) {
	$article1 = current($_DATA['article']['items']);
	$article2 = next($_DATA['article']['items']);
}
?>
<a href="#" class="scroll_to_top"></a>
<div class="vd_about_wrapper">
	<div class="vd_about_wrapper-header">
		<h1>О компании Деловой</h1>
	</div>
	<div class="vd_about_wrapper-menu">
		<div class="g-container">
		<ul>
		<?	if ($article1) { ?>
			<li>
				<a href="#about"><?=$article1['title']?></a>
			</li>
		<?	} /*?>
			<li>
				<a href="#blog">Блог</a>
			</li>
		<?	*/
			if ($article2) { ?>
			<li>
				<a href="#agents"><?=$article2['title']?></a>
			</li>
		<?	} ?>
			<li>
				<a href="#clients">Наши клиенты</a>
			</li>
			<li>
				<a href="#contacts">Контакты</a>
			</li>
			<li class="helper"></li>
		</ul>
		</div>
	</div>
<?	if ($article1) { ?>
	<div class="vd_about_wrapper-about">
		<div class="g-container">
			<a name="about"></a>
			<h2 class="g-section-title"><?=$article1['title']?></h2>
			<div class="text-content">
				<?=$article1['body']?>
			</div>
		</div>
	</div>
<?	} /* ?>
	<div class="vd_about_wrapper-blog">
		<a name="blog"></a>
		<h2 class="g-section-title">Блог</h2>
		<div class="g-container">
			<div class="vd_about_wrapper-blog-list">
				<div class="cycle-slideshow"
					data-cycle-timeout="0"
					data-cycle-allow-wrap="true"
					data-cycle-fx="carousel"
					data-cycle-carousel-fluid="false"
					data-cycle-slides="> div"
					data-prev=".vd_about_wrapper-blog-list .cycle-prev"	
					data-next=".vd_about_wrapper-blog-list .cycle-next"
				>
					<div class="vd_about_wrapper-blog-list-post">
						<img src="../images/delovoy_sample_blog_photo.jpg" />
						<span class="blogpost_date">
							16 апреля 2016 
						</span>
						<span class="blogpost_title">
							Виртуальный тур по бизнес-центрам
						</span>
					</div>
					<div class="vd_about_wrapper-blog-list-post">
						<img src="../images/delovoy_sample_blog_photo.jpg" />
						<span class="blogpost_date">
							16 апреля 2016 
						</span>
						<span class="blogpost_title">
							Виртуальный тур по бизнес-центрам
						</span>
					</div>
					<div class="vd_about_wrapper-blog-list-post">
						<img src="../images/delovoy_sample_blog_photo.jpg" />
						<span class="blogpost_date">
							16 апреля 2016 
						</span>
						<span class="blogpost_title">
							Виртуальный тур по бизнес-центрам
						</span>
					</div>
					<div class="vd_about_wrapper-blog-list-post">
						<img src="../images/delovoy_sample_blog_photo.jpg" />
						<span class="blogpost_date">
							16 апреля 2016 
						</span>
						<span class="blogpost_title">
							Виртуальный тур по бизнес-центрам
						</span>
					</div>
					<div class="vd_about_wrapper-blog-list-post">
						<img src="../images/delovoy_sample_blog_photo.jpg" />
						<span class="blogpost_date">
							16 апреля 2016 
						</span>
						<span class="blogpost_title">
							Виртуальный тур по бизнес-центрам
						</span>
					</div>
					<div class="vd_about_wrapper-blog-list-post">
						<img src="../images/delovoy_sample_blog_photo.jpg" />
						<span class="blogpost_date">
							16 апреля 2016 
						</span>
						<span class="blogpost_title">
							Виртуальный тур по бизнес-центрам
						</span>
					</div>
				</div>
				<div class="cycle-prev"></div>
				<div class="cycle-next"></div>
				<a href="" class="vd_about_wrapper-blog-list-all">ВСЕ ЗАПИСИ БЛОГА</a>
			</div>
		</div>
	</div>
<?	*/ ?>
	<div class="vd_about_wrapper-clients">
		<a name="clients"></a>
		<h2 class="g-section-title">Наши клиенты</h2>
		<div class="g-container">
			<div class="vd_about_wrapper-clients-list">
				<div class="vd_about_wrapper-clients-list-inneer" style="width: 300%;">
					<div class="cycle-slideshow"
						data-cycle-timeout="0"
						data-cycle-allow-wrap="false"
						data-cycle-fx="carousel"
						data-cycle-carousel-fluid="false"
						data-cycle-slides="> div"
						data-prev=".vd_about_wrapper-clients-list .cycle-prev"	
						data-next=".vd_about_wrapper-clients-list .cycle-next"
						data-pager=".vd_about_wrapper-clients-list .cycle-pager"	
					>
						<div class="vd_about_wrapper-clients-list-slide">
						<?	$logo_count = count($_DATA['client']['items']);
							$logo_per_slide = 5;
							$i = 0;
							foreach ($_DATA['client']['items'] as &$client) { ?>
								<div class="vd_about_wrapper-clients-list-slide-element">
									<?=out_http_link($client['web'], true, '<img src="' . $client['img_src'] . '" title="' . $client['title'] . '">')?>
								</div>
							<?	if (++$i != $logo_count && $i % $logo_per_slide == 0) { ?>
										<div class="helper"></div>
									</div>
									<div class="vd_about_wrapper-clients-list-slide">
							<?	}
							}
							unset($client); ?>
							<div class="helper"></div>
						</div>
					</div>
					<div class="cycle-prev"></div>
					<div class="cycle-next"></div>
				</div>
				<div class="cycle-pager"></div>
			</div>
		</div>
	</div>
<?	if ($article2) { ?>
	<div class="vd_about_wrapper-agents">
		<a name="agents"></a>
		<h2 class="g-section-title"><?=$article2['title']?></h2>
		<div class="g-container">
			<div class="text-content">
				<?=$article2['body']?>
			</div>
		</div>
	</div>
<?	} ?>
	<div class="vd_about_wrapper-contacts">
		<a name="contacts"></a>
		<h2 class="g-section-title">Контакты главного офиса</h2>
		<div class="vd_about_wrapper-contacts-inner">
			<div class="g-container">
				<div>
					<div class="vd_about_wrapper-contacts-inner-data">
						<div class="vd_about_wrapper-contacts-inner-data-block">
							<?=nl2br($_SITE['settings']['contacts_address'])?>
							<span class="metro"><?=$_SITE['settings']['contacts_metro']?></span>
						</div>
						<div class="vd_about_wrapper-contacts-inner-data-block">
							<span class="phone"><?=$_SITE['settings']['contacts_phone']?></span>
							<span class="email"><a href="mailto:<?=$_SITE['settings']['contacts_email']?>"><?=$_SITE['settings']['contacts_email']?></a></span>
						</div>
						<div class="vd_about_wrapper-contacts-inner-data-form">
							<span class="title">Оставить сообщение</span>
							<form method="post">
								<input class="email" name="about_contacts_email" type="text" placeholder="E-mail">
								<input class="name" name="about_contacts_name" type="text" placeholder="Имя">
								<textarea class="message" name="about_contacts_message" placeholder="Сообщение"></textarea>
								<button class="submit">Отправить</button>
							</form>
						</div>
					</div>
					<div id="vd_about_wrapper-contacts-inner-map"></div>
				</div>
			</div>
			
		</div>
	</div>
</div>