<?
if (!$_GET['ajax_inner']) { ?>
<div class="ajax-window">
    <?= $__CMS__INNER_TEMPLATE_CONTENTS ?>
</div>
<?
} else {
	echo $__CMS__INNER_TEMPLATE_CONTENTS;
}
?>