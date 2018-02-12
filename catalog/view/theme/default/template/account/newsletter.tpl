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
    <section class="s-account">
      <div class="container">
        <div class="row">
          <div class="col-md-9 col-sm-8 col-xs-12">
            <div class="caption-content subscription clearfix">
              <div class="col-md-7 no-padding">
                <h1><?php echo $heading_title; ?></h1>
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

                  <div class="checkbox-group">
                    <div class="checkbox">
                      <label class="radio-inline">
                        <input type="radio" name="newsletter" value="1" checked="checked" />
                        <?php echo $text_yes; ?> </label>
                    </div>
                    <div class="checkbox">
                      <label class="radio-inline">
                        <input type="radio" name="newsletter" value="0" />
                        <?php echo $text_no; ?></label>

                  </div>
                  <div>
                    <input type="submit" value="<?php echo $button_continue; ?>" class="colored" />
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <?php echo $content_bottom; ?>

    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>