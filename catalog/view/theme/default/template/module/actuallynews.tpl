<section class="s-news">
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-sm-4">
                <?php if ($heading_title) { ?>
                <h3><?php echo $heading_title; ?></h3>
                <?php } ?>
                <?php foreach ($articles as $article) { ?>
                <div class="news trending">
                    <div class="img-title">
                        <a href="<?php echo $article['href']; ?>">
                            <img class="img-responsive" src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>">
                        </a>
                    </div>
                    <div class="news-content">
                        <h4><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h4>
                        <p><?php echo $article['preview']; ?></p>
                    </div>
                    <div class="user-select">
                        <a href="<?php echo $article['href']; ?>" class="button colored"><?php echo $text_more; ?></a>
                    </div>
                </div>
                <?php } ?>
            </div>
