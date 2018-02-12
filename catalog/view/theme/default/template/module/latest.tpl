<section class="s-products">
  <div class="container">
    <h2><?=$our_products ?></h2>
    <div class="tabs">
      <ul class="tabs-caption">
        <li class="button bordered is-open">
          <svg xmlns="http://www.w3.org/2000/svg" width="19.293" height="19" viewBox="0 0 19.293 19"><g><g><g><path class="cls-1" d="M9.647,1.239l2.224,1.629.235.172.29.019,2.751.182L15.8,5.918l.069.282.21.2,1.99,1.908-1.218,2.473-.128.261.031.289.3,2.741-2.523,1.112-.266.117-.162.242-1.533,2.291-2.647-.77-.279-.081-.279.081-2.647.77L5.187,15.544,5.025,15.3l-.266-.117L2.237,14.073l.3-2.741.031-.289-.128-.261L1.221,8.31,3.211,6.4l.21-.2.069-.282.657-2.677L6.9,3.059l.29-.019.235-.172L9.647,1.239M9.647,0,6.832,2.061,3.35,2.292,2.519,5.68,0,8.094l1.541,3.13-.377,3.468L4.356,16.1,6.3,19l3.35-.974L13,19l1.94-2.9,3.193-1.407-.377-3.468,1.541-3.13L16.774,5.68l-.832-3.388-3.481-.231L9.647,0Z"/><path d="M8.507,11.6,8.26,3.994h2.772L10.786,11.6Zm-.077,3.4V12.7h2.433v2.31Z"/></g></g></g></svg>
          <?php echo $tab_latest; ?>
        </li>
        <li class="button bordered">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="19" viewBox="0 0 20 19"><g><g><path d="M10,4.527l1.29,2.619.466.946,1.044.15,2.888.415-2.09,2.03-.757.736.18,1.04.5,2.873-2.584-1.362L10,13.484l-.932.491L6.483,15.336l.5-2.873.18-1.04L6.4,10.688l-2.09-2.03L7.2,8.242l1.044-.15.466-.946L10,4.527M10,0,6.916,6.263,0,7.257l5.01,4.865L3.82,19,10,15.744,16.18,19l-1.19-6.877L20,7.257l-6.916-.995L10,0Z"/></g></g></svg>
          <?php echo $tab_bestseller; ?>
        </li>
        <li class="button bordered">
          <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 19 19"><g><g><g><path d="M3.8,1.9A1.9,1.9,0,1,1,1.9,3.8,1.9,1.9,0,0,1,3.8,1.9M3.8,0A3.8,3.8,0,1,0,7.6,3.8,3.8,3.8,0,0,0,3.8,0Z"/><path d="M15.2,13.3a1.9,1.9,0,1,1-1.9,1.9,1.9,1.9,0,0,1,1.9-1.9m0-1.9A3.8,3.8,0,1,0,19,15.2a3.8,3.8,0,0,0-3.8-3.8Z"/><path d="M2.85,17.1a.95.95,0,0,1-.672-1.622l13.3-13.3a.95.95,0,0,1,1.343,1.343l-13.3,13.3A.947.947,0,0,1,2.85,17.1Z"/></g></g></g></svg>
          <?php echo $tab_special; ?>
        </li>
      </ul>

    <div class="tabs-content is-open">
    <div class="slider">
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="col-md-3 col-sm-6">
          <article class="main-product" id='item-<?php echo $product['product_id']; ?>'>
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
                    <button type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="button colored">
                      <span><img src="/image/unilight/icons/cart1.svg" alt=""></span>
                      <?php echo $button_cart; ?>
                    </button>
                  </li>
                  <li class="icon">
                    <div class="button-group">
                      <a  data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><img src="/image/unilight/icons/fav1.svg" alt=""></span></a>
                    </div>
                  </li>
                  <li class="icon">
                    <div class="button-group">
                      <a  data-toggle="tooltip" title="<?php echo $button_compare; ?>"  onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><img src="/image/unilight//icons/compare1.svg" alt=""></span></a>
                    </div>
                  </li>
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
