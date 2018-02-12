
<?php echo $header; ?>
<div class="container">
  <div class="breadcrumbs">
    <ul>
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
</div>
<div class="container">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <section class="s-account">
      <div class="container">
        <div class="row">
          <div class="col-md-9 col-sm-8 col-xs-12">
            <div class="caption-content locations">
              <h3><?php echo $heading_title;?></h3>
              <?php if ($addresses) { ?>
              <?php foreach ($addresses as $result) { ?>
              <div class="col-md-6 col-sm-12 col-xs-12 ">
                <div class="item clearfix">
                  <div class="location ">
                        <ul>
                          <li class="city"><?php echo $result['address']?></li>
                        </ul>
                        <div class="user-panel">
                          <a href="<?php echo $result['update']; ?>" class="button bordered"><?php echo $button_edit; ?></a>
                          <a href="<?php echo $result['delete']; ?>" class="button bordered"><?php echo $button_delete; ?></a>
                    </div>
                  </div>
                </div>
              </div>

              <?php } ?>

              <?php } else { ?>
              <p><?php echo $text_empty; ?></p>
              <?php } ?>
              <div class="col-md-12 no-padding">
                <div class="add-location clearfix">
                  <a href="<?php echo $add; ?>"  class="add-location-button button bordered">
                    <i class="fa fa-plus" aria-hidden="true"></i>
                    <?php echo $button_new_address ;?>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

  </div>
  <?php echo $content_bottom; ?>
  <?php echo $footer; ?>
