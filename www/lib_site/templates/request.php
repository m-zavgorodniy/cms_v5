<?

// отправлять заявку на этот адрес, если не один БЦ не отмечен
$feedback_email_default = $_SITE['settings']['email_feedback'];

?>
<div class="vd_specialoffer-header">
	<div class="g-container">
		<div class="g-container-row">
			<div class="vd_request_wrapper-content">
				<h1><?=$_SITE['section_title']?></h1>
				<div class="<?=$_SITE['config']['CONTENT_CSS_CLASS_NAME']?>">
					<p>
				<?	// текст над формой, меняется в системе управления
					if (isset($_DATA['article']['items'])) {
						$article = current($_DATA['article']['items']);
						if (trim($article['body'])) { ?>
							<?=$article['body']?>
					<?	}
					} ?>
					</p>
				</div>
			</div>
			<div class="vd_request_wrapper-form">
				<form>
					<input type="text" name="phone" class="phone" value="" placeholder="+7 (___) ___-__-__">
					<input type="text" name="email" class="email" value="" placeholder="E-mail">
					<input type="text" name="name" class="name" value="" placeholder="Имя">
					<textarea class="message" name="message" placeholder="Ваше сообщение"></textarea>
					<div class="vd_request_wrapper-button">
						<button>Отправить заявку</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>