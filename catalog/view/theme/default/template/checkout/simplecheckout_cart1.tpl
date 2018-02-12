<div class="simplecheckout-block" id="simplecheckout_cart" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $display_error && $has_error ? 'data-error="true"' : '' ?>>
<?php if ($display_header) { ?>
    <div class="checkout-heading"><?php echo $text_cart ?></div>
<?php } ?>
<?php if ($attention) { ?>
    <div class="simplecheckout-warning-block"><?php echo $attention; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
    <div class="simplecheckout-warning-block"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="order-result">
    <h3 class="title">Ваш заказ</h3>

    <div class="items">
        <?php foreach ($products as $product) { ?>
        <div class="item clearfix">
            <div class="col-md-2 col-sm-2 col-xs-12 no-padding">
                <?php if ($product['thumb']) { ?>
                <a href="<?php echo $product['href']; ?>"><img  class="item-img img-responsive" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                <?php } ?>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-12 no-padding">
                <div class="item-description">
                    <h4 class="name"><?php echo $product['name']; ?></h4>
                    <span class="price"><?php echo $product['price']; ?></span>
                </div>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-12 no-padding">
                <div class="count">
                    <label for="count">Количество</label>
                    <table class="simplecheckout-cart">
                        <tbody>
                    <tr>
                        <td class="quantity">
                            <img data-onclick="decreaseProductQuantity" src='<?php echo $additional_path ?>catalog/view/image/minus.png'>
                            <input type="text" data-onchange="changeProductQuantity" name="quantity[<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
                            <img data-onclick="increaseProductQuantity" src='<?php echo $additional_path ?>catalog/view/image/plus.png'>
                        </td>
                    </tr>
                        </tbody>
                        </table>

                </div>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-12 no-padding">
                <span class="total-price"><?php echo $product['total']; ?></span>
                <button class="delete"><img src="img/icons/close.svg" alt=""></button>
            </div>
        </div>
        <?php }?>
    </div>
    <!--<div class="resume clearfix">
        <div class="col-md-5 col-sm-5 col-xs-12 no-padding">
            <div class="input-wrapp">
                <label for="promocode">Промокод:</label>
                <div class="search clearfix">
                    <input type="text" id="promocode">
                    <button>Ввести</button>
                </div>
                <p class="promocode-allert">
                    <span class="ok">Промокод активирован!</span>
                    <span class="wrong">Промокод не верен!</span>
                </p>
            </div>
        </div>
        <div class="col-md-7 col-sm-7 col-xs-12 no-padding">
            <ul class="checklist">
                <li>Общая стоимость товаров: <span>12 900 грн</span></li>
                <li>Стоимость доставки: <span>0 грн</span></li>
                <li class="total">Итого к оплате: <span>123 900 грн</span></li>
            </ul>
        </div>
    </div>-->
</div>
    


<input type="hidden" name="remove" value="" id="simplecheckout_remove">
<div style="display:none;" id="simplecheckout_cart_total"><?php echo $cart_total ?></div>
<?php if ($display_weight) { ?>
    <div style="display:none;" id="simplecheckout_cart_weight"><?php echo $weight ?></div>
<?php } ?>
<?php if (!$display_model) { ?>
    <style>
    .simplecheckout-cart col.model,
    .simplecheckout-cart th.model,
    .simplecheckout-cart td.model {
        display: none;
    }
    </style>
<?php } ?>
</div>
<div class="counter">
    <button data-onclick="decreaseProductQuantity" type="button" class="but counterBut dec">-</button>
    <input type="text" data-onchange="changeProductQuantity" name="quantity[<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
    <button data-onclick="increaseProductQuantity" type="button" class="but counterBut inc">+</button>
</div>