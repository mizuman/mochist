cronJob = require('cron').CronJob

module.exports = (robot) ->
	cronjob = new cronJob('00 45 11 * * 1-5', () =>
		envelope = room: "#random"
		robot.send envelope, "(´º﹃º｀) はらへ"
	)
	cronjob.start()

	cronjob_weeklyreport = new cronJob('00 00 9 * * 5', () =>
		envelope = room: "#general"
		robot.send envelope, '''
		今週もお疲れさまです。
		週報書いてね
		あ、まだ戦略部門用のredmineがなかった。
		'''
	)
	cronjob_weeklyreport.start()

	cronjob_voucher = new cronJob('00 45 11 15 * *', () =>
		envelope = room: "#random"
		robot.send envelope, "バウチャーはもらった？"
	)
	cronjob_voucher.start()