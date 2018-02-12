<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
  <base href="<?php echo $base; ?>" />
  <?php if ($description) { ?>
  <meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
  <?php } ?>
  <?php if ($keywords) { ?>
  <meta name="keywords" content= "<?php echo $keywords; ?>" />
  <?php } ?>
  <meta property="og:title" content="<?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
  <meta property="og:type" content="website" />
  <meta property="og:url" content="<?php echo $og_url; ?>" />
  <?php if ($og_image) { ?>
  <meta property="og:image" content="<?php echo $og_image; ?>" />
  <?php } else { ?>
  <meta property="og:image" content="<?php echo $logo; ?>" />
  <?php } ?>
  <meta property="og:site_name" content="<?php echo $name; ?>" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
  <!-- <link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet"> -->
  <link href="/catalog/view/theme/default/stylesheet/main.min.css" rel="stylesheet">
  <?php foreach ($styles as $style) { ?>
  <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
  <?php } ?>

  <?php foreach ($links as $link) { ?>
  <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
  <?php } ?>
  <?php foreach ($scripts as $script) { ?>
  <script src="<?php echo $script; ?>" type="text/javascript"></script>
  <?php } ?>
  <?php foreach ($analytics as $analytic) { ?>
  <?php echo $analytic; ?>
  <?php } ?>
  <link rel="shortcut icon" href="/image/unilight/favicon/favicon.ico" type="image/x-icon">
  <link rel="apple-touch-icon" href="/image/unilight/favicon/apple-touch-icon.png">
  <link rel="apple-touch-icon" sizes="72x72" href="/image/unilight/favicon/apple-touch-icon-72x72.png">
  <link rel="apple-touch-icon" sizes="114x114" href="/image/unilight/favicon/apple-touch-icon-114x114.png">
  <!-- Chrome, Firefox OS and Opera -->
  <meta name="theme-color" content="#000">
  <!-- Windows Phone -->
  <meta name="msapplication-navbutton-color" content="#000">
  <!-- iOS Safari -->
  <meta name="apple-mobile-web-app-status-bar-style" content="#000">
</head>
<body class="p-index">

<header>
  <div class="container">

    <div class="top-line">
      <div class="row">
        <?php echo $language; ?>
        <div class="col-md-8 col-sm-11 col-xs-12">
          <ul class="navigate top-nav">
            <li><a href="/index.php?route=information/information&information_id=4"><?php echo $about_us; ?></a></li>
            <li><a href="/index.php?route=information/information&information_id=6"><?php echo $delivery; ?></a></li>
            <li><a href="/index.php?route=newsblog/category&newsblog_path=1"><?php echo $blog; ?></a></li>
            <li><a href="/index.php?route=information/information&information_id=7"><?php echo $partner; ?></a></li>
            <li><a href="/index.php?route=information/contact"><?php echo $contacts; ?></a></li>
          </ul>
          <ul class="top-mobile-nav">
            <li><a href="#" class="top-nav-open"><i class="fa fa-bars" aria-hidden="true"></i></a></li>
            <li><a href="/index.php?route=product/compare"><i class="fa fa-balance-scale" aria-hidden="true"></i></a></li>
            <li><a href="<?php echo $wishlist; ?>"><i class="fa fa-heart-o" aria-hidden="true"></i></a></li>
            <li><a href="/index.php?route=checkout/simplecheckout"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
            <li><a href="/index.php?route=account/login"><i class="fa fa-user" aria-hidden="true"></i></a></li>
          </ul>
        </div>

        <div class="col-md-2 col-sm-1 hidden-xs">
          <ul class="navigate login">
            <li>
              <a href="/index.php?route=account/login">
                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="14" viewBox="0 0 10 14"><g><g><g><path d="M8,3C8,5.209,6.657,7,5,7S2,5.209,2,3A2.7,2.7,0,0,1,5,0,2.7,2.7,0,0,1,8,3Z"/><path d="M9.767,14A9.531,9.531,0,0,0,10,12c0-3.31-2.242-4-5-4s-5,.69-5,4a9.531,9.531,0,0,0,.233,2Z"/></g></g></g></svg>
                <span><?php echo $text_account; ?></span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <div class="mid-line">
      <div class="row">

        <div class="col-md-2 col-sm-3 col-xs-6">
          <a href="/">
            <img class="logo img-responsive" src="/image/unilight/logo.png" alt="">
          </a>
        </div>

        <div class="col-md-3 col-sm-9 col-xs-6">
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
        </div>

        <?php echo $search; ?>

        <div class="col-md-4" id="refresh">
          <ul class="user-panel">
            <li class="link">
              <a href="/index.php?route=product/compare">
                <img src="/image/unilight/icons/compare.svg" alt="">
                <span><?= $comparison ?></span>
              </a>
            </li>
            <li class="link">
              <a href="<?php echo $wishlist; ?>">
                <img src="/image/unilight/icons/fav.svg" alt="">
                <span><?= $my_favorites ?></span>
              </a>
            </li>
            <li>
              <?php echo $cart; ?>
            </li>
          </ul>
        </div>
      </div>
    </div>
<?php if ($categories) { ?>
<nav class="main-nav">
  <div class="container">
    <div class="row">
      <div class="sub-category-container">
         <ul class="category-ul clearfix">
          <?php foreach ($categories as $category) { ?>
          <?php if ($category['children']) { ?>
          <li class="main-category-li">
            <div class="col-md-1 col-sm-1 col-xs-1">
              <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt=""><span><?php echo $category['name']; ?></span></a>
              <ul class="categories clearfix">
                <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                <?php foreach ($children as $child) { ?>
                <li class="sub-category-li">
                  <div class="col-md-6">
                    <div class="category">
                      <a href="<?php echo $child['href']; ?>" class="button"><img src="<?php echo $child['thumb']; ?>" alt=""><span><?php echo $child['name']; ?></span></a>
                    </div>
                  </div>
                </li>
                <?php } ?>
                <?php } ?>
              </ul>
            </div>
          </li>
          <?php } else { ?>
          <li class="main-category-li">
            <div class="col-md-1 col-sm-1 col-xs-1">
              <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt=""><span><?php echo $category['name']; ?></span></a>
            </div>
          </li>
          <?php } ?>
          <?php } ?>
      </ul>
      </div>
    </div>
  </div>
</nav>
<?php } ?>
  </div>
</header>


<!--<nav class="main-nav">
  <div class="container">
    <div class="row">
      <ul class="category-ul clearfix">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="main-category-li">
          <div class="col-md-1 col-sm-1 col-xs-1">
            <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt=""><span><?php echo $category['name']; ?></span></a>
          </div>
        </li>

        <li class="sub-category-container">
          <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
          <ul class="categories clearfix">
            <?php foreach ($children as $child) { ?>
            <li class="sub-category-li">
              <div class="col-md-2 col-sm-2 col-xs-6 col-md-offset-1 col-sm-offset-1">
                <div class="category">
                  <a href="<?php echo $child['href']; ?>" class="button"><img src="<?php echo $child['thumb']; ?>" alt=""><span><?php echo $child['name']; ?></span></a>
                </div>
              </div>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
        </li>
        <?php } else { ?>
        <li class="main-category-li">
          <div class="col-md-1 col-sm-1 col-xs-1">
            <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt=""><span><?php echo $category['name']; ?></span></a>
          </div>
        </li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </div>
</nav>-->
