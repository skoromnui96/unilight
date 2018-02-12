<section class="s-feedback" id="feedback">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-md-offset-1">
                <div class="form-description">
                    <h2><?=$want?></h2>
                    <p><?=$text?></p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="feedback-form">

                    <h4><?=$registration?></h4>
                    <div class="input-wrapp">
                        <label for="f-name"><?=$name?></label>
                        <input type="text" id="f-name" placeholder="<?=$name_placeholder?>">
                    </div>
                    <div class="input-wrapp">
                        <label for="f-email"><?=$email?></label>
                        <input type="email" id="f-email" placeholder="example@mail.com">
                    </div>
                    <div class="input-wrapp">
                        <label for="f-tel"><?=$phone?></label>
                        <input type="tel" id="f-tel" placeholder="+38(__)__-__-__">
                    </div>
                    <div class="input-wrapp">
                        <input type="submit" class="colored" value="<?=$button_text?>">
                    </div>
                    <p class="annotation"><?=$private_policy?></p>
                </div>
            </div>
        </div>
    </div>
</section>