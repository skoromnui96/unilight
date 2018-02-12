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
        <div class="caption-content favorite clearfix">
          <div class="col-md-12 no-padding">
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <?php if ($downloads) { ?>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-right"><?php echo $column_order_id; ?></td>
            <td class="text-left"><?php echo $column_name; ?></td>
            <td class="text-left"><?php echo $column_size; ?></td>
            <td class="text-left"><?php echo $column_date_added; ?></td>
            <td></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($downloads as $download) { ?>
          <tr>
            <td class="text-right"><?php echo $download['order_id']; ?></td>
            <td class="text-left"><?php echo $download['name']; ?></td>
            <td class="text-left"><?php echo $download['size']; ?></td>
            <td class="text-left"><?php echo $download['date_added']; ?></td>
            <td><a href="<?php echo $download['href']; ?>" data-toggle="tooltip" title="<?php echo $button_download; ?>" class="button colored"><i class="fa fa-cloud-download"></i></a></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div><a href="<?php echo $continue; ?>" class="button colored"><?php echo $button_continue; ?></a></div>
      </div>
            </div>
          </div>
        </div>
      </div>
    <?php echo $column_right; ?></div>
</div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>