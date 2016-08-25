<div class="row">
	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">Adblock</div>
			<div class="panel-body">
				<p>
					Adblock Settings:
				</p>
				<form role="form" class="adblock-settings">
					<fieldset>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="message">Message</label>
									<input placeholder="Popup message" type="text" class="form-control" id="message" name="message" />
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<div class="col-lg-3">
		<div class="panel panel-default">
			<div class="panel-heading">Control Panel</div>
			<div class="panel-body">
				<button class="btn btn-primary" id="save">Save Settings</button>
			</div>
		</div>
	</div>
</div>

<script>
	require(['settings'], function(Settings) {
		Settings.load('adblock', $('.adblock-settings'));

		$('#save').on('click', function() {
			Settings.save('adblock', $('.adblock-settings'), function() {
				app.alert({
					type: 'success',
					alert_id: 'adblock-saved',
					title: 'Settings Saved',
					message: 'Please reload your NodeBB to apply these settings',
					clickfn: function() {
						socket.emit('admin.reload');
					}
				})
			});
		});
	});
</script>