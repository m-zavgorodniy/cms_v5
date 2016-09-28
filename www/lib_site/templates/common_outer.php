<?
define('MOBILE_BREAKPOINT_PX', '1000'); // 568px - iPhone 5, 768px - tablet
define('MOBILE_MEDIA', 'screen and (max-width:' . MOBILE_BREAKPOINT_PX . 'px)');

define('UPD', '?upd=20');

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
	<link rel="stylesheet" type="text/css" href="/css/styles.css<?=UPD?>" />
	<link rel="stylesheet" type="text/css" href="/css/content.css<?=UPD?>" />
	<link rel="stylesheet" type="text/css" href="/css/delovoy_styles.css<?=UPD?>" />
    <link rel="stylesheet" type="text/css" href="/css/delovoy_styles_mobile.css<?=UPD?>" />
	<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/jquery.fancybox.css" />
	<link rel="stylesheet" type="text/css" href="/css/jquery.fancybox-thumbs.css" />
	<link rel="stylesheet" type="text/css" href="/css/jquery.jscrollpane.css" />
	<link rel="stylesheet" type="text/css" href="/css/tooltipster.bundle.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/tooltipster-sideTip-shadow.min.css" />	

    <script type="text/javascript" src="/js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="/js/script.js<?=UPD?>"></script>
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
	<script type="text/javascript" src="/js/tooltipster.bundle.min.js"></script>    
	<script type="text/javascript" src="/js/tooltipster-SVG.min.js"></script>    
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
	<!-- Facebook Pixel Code -->
	<script>
	!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
	n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
	n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
	t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
	document,'script','//connect.facebook.net/en_US/fbevents.js');
	
	fbq('init', '1726395320911824');
	fbq('track', "PageView");</script>
	<noscript><img height="1" width="1" style="display:none"
	src="https://www.facebook.com/tr?id=1726395320911824&ev=PageView&noscript=1"
	/></noscript>
	<!-- End Facebook Pixel Code -->
</head>
<body class="page-<?=$_SITE['section_type']?>">
	<!-- Google Tag Manager -->
	<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-5DMZKZ"
	height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-5DMZKZ');</script>
	<!-- End Google Tag Manager -->	
    <div class="body-wrap">
        <header class="header">
            <div class="header-top">
                <div class="header-top-left"><a href="<?=$_SITE['section_paths']['office_centers']['path']?>?center=<?=$_SITE['config']['GDC_OFFICE_CENTER_ID']?>"><span>ГОРНЫЙ ДЕЛОВОЙ ЦЕНТР</span> в Роза Хутор. Работа и учеба в горах.</a></div>
                <div class="header-top-right"><a href="<?=$_SITE['section_paths']['office_centers']['path']?>?center=<?=$_SITE['config']['GDC_OFFICE_CENTER_ID']?>">УЗНАТЬ БОЛЬШЕ</a></div>
            </div>
            <div class="g-container"><div class="g-container-row">
                <div class="header-nav g-clearfix">
                    <div class="header-nav-logo">
                    <a<?=!$_SITE['is_index_page']?' href="/"':''?>>
                        <img src="/images/svg/logo_ru.svg" alt="Деловой - сеть офисных центров">
                        <span class="header-nav-logo-after">Деловой</span>
                    </a>
                    </div>
                    <div class="header-nav-right">
                        <div class="header-phone g-clearfix">
                            <div class="header-phone-number">
                                <?=strtr($_SITE['settings']['phone_number'], '()', '  ')?>
                            </div>
                            <a href="<?=$_SITE['section_paths']['callback']['path']?>" class="header-phone-button g-button">позвоните мне</a>
                        </div>
                        <?	if ($_SITE['menu']['main']) { ?>
                            <nav class="header-menu">
                                <ul>
                                <?	foreach ($_SITE['menu']['main'] as $id => &$menu_item) { ?>
                                    <li<?=$_SITE['crumbs'][$id]?' class="menu-active"':''?>><a href="<?=$menu_item['url']?>"<?=$menu_item['target_blank']?' target="_blank"':''?>><?=$menu_item['title']?></a></li>
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
        <?  if ($_SITE['seo_text']) { ?>
            <div class="vd_officelistdata text-content">
                <div class="g-container"><div class="g-container-row">
                    <p><?=$_SITE['seo_text']?></p>
                </div></div>
            </div>
        <?  } ?>
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
                        <li><a href="/company/#clients">Клиенты</a><li>
                        <li><a href="/company/#agents">Агентам</a><li>
                        <li><a href="/blog/" target="_blank">Блог</a><li>
                        <li><a href="/company/#contacts">Контакты</a></li>
                    </ul>
                </div>
                <div class="footer-main-left-col">
                    <div class="footer-main-title">
                        Услуги
                    </div>
                    <ul>
                        <li><a href="/services/arenda-ofisov/">Офисы и рабочие места</a><li>
                        <li><a href="/services/peregovornaya/">Переговорная</a><li>
                        <li><a href="/services/virtualnyy-ofis/">Виртуальный офис</a><li>
                        <li><a href="/services/coworking/">Коворкинг</a></li>
                    </ul>
                </div>
                <div class="footer-main-left-col">
                    <div class="footer-main-title">
                        Еще
                    </div>
                    <ul>
                        <li><a href="/business-centers/">Бизнес-центры в Москве</a><li>
                        <li><a href="/business-centers/rosa-khutor/">Горный деловой центр в Роза Хутор</a><li>
                        <li><a href="<?=$_SITE['section_paths']['request']['path']?>" class="g-button">ПОЛУЧИТЬ КОНСУЛЬТАЦИЮ</a></li>
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
                <div class="footer-subscribe">
                    <form>
                        <input type="text" placeholder="@ Введите свой e-mail">
                        <button type="submit"></button>
                    </form>
                </div>
                <div class="footer-sm g-clearfix">
                    <div class="footer-counter">
<!--LiveInternet counter--><script type="text/javascript"><!--
document.write("<a href='http://www.liveinternet.ru/click' "+
"target=_blank><img src='//counter.yadro.ru/hit?t45.4;r"+
escape(document.referrer)+((typeof(screen)=="undefined")?"":
";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
";"+Math.random()+
"' alt='' title='LiveInternet' "+
"border='0' width='31' height='31'><\/a>")
//--></script><!--/LiveInternet-->

<div style="position:absolute; width: 1px; overflow: hidden;">
<!-- Код тега ремаркетинга Google -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 988378918;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/988378918/?value=0&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
</div>
                    </div>
                    <a href="http://www.facebook.com/pages/Delovoy/275305792573991" target="_blank"><img src="/images/svg/fb.svg" width="48" height="48" alt="Facebook" title="Мы в Facebook"></a><a href="https://twitter.com/delovoy_" target="_blank"><img src="/images/svg/twitter.svg" width="48" height="48" alt="Twitter" title="Мы в Twitter"></a>
                </div>                
           </div>
        </div></div>
        <div class="footer-bottom">
            <div class="g-container"><div class="g-container-row">
                © <?=date('Y')?> <?=$_SITE['settings']['copyright']?>
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
