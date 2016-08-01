<?

	$about_contacts_email = $_POST['about_contacts_email'];
	$about_contacts_name = $_POST['about_contacts_name'];
	$about_contacts_message = $_POST['about_contacts_message'];
	
	$about_contacts_manager_message_text .= "Здравствуйте,\r\nНа сайте было отправлено новое сообщение через форму контактов на странице «О компании».";
		
	$about_contacts_manager_message_text .= "\r\n";
	
	$about_contacts_manager_message_text .= "\r\nДанные сообщения";
	$about_contacts_manager_message_text .= "\r\nИмя: " . $about_contacts_name;
	$about_contacts_manager_message_text .= "\r\nE-mail: " . $about_contacts_email;
	$about_contacts_manager_message_text .= "\r\nСообщение: " . $about_contacts_message;
	
	$about_contacts_customer_message_text .= "Здравствуйте,\r\nВаше сообщение, отправленное через форму контактов на странице «О компании», было принято.";
	
	if ($about_contacts_email && $about_contacts_name && $about_contacts_message) {
	
		mail('e.izmalkova@gmail.com', 'Новое сообщение со страницы «О компании»', $about_contacts_manager_message_text);
		
		//mail('yojmm@yandex.ru', 'Новое сообщение со страницы «О компании»', $about_contacts_manager_message_text);
		
		mail($about_contacts_email, 'Ваше сообщение принято', $about_contacts_customer_message_text);
		
	}
	
?>
<div class="vd_about_wrapper">
	<div class="vd_about_wrapper-header">
		<h1>О компании Деловой</h1>
	</div>
	<div class="vd_about_wrapper-menu">
		<div class="g-container">
		<ul>
			<li>
				<a href="#about">О нас</a>
			</li>
			<li>
				<a href="#blog">Блог</a>
			</li>
			<li>
				<a href="#agents">Агентам</a>
			</li>
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
	<div class="vd_about_wrapper-about">
		<div class="g-container">
			<a name="about"></a>
			<h2 class="g-section-title">О нас</h2>
			<div class="vd_about_wrapper-subtitle">
				Сеть офисных центров «Деловой» — единственная в России компания, деятельность которой заключается в создании благоприятных условий работы для малого и среднего бизнеса.
			</div>
			<p>В Москве каждый год появляются новые офисные центры, аренда площадей в которых считается престижным и выгодным капиталовложением. В каждом из таких центров доступны сотни самых разных помещений со всеми коммуникациями и современным дизайном. Однако зачастую представители малого бизнеса обходят их стороной, опасаясь высоких расценок и кабальных условий договоров аренды.
	Натыкаясь на объявления в Интернете: «офисные центры аренда», мелкие предприниматели даже не пытаются узнать условия у арендодателя. Не торопятся идти навстречу мелким арендаторам и сами владельцы бизнес-центров, ведь гораздо выгодней сдавать в аренду большие объемы площадей на длительные сроки.</p>
			<div class="vd_about_wrapper-subtitle">
				Аренда в офисном центре – оптимальное решение
			</div>
			<p>Сеть офисных центров «Деловой» создана именно для того, что бы решить эту проблему и сделать аренду в офисных центрах доступной для небольших компаний. Это первая сеть в России, цель которой создать достойную инфраструктуру для малого бизнеса.</p>
			<p>Теперь к услугам малых предпринимателей аренда в офисных центрах, которой можно пользоваться и оплачивать понедельно. Иными словами, есть возможность забронировать офис как столик в ресторане или билет в кинотеатр. Арендатору будет доступно помещение площадью от 12 до 60 кв. метров либо переговорная комната от 19 кв. метров. Такие малые офисы сдаются в четырех бизнес-центрах класса B+ и А: «Омега-плаза», «Алексеевская башня», «Гостиный двор» и «Арма», которые расположены в самых престижных районах города.</p>
		</div>
	</div>
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
	<div class="vd_about_wrapper-agents">
		<a name="agents"></a>
		<h2 class="g-section-title">Агентам</h2>
		<div class="g-container">
			<p>
				В Москве каждый год появляются новые офисные центры, аренда площадей в которых считается престижным и выгодным капиталовложением. В каждом из таких центров доступны сотни самых разных помещений со всеми коммуникациями и современным дизайном. Однако зачастую представители малого бизнеса обходят их стороной, опасаясь высоких расценок и кабальных условий договоров аренды.
Натыкаясь на объявления в Интернете: «офисные центры аренда», мелкие предприниматели даже не пытаются узнать условия у арендодателя. Не торопятся идти навстречу мелким арендаторам и сами владельцы бизнес-центров, ведь гораздо выгодней сдавать в аренду большие объемы площадей на длительные сроки.
			</p>
		</div>
	</div>
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
	<div class="vd_about_wrapper-contacts">
		<a name="contacts"></a>
		<h2 class="g-section-title">Контакты главного офиса</h2>
		<div class="vd_about_wrapper-contacts-inner">
			<div class="g-container">
				<div class="azaza">
					<div class="vd_about_wrapper-contacts-inner-data">
						<div class="vd_about_wrapper-contacts-inner-data-block">
							145464, Москва<br />
							ул. Ленинская Слобода, 19<br />
							этаж 4/5<br />
							<span class="metro">Автозаводская</span>
						</div>
						<div class="vd_about_wrapper-contacts-inner-data-block">
							<span class="phone">+7 (495) 765-78-76</span>
							<span class="email"><a href="mailto:info@delovoy.su">info@delovoy.su</a></span>
						</div>
						<div class="vd_about_wrapper-contacts-inner-data-form">
							<span class="title">Оставить сообщение</span>
							<form method="post">
								<input class="email" name="about_contacts_email" type="text" placeholder="E-mail">
								<input class="name" name="about_contacts_name" type="text" placeholder="Имя">
								<textarea class="message" name="about_contacts_message" placeholder="Сообщение"></textarea>
								<input class="submit" type="submit" value="Отправить">
							</form>
						</div>
					</div>
					<div id="vd_about_wrapper-contacts-inner-map"></div>
				</div>
			</div>
			
		</div>
	</div>
</div>