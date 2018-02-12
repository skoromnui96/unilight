<div class="simplecheckout-block" id="simplecheckout_customer" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $display_error && $has_error ? 'data-error="true"' : '' ?>>
  <?php if ($display_header || $display_login) { ?>
<div class="head"><h3><?php echo $text_checkout_customer ?></h3><?php if ($display_login) { ?><span class="checkout-heading-button"><a class="button bordered login-butt" href="javascript:void(0)" data-onclick="openLoginBox"><svg xmlns="http://www.w3.org/2000/svg" width="10" height="14" viewBox="0 0 10 14"><g><g><g><path d="M8,3C8,5.209,6.657,7,5,7S2,5.209,2,3A2.7,2.7,0,0,1,5,0,2.7,2.7,0,0,1,8,3Z"/><path d="M9.767,14A9.531,9.531,0,0,0,10,12c0-3.31-2.242-4-5-4s-5,.69-5,4a9.531,9.531,0,0,0,.233,2Z"/></g></g></g></svg> <?php echo $text_checkout_customer_login ?> </a></span><?php } ?></div>
<?php } ?>
  <div class="simplecheckout-block-content">

			  
            
    <?php if ($display_registered) { ?>
      <div class="success"><?php echo $text_account_created ?></div>
    <?php } ?>
    <?php if ($display_you_will_registered) { ?>
      <div class="you-will-be-registered"></div>
    <?php } ?>
    <?php foreach ($rows as $row) { ?>
      <?php echo $row ?>
    <?php } ?>
  </div>
</div>
<!--<div class="ordering-form">
  <form action="">
    <div class="input-group">
      <div class="input-wrapp">
        <label for="name">Ваше имя:</label>
        <input type="text" id="name" placeholder="Например: Иван Иванов">
      </div>
      <div class="input-wrapp">
        <label for="email">Адрес электронной почты: <span>(Опционально)</span></label>
        <input type="email" id="email" placeholder="example@mail.com">
      </div>
      <div class="input-wrapp">
        <label for="tel">Номер телефона:</label>
        <input type="tel" id="tel" placeholder="+38 (__)__-__-__">
      </div>
    </div>
    <div class="checkbox">
      <label>
        <input type="checkbox"> Запомнить меня для будущих скидок
      </label>
    </div>
    <div class="radio-group">
      <h3>Способ доставки</h3>
      <div class="radio">
        <label>
          <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
          Новая почта
        </label>
      </div>
      <div class="radio">
        <label>
          <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
          Курьером до двери
        </label>
      </div>
      <div class="radio">
        <label>
          <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">
          Самовывоз
        </label>
      </div>
    </div>
    <div class="input-group">
      <div class="input-wrapp">
        <label for="region">Область доставки:</label>
        <select name="" id="region">
          <option value="">Одесская</option>
          <option value="">Киевская</option>
        </select>
      </div>
      <div class="input-wrapp">
        <label for="town">Город:</label>
        <select name="" id="town">
          <option value="">Одесса</option>
          <option value="">Николаев</option>
        </select>
      </div>
      <div class="input-wrapp">
        <label for="delivery">Номер отделения:</label>
        <select name="" id="delivery">
          <option value="">№ 14. Маршала малиновского, 71</option>
          <option value="">№ 14. Маршала малиновского, 71</option>
        </select>
      </div>
    </div>
    <div class="radio-group">
      <h3>Способ оплаты</h3>
      <div class="radio">
        <label>
          <input type="radio" name="optionsRadios2" id="optionsRadios2-1" value="option2-1" checked="">
          Наложенный платеж
        </label>
      </div>
      <div class="radio">
        <label>
          <input type="radio" name="optionsRadios2" id="optionsRadios2-2" value="option2-2">
          Оплата банковской картой
        </label>
      </div>
    </div>
    <div class="input-wrapp">
      <label for="text">Комментарий к заказу: <span>(Опционально)</span></label>
      <textarea id="text" placeholder="Введите комментарий"></textarea>
    </div>
    <div class="input-wrapp submit">
      <button class="button colored">Оформить заказ</button>
    </div>
  </form>
</div>-->