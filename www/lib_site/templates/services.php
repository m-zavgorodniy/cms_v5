<div class="g-container">
	<div class="g-container-row">
		<h2 class="g-section-title">Cпецпредложения</h2>
		<ul class="offers-items">
	        <li>
	            <div class="offers-item">
	                <div class="offers-item-title c-icon c-office">
	                    Получите скидку 10% на аренду офиса
	                </div>
	                <div class="offers-item-date">
	                    1 февраля – 29 апреля 2016
	                </div>
	                <div class="offers-item-link"><a href="#" class="g-button c-office">ПОДРОБНЕЕ</a></div>
	            </div>
	        </li>
	        <li>
	            <div class="offers-item">
	                <div class="offers-item-title c-icon c-virtual">
	                    Виртуальный офис + 4 часа переговорных в подарок
	                </div>
	                <div class="offers-item-date">
	                    20 марта – 18 мая  2016
	                </div>
	                <div class="offers-item-link"><a href="#" class="g-button c-virtual">ПОДРОБНЕЕ</a></div>
	            </div>
	        </li>
	        <li>
	            <div class="offers-item">
	                <div class="offers-item-title c-icon c-meeting">
	                    Акция февраля – скидка 70% на аренду переговорных
	                </div>
	                <div class="offers-item-date">
	                    1 февраля – 29 апреля  2016
	                </div>
	                <div class="offers-item-link"><a href="#" class="g-button c-meeting">ПОДРОБНЕЕ</a></div>
	            </div>
	        </li>
	    </ul>		
	</div>
	<div class="g-container-row">
		<h2 class="g-section-title">Основные услуги</h2>
		<ul class="vd_services_list">
		<?
		
		foreach ($_DATA['service_group']['items'] as $service_group_item) {
			
			?>
			
			<li class="vd_services_list-item <? echo $service_group_item['css_signature']; ?>">
				<? echo $service_group_item['title']; ?>
			</li>
			
			<?
			
		}
			
		?>
			<li class="vd_services_list-item helper"></li>
		</ul>
	</div>
</div>

<?
	
?>