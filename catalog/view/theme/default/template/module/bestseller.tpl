<div class="tabs-content">
  <div class="slider">
    <div class="row">
      <?php foreach ($products as $product) { ?>
      <div class="col-md-3 col-sm-6">
        <article class="main-product">
          <div class="product-image">
            <a href="<?php echo $product['href']; ?>">
              <img src="<?php echo $product['thumb']; ?>" class="img-responsive"  alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>">
            </a>
          </div>
          <div class="product-info">
            <h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
            <?php if (!$product['special']) { ?>
            <h4 class="price"><?php echo $product['price']; ?></h4>
            <?php } else { ?>
            <h4 class="price"><?php echo $product['special']; ?></h4>
            <?php } ?>
            <div class="product-features">
              <ul class="properties">
                <li>
                  <?php if($product['upc']) { ?>
                <li>
                  <p>
                    <?php echo $product['entry_upc']; ?>
                    <span><?php echo $product['upc']; ?></span>
                    <span class="info-block">
                                <button class="info-open"><img src="/image/unilight//icons/info.svg" alt=""></button>
                                <span class="info-wrapper">
                                  <button class="info-close"><img src="/image/unilight//icons/close.svg" alt=""></button>
                                  <span class="info-title"><?php echo $product['entry_upc']; ?></span>
                                  <span class="info-content"><?php echo $product['upc_description']; ?></span>
                                  <a class="info-details" href="#"><?= $text_more ?></a>
                                </span>
                            </span>
                  </p>
                </li>
                <?php } else { ?>
                <p></p>
                <?php } ?>
                <?php if($product['sku']) { ?>
                <li><p><?php echo $product['entry_sku']; ?><span><?php echo $product['sku']; ?></span></p></li>
                <?php } else { ?>
                <p></p>
                <?php } ?>
                <?php if($product['isbn']) { ?>
                <li><p><?php echo $product['entry_isbn']; ?><span><?php echo $product['isbn']; ?></span></p></li>
                <?php } else { ?>
                <p></p>
                <?php } ?>
              </ul>
              <div class="add-to-cart">
                <ul class="buttons">
                  <li>
                    <button type="button" title="<?php echo $button_cart; ?>"  onclick="cart.add('<?php echo $product['product_id']; ?>');" class="button colored">
                      <span><img src="/image/unilight/icons/cart1.svg" alt=""></span>
                      <?php echo $button_cart; ?>
                    </button>
                  </li>
                  <li class="icon">
                    <div class="button-group">
                      <a  data-toggle="tooltip" title="<?php echo $button_wishlist; ?>"  onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><img src="/image/unilight/icons/fav1.svg" alt=""></span></a>
                    </div>
                  </li>
                  <li class="icon">
                    <div class="button-group">
                      <a  data-toggle="tooltip" title="<?php echo $button_compare; ?>"  onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><img src="/image/unilight//icons/compare1.svg" alt=""></span></a>
                    </div>
                </ul>
              </div>
            </div>
          </div>
        </article>
      </div>
      <?php } ?>
    </div>
  </div>
</div>