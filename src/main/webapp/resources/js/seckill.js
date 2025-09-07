var seckill = {
	// ajax related urls
	URL : {
		basePath : function() {
			return $('#basePath').val();
		},
		now : function() {
			return seckill.URL.basePath() + 'seckill/time/now';
		},
		exposer : function(seckillId) {
			return seckill.URL.basePath() + 'seckill/' + seckillId + '/exposer';
		},
		execution : function(seckillId, md5) {
			return seckill.URL.basePath() + 'seckill/' + seckillId + '/' + md5 + '/execution';
		}
	},
	//  seckill logic
	handleSeckill : function(seckillId, node) {
		// get seckill url, handle display logic, execute seckill
		node.hide().html('<button class="btn btn-primary btn-lg" id="killBtn">Start Seckill</button>');
		console.log('exposerUrl=' + seckill.URL.exposer(seckillId));//TODO
		$.post(seckill.URL.exposer(seckillId), {}, function(result) {
			// Execute interactive flow in callback function
			if (result && result['success']) {
				var exposer = result['data'];
				if (exposer['exposed']) {
					// start seckill
					var md5 = exposer['md5'];
					var killUrl = seckill.URL.execution(seckillId, md5);
					console.log('killUrl=' + killUrl);//TODO
					$('#killBtn').one('click', function() {
						// execute seckill request
						// 1.disable button
						$(this).addClass('disabled');
						// 2.send seckill request
						$.post(killUrl, {}, function(result) {
							if (result && result['success']) {
								var killResult = result['data'];
								var state = killResult['state'];
								var stateInfo = killResult['stateInfo'];
								// 3.display seckill result
								node.html('<span class="label label-success">' + stateInfo + '</span>');
							}
						});
					});
					node.show();
				} else {
					// seckill not open
					var now = exposer['now'];
					var start = exposer['start'];
					var end = exposer['end'];
					// restart countdown flow
					seckill.countdown(seckillId, now, start, end);
				}
			} else {
				console.log('result=' + result);
			}
		});
	},
	// validate phone number
	validatePhone : function(phone) {
		if (phone && phone.length == 11 && !isNaN(phone)) {
			return true;
		} else {
			return false;
		}
	},
	// countdown logic
	countdown : function(seckillId, nowTime, startTime, endTime) {
		// check time
		var seckillBox = $('#seckillBox');
		if (nowTime > endTime) {
			// seckill ended
			seckillBox.html('Seckill Ended');
		} else if (nowTime < startTime) {
			// seckill not open, countdown event binding
			var killTime = new Date(startTime + 1000);
			seckillBox.countdown(killTime, function(event) {
				// time format
				var format = event.strftime('Seckill Countdown: %D days %H hrs %M mins %S s');
				seckillBox.html(format);
				// callback after countdown finishes
			}).on('finish.countdown', function() {
				// get seckill url, handle display logic, execute seckill
				seckill.handleSeckill(seckillId, seckillBox);
			});
		} else {
			// seckill starts
			seckill.handleSeckill(seckillId ,seckillBox);
		}
	},
	// detail page seckill logic
	detail : {
		init : function(params) {
            // User phone number verification & login, countdown interaction
            // Design the interaction flow
            // Check for phone number in cookies
			var killPhone = $.cookie('killPhone');
			var startTime = params['startTime'];
			var endTime = params['endTime'];
			var seckillId = params['seckillId'];
			// validate phone number
			if (!seckill.validatePhone(killPhone)) {
				// bind phone number
				// control display
				var killPhoneModal = $('#killPhoneModal');
				killPhoneModal.modal({
					show : true,// display modal
					backdrop : 'static',// disable location toggle
					keyboard : false // close keyboard event
				})
				$('#killPhoneBtn').click(function() {
					var inputPhone = $('#killphoneKey').val();
					console.log('inputPhone='+inputPhone);//TODO
					if (seckill.validatePhone(inputPhone)) {
						// add phone number to cookie
						$.cookie('killPhone', inputPhone, {
							expires : 7,
							path : '/seckill'
						});
						// refresh page
						window.location.reload();
					} else {
						$('#killphoneMessage').hide().html('<label class="label label-danger">Wrong Phone Number</label>').show(300);
					}
				});
			}
			// user already login
			// countdown interaction
			var startTime = params['startTime'];
			var endTime = params['endTime'];
			var seckillId = params['seckillId'];
			$.get(seckill.URL.now(), {}, function(result) {
				if (result && result['success']) {
					var nowTime = result['data'];
					// check time, countdown interaction
					seckill.countdown(seckillId, nowTime, startTime, endTime);
				} else {
					console.log(result['reult:'] + result);
				}
			});
		}
	}
}