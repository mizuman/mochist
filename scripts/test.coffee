cronJob = require('cron').CronJob

module.exports = (robot) ->
	cronjob = new cronJob('00 45 11 * * 1-5', () =>
		envelope = room: "#random"
		robot.send envelope, "(´º﹃º｀) はらへ"
	)
	cronjob.start()

	cronjob_post_am = new cronJob('00 00 10 * * 1-5', () =>
		envelope = room: "#post"
		robot.send envelope, "私送便の到着時間だよ。誰か見に行った？"
	)
	cronjob_post_am.start()

	cronjob_post_pm = new cronJob('00 00 10 * * 1-5', () =>
		envelope = room: "#post"
		robot.send envelope, "私送便の到着時間だよ。誰か見に行った？"
	)
	cronjob_post_pm.start()

	cronjob_payday = new cronJob('00 00 16 20 * 1-5', () =>
		envelope = room: "#random"
		robot.send envelope, "今日は給料日です。残業できないから気をつけて。（あと1.5時間）"
	)
	cronjob_payday.start()

	cronjob_weeklyreport = new cronJob('00 00 9 * * 3', () =>
		envelope = room: "#general"
		robot.send envelope, '''
		今週もお疲れさまです。
		週報書いてね
		https://webcore.ft.nttcloud.net/redmine/projects/tech-strategy/wiki/定例MTG
		'''
	)
	cronjob_weeklyreport.start()

	cronjob_voucher = new cronJob('00 45 11 15 * *', () =>
		envelope = room: "#random"
		robot.send envelope, "バウチャーはもらった？"
	)
	cronjob_voucher.start()
