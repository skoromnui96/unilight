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
        <div class="caption-content change-pass clearfix">
          <div class="col-md-6 col-sm-8 col-xs-12">
            <h3>Смена пароля</h3>
            <div class="ordering-form">
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="input-group">
                  <div class="input-wrapp">
                    <label for="pass">Новый пароль:</label>
                    <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="pass" />
                    <?php if ($error_password) { ?>
                    <div class="text-danger"><?php echo $error_password; ?></div>
                    <?php } ?>
                  </div>
                  <div class="input-wrapp">
                    <label for="pass2">Подтвердить пароль:</label>
                    <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="pass2"/>
                    <?php if ($error_confirm) { ?>
                    <div class="text-danger"><?php echo $error_confirm; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="input-wrapp submit">
                  <input type="submit" value="Сохранить" class="button colored" />
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>


  <?php echo $column_right; ?></div>
  <?php echo $content_bottom; ?>
<?php echo $footer; ?>