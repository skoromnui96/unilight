<?php echo $header; ?>
<div class="container" style="padding: 0 25px;">
  <div class="breadcrumbs">
    <ul>
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <div class="col-md-12">
          <h1><?php echo $heading_title; ?></h1>
          <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
        </div>
      </div>
      <div class="row">
        <div class="col-md-5 col-sm-5">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
          <label class="checkbox-inline">
            <?php if ($sub_category) { ?>
            <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?>
          </label>
        </div>
        <div class="col-md-5 col-sm-5">
          <select name="category_id" style="width: 100%;">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>"><?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
          <label class="checkbox-inline">
            <?php if ($description) { ?>
            <input type="checkbox" name="description" value="1" id="description" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="description" value="1" id="description" />
            <?php } ?>
            <?php echo $entry_description; ?>
          </label>
        </div>
        <div class="col-md-2 col-sm-2">
          <input type="button" class="button colored" value="<?php echo $button_search; ?>" id="button-search" style="width: 100%;" />
        </div>
      </div>
      <div class="row">
        <div class="col-md-3 col-md-offset-2">
        </div>
        <div class="col-md-3">
        </div>
      </div>
      <h2><?php echo $text_search; ?></h2>
      <?php if ($products) { ?>
      <?php echo $results; ?>
      <div class="col-md-8 col-sm-12 no-padding">
        <div class="col-md-4 col-sm-5 col-xs-12 no-padding">
          <div class="input-wrapp">
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
  <div class="s-products">
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
  <div class="pagination">
  <?php echo $pagination; ?>
  </div>
  </div>
  <?php } else { ?>
  <p><?php echo $text_empty; ?></p>
  <?php } ?>
<?php echo $content_bottom; ?>
<?php echo $column_right; ?>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>