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
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
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
    <div class="col-md-9 col-sm-8 col-xs-12">
      <div class="s-account">
    <div style="margin: 0 0 40px 20px;" id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <table class="table table-bordered table-hover">
        <thead>
        <tr>
          <td class="text-left" colspan="2"><?php echo $text_order_detail; ?></td>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td class="text-left" style="width: 50%;"><?php if ($invoice_no) { ?>
            <b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
            <?php } ?>
            <b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
            <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
          <td class="text-left"><?php if ($payment_method) { ?>
            <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
            <?php } ?>
            <?php if ($shipping_method) { ?>
            <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
            <?php } ?></td>
        </tr>
        </tbody>
      </table>
      <table class="table table-bordered table-hover">
        <thead>
        <tr>
          <td class="text-left" style="width: 50%;"><?php echo $text_payment_address; ?></td>
          <?php if ($shipping_address) { ?>
          <td class="text-left"><?php echo $text_shipping_address; ?></td>
          <?php } ?>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td class="text-left"><?php echo $payment_address; ?></td>
          <?php if ($shipping_address) { ?>
          <td class="text-left"><?php echo $shipping_address; ?></td>
          <?php } ?>
        </tr>
        </tbody>
      </table>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
          <tr>
            <td class="text-left"><?php echo $column_name; ?></td>
            <td class="text-left"><?php echo $column_model; ?></td>
            <td class="text-right"><?php echo $column_quantity; ?></td>
            <td class="text-right"><?php echo $column_price; ?></td>
            <td class="text-right"><?php echo $column_total; ?></td>
          </tr>
          </thead>
          <tbody>
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="text-left"><?php echo $product['name']; ?>
              <?php foreach ($product['option'] as $option) { ?>
              <br />
              &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
              <?php } ?></td>
            <td class="text-left"><?php echo $product['model']; ?></td>
            <td class="text-right"><?php echo $product['quantity']; ?></td>
            <td class="text-right"><?php echo $product['price']; ?></td>
            <td class="text-right"><?php echo $product['total']; ?></td>

          </tr>
          <?php } ?>
          <?php foreach ($vouchers as $voucher) { ?>
          <tr>
            <td class="text-left"><?php echo $voucher['description']; ?></td>
            <td class="text-left"></td>
            <td class="text-right">1</td>
            <td class="text-right"><?php echo voucher['amount']; ?></td>
          </tr>
          <?php } ?>
          </tbody>
          <tfoot>
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td colspan="3"></td>
            <td class="text-right"><b><?php echo $total['title']; ?></b></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
          </tfoot>
        </table>
      </div>
      <?php if ($comment) { ?>
      <table class="table table-bordered table-hover">
        <thead>
        <tr>
          <td class="text-left"><?php echo $text_comment; ?></td>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td class="text-left"><?php echo $comment; ?></td>
        </tr>
        </tbody>
      </table>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="button colored"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
        </div>
      </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>