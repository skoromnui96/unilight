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
        <div class="caption-content order-history clearfix">
          <div class="col-md-12 no-padding">
            <h3><?php echo $heading_title; ?></h3>
            <?php if ($orders) { ?>
            <div class="heading">
              <div class="table">
                <div class="t-line">
                  <div class="t-cell">
                    <h5><?php echo $column_order_id?> <i class="fa fa-angle-down" aria-hidden="true"></i></h5>
                  </div>
                  <div class="t-cell">
                    <h5>Дата заказ<i class="fa fa-angle-down" aria-hidden="true"></i></h5>
                  </div>
                  <div class="t-cell">
                    <h5><?php echo $column_status?> <i class="fa fa-angle-down" aria-hidden="true"></i></h5>
                  </div>
                  <div class="t-cell">
                    <h5><?php echo $column_total?> <i class="fa fa-angle-down" aria-hidden="true"></i></h5>
                  </div>
                  <div class="t-cell">
                    <h5>Детали заказа <i class="fa fa-angle-down" aria-hidden="true"></i></h5>
                  </div>
                </div>
              </div>
            </div>
            <?php foreach ($orders as $order) { ?>
            <div class="order">
              <div class="table">
                <div class="t-line">
                  <div class="t-cell">
                    <p class="order-id"><?php echo $order['order_id']; ?></p>
                  </div>
                  <div class="t-cell">
                    <p class="order-date"><?php echo $order['date_added']; ?></p>
                  </div>
                  <div class="t-cell">
                    <p class="order-delivery-status yellow"><?php echo $order['status']; ?></p>
                  </div>
                  <div class="t-cell">
                    <p class="order-price"><?php echo $order['total']; ?></p>
                  </div>
                  <div class="t-cell">
                 <a href="http://unilight.dev/index.php?route=account/order/info&order_id=<?php echo $order['order_id']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <?php }?>
            <?php } else { ?>
            <p><?php echo $text_empty; ?></p>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>

    <div class="text-right"><?php echo $pagination; ?></div>
  <?php echo $column_right; ?></div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
