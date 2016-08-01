<div class="index-promo g-container"><div class="g-container-row">
    <div class="index-promo-left">
        <div class="index-promo-left-title">
            Приходи и&nbsp;работай
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
        <a style="background-image: url(/uploads/images/samples/main_1.png)"></a>
    </div></div>
</div></div>
<?
if (isset($_DATA['special_offer'])) { ?>
    <div class="offers index-offers g-container"><div class="g-container-row">
    <?  out_special_offers($_DATA['special_offer']['items']); ?>
    </div></div>
<?
} ?>
<div class="index-promo2 g-container"><div class="g-container-row">
    <div class="index-promo2-left g-bigpicture"><div class="g-bigpicture-box">
        <a style="background-image: url(/uploads/images/office_centers/roza_hutor/roza3.jpg)"></a>
    </div></div>
    <div class="index-promo2-right">
        <h2>Горный деловой центр в Роза Хутор</h2>
        <div class="index-promo2-text text-content">
            <p>Новый формат — сочетание работы и активного отдыха. Все возможности известного курорта «Роза Хутор» и офисного центра «Деловой».
Работайте в комфортной обстановке настоящего офиса. Не важно, проведете Вы здесь один час или несколько дней, придете один или с коллегами, — мы создали все условия для того, чтобы ваша работа была комфортной и продуктивной.</p>
        </div>
        <div class="index-promo2-link"><a href="<?=$_SITE['section_paths']['office_centers']['path']?>?center=<?=$_SITE['config']['GDC_OFFICE_CENTER_ID']?>" class="g-button">ПОДРОБНЕЕ</a></div>
    </div>
</div></div>
<div class="index-text">
	<div class="g-container"><div class="g-container-row">
    	<div class="index-text-left text-content">
    		<p>Сеть офисных центров «Деловой» — единственная в России компания, деятельность которой заключается в создании благоприятных условий работы для малого и среднего бизнеса.</p>
			<p>В отличие от многих организаций и союзов поддержки предпринимателей и банков, мы не даем гранты, не лоббируем законы и не предоставляем кредиты.</p>
        </div>
        <div class="index-text-right text-content">
        	<p>«Деловой» предлагает гораздо большее: современную недвижимость для малого предпринимателя, помощь в оптимизации расходов на аренду и выход на новый уровень ведения бизнеса.</p>
			<p>Цены на аренду офисов начинаются от 11 и до 15,5 тыс. рублей за 1 рабочее место в месяц, а расценки на аренду переговорных 700 (в 3-х центрах) и 1800 рублей в час (в Гостином Дворе). При этом чем больше часов вы у нас работаете, тем больше скидка. Наши цены оптимальны и справедливы, не занижены искусственно за счет дополнительных скрытых платежей. При этом предпринимателям предоставляется полная свобода выбора: можно поменять офис или переговорную комнату, отказаться от дополнительных услуг или вовсе отменить бронь на помещение. Никаких штрафов и претензий.</p>
			<p>Мы понимаем трудности, с которыми сталкиваются начинающие предприниматели, поэтому не гонимся за сверхприбылью. Задача сети центров «Деловой» — помочь малому бизнесу Москвы, формируя для него полноценную инфраструктуру высокого  уровня.</p>
        </div>
	</div></div>
</div>
