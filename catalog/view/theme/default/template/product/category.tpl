<?php echo $header; ?>

<div class="container">
    <div class="breadcrumbs">
        <ul>
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
    </div>
<div class="row">
<?php if ($column_left && $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'col-sm-9'; ?>
<?php } else { ?>
<?php $class = 'col-sm-12'; ?>
<?php } ?></div>
<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?></div>

<section class="s-categories">
    <div class="container">
        <h2><?php echo $heading_title; ?></h2>
        <div class="user-select">
            <div class="row">
                <div class="col-md-4 col-sm-12">
                    <p class="total-find"><span><?php echo $results; ?></span></p>
                </div>
                <div class="col-md-8 col-sm-12 no-padding">
                    <div class="col-md-4 col-sm-5 col-xs-12 no-padding">
                        <div class="input-wrapp">
                            <p class="desc"><?=$text_count?></p>
                            <select id="input-limit" class="button bordered dropdown-toggle" onchange="location = this.value;">
                                <?php foreach ($limits as $limits) { ?>
                                <?php if ($limits['value'] == $limit) { ?>
                                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                  <!-- <div class="col-md-3 col-sm-3 col-xs-12 no-padding">
                        <div class="input-wrapp view">
                            <p class="desc">
                                Вид:
                                <button type="button" id="grid-view" class="button bordered is-select" data-toggle="tooltip" title="<?php echo $button_grid; ?>">
                                    <i class="fa fa-th"></i>
                                </button>
                                <button type="button" id="list-view" class="button bordered" data-toggle="tooltip" title="<?php echo $button_list; ?>">
                                    <i class="fa fa-th-list"></i>
                                </button>
                            </p>
                        </div>
                    </div> -->
                    <div class="col-md-8 col-sm-7 col-xs-12 no-padding">
                        <div class="input-wrapp">
                            <div class="input-wrapp">
                                <p class="desc sort">
                                    <?php echo $text_sort; ?>
                                    <select id="input-sort" class="button bordered dropdown-toggle" onchange="location = this.value;">
                                        <?php foreach ($sorts as $sorts) { ?>
                                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                                        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="categories">
            <div class="row">
                    <?php echo $column_left; ?>

                <div class="col-md-9 col-sm-8 no-padding">
                    <div class="s-products">

                        <?php foreach ($products as $product) { ?>
                        <div class="col-md-4 col-sm-6">
                            <article class="main-product">
                                <div class="product-image">
                                    <a href="<?php echo $product['href']; ?>">
                                        <img src="<?php echo $product['thumb']; ?>" class="img-responsive"  alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>">
                                    </a>
                                </div>
                                <div class="product-info">
                                    <h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                                    <?php if ($product['price']) { ?>
                                    <h4 class="price"><?php echo $product['price']; ?></h4>
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
                                                    <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="button colored">
                                                        <span><img src="/image/unilight/icons/cart1.svg" alt=""></span>
                                                        <?php echo $button_cart; ?>
                                                    </button>
                                                </li>
                                                <li class="icon">
                                                    <div class="button-group">
                                                        <a  data-toggle="tooltip" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><img src="/image/unilight/icons/fav1.svg" alt=""></span></a>
                                                    </div>
                                                </li>
                                                <li class="icon">
                                                    <div class="button-group">
                                                        <a  data-toggle="tooltip" onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><img src="/image/unilight//icons/compare1.svg" alt=""></span></a>
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
            <br>
            <br>
            <div class="pagination">
                <?php echo $pagination; ?>
            </div>
</section>
    <?php echo $content_bottom; ?>
<?php echo $footer; ?>
