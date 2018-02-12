<?php echo $header; ?>
<div class="container">
  <div class="container">

  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <ul class="col-md-3 col-sm-4 col-xs-12 caption">
      <?php if ($logged) { ?>
      <li><a href="<?php echo $edit; ?>" >Личные данные</a> </li>
      <li><a href="<?php echo $address; ?>" >Мои адреса</a> </li>
      <li><a href="<?php echo $password; ?>" >Смена пароля</a></li>
      <li><a href="<?php echo $order; ?>" >История заказов</a> </li>
      <li><a href="<?php echo $wishlist; ?>" >Избранные товары</a> </li>
      <li><a href="<?php echo $download; ?>" >Прайс-листы</a></li>
      <li><a href="<?php echo $newsletter; ?>" >Подписка на рассылку</a></li>
      <li><a href="<?php echo $logout; ?>" >Выйти</a></li>
      <?php } ?>
    </ul>
    <div class="col-md-9 col-sm-8 col-xs-12">
      <div class="s-account">
        <div class="caption-content personal-data clearfix">
          <div class="col-md-6 col-sm-8 col-xs-12">
            <h3>Личные данные</h3>
            <div class="ordering-form">
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"">
              <div class="input-group">
                <div class="input-wrapp">
                  <label for="firstname">Ваше имя:</label>
                  <input type="text" name="firstname" value="<?php echo $firstname?>" placeholder="<?php echo $entry_firstname; ?>" id="firstname" />
                  <?php if ($error_firstname) { ?>
                  <div class="text-danger"><?php echo $error_firstname; ?></div>
                  <?php } ?>
                </div>
                <div class="input-wrapp">
                  <label for="lasname">Ваше имя:</label>
                  <input type="text" name="lastname" value="<?php echo $lastname?>" placeholder="<?php echo $entry_lastname; ?>" id="lastname" />
                  <?php if ($error_lastname) { ?>
                  <div class="text-danger"><?php echo $error_lastname; ?></div>
                  <?php } ?>
                </div>
                <div class="input-wrapp">
                  <label for="email">Адрес электронной почты:</label>
                  <input type="email" name="email" value="<?php echo $email?>" placeholder="<?php echo $entry_email; ?>" id="email" />
                  <?php if ($error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
                <div class="input-wrapp">
                  <label for="tel">Номер телефона:</label>
                  <input type="tel" name="telephone" value="<?php echo $telephone?>" placeholder="<?php echo $entry_telephone; ?>" id="tel"/>
                  <?php if ($error_telephone) { ?>
                  <div class="text-danger"><?php echo $error_telephone; ?></div>
                  <?php } ?>
                </div>
                <div class="input-wrapp date-time">
                  <label for="t-d">Дата рождения</label>
                  <input type="date" id="t-d" value="<?php echo $date?>">
                </div>
              </div>
              <div class="radio-group">
                <div class="radio">
                  <label>
                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                    Мужской
                  </label>
                </div>
                <div class="radio">
                  <label>
                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                    Женский
                  </label>
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

    <?php echo $content_bottom; ?></div>
  <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
  // Sort the custom fields
  $('.form-group[data-sort]').detach().each(function() {
    if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group').length) {
      $('.form-group').eq($(this).attr('data-sort')).before(this);
    }

    if ($(this).attr('data-sort') > $('.form-group').length) {
      $('.form-group:last').after(this);
    }

    if ($(this).attr('data-sort') < -$('.form-group').length) {
      $('.form-group:first').before(this);
    }
  });
  //--></script>
<script type="text/javascript"><!--
  $('button[id^=\'button-custom-field\']').on('click', function() {
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
            $(node).parent().find('.text-danger').remove();

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
  //--></script>
<?php echo $footer; ?>