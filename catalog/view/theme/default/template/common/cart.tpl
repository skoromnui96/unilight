<div id="cart">
    <button id="button-cart" type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="cart">
        <img src="/image/unilight/icons/cart.svg" alt="">
        <span class="caption">
            <?php echo $text_shopping_cart; ?>
            <span class="item-count" data-id="container-for-total-count-cart"><?= $text_items ?></span>
            <span class="item-price" data-id="container-for-total-price-cart"><?= $text_currency ?></span>
        </span>
    </button>

    <div class="quick-order">
        <div class="">
            <div class="s-ordering q-order">
                <button class="close"><img src="/image/unilight/icons/close.svg" alt=""></button>
                <div class="heading">
                    <h4><?= $text_text_inner ?> <span data-id="container-for-total-count"><?= $text_items ?></span> <?=$text_inner ?></h4>
                </div>
                <div  class="order-result ">
                    <ul>
                        <?php foreach ($products as $product) { ?>
                        <li class="items" id="cart-items-<?php echo $product['cart_id']; ?>">
                            <div class="item clearfix">
                                <div class="col-md-2 col-sm-2 col-xs-12 no-padding">
                                    <?php if ($product['thumb']) { ?>
                                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="item-img img-responsive" /></a>
                                    <?php } ?>
                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-12 no-padding">
                                    <div class="item-description">
                                        <h4 class="name"><?php echo $product['name']; ?></h4>
                                        <span class="price"><?php echo $product['total']; ?></span>
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-12 no-padding">
                                    <div class="count">
                                        <label for="count"><?= $text_items_text ?></label>
                                        <div class="counter">
                                            <?php echo $product['quantity']; ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12 no-padding">
                                    <span class="total-price"></span>
                                    <button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="delete"><i class="fa fa-times"></i></button>

                                </div>
                            </div>
                        </li>
                        <?php } ?>
                        <li id="box-itmes" style="display: none" ><?= $text_items ?></li>
                        <li id="box-currensy" style="display: none" ><?= $text_currency ?></li>
                    </ul>


                    <div class="order-total">

                        <h3 class="text-right"><?= $text_total ?></h3>
                        <h3 class="text-right"><span data-id="container-for-total-price"><?= $text_currency ?></span></h3>

                        <a href="<?php echo $checkout; ?>" class="button colored"><?=$text_checkout?></a>
                    </div>
                </div>
            </div>
        </div>