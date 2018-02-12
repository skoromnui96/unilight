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
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <?php echo $content_top; ?>
        <section class="s-product-card" id="content">
            <div class="container">
                <div class="col-md-9 col-sm-12 col-xs-12">
                    <article class="product-card">
                        <div class="col-md-7 col-sm-5 col-xs-12 no-padding">
                            <div class="item-photo">
                                <div class="col-md-2 col-sm-2 col-xs-2 no-padding">
                                    <div class="preview">
                                        <?php if ($images) { ?>
                                        <?php foreach ($images as $image) { ?>
                                        <a href="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" data-fancybox="group">
                                            <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/>
                                        </a>
                                        <?php } ?>
                                        <?php } ?>
                                    </div>
                                </div>
                                <?php if ($thumb || $images) { ?>
                                <div class="col-md-10 col-sm-10 col-xs-10 no-padding">
                                    <?php if ($thumb) { ?>
                                    <a href="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" data-fancybox="group">
                                        <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="main img-responsive">
                                    </a>
                                    <?php } ?>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-7 col-xs-12 no-padding">
                            <div class="item-description">
                                <h1 class="item-name"><?php echo $heading_title; ?></h1>
                                <div class="item-reviews">
                                    <div class="item-rate">
                                        <div class="rate" style="width: 100%"></div>
                                    </div>
                                    <span class="count"><?php echo $reviews; ?></span>
                                </div>
                                <ul class="properties">
                                    <li>
                                        <?php if ($cat_list) { ?>
                                        <?php foreach ($cat_list as $cat_name) { ?>
                                        <p><?=$text_category?> <span><?php echo $cat_name['name']; ?></span></p>
                                        <?php } ?>
                                        <?php } ?>
                                    </li>
                                    <?php if ($upc) { ?>
                                    <li>
                                        <p>
                                            <?php echo $entry_upc; ?>
                                            <span><?php echo $upc; ?></span>
                                            <span class="info-block">
											<button class="info-open"><img src="/image/unilight//icons/info.svg" alt=""></button>
											<span class="info-wrapper">
												<button class="info-close"><img src="/image/unilight//icons/close.svg" alt=""></button>
                                                <?=$text_info?>
											</span>
										</span>
                                        </p>
                                    </li>
                                    <?php } else { ?>
                                    <li></li>
                                    <?php } ?>
                                    <?php if ($sku) { ?>
                                    <li>
                                        <p> <?php echo $entry_sku; ?> <span><?php echo $sku; ?></span></p>
                                    </li>
                                    <?php } else { ?>
                                    <li></li>
                                    <?php } ?>
                                    <?php if ($isbn) { ?>
                                    <li>
                                        <p><?php echo $entry_isbn; ?> <span><?php echo $isbn; ?></span></p>
                                    </li>
                                    <?php } else { ?>
                                    <li></li>
                                    <?php } ?>
                                </ul>
                                <div id="product">
                                <?php if ($options) { ?>
                                <?php foreach ($options as $option) { ?>
                                <?php if ($option['type'] == 'image') { ?>
                                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                    <h4 class="control-label"><?php echo $option['name']; ?></h4>
                                    <div id="input-option<?php echo $option['product_option_id']; ?>">
                                        <div class="item-colors">
                                            <div class="slider">
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                <label>
                                                <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                                <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                                                </label>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <?php } ?>
                                <?php } ?>
                                <?php } ?>
                                </div>
                                <div class="item-price">
                                    <?php if($stock == 0) { ?>
                                    <h3 class="in-stock" style="color: red"><?=$text_stock_none; ?></h3>
                                    <?php } else { ?>
                                    <h4 class="in-stock"><?=$text_stock; ?> <?php echo $stock; ?> шт.</h4>
                                    <?php } ?>
                                    <?php if ($price) { ?>
                                    <ul class="price navigate">
                                        <?php if (!$special) { ?>
                                        <li class="current"><?php echo $price; ?></li>
                                        <?php } else { ?>
                                        <li class="current"><?php echo $special; ?></li>
                                        <li class="old"><?php echo $price; ?></li>
                                        <?php } ?>
                                    </ul>
                                    <?php } ?>
                                </div>
                                <div class="add-to-cart" id="product">
                                    <ul class="buttons clearfix">
                                        <li>
                                            <div class="counter">
                                                <button type="button" class="but counterBut dec">-</button>
                                                <input type="text" name="quantity" class="field fieldCount" value="<?php echo $minimum; ?>" size="2" id="input-quantity" data-min="1" data-max="1000">
                                                <button type="button" class="but counterBut inc">+</button>
                                            </div>
                                        </li>
                                        <li>
                                            <button id="product-add-btn" onclick="cart.add('<?php echo $product_id; ?>')"  type="button"  data-loading-text="<?php echo $text_loading; ?>"  class="button colored">
                                                <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                                                <span><img src="/image/unilight//icons/cart1.svg" alt=""></span>
                                                <?php echo $button_cart; ?>
                                            </button>
                                        </li>
                                    </ul>
                                    <ul class="buttons clearfix">
                                        <li class="oneclick">
                                            <div id="oneclick">
                                                <div class="search one-click">
                                                    <input type="text" name="telephone" value="" placeholder="<?php echo $text_one_click_placeholder; ?>" id="input-payment-telephone" class="form-control">
                                                    <input type="hidden" name="product_id" value="<?php echo $product_id; ?>">
                                                    <button type="submit" id="button-oneclick" class="button bordered"><?php echo $text_one_click_button; ?></button>
                                                </div>
                                            </div>
                                            <script src="catalog/view/javascript/jquery.maskedinput.min.js" type="text/javascript"></script>
                                            <script type="text/javascript">
                                                $(document).ready(function() {
                                                    $("#input-payment-telephone").mask("<?php echo $text_one_click_mask; ?>",{placeholder:" "});
                                                });
                                            </script>
                                        </li>
                                        <li class="icon">
                                            <div class="button-group">
                                                <button type="button" class="button bordered" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');">
                                                    <span><img src="/image/unilight//icons/fav1.svg" alt=""></span>
                                                </button>
                                            </div>
                                        </li>
                                        <li class="icon">
                                            <button type="button" class="button bordered"  data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');">
                                                <span><img src="/image/unilight//icons/compare1.svg" alt=""></span>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="purchase-cond">
                        <ul>
                            <?=$text_information?>
                        </ul>
                    </div>

                    <div class="video-wrapp">
                        <div class="video">
                            <?php if ($video_type && ($video || $videos) && ($video_type == 2 || $video_type == 3)) { ?>
                            <h4><?=$text_video?></h4>
                            <?php if ($videos) { ?>
                            <?php if ($video) { ?>
                            <?php $default_video = array('id'=>$video,'thumb'=> $tab_thumb_video,'title'=>$default_video_title); ?>
                            <?php array_unshift($videos, $default_video); ?>
                            <?php } ?>

                            <?php $total_videos = count($videos); ?>
                            <?php if ($total_videos == 1) { ?>
                            <div class="video-container"><iframe width="1280" height="720" src="https://www.youtube.com/embed/<?php echo $videos[0]['id']; ?>?rel=0" frameborder="0" allowfullscreen></iframe></div>
                            <?php } else { ?>
                            <ul class="video-thumbnails">
                                <?php foreach ($videos as $video) { ?>
                                <li class="video-additional"><a class="thumbnail" target="_blank" href="//www.youtube.com/watch?v=<?php echo $video['id']; ?>"><div class="video-title"><h4><?php echo $video['title']; ?></h4></div><span class="v_thumb_block"><img src="<?php echo $video['thumb']; ?>" alt="<?php echo $video['title']; ?>" /><span class="play"></span></span></a></li>
                                <?php } ?>
                            </ul>
                            <script type="text/javascript"><!--
                                $(document).ready(function() {
                                    $('.video-thumbnails').magnificPopup({
                                        type:'iframe',
                                        delegate: 'a',
                                        iframe: {
                                            patterns: {
                                                youtube: {
                                                    src: '//www.youtube.com/embed/%id%?autoplay=1&rel=0'
                                                }
                                            }
                                        },
                                        gallery: {
                                            enabled:true
                                        }
                                    });
                                });
                                //--></script>
                            <?php } ?>
                            <?php } else { ?>
                            <div class="video-container"><iframe src="https://www.youtube.com/embed/<?php echo $video; ?>?rel=0" frameborder="0" allowfullscreen></iframe></div>
                            <?php } ?>
                        </div>
                        <?php } ?>
                    </div>
                </div>

            </div>
            <div class="tabs">
                <ul class="tabs-caption">
                    <li class="button bordered main-tab is-open">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20"><g><g><g><path d="M10,1a9,9,0,1,1-9,9,9.01,9.01,0,0,1,9-9m0-1A10,10,0,1,0,20,10,10,10,0,0,0,10,0Z"/><path d="M12.077,13.921l-.14.571q-.629.248-1,.378a2.647,2.647,0,0,1-.87.13,1.737,1.737,0,0,1-1.184-.371,1.2,1.2,0,0,1-.422-.943,3.336,3.336,0,0,1,.031-.454q.032-.232.1-.524l.524-1.854q.07-.266.118-.5a2.194,2.194,0,0,0,.048-.434.672.672,0,0,0-.147-.5.828.828,0,0,0-.56-.14,1.468,1.468,0,0,0-.416.064c-.143.042-.264.083-.367.121l.14-.572q.515-.21.985-.359a2.946,2.946,0,0,1,.891-.149,1.694,1.694,0,0,1,1.166.365,1.212,1.212,0,0,1,.41.949c0,.081-.009.223-.028.425a2.846,2.846,0,0,1-.1.559l-.522,1.847a4.905,4.905,0,0,0-.115.509,2.618,2.618,0,0,0-.051.432.622.622,0,0,0,.164.5.928.928,0,0,0,.571.133,1.648,1.648,0,0,0,.431-.067A2.413,2.413,0,0,0,12.077,13.921Zm.132-7.753a1.081,1.081,0,0,1-.365.822,1.242,1.242,0,0,1-.879.34,1.256,1.256,0,0,1-.883-.34,1.105,1.105,0,0,1,0-1.648,1.3,1.3,0,0,1,1.762,0A1.091,1.091,0,0,1,12.209,6.168Z"/></g></g></g></svg>
                        <?php echo $tab_description; ?>
                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                    </li>
                    <li class="button bordered">
                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22"><g><g><path d="M11,15a4,4,0,1,1,4-4A4,4,0,0,1,11,15Zm0-6a2,2,0,1,0,2,2A2,2,0,0,0,11,9Zm3,13H8V19.49a8.907,8.907,0,0,1-.885-.367L5.342,20.907,1.093,16.658l1.784-1.773A8.907,8.907,0,0,1,2.51,14H0V8H2.51a8.907,8.907,0,0,1,.367-.885L1.093,5.342,5.342,1.093,7.115,2.877A8.907,8.907,0,0,1,8,2.51V0h6V2.51a8.907,8.907,0,0,1,.885.367l1.773-1.784,4.249,4.249L19.123,7.115A8.907,8.907,0,0,1,19.49,8H22v6H19.49a8.907,8.907,0,0,1-.367.885l1.784,1.773-4.249,4.249-1.773-1.784A8.907,8.907,0,0,1,14,19.49Zm-4-2h2V17.974l.751-.193a6.886,6.886,0,0,0,1.808-.751l.67-.4,1.433,1.441,1.412-1.412-1.441-1.433.4-.67a6.886,6.886,0,0,0,.751-1.808L17.974,12H20V10H17.974l-.193-.751a6.886,6.886,0,0,0-.751-1.808l-.4-.67,1.441-1.433L16.662,3.926,15.229,5.368l-.67-.4a6.886,6.886,0,0,0-1.808-.751L12,4.026V2H10V4.026l-.751.193a6.886,6.886,0,0,0-1.808.751l-.67.4L5.338,3.926,3.926,5.338,5.368,6.771l-.4.67a6.886,6.886,0,0,0-.751,1.808L4.026,10H2v2H4.026l.193.751a6.886,6.886,0,0,0,.751,1.808l.4.67L3.926,16.662l1.412,1.412,1.433-1.441.67.4a6.886,6.886,0,0,0,1.808.751l.751.193Z"/></g></g></svg>
                        <?php echo $tab_attribute; ?>
                    </li>
                    <li class="button bordered">
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="16" viewBox="0 0 14 16"><g><g><path d="M12,2v8H9v1.163l-.574-.575L7.84,10H2V2H12m.444-2H1.556A1.646,1.646,0,0,0,0,1.714v8.571A1.646,1.646,0,0,0,1.556,12H7.01L11,16V12h1.444A1.646,1.646,0,0,0,14,10.286V1.714A1.646,1.646,0,0,0,12.444,0Z"/></g></g></svg>
                        <?php echo $tab_review; ?>
                    </li>
                    <li class="button bordered">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20"><g><g><g><path d="M14,9H11V6A1,1,0,0,0,9,6V9H6a1,1,0,0,0,0,2H9v3a1,1,0,0,0,2,0V11h3a1,1,0,0,0,0-2Z"/><path d="M10,1a9,9,0,1,1-9,9,9.01,9.01,0,0,1,9-9m0-1A10,10,0,1,0,20,10,10,10,0,0,0,10,0Z"/></g></g></g></svg>
                        <?=$text_with?>
                    </li>
                    <li class="button bordered">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="21" viewBox="0 0 18 21"><g><g><g><path d="M9,3A6.007,6.007,0,0,0,3,9c0,3.245,1.209,4.4,2.093,5.249A2.045,2.045,0,0,1,6,16v1h6V16a2.045,2.045,0,0,1,.907-1.751C13.791,13.4,15,12.245,15,9A6.007,6.007,0,0,0,9,3Zm2.524,9.8A4,4,0,0,0,10,16H8a4,4,0,0,0-1.524-3.2C5.717,12.077,5,11.391,5,9a4,4,0,0,1,8,0C13,11.391,12.283,12.077,11.524,12.8Z"/><rect x="6" y="18" width="6" height="1"/><rect x="6" y="20" width="6" height="1"/><circle cx="9" cy="1" r="1"/><circle cx="3.343" cy="3.343" r="1" transform="translate(-1.385 3.343) rotate(-45)"/><circle cx="1" cy="9" r="1"/><circle cx="3.343" cy="14.657" r="1" transform="translate(-9.385 6.657) rotate(-44.999)"/><circle cx="14.657" cy="3.343" r="1" transform="translate(1.929 11.343) rotate(-45)"/><circle cx="17" cy="9" r="1"/><circle cx="14.657" cy="14.657" r="1" transform="translate(-6.071 14.656) rotate(-44.999)"/></g></g></g></svg>
                        <?=$text_lamps?>
                    </li>
                </ul>
                <div class="tabs-content tab-description is-open">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <p><?php echo $description; ?></p>
                        </div>
                    </div>
                </div>
                <div class="tabs-content tab-param">
                    <div class="row">
                        <?php foreach ($attribute_groups as $attribute_group) { ?>
                        <div class="col-md-3 col-sm-4 col-xs-12 col-md-offset-1">
                            <h3><?php echo $attribute_group['name']; ?></h3>
                            <ul>
                                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                <li><?php echo $attribute['name']; ?>: <span><?php echo $attribute['text']; ?></span></li>
                                <?php } ?>
                            </ul>
                        </div>
                        <?php } ?>
                    </div>
                </div>
                <div class="tabs-content tab-comments">
                    <?php if ($review_status) { ?>
                    <div id="review">
                    </div>
                    <div class="send-a-review">
                        <button class="button colored"><?php echo $text_write; ?></button>
                    </div>
                    <div class="add-a-rewiew" id="tab-review" style="display:none;">
                        <form class="" id="form-review">
                            <?php if ($review_guest) { ?>
                            <div class="form-group required">
                                <div class="col-md-8 col-md-offset-2">
                                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group required">
                                <div class="col-md-8 col-md-offset-2">
                                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group required">
                                <div class="col-md-8 col-md-offset-2">
                                    <label class="control-label"><?php echo $entry_rating; ?></label>
                                    <input type="radio" name="rating" value="1" />
                                    <input type="radio" name="rating" value="2" />
                                    <input type="radio" name="rating" value="3" />
                                    <input type="radio" name="rating" value="4" />
                                    <input type="radio" name="rating" value="5" />
                                </div>
                            </div>
                            <?php echo $captcha; ?>
                            <div class="buttons clearfix">
                                <div class="col-md-8 col-md-offset-2" style="text-align: center;">
                                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="button colored"><?php echo $button_continue; ?></button>
                                </div>
                            </div>
                            <?php } else { ?>
                            <?php echo $text_login; ?>
                            <?php } ?>
                        </form>
                    </div>
                    <?php } ?>
                </div>

                <?php if ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-4'; ?>
                <?php } ?>
                <div class="tabs-content">
                    <section class="s-products">
                        <?php if ($products) { ?>
                        <div class="row">
                            <?php $i = 0; ?>
                            <?php foreach ($products as $product) { ?>
                            <?php if ($column_left && $column_right) { ?>
                            <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
                            <?php } elseif ($column_left || $column_right) { ?>
                            <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
                            <?php } else { ?>
                            <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
                            <?php } ?>
                            <div class="col-md-3 col-sm-6">
                                <article class="main-product">
                                    <div class="product-image">
                                        <a href="<?php echo $product['href']; ?>">
                                            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="" />
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
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <?php } ?>
                            <?php } ?>
                        </div>
                    </section>
                </div>
                <?php echo $content_bottom; ?>
            </div>
    </div>
    </section>
</div>
<script>
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function() {
                $('#recurring-description').html('');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
</script>
<script >
    $('#button-cart').on('click', function() {
        $.ajax({
                url: 'index.php?route=checkout/cart/add',
                type: 'post',
                data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
                dataType: 'json',
                beforeSend: function() {

                },
                complete: function() {
                    $('#button-cart').button('reset');
                },
                success: function(json) {
                    $('.alert, .text-danger').remove();
                    $('.form-group').removeClass('has-error');

                    setTimeout(function(){
                        $('#cart').children().find('[data-id="container-for-total-count"]').html( $('#cart').children().find('[id="box-itmes"]').text());
                        $('#cart').children().find('[data-id="container-for-total-price"]').html($('#cart').children().find('[id="box-currensy"]').text());
                        $('#cart').children().find('[data-id="container-for-total-count-cart"]').html( $('#cart').children().find('[id="box-itmes"]').text());
                        $('#cart').children().find('[data-id="container-for-total-price-cart"]').html($('#cart').children().find('[id="box-currensy"]').text());
                        $('#cart').children().find('[id="box-itmes"]').text(json['total']);
                        $('#cart').children().find('[id="box-currensy"]').text(json['text_currency']);
                        setInterval(function(){
                            /* $('#cart').children().find('[data-id="container-for-total-count-cart"]').html( $('#cart').children().find('[id="box-itmes"]').text());
                             $('#cart').children().find('[data-id="container-for-total-price-cart"]').html($('#cart').children().find('[id="box-currensy"]').text());*/
                        },50);


                        if (json['error']) {
                            if (json['error']['option']) {
                                for (i in json['error']['option']) {
                                    var element = $('#input-option' + i.replace('_', '-'));

                                    if (element.parent().hasClass('input-group')) {
                                        element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                    } else {
                                        element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                    }
                                }
                            }

                            if (json['error']['recurring']) {
                                $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                            }

                            // Highlight any found errors
                            $('.text-danger').parent().addClass('has-error');
                        }

                        if (json['success']) {
                            $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                            $('#button-cart').button('loading');
                            $('#cart').children().find('ul').load('index.php?route=common/cart/info ul li');
                            console.log('json total ='+json['total']);
                            console.log('json total ='+json['text_currency']);
                        }
                        },200)

                    //$('#cart > button').html('<img src="/image/unilight/icons/cart.svg" alt=""><span class="caption">Корзина' + '<span id="container-for-total-count-cart" class="item-count">' +json['total']+ '</span>' + '<span id="container-for-total-count-cart" class="item-price">' + json['text_currency'] + '</span>');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
    });</script>
<script type="text/javascript">
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('button[id^=\'button-upload\']').on('click', function() {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function() {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function() {
                        $(node).button('loading');
                    },
                    complete: function() {
                        $(node).button('reset');
                    },
                    success: function(json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').attr('value', json['code']);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
</script>
<script>

    $('#review').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function() {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function() {
                $('#button-review').button('loading');
            },
            complete: function() {
                $('#button-review').button('reset');
            },
            success: function(json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
    });

    $(document).ready(function() {
        $('.thumbnails').magnificPopup({
            type:'image',
            delegate: 'a',
            gallery: {
                enabled:true
            }
        });



    });
</script>
<script>
    (function($){
        setInterval(function () {
            if($('input[name="quantity"]').val()!=1){
                $('#product-add-btn').attr('onclick','cart.add('+$('input[name="product_id"]').val()+','+$('input[name="quantity"]').val()+')');
            }else{
                $('#product-add-btn').attr('onclick','cart.add('+$('input[name="product_id"]').val()+','+1+')');
            };

        },50);
    })(window.jQuery);
</script>

<script type="text/javascript"><!--
    $('#button-oneclick').on('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/one_click/add',
            type: 'post',
            data: $('#oneclick input[type=\'text\'], #oneclick input[type=\'hidden\']'),
            dataType: 'json',
            beforeSend: function() {
                $('#button-oneclick').button('loading');
            },
            complete: function() {
                $('#button-oneclick').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['telephone']) {
                        $('.breadcrumbs').after('<div class="alert alert-danger text-danger">' + json['error']['telephone'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                        $('html, body').animate({ scrollTop: 0 }, 'slow');
                    }
                    if (json['error']['product']) {
                        $('.breadcrumbs').after('<div class="alert alert-danger text-danger">' + json['error']['product'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                        $('html, body').animate({ scrollTop: 0 }, 'slow');
                    }
                    if (json['error']['order']) {
                        $('.breadcrumbs').after('<div class="alert alert-danger text-danger">' + json['error']['order'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                        $('html, body').animate({ scrollTop: 0 }, 'slow');
                    }
                }

                if (json['success']) {
                    $('.breadcrumbs').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    $('html, body').animate({ scrollTop: 0 }, 'slow');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    //--></script>


<?php echo $footer; ?>
