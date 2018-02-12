<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
  <div class="row">
    <div class="col-md-10 col-sm-12 col-md-offset-1">
      <div class="comment-wrapp">
        <div class="topline">
          <h3 class="name"><?php echo $review['author']; ?></h3>
          <p class="pubdate"><?php echo $review['date_added']; ?></p>
        </div>
        <div class="text">
          <p><?php echo $review['text']; ?></p>
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($review['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
      </div>
    </div>
  </div>
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } ?>

