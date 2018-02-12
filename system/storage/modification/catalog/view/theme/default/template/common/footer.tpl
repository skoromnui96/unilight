<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-2 col-sm-12 col-md-offset-1">
                <div class="logo">
                    <img src="/image/unilight/logo2.png" alt="" class="img-responsive">
                </div>
                <div class="social-wrapp">
                    <p class="copy"><?=$text_information?></p>
                    <h5><?=$text_service?></h5>
                    <ul class="social">
                        <li><a href="https://www.facebook.com/"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                        <li><a href="https://www.instagram.com/"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                        <li><a href="https://www.youtube.com/"><i class="fa fa-youtube-play" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2 col-sm-12">
                <h4><?=$text_extra?></h4>
                <ul class="navigation">
                    <?php foreach ($informations as $information) { ?>
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <div class="col-md-2 col-sm-12">
                <h4><?=$text_affiliate?></h4>
                <ul class="navigation">
                    <?php foreach ($categories as $category) { ?>
                    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <div class="col-md-2 col-sm-12">
                <h5><?=$text_phone?></h5>
                <ul class="tel">
                    <li>
                        <img src="/image/unilight/icons/kiyvstar.svg" alt="">
                        <a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a>
                    </li>
                    <li>
                        <img src="/image/unilight/icons/lifecell.svg" alt="">
                        <a href="tel:<?php echo $telephone2; ?>"><?php echo $telephone2; ?></a>
                    </li>
                    <li>
                        <img src="/image/unilight/icons/vodafone.svg" alt="">
                        <a href="tel:<?php echo $telephone3; ?>"><?php echo $telephone3; ?></a>
                    </li>
                </ul>
                <h5><?=$text_email?></h5>
                <ul class="email">
                    <li>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16.8" height="12.002" viewBox="0 0 16.8 12.002"><defs><style> .cls-1 { fill: #ffcb08; } </style></defs><title>email</title><g id="Layer_2" data-name="Layer 2"><g id="Layer_1-2" data-name="Layer 1"><g id="Canvas"><g id="_6" data-name=" 6"><g id="Group"><g id="Group-2" data-name="Group"><g id="Vector"><path id="path0_fill" data-name="path0 fill" class="cls-1" d="M1.332.709,7.383,5.6a1.518,1.518,0,0,0,1.02.3,1.514,1.514,0,0,0,1.019-.3L15.474.709c.485-.39.375-.709-.24-.709H1.574C.958,0,.848.319,1.332.709Z"/></g><g id="Vector-2" data-name="Vector"><path id="path1_fill" data-name="path1 fill" class="cls-1" d="M15.907,2,9.295,7.124a1.579,1.579,0,0,1-1.788,0L.893,2C.4,1.622,0,1.825,0,2.454v8.406A1.135,1.135,0,0,0,1.12,12H15.68a1.135,1.135,0,0,0,1.12-1.143V2.454C16.8,1.825,16.4,1.622,15.907,2Z"/></g></g></g></g></g></g></g></svg>
                        <a href="#"><?=$email?></a>
                    </li>
                </ul>
            </div>
            <div class="col-md-2 col-sm-12">
                <h5><?=$text_address?></h5>
                <ul class="addres">
                    <li><?=$address; ?></li>
                </ul>
                <h5><?=$text_work_mode?></h5>
                <ul class="time">
                    <li><?=$open?></li>
                </ul>
                <div class="created-by">
                    <h5><?=$text_site_dev?></h5>
                    <a href="https://beinweb.biz/" target="_blank"><img src="/image/unilight/beniweb-logo.png" alt=""></a>
                </div>
            </div>
        </div>
    </div>
</footer>

<script src="/catalog/view/javascript/scripts.min.js"></script>
<script src="/catalog/view/javascript/common.js"></script>

</body>
</html>
