<button class="button bordered sidebar-open">Открыть фильтр <i class="fa fa-angle-down" aria-hidden="true"></i></button>
<div class="sidebar">
  <div class="head">
    <a type="button" id="button-filter" class="" style="font-size: 17px; cursor: pointer"><?php echo $button_filter; ?></a>
  </div>
  <!-- <div class="cost">
    <h5>Цена:</h5>
    <div class="input-wrapp">
      <div class="wrapp">
        <label for="from">От:</label>
        <input id="from" type="text">
      </div>
      <div class="wrapp">
        <label for="to">До:</label>
        <input id="to" type="text">
      </div>
    </div>
    <div class="range">
      <input type="range">
      <input type="range">
    </div>
  </div> -->
  <div class="filter" id="documents">
    <ul class="akkordeon">
      <?php foreach ($filter_groups as $filter_group) { ?>
      <li>
        <h5 class="cat-name"><?php echo $filter_group['name']; ?></h5>
        <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>" class="cat-content">
          <?php foreach ($filter_group['filter'] as $filter) { ?>
          <label>
            <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
            <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
            <?php echo $filter['name']; ?>
            <?php } else { ?>
            <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
            <?php echo $filter['name']; ?>
            <?php } ?>
          </label>
          <?php } ?>
        </div>
      </li>
      <?php } ?>
    </ul>
  </div>

  <script type="text/javascript"><!--
      $('#button-filter').on('click', function() {
          filter = [];

          $('input[name^=\'filter\']:checked').each(function(element) {
              filter.push(this.value);
          });

          location = '<?php echo $action; ?>&filter=' + filter.join(',');
      });
      //--></script>

