<section class="s-stock">
    <div class="container">

        <div class="wholesalers">
            <a href="#feedback"><?=$text_buyers ?></a>
        </div>

        <div class="slider">
            <?php foreach ($banners as $banner) { ?>
                <div class="slide">
                    <div class="row">
                        <div class="col-md-5 col-sm-6 col-md-offset-1">
                            <div class="promo-text">
                                <h2><?php echo $banner['title']; ?></h2>
                                <?php if($banner['description']) { ?>
                                <p><?php echo $banner['description']; ?></p>
                                <?php } else { ?>
                                <?php } ?>
                                <?php if($banner['link']) { ?>
                                <a href="<?php echo $banner['link']; ?>" class="button colored"><?=$text_more ?></a>
                                <?php } ?>
                            </div>
                        </div>
                            <div class="col-md-5 col-sm-6">
                                <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive stock-item" />
                            </div>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
</section>

