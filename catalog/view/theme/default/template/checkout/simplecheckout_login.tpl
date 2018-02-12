<div class="simplecheckout-block" id="simplecheckout_login" <?php echo $has_error ? 'data-error="true"' : '' ?>>
    <div class="simplecheckout-block-content">

        <?php if ($error_login) { ?>
        <div class="simplecheckout-warning-block"><?php echo $error_login ?></div>
        <?php } ?>

               <!--= <div id="simple_login_header"><button style="cursor:pointer;" data-onclick="close" class="fancybox-close-small" "></div>-->
                <div class="feedback-form">
                    <form action="#">
                        <h3>Авторизация</h3>
                        <div class="input-group">
                            <div class="input-wrapp">
                                <label for="tel"><?php echo $entry_email; ?></label>
                                <input data-onkeydown="detectEnterAndLogin" type="text" name="email" value="<?php echo $email; ?>" />
                            </div>
                            <div class="input-wrapp">
                                <label for="pass"><?php echo $entry_password; ?></label>
                                <input data-onkeydown="detectEnterAndLogin" type="password" name="password" value="" />
                                <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
                            </div>
                            <div class="input-wrapp">
                                <a style="cursor: pointer" id="simplecheckout_button_login" data-onclick="login" class="button colored"><span><?php echo $button_login; ?></span></a>
                            </div>
                        </div>
                    </form>
                </div>


    </div>
</div>