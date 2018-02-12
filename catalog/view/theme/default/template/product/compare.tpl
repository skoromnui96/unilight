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
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <section class="s-compare">
                <div class="container">
                    <h2><?php echo $heading_title; ?></h2>
                    <div class="compare-table">
                        <div class="row">
                            <?php if ($products) { ?>

                            <div class="col-md-3 col-sm-3 no-padding">
                                <div class="compare-description">
                                    <div class="heading">
                                        <h3 class="compare-item-count">В сравнении <?php echo count($products); ?> товара</h3>
                                    </div>
                                    <div class="properties">
                                        <ul>
                                            <?php foreach ($attribute_groups as $attribute_group) { ?>
                                            <li><h3 class="prop-title"><?php echo $attribute_group['name']; ?></h3></li>

                                            <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
                                            <li><?php echo $attribute['name']; ?></li>
                                            <?php }?>
                                            <?php }?>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <?php foreach ($products as $product) { ?>
                            <div class="col-md-3 col-sm-3 no-padding">
                                <article class="compareble-item">
                                    <div class="heading">

                                        <div class="title">
                                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['thumb']; ?>"></a>
                                            <h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                                        </div>
                                        <h3 class="price"><?php echo $product['price']; ?></h3>
                                        <div class="add-to-cart">
                                            <ul class="buttons">
                                                <li>
                                                    <button class="button colored" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" ><span><img src="/image/unilight/icons/cart1.svg" alt=""></span>
                                                        В корзину</button>
                                                </li>
                                                <li class="icon">
                                                    <div class="button-group">
                                                        <a  data-toggle="tooltip" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><img src="/image/unilight/icons/fav1.svg" alt=""></span></a>
                                                    </div>
                                                    <!--<a href="#" ><span><img src="/image/unilight/icons/fav1.svg" alt=""></span></a>-->
                                                </li>
                                                <li class="icon">
                                                    <a href="<?php echo $product['remove']; ?>"><span><img src="/image/unilight/icons/close.svg" alt=""></span></a>
                                                </li>
                                            </ul>

                                        </div>

                                    </div>
                                    <div class="properties">
                                        <ul>

                                            <?php foreach ($attribute_groups as $attribute_group) { ?>
                                            <li></li>
                                            <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
                                            <?php if (isset($product['attribute'][$key])) { ?>
                                            <li><?php echo $product['attribute'][$key]; ?></li>
                                            <?php } else { ?>
                                            <li><?php echo ''?></li>
                                            <?php } ?>
                                            <?php } ?>
                                            <?php }?>
                                        </ul>
                                    </div>
                                </article>
                            </div>
                            <?php }?>
                            <?php } else { ?>
                            <p><?php echo $text_empty; ?></p>
                            <?php }?>
                        </div>
                    </div>
                </div>
            </section>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>