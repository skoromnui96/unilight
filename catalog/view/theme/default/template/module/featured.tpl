<div class="tabs-content">
  <section class="s-products">
    <div class="row">
      <?php if ($products) { ?>
      <?php foreach ($products as $product) { ?>
      <div class="col-md-3 col-sm-6">
        <article class="main-product">
          <div class="product-image">
            <a href="<?php echo $product['href']; ?>">
              <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" />
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
<script type="text/javascript"><!--
    $('#button-cart').on('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('#button-cart').button('loading');
            },
            complete: function() {
                $('#button-cart').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

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

                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

                    $('html, body').animate({ scrollTop: 0 }, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
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
    //--></script>
<script type="text/javascript"><!--
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
    //--></script>

