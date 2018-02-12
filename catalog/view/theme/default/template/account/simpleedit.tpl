

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

        <div class="col-md-9 col-sm-8 col-xs-12">
            <div class="s-account">
                <div class="caption-content personal-data clearfix">
                    <div class="col-md-8 col-sm-8 col-xs-12">
                        <h3><?php echo $heading_title ;?></h3>
                        <div class="ordering-form">
                            <?php if (!$ajax || ($ajax && $popup)) { ?>
                            <script type="text/javascript">
                                (function($) {
                                    <?php if (!$popup && !$ajax) { ?>
                                        $(function(){
                                            <?php } ?>
                                        if (typeof Simplepage === "function") {
                                            var simplepage = new Simplepage({
                                                additionalParams: "<?php echo $additional_params ?>",
                                                additionalPath: "<?php echo $additional_path ?>",
                                                mainUrl: "<?php echo $action; ?>",
                                                mainContainer: "#simplepage_form",
                                                scrollToError: <?php echo $scroll_to_error ? 1 : 0 ?>,
                                            javascriptCallback: function() {<?php echo $javascript_callback ?>}
                                        });

                                            simplepage.init();
                                        }
                                    <?php if (!$popup && !$ajax) { ?>
                                        });
                                    <?php } ?>
                                })(jQuery || $);
                            </script>
                            <?php } ?>
                            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="simplepage_form">
                            <div class="input-group">
                                <div class="input-wrapp">
                                    <?php foreach ($rows as $row) { ?>
                                    <?php echo $row?>
                                    <?php } ?>
                                </div>

                            </div>
                            <div class="input-wrapp submit">
                                <a class="button colored" data-onclick="submit" id="simpleregister_button_confirm"><span><?php echo $button_continue; ?></span></a>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
<?php echo $content_bottom; ?>
<?php echo $footer?>
