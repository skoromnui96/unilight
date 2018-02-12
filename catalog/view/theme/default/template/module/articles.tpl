<div class="col-md-7 col-sm-8">
    <?php if ($heading_title) { ?>
    <h3><?php echo $heading_title; ?></h3>
    <?php } ?>
    <?php foreach ($articles as $article) { ?>
    <div class="news clearfix">
        <div class="news-content">
            <div class="pubdate">
                <a href="<?php echo $article['href']; ?>">
                    <?php echo $article['date']; ?>
                </a>
            </div>
            <h4><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h4>
            <p><?php echo $article['preview']; ?></p>
        </div>
    </div>
    <?php } ?>
    <a href="index.php?route=newsblog/category&newsblog_path=1" class="button bordered goto">Перейти в блог <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
</div>
</div>
</div>
</section>
<br>
<br>