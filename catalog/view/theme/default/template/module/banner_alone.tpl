<section class="s-about-us">
    <div class="container">
        <?php foreach ($banners as $banner) { ?>
        <h2><?=$banner['title'] ?></h2>
        <p class="description"><?=$description_alone ?></p>
        <img class="bgi-l img-responsive" src="/image/unilight/side-lamp-l.png" alt="">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
                <div class="video-wrap">
                    <?php if($banner['video']):?>
                    <div class="video">
                        <iframe src="https://www.youtube.com/embed/<?php echo $banner['video']?>" frameborder="0" allowfullscreen></iframe>
                    </div>
                    <?php else:?>
                    <?php if ($banner['link']) { ?>
                    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
                    <?php } else { ?>
                    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
                    <?php } ?>
                    <?php endif;?>
                </div>
            </div>
        </div>
        <img class="bgi-r img-responsive" src="/image/unilight/side-lamp-r.png" alt="">
        <?php } ?>
    </div>
</section>

