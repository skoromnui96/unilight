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

            <div class="row">
                <div class="container">

                        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <?php if (!$ajax && !$popup && !$as_module) { ?>
            <?php $simple_page = 'simpleregister'; ?>
            <div class="simple-content">
            <?php } ?>
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
                                useAutocomplete: <?php echo $use_autocomplete ? 1 : 0 ?>,
                                useGoogleApi: <?php echo $use_google_api ? 1 : 0 ?>,
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
                    <div class="simpleregister" id="simpleregister">
                        <p class="simpleregister-have-account"><?php echo $text_account_already; ?></p>
                        <?php if ($error_warning) { ?>
                        <div class="warning alert alert-danger"><?php echo $error_warning; ?></div>
                        <?php } ?>
                        <div class="simpleregister-block-content">
                            <div class="form-group required">
                                <div class="col-md-10">
                                    <?php foreach ($rows as $row) { ?>
                                    <?php echo $row ?>
                                    <?php } ?>
                                    <?php foreach ($hidden_rows as $row) { ?>
                                    <?php echo $row ?>
                                    <?php } ?>
                                    <a class="button colored " data-onclick="submit" id="simpleregister_button_confirm">
                                        <span><?php echo $button_continue; ?></span>
                                    </a>
                                </div>

                            </div>
                        </div>



                    </div>
                    <?php if ($redirect) { ?>
                        <script type="text/javascript">
                            location = "<?php echo $redirect ?>";
                        </script>
                    <?php } ?>
                </form>
            <?php if (!$ajax && !$popup && !$as_module) { ?>
            </div>

            <?php } ?>
                            </div>
                </div>
            </div>

<?php include $simple_footer ?>