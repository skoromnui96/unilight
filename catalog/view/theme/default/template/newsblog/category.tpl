<?php echo $header; ?>
<div class="container">
<div class="breadcrumbs">
  <ul>
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
</div>
</div>
<?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'col-sm-9'; ?>
<?php } else { ?>
<?php $class = 'col-sm-12'; ?>
<?php } ?>
<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
  <section class="s-news">
    <div class="container">
      <div class="other-news">
        <h3><?php echo $heading_title; ?></h3>
        <?php if ($articles) { ?>
        <div class="row">
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
                <a href="<?php echo $article['href']; ?>" class="button colored">Читать далее</a>
                <a href="#" class="button bordered">Поделиться <img src="/image/unilight/icons/share.svg" alt=""></a>
              </div>
            </div>
          </div>
          <?php } ?>
        </div>
        <?php } ?>
        <div class="pagination">
          <?php echo $pagination; ?>
        </div>
      </div>
    </div>
  </section>
</div>
<?php echo $content_bottom; ?>
<?php echo $column_right; ?>
<?php echo $footer; ?>