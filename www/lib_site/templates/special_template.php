<style type="text/css">
	.vd_specialoffer {
		width: 100%;
		margin: 0 auto;
	}
	.vd_specialoffer-header {
		height: 372px;
		padding: 60px 120px;
		background-color: #f8f9fa;
	}		
	.vd_specialoffer-header-dates {
		/*font-family: Lato-Semibold;*/
		font-size: 20px;
		color: #e62e66;
		margin: 0 0 30px 0; 
	}
	.vd_specialoffer-header-virtual {
		background-image: url(/images/svg/icon-virtual.svg);
		background-repeat: no-repeat;
		background-size: 70.5px 81.9px;
		margin: 0 21px 0 0;
		width: 70.5px;
		height: 81.9px;
		float: left;
	}
	.vd_specialoffer-header-meeting {
		background: url(/images/svg/icon-meeting.svg);
		background-repeat: no-repeat;
		background-size: 90px 55px;
		margin: 0 21px 0 0;		
		width: 90px;
		height: 55px;
		float: left;
	}
	.vd_specialoffer-header h1 {	
		height: 46px;
		/*font-family: Lato-Bold;*/
		font-size: 30px;
		line-height: 1.3;
		color: #000000;
		float: left;
	}
	.vd_specialoffer-header p {
		width: 100%;
		float: left;
		margin: 25px 0 0 0;
		/*font-family: Lato-Regular;*/
		font-size: 20px;
		line-height: 1.5;
	}
	
.vd_specialoffer-offers {
	margin: 80px auto 0px auto;
    width: 1440px;
	padding: 0px 120px;
    overflow: auto;
}

.vd_specialoffer-offers-title {
	/* font-family: Lato-Black; */
	font-size: 30px;
	line-height: 1.5;
	color: #000000;
	text-align: center;	
}

.vd_specialoffer-offers-list {
	margin-top: 45px;
	margin-bottom: 10px;
}

.vd_specialoffer-offers-list-element-header {
	background-color: #fbfbfc;
	height: 100px;
	width: 100%;
	border-bottom: 2px solid #ffffff;
	position: relative;
}

.vd_specialoffer-offers-list-element.open .vd_specialoffer-offers-list-element-header {
	background-color: #efeff6;
}

.vd_specialoffer-offers-list-element.open .vd_specialoffer-offers-list-element-header:after {
	position: absolute;
	content: '';
	height: 10px;
	width: 22px;
	background-image: url('../images/fake_menu_arrow.png');
	bottom: -10px;
	right: 90px;
}

.vd_specialoffer-offers-list-element-header-office {
	width: 555px;
	height: 100px;
	border-right: 2px solid #ffffff;
	float: left;
    text-align: center;
}

.vd_specialoffer-offers-list-element-header-office img {
	width: 175px;
	height: 100px;
	float: left;
}

.vd_specialoffer-offers-list-element-header-office span {
	/* font-family: Lato-Regular; */
	font-size: 20px;
	line-height: 1.5;
	color: #000000;
    padding-top: 36px;
    display: inline-block;
}

.vd_specialoffer-offers-list-element-header-area {
	width: 156px;
	height: 100px;
	border-right: 2px solid #ffffff;
	float: left;
	/* font-family: Lato-Regular; */
	font-size: 16px;
	line-height: 1.5;
	color: #010101;
	padding-top: 36px;
	padding-left: 68px;
	background-image: url('../images/svg/icon-office-black.svg');
    background-size: 24px 24px;
    background-repeat: no-repeat;
    background-position: 30px 36px;
}

.vd_specialoffer-offers-list-element-header-services {
	width: 202px;
	height: 100px;
	border-right: 2px solid #ffffff;
	float: left;
	/* font-family: Lato-Regular; */
	font-size: 16px;
	line-height: 1.5;
	color: #010101;
	padding-top: 35px;
	padding-left: 0px;
	text-align: center;
}

.vd_specialoffer-offers-list-element-header-services .vd_officelistwrapper-office-services-service {
	float: none;
	display: inline-block;
	margin: 0 5px;
}

.vd_specialoffer-offers-list-element.open .vd_specialoffer-offers-list-element-header-people {
	background-image: url('../images/number_of_people_open.png');
}

.vd_specialoffer-offers-list-element-header-place .reserve {
	float: right;
	width: 205px;
	height: 60px;
	background-color: #007aff;
	margin-top: 20px;
	text-align: center;
	color: #ffffff;
    line-height: 60px;
}

.vd_specialoffer-offers-list-element.open .vd_specialoffer-offers-list-element-header-place .reserve {
	background-color: #3498ff;
	color: #ffffff;
}

.vd_specialoffer-offers-list-element-header-place span.price {
	float: left;
	width: 200px;
	margin-left: 25px;
	/* font-family: Lato-Semibold; */
	font-size: 16px;
	line-height: 1.9;
    padding-top: 32px;
}

.vd_specialoffer-offers-list-element-header-place span.price span {
	/* font-family: Lato-Black; */
	font-size: 20px;
	line-height: 1.5;
}

.vd_specialoffer-offers-list-element-header-place span.special {
	/* font-family: Lato-Semibold; */
	font-size: 16px;
	line-height: 1;
	color: #e62e66;
	float: left;
	width: 250px;
	margin-left: 25px;
}

.vd_specialoffer-offers-list-element-menu {
	width: 100%;
	background-color: #fbfbfc;
	height: 0;
	overflow: hidden;
	transition: height 0.5s;
}

.vd_specialoffer-offers-list-element.open .vd_specialoffer-offers-list-element-menu {
	/* display: block; */
	height: 312px;
	border-bottom: 2px solid #b4b3cc;
}

.vd_specialoffer-offers-list-element-menu-reserveform {
	width: 100%;
	height: 310px;
	background-color: #fbfbfc;
	padding: 30px;
}

.vd_specialoffer-offers-list-element-menu-title {
	/* font-family: Lato-Bold; */
	font-size: 30px;
	line-height: 1.3;
	color: #000000;
	padding: 40px 0px 0px 30px;
	height: 88px;
}

.vd_specialoffer-offers-list-element-menu-reserveform-left {
	width: 350px;
	height: 250px;
	margin-right: 30px;
	float: left;
}

.vd_specialoffer-offers-list-element-menu-reserveform-left-text {
/* 	font-family: Lato-Regular; */
	font-size: 16px;
	line-height: 1.5;
	color: #010101;
	margin-bottom: 25px;
}

.vd_specialoffer-offers-list-element-menu-reserveform-left-photo {
	height: 72px;
	width: 72px;
	float: left;
	margin-right: 20px;
}

.vd_specialoffer-offers-list-element-menu-reserveform-left-photo img {
	height: 100%;
	width: 100%;
}

.vd_specialoffer-offers-list-element-menu-reserveform-left-name {
/* 	font-family: Lato-Semibold; */
	font-size: 20px;
	color: #000000;
	padding-bottom: 5px;
}

.vd_specialoffer-offers-list-element-menu-reserveform-left-phone {
/* 	font-family: Lato-Black; */
	font-size: 16px;
	line-height: 1.5;
	color: #000000;
	padding-left: 50px;
	background-image: url('../images/fake-phone-special-icon.png');
	background-size: 24px 24px;
	background-repeat: no-repeat;
	margin-left: 92px;
    padding-left: 30px;
}

.vd_specialoffer-offers-list-element-menu-reserveform-left-email {
/* 	font-family: Lato-Black; */
	font-size: 16px;
	line-height: 1.5;
	color: #000000;
	padding-left: 50px;
	background-image: url('../images/fake-email-special-icon.png');
	background-size: 24px 24px;
	background-repeat: no-repeat;
	margin-left: 92px;
    padding-left: 30px;
}

.vd_specialoffer-offers-list-element-menu-reserveform-right {
	width: 760px;
	height: 250px;
	float: left;
}

.vd_specialoffer-offers-list-element-menu-reserveform-right input {
	margin-right: 30px;
	float: left;
	width: 233px;
	height: 40px;
	border-radius: 1px;
	background-color: #ffffff;
	border: solid 2px #dadae6;
	/* font-family: Lato-Regular; */
	font-size: 16px;
	line-height: 1.5;
	color: #595964;
	padding-left: 10px;
	padding-right: 10px;
}

.vd_specialoffer-offers-list-element-menu-reserveform-right input:focus {
	box-shadow: 0px 0px 0px 2px #4ea6fe;
}

.vd_specialoffer-offers-list-element-menu-reserveform-right input.phone {
	background-image: url('../images/input_phone.png');
    background-repeat: no-repeat;
    background-position: 17px 8px;
    padding-left: 40px;
    /* font-family: Lato-Regular; */
    font-size: 16px;
    line-height: 1.5;
    color: #595964;
}

.vd_specialoffer-offers-list-element-menu-reserveform-right input.email {
	background-image: url('../images/input_email.png');
    background-repeat: no-repeat;
    background-position: 17px 8px;
    padding-left: 40px;
    /* font-family: Lato-Regular; */
    font-size: 16px;
    line-height: 1.5;
    color: #595964;
}

.vd_specialoffer-offers-list-element-menu-reserveform-right input.name {
	margin-right: 0px;
	background-image: url('../images/svg/input_name.svg');
    background-repeat: no-repeat;
    background-position: 18px 11px;
    padding-left: 40px;
    /* font-family: Lato-Regular; */
    font-size: 16px;
    line-height: 1.5;
    color: #595964;
}

.vd_specialoffer-offers-list-element-menu-reserveform-right textarea {
	height: 100px;
	width: 100%;
	margin-top: 20px;
	margin-bottom: 30px;
	padding: 5px 5px 5px 50px;
	float: left;
	border-radius: 1px;
	background-color: #ffffff;
	border: solid 2px #dadae6;
	background-image: url('../images/fake_message_icon.png');
    background-size: 24px 24px;
    background-repeat: no-repeat;
    background-position: 11px 6px;
    resize: none;
}

.vd_specialoffer-offers-list-element-menu-reserveform-right textarea:focus {
	box-shadow: 0px 0px 0px 2px #4ea6fe;
}

.vd_specialoffer-offers-list-element-menu-reserveform-right .warning {
	width: 355px;
	float: right;
	font-style: italic;
	/* font-family: Lato-Italic; */
	font-size: 16px;
	line-height: 1.5;
	color: #000000;
	position: relative;
	padding-left: 30px;
}

.vd_specialoffer-offers-list-element-menu-reserveform-right .warning:before {
	content: '!';
	height: 24px;
	width: 24px;
	background-color: #e62e66;
	color: #ffffff;
	text-align: center;
	line-height: 24px;
	position: absolute;
    left: 0px;
	font-style: normal;
	border-radius: 50%;
	font-size: 20px;
}

.vd_specialoffer-offers-list-element-menu-reserveform-right .warning span {
	font-weight: bold;
}

.vd_specialoffer-offers-list-element-menu-reserveform-right button {
	width: 380px;
	height: 60px;
	text-align: center;
	border: none;
	line-height: 60px;
	background-color: #007aff;
	/* font-family: Lato-Bold; */
	font-size: 14px;
	color: #ffffff;
}

.vd_specialoffer-offers-list-element-menu-reserveform-right button.disabled {
	background-color: #3498ff;
	color: #fdfdfd;
}

.vd_specialoffer-offers-list-element-menu-previewform {
	width: 100%;
	height: 240px;
	background-color: #f2f2f6;
	padding: 30px;
}

.vd_specialoffer-offers-list-element-menu-previewform-left {
	width: 350px;
	float: left;
	margin-right: 30px;
}

.vd_specialoffer-offers-list-element-menu-previewform-left p {
	/* font-family: Lato-Regular; */
	font-size: 16px;
	line-height: 1.5;
	color: #010101;	
}

.vd_specialoffer-offers-list-element-menu-previewform-right {
	width: 760px;
	float: left;
}

.vd_specialoffer-offers-list-element-menu-previewform-right-preview {
	/* font-family: Lato-Regular; */
	font-size: 16px;
	line-height: 1.5;
	color: #010101;
}

.vd_specialoffer-offers-list-element-menu-previewform-right-preview .preview {
	display: none;
}

.vd_specialoffer-offers-list-element-menu-previewform-right-preview .preview_label {
	position: relative;
	padding-left: 40px;
}

.vd_specialoffer-offers-list-element-menu-previewform-right-preview .preview_label span {
	position: absolute;
    width: 20px;
    height: 16px;
    background-image: url('../images/checkbox_blue.png');
    background-size: 16px 16px;
    background-repeat: no-repeat;
    top: 4px;
    left: 0px;
}

.vd_specialoffer-offers-list-element-menu-previewform-right-preview .preview:checked + span {
	content: url(../images/svg/check-white.svg);
}	
	
</style>

<div class="vd_specialoffer">
	<div class="vd_specialoffer-header">
		<div class="vd_specialoffer-header-dates">1 апреля - 29 мая 2016</div>
		<div class="vd_specialoffer-header-virtual"></div>
		<div class="vd_specialoffer-header-meeting"></div>
		<h1>Вирутальный офис +4 часа переговорных в подарок</h1>
		<p>Для всех клиентов, заключивших договор на услуги «Виртуальный офис» до 29 февраля 2016 г., предоставляется бесплатно 4 часа аренды переговорной комнаты в любом офисном центре «Деловой». Воспользоваться переговорными комнатами можно в течение срока действия договора.</p>
	</div>

	<div class="vd_specialoffer-offers">
		<a name="freeoffices" /></a>
		<div class="vd_specialoffer-offers-title">Бизнес-центры, в которых идет акция</div>
		<div class="vd_specialoffer-offers-list">
			<div class="vd_specialoffer-offers-list-element">
				<div class="vd_specialoffer-offers-list-element-header">
					<div class="vd_specialoffer-offers-list-element-header-office">
						<img src="" />
						<span>Алексеевская башня</span>
					</div>
					<div class="vd_specialoffer-offers-list-element-header-services">
						<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_1"></div>
						<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_3"></div>
						<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_2"></div>
						<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_4"></div>
					</div>
					<div class="vd_specialoffer-offers-list-element-header-place">
						<div class="reserve">ОСТАВИТЬ ЗАЯВКУ</div>
						<span class="price"><span></span>ВДНХ</span>
					</div>
				</div>
				<div class="vd_specialoffer-offers-list-element-menu">
					<div class="vd_specialoffer-offers-list-element-menu-reserveform">
						<div class="vd_specialoffer-offers-list-element-menu-reserveform-left">
							<div class="vd_specialoffer-offers-list-element-menu-reserveform-left-text">
								Если вас заинтересовало наше предложение – оставьте свои данные и наш менеджер свяжется с вами.
							</div>
							<div class="vd_specialoffer-offers-list-element-menu-reserveform-left-photo">
								<img src="" />
							</div>
							<div class="vd_specialoffer-offers-list-element-menu-reserveform-left-name">
								Ник Гевин
							</div>
							<div class="vd_specialoffer-offers-list-element-menu-reserveform-left-phone">
								+7 (495) 765-78-76
							</div>
							<div class="vd_specialoffer-offers-list-element-menu-reserveform-left-email">
								<a href="mailto:info@delovoy.su">info@delovoy.su</a>
							</div>
						</div>
						<div class="vd_specialoffer-offers-list-element-menu-reserveform-right">
							<input type="text" class="phone" value="" placeholder="+7 (___) ___-__-__">
							<input type="text" class="email" value="" placeholder="E-mail">
							<input type="text" class="name" value="" placeholder="Имя">
							<textarea class="message" placeholder="Ваше сообщение"></textarea>
							<button>ОСТАВИТЬ ЗАЯВКУ</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<div class="vd_singleofficewrapper-content-special">
			<a name="special"></a>
			<div class="vd_singleofficewrapper-content-special-title">
				Cпецпредложения
			</div>
			<div class="vd_singleofficewrapper-content-special-list">
				<div class="vd_singleofficewrapper-content-special-list-item office">
					<div class="vd_singleofficewrapper-content-special-list-item-text"><!--
						--><span>Получите скидку 10% на аренду офиса</span>
					</div>
					<div class="vd_singleofficewrapper-content-special-list-item-date">
						1 февраля – 29 апреля 2016
					</div>
					<a href="" class="vd_singleofficewrapper-content-special-list-item-details">
						<span>Подробнее</span>
					</a>
				</div>
				<div class="vd_singleofficewrapper-content-special-list-item virtual">
					<div class="vd_singleofficewrapper-content-special-list-item-text"><!--
						--><span>Виртуальный офис + 4 часа переговорных в подарок</span>
					</div>
					<div class="vd_singleofficewrapper-content-special-list-item-date">
						20 марта – 18 мая  2016
					</div>
					<a href="" class="vd_singleofficewrapper-content-special-list-item-details">
						<span>Подробнее</span>
					</a>
				</div>
				<div class="vd_singleofficewrapper-content-special-list-item negotiating">
					<div class="vd_singleofficewrapper-content-special-list-item-text"><!--
						--><span>Акция февраля – скидка 70% на аренду переговорных</span>
					</div>
					<div class="vd_singleofficewrapper-content-special-list-item-date">
						1 февраля – 29 апреля 2016
					</div>
					<a href="" class="vd_singleofficewrapper-content-special-list-item-details">
						<span>Подробнее</span>
					</a>
				</div>
			</div>
		</div>
	
</div>