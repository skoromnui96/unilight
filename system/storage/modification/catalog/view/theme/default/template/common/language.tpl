<?php if (count($languages) > 1) { ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
      <div class="col-md-2 hidden-sm hidden-xs">
        <ul class="navigate lang">
          <li> <?php foreach ($languages as $language) { ?>
            <a href="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></a>
            <?php } ?></li>
        </ul>
      </div>
    <input type="hidden" name="code" value="" />
    <input type="hidden" name="redirect_route" value="<?php echo $redirect_route; ?>" />
    <input type="hidden" name="redirect_query" value="<?php echo isset($redirect_query) ? $redirect_query : ''; ?>" />
    <input type="hidden" name="redirect_ssl" value="<?php echo isset($redirect_ssl) ? $redirect_ssl : ''; ?>" />
  </form>

<?php } ?>