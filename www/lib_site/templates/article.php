<div class="<?=$_SITE['config']['CONTENT_CSS_CLASS_NAME']?>">
<?	if (isset($_DATA['article']['items'])) { 
		$article = current($_DATA['article']['items']); ?>
		<h1><?=$article['title']?></h1>
		<?=$article['body']?>
<?	} else {
		define('SEO_PAGE_NOINDEX', true); ?>
		<p>
			<?=$__['under_development']?>
		</p>
<?	} ?>
</div>