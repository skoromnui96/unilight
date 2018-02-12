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
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row">
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
  <section class="s-account-registration">
    <div class="container">
      <h2><?php echo $text_account?></h2>
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <p class="title-text center"><?php echo $text_description?></p>
        </div>
      </div>
      <div class="authorization-forms authorization-forms-margin">
        <div class="row">
          <div class="col-md-4 col-sm-6 col-md-offset-1">
            <div class="feedback-form">
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                <h3><?php echo $text_new_customer?></h3>
                <div class="input-group">
                  <div class="input-wrapp">
                    <p><strong><?php echo $text_register; ?></strong></p>
                  </div>
                  <div class="input-wrapp">
                    <p><?php echo $text_register_account; ?></p>
                  </div>
                  <a href="<?php echo $register; ?>" class="button colored"><?php echo $text_registration?></a>
                </div>
                <p class="annotation"><?php echo $text_spam?> <a href="#"><?php echo $text_confidential?></a></p>
            </div>

            </form>
          </div>

          <div class="col-md-4 col-sm-6 col-md-offset-1">
            <div class="feedback-form">
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <h3><?php echo $text_has_account; ?></h3>
                <div class="input-group">
                  <div class="input-wrapp">
                    <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                    <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" />
                  </div>
                  <div class="input-wrapp">
                    <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                    <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" />
                    <a class="remind-password" href="<?php echo $forgotten; ?>"><?php echo $text_forgotten?></a>
                  </div>
                  <div class="input-wrapp">
                    <input type="submit" value="<?php echo $button_login; ?>" class="colored" />
                    <?php if ($redirect) { ?>
                    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                    <?php } ?>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
    </div>
</div>
<script type="text/javascript"><!--
  // Sort the custom fields
  $('#account .form-group[data-sort]').detach().each(function() {
    if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#account .form-group').length) {
      $('#account .form-group').eq($(this).attr('data-sort')).before(this);
    }

    if ($(this).attr('data-sort') > $('#account .form-group').length) {
      $('#account .form-group:last').after(this);
    }

    if ($(this).attr('data-sort') < -$('#account .form-group').length) {
      $('#account .form-group:first').before(this);
    }
  });

  $('#address .form-group[data-sort]').detach().each(function() {
    if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#address .form-group').length) {
      $('#address .form-group').eq($(this).attr('data-sort')).before(this);
    }

    if ($(this).attr('data-sort') > $('#address .form-group').length) {
      $('#address .form-group:last').after(this);
    }

    if ($(this).attr('data-sort') < -$('#address .form-group').length) {
      $('#address .form-group:first').before(this);
    }
  });

  $('input[name=\'customer_group_id\']').on('change', function() {
    $.ajax({
      url: 'index.php?route=account/register/customfield&customer_group_id=' + this.value,
      dataType: 'json',
      success: function(json) {
        $('.custom-field').hide();
        $('.custom-field').removeClass('required');

        for (i = 0; i < json.length; i++) {
          custom_field = json[i];

          $('#custom-field' + custom_field['custom_field_id']).show();

          if (custom_field['required']) {
            $('#custom-field' + custom_field['custom_field_id']).addClass('required');
          }
        }


      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

  $('input[name=\'customer_group_id\']:checked').trigger('change');
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

  $('.time').datetimepicker({
    pickDate: false
  });

  $('.datetime').datetimepicker({
    pickDate: true,
    pickTime: true
  });
  //--></script>
<script type="text/javascript"><!--
  $('select[name=\'country_id\']').on('change', function() {
    $.ajax({
      url: 'index.php?route=account/account/country&country_id=' + this.value,
      dataType: 'json',
      beforeSend: function() {
        $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
      },
      complete: function() {
        $('.fa-spin').remove();
      },
      success: function(json) {
        if (json['postcode_required'] == '1') {
          $('input[name=\'postcode\']').parent().parent().addClass('required');
        } else {
          $('input[name=\'postcode\']').parent().parent().removeClass('required');
        }

        html = '<option value=""><?php echo $text_select; ?></option>';

        if (json['zone'] && json['zone'] != '') {
          for (i = 0; i < json['zone'].length; i++) {
            html += '<option value="' + json['zone'][i]['zone_id'] + '"';

            if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
              html += ' selected="selected"';
            }

            html += '>' + json['zone'][i]['name'] + '</option>';
          }
        } else {
          html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
        }

        $('select[name=\'zone_id\']').html(html);
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

  $('select[name=\'country_id\']').trigger('change');
  //--></script>
<?php echo $footer; ?>
