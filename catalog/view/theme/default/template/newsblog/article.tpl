<?php echo $header; ?>
<section class="s-news-inside">
<div class="container">
    <div class="breadcrumbs">
        <ul>
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
    </div>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <div class="news-title">
              <h2><?php echo $heading_title; ?></h2>
              <p class="pubdate"><?php echo $date; ?></p>
          </div>

          <div class="news-content">
              <div class="row">
                  <div class="col-md-8 col-sm-7">
                      <div class="img-preview">
                          <?php if ($thumb || $images) { ?>
                          <ul class="thumbnails">
                              <?php if ($images) { ?>
                              <?php foreach ($images as $image) { ?>
                                <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive" />
                              <?php } ?>
                              <?php } ?>
                          </ul>
                          <?php } ?>
                      </div>
                      <p><?php echo $description ?></p>
                  </div>
                  <div class="col-md-4 col-sm-5">
                      <div class="related">
                          <div class="related-news">
                              <h3><?=$text_news?></h3>
                              <?php if ($articles) { ?>
                              <?php foreach ($articles as $article) { ?>
                              <div class="news">
                                  <h4 class="news-title"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h4>
                                  <p class="news-content"><?php echo $article['preview']; ?></p>
                                  <a href="<?php echo $article['href']; ?>" class="read-more"><?=$text_more?></a>
                              </div>
                              <?php } ?>
                              <?php } ?>
                          </div>
                      </div>
                  </div>
              </div>
          </div>

          <div class="user-panel">
                 <!--<div class=""> Поделиться:
                  <div class="ya-share2" data-services="vkontakte,facebook,odnoklassniki,moimir,gplus,twitter,linkedin,viber,whatsapp,skype,telegram" data-limit="0">
                  </div></div>

              <script src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>
              <script src="//yastatic.net/share2/share.js"></script> -->
          </div>
      </div>
</section>

<section class="s-news">
    <div class="container">
        <div class="other-news">
            <h3><?=$text_another?></h3>
            <div class="row">
                <?php if ($articles) { ?>
                <?php foreach ($articles as $article) { ?>
                <div class="col-md-4 col-sm-6">
                    <div class="news trending">
                        <div class="img-title">
                            <a href="<?php echo $article['href']; ?>">
                                <img class="img-responsive" src="<?php echo $article['thumb']; ?>" alt="">
                            </a>
                        </div>
                        <div class="news-content">
                            <h4><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h4>
                            <p><?php echo $article['preview']; ?></p>
                        </div>
                        <div class="user-select">
                            <a href="<?php echo $article['href']; ?>" class="button colored"><?=$text_more?></a>
                        </div>
                    </div>
                </div>
                <?php } ?>
                <?php } ?>
            </div>
        </div>
    </div>
</section>
<br>

<?php echo $footer; ?>