<script>
		function subscribe()
		{
			var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			var email = $('#txtemail').val();
			if(email != "")
			{
				if(!emailpattern.test(email))
				{
					alert("Неправильный Email");
					return false;
				}
				else
				{
					$.ajax({
						url: 'index.php?route=module/newsletters/news',
						type: 'post',
						data: 'email=' + $('#txtemail').val(),
						dataType: 'json',
						
									
						success: function(json) {
						
						alert(json.message);
						
						}
						
					});
					return false;
				}
			}
			else
			{
				alert("Email обязательно");
				$(email).focus();
				return false;
			}
			

		}
	</script>

<section class="s-subscribe">
	<div class="container">
		<div class="row">
			<div class="col-md-2 col-sm-3 col-xs-12 col-md-offset-2 col-sm-offset-1">
				<label for="subscribe"><?=$heading_title?></label>
			</div>
			<div class="col-md-6 col-sm-7 col-xs-12">
				<div class="search">
					<form class="form-inline" action="" method="post">
					<input type="email" class="form-control" name="txtemail" id="txtemail" placeholder="<?=$email?>">
					<button type="submit"  onclick="return subscribe();"><?=$subscribe?></button>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
