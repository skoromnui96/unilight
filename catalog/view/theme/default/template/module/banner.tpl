<section class="s-videofiles">
  <div class="container">
    <h2><?php echo $text_video ?></h2>
    <div id="banner<?php echo $module; ?>">
      <div class="row">
        <?php foreach ($banners as $banner) { ?>
          <div class="col-md-4 col-sm-4 col-xs-12">
            <div class="video-wrap">
              <?php if($banner['video']):?>
                <div class="video">
                  <iframe src="https://www.youtube.com/embed/<?php echo $banner['video']?>" frameborder="0" allowfullscreen></iframe>
                </div>
              <?php else: ?>
                <?php if ($banner['link']) { ?>
                  <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
                <?php } else { ?>
              <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
                <?php } ?>
              <?php endif;?>
            <h4 class="video-title"><?php echo $banner['title']?></h4>
            </div>
          </div>
        <?php } ?>
      </div>
    </div>
  </div>
</section>






