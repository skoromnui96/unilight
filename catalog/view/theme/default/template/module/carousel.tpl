<section class="s-partners">
  <div class="container">
    <div class="t-row" id="carousel<?php echo $module; ?>">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <a href="<?php echo $banner['link']; ?>">
      <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"  />
    </a>
  </div>
  <?php } ?>
    </div>
  </div>
</section>
<script type="text/javascript"><!--
$('#carousel<?php echo $module; ?>').owlCarousel({
	items: 4,
    autoPlay: 3000,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: false
});
--></script>
