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
    <section class="s-contacts">
      <div class="container">
        <h2><?php echo $heading_title; ?></h2>
        <p class="title-text"><?php echo $text_location; ?></p>
        <div class="row">
          <div class="col-md-8 col-sm-10 col-md-offset-2 col-sm-offset-1">
            <div class="col-md-6 col-sm-6">
              <div class="contacts">
                <div class="tel">
                  <h4><?php echo $text_telephone?></h4>
                  <ul>
                    <li><?php echo $telephone; ?></li>
                  </ul>
                </div>
                <div class="address">
                  <h4><?php echo $text_address?></h4>
                  <ul>
                    <li> <?php echo $address; ?></li>
                  </ul>
                </div>
                <div class="worktime">
                  <h4><?php echo $text_open; ?></h4>
                  <ul>
                    <li> <?php if ($open) { ?>
                      <?php echo $open; ?><br />
                      <br />
                      <?php } ?></li>

                  </ul>
                </div>
                <div class="email">
                  <h4><?php echo $text_email; ?></h4>
                  <ul>
                    <li><?php echo $emails; ?></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-sm-6">
              <div class="feedback-form">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                  <h4><?php echo $text_contact; ?></h4>
                  <div class="input-wrapp">
                    <label for="input-name"><?php echo $entry_name;?>: </label>
                    <input type="text" name="name" value="<?php echo $name; ?>" id="input-name"/>
                    <?php if ($error_name) { ?>
                    <div class="text-danger"><?php echo $error_name; ?></div>
                    <?php } ?>
                  </div>
                  <div class="input-wrapp">
                    <label for="input-email"><?php echo $entry_email;?>: </label>
                    <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" />
                    <?php if ($error_email) { ?>
                    <div class="text-danger"><?php echo $error_email; ?></div>
                    <?php } ?>
                  </div>
                  <div class="input-wrapp">
                    <label for="input-enquiry">Номер телефона:</label>
                    <input type="tel" id="input-enquiry" value="<?php echo $enquiry; ?>"/>
                  </div>
                  <div class="input-wrapp">
                    <input class="colored" type="submit" value="<?php echo $button_submit; ?>" />
                  </div>
                  <p class="annotation"><?php echo $entry_spam;?> <a href="#"><?php echo $entry_confidential;?></a></p>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <?php echo $column_right; ?></div>


          <section class="s-map">
            <div class="container">
              <div id='map'>

              </div>
            </div>
          </section>


          <link href="https://fonts.googleapis.com/css?family=Roboto:300,400" rel="stylesheet">
          <link href="https://cdn.mapkit.io/v1/infobox.css" rel="stylesheet" >
          <script src="https://maps.googleapis.com/maps/api/js?key=&extension=.js"></script>
          <script src="https://cdn.mapkit.io/v1/infobox.js"></script>
          <script src="js/google-map.min.js"></script>
          <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
