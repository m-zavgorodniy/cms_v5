<?
define('MOBILE_BREAKPOINT_PX', '1000'); // 568px - iPhone 5, 768px - tablet
define('MOBILE_MEDIA', 'screen and (max-width:' . MOBILE_BREAKPOINT_PX . 'px)');

?><!DOCTYPE html>
<html lang="<?=$_SITE['html_lang']?>" xmlns:og="http://ogp.me/ns#">
<head>
	<title><?=$_SITE['page_title']?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?	if (defined('SHARING_PICTURE')) { ?>
    	<meta property="og:image" content="http://<?=$_SERVER['HTTP_HOST']?><?=SHARING_PICTURE?>" />
<?	}
	if ($_SITE['seo_description']) { ?>
    	<meta name="description" content="<?=$_SITE['seo_description']?>" />
<?	} ?>
	<meta name="format-detection" content="telephone=no" />
	<link rel="stylesheet" type="text/css" href="/css/styles.css" />
	<link rel="stylesheet" type="text/css" href="/css/content.css" />
	<link rel="stylesheet" type="text/css" href="/css/delovoy_styles.css" />
	<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/jquery.fancybox.css" />
	<link rel="stylesheet" type="text/css" href="/css/jquery.fancybox-thumbs.css" />
	<link rel="stylesheet" type="text/css" href="/css/jquery.jscrollpane.css" />
	<link rel="stylesheet" type="text/css" href="/css/mobile.css" media="<?=MOBILE_MEDIA?>" />
    <!--[if lte IE 9]><script src="/respond.min.js"></script><![endif]-->
    <script type="text/javascript" src="/js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
	<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/infobubble.js"></script>
    <script type="text/javascript" src="/js/markerclusterer.js"></script>
    <script type="text/javascript" src="/js/jquery.cycle2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.cycle2.carousel.min.js"></script>
	<script type="text/javascript" src="/js/jquery.fancybox.js"></script>
	<script type="text/javascript" src="/js/jquery.fancybox-thumbs.js"></script>
	<script type="text/javascript" src="/js/jquery.mask.min.js"></script>
	<script type="text/javascript" src="/js/jquery.mousewheel.js"></script>
	<script type="text/javascript" src="/js/jquery.jscrollpane.min.js"></script>    
    <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body class="page-<?=$_SITE['section_type']?>">
    <div class="body-wrap">
        <header class="header">
            <div class="header-top">
                <div class="header-top-left"><span>ГОРНЫЙ ДЕЛОВОЙ ЦЕНТР</span> в Роза Хутор. Работа и учеба в горах.</div>
                <div class="header-top-right"><a href="#">УЗНАТЬ БОЛЬШЕ</a></div>
            </div>
            <div class="g-container"><div class="g-container-row">
                <div class="header-nav g-clearfix">
                    <div class="header-nav-logo">
                    <a<?=!$_SITE['is_index_page']?' href="/"':''?>>
                        <img src="/images/svg/logo_ru.svg" alt="Деловой - сеть офисных центров">
                    </a>
                    </div>
                    <div class="header-nav-right">
                        <div class="header-phone g-clearfix">
                            <div class="header-phone-number">
                                +7 495 988-07-36
                            </div>
                            <a href="#" class="header-phone-button g-button">позвоните мне</a>
                        </div>
                        <?	if ($_SITE['menu']['main']) { ?>
                            <nav class="header-menu">
                                <ul>
                                <?	foreach ($_SITE['menu']['main'] as $id => &$menu_item) { ?>
                                    <li<?=$_SITE['crumbs'][$id]?' class="menu-active"':''?>><a<?=!$_SITE['crumbs'][$id]['is_current']?' href="' . $menu_item['url'] . '"':''?><?=$menu_item['target_blank']?' target="_blank"':''?>><?=$menu_item['title']?></a></li>
                                <?	} ?>
                                </ul>                            
                            </nav>
                        <?	} ?>
                    </div>
                </div>
            <?	if (!$_SITE['is_index_page'] and !$_SITE['http_error']) { ?>
                <nav class="header-path">
                    <ul>
                        <li><a href="/"><?=current(explode(' ', $_SITE['section_paths']['index']['title']))?></a></li>
                        <? foreach($_SITE['crumbs'] as $path_item_id => &$path_item) { ?><li><? if (!$path_item['is_current']) { ?><a href="<?=$path_item['url']?>"><?=$path_item['title']?></a><? } else { ?><?=$path_item['title']?><? }?></li><? } ?>
                    </ul>
                </nav>
            <?	} ?>
             </div></div>
        </header>
        <div class="inner">
            <?=$__CMS__INNER_TEMPLATE_CONTENTS?>
        </div>
    </div>
    <footer class="footer">
        <div class="footer-main g-container"><div class="g-container-row">
            <div class="footer-main-left">
                <div class="footer-main-left-col">
                    <div class="footer-main-title">
                        О компании
                    </div>
                    <ul>
                        <li><a href="#">Клиенты</a><li>
                        <li><a href="#">Агентам</a><li>
                        <li><a href="#">Блог</a><li>
                        <li><a href="#">Контакты</a></li>
                    </ul>
                </div>
                <div class="footer-main-left-col">
                    <div class="footer-main-title">
                        Услуги
                    </div>
                    <ul>
                        <li><a href="#">Офисы и рабочие места</a><li>
                        <li><a href="#">Переговорная</a><li>
                        <li><a href="#">Виртуальный офис</a><li>
                        <li><a href="#">Коворкинг</a></li>
                    </ul>
                </div>
                <div class="footer-main-left-col">
                    <div class="footer-main-title">
                        Еще
                    </div>
                    <ul>
                        <li><a href="#">Бизнес-центры в Москве</a><li>
                        <li><a href="#">Горный деловой центр в Роза Хутор</a><li>
                        <li><a href="#" class="g-button">ПОЛУЧИТЬ КОНСУЛЬТАЦИЮ</a></li>
                    </ul>
                </div>              
            </div>
            <div class="footer-main-right">
                <div class="footer-main-title">
                    Подпишитесь
                </div>
                <div class="footer-main-right-text">
                    на рассылку спецпредложений наших офисных центров и обновления блога
                </div>
                <div class="footer-subscribe g-clearfix">
                    <form>
                        <input type="text" placeholder="@ Введите свой e-mail">
                        <button type="submit"></button>
                    </form>
                </div>
           </div>
        </div></div>
        <div class="footer-bottom">
            <div class="g-container"><div class="g-container-row">
                © 2016 КЦ «Деловой». Аренда офисов без посредников.
            </div></div>
        </div>
    </footer>
    <script src="https://maps.googleapis.com/maps/api/js?callback=initMap" async defer></script>
	<div id="fb-root"></div>
		<script>(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>
</body>
</html>