<div class="vd_specialoffer-header">
	<div class="g-container">
		<div class="g-container-row">

			<h2><?=$_SITE['section_title']?></h2>

			<?	// текст над формой, меняется в системе управления
				if (isset($_DATA['article']['items'])) {
					$article = current($_DATA['article']['items']); ?>
					<div class="<?=$_SITE['config']['CONTENT_CSS_CLASS_NAME']?>">
						<p><?=$article['body']?></p>
					</div>
			<?	} ?>

			<form>
			</form>
		</div>
	</div>
</div>