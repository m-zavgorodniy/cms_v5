<?
$articles = array();
foreach($_DATA['article']['items'] as &$article) {
    $articles[$article['article_type_id']][] = $article;
}
?>
<div class="index-promo g-container"><div class="g-container-row">
    <div class="index-promo-left">
        <div class="index-promo-left-title">
        <?  $article_image_top = current($articles['image']); ?>
            <?=$article_image_top['title']?>
        </div>
        <ul class="index-promo-links">
        <?  foreach ($_DATA['service_group']['items'] as &$service_group) { ?>
            <li class="c-icon c-<?=$service_group['css_signature']?>">
                <a href="<?=$_SITE['section_paths']['services']['path']?>?service=<?=$service_group['id']?>"><?=$service_group['title_alt']?$service_group['title_alt']:$service_group['title']?></a>
                <div class="index-promo-links-text"><?=$service_group['headline']?></div>
            </li>
        <?  }
            unset($service_group); ?>
        </ul>
    </div>
    <div class="index-promo-right g-bigpicture"><div class="g-bigpicture-box">
        <a style="background-image: url(<?=$article_image_top['img_src']?$article_image_top['img_src']:'/uploads/images/samples/main_1.png'?>)"></a>
    </div></div>
</div></div>
<?
if (isset($_DATA['special_offer'])) { ?>
    <div class="offers index-offers g-container"><div class="g-container-row">
        <h2 class="g-section-title">Cпецпредложения</h2>
    <?  out_special_offers($_DATA['special_offer']['items']); ?>
    </div></div>
<?
} ?>
<div class="index-promo2 g-container"><div class="g-container-row">
    <?  $article_image_mid = next($articles['image']); ?>
    <div class="index-promo2-left g-bigpicture"><div class="g-bigpicture-box">
        <a style="background-image: url(<?=$article_image_mid['img_src']?>)"></a>
    </div></div>
    <?  $article_main = current($articles['']); ?>
    <div class="index-promo2-right">
        <h2><?=$article_main['title']?></h2>
        <div class="index-promo2-text text-content">
            <?=$article_main['body']?>
        </div>
        <div class="index-promo2-link"><a href="<?=$_SITE['section_paths']['office_centers']['path']?>?center=<?=$_SITE['config']['GDC_OFFICE_CENTER_ID']?>" class="g-button">ПОДРОБНЕЕ</a></div>
    </div>
</div></div>