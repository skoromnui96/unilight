<?php echo $header; ?>
<div class="container">
  <div class="container">
    <div class="breadcrumbs">
      <ul>
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div class="col-md-9 col-sm-8 col-xs-12">
      <div class="s-account">
        <div class="caption-content favorite clearfix">
          <div class="col-md-12 no-padding">


            <?php if ($products) { ?>
            <?php foreach ($products as $product) { ?>

            <article class="list-item clearfix">

              <div class="col-md-3 col-sm-3 col-xs-4 no-padding">
                <div class="product-image">
                  <?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>">
                    <img src="<?php echo $product['thumb']; ?>" class="img-responsive" alt="">
                  </a>
                  <?php }?>
                </div>
              </div>
              <div class="col-md-5 col-sm-5 col-xs-4 no-padding">
                <div class="product-info">
                  <h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']?></a></h4>
                  <ul class="properties">
                    <li>
                      <p><?php echo $product['entry_upc'] ?><span><?php echo $product['upc']; ?></span></p>
                    </li>
                    <li>
                      <p><?php echo $product['entry_ean'] ?> <span><?php echo $product['ean']; ?></span></p>
                    </li>
                    <li>
                      <p><?php echo $product['entry_jan'] ?> <span> <?php echo $product['jan']?></span></p>
                    </li>
                  </ul>

                </div>
              </div>
              <div class="col-md-4 col-sm-4 col-xs-4 no-padding">
                <div class="product-features">
                  <div class="add-to-cart">
                    <h4 class="price"><?php echo $product['price'] ?></h4>
                    <a class="button colored" type="button" onclick="cart.add('<?php echo $product['product_id']?>');"
                       data-toggle="tooltip"> <span><img src="/image/unilight/icons/cart1.svg" alt=""></span>
                      <?php echo $button_cart;?></a>

                    <ul class="buttons">

                      <li class="icon">
                        <a href="<?php echo $product['remove']; ?>"
                           data-toggle="tooltip" title="<?php echo $button_remove; ?>"
                        ><span><img src="/image/unilight/icons/close.svg" alt=""></span></a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>

            </article>
            <?php } ?>
            <?php } else { ?>
            <p><?php echo $text_empty; ?></p>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>
    <?php echo $column_right; ?></div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
