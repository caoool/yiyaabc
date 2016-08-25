Meteor.methods


	'verify.sms.send': (phone) ->

		_id = Verifications.insert {}
		code = Verifications.findOne(_id).code

		response = HTTP.call 'POST', 'http://yunpian.com/v1/sms/send.json',
			params:
				'apikey': '5f8b020206700ba42faa253ffcc4cd4b'
				'mobile': phone
				'text': '【循环牛科技】您好，尊敬的导师！您的验证码为' + code + '请尽快登录系统。非常感谢，祝您使用愉快！'
			headers:
				'Accept': 'application/json;charset=utf-8'
				'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'

		if response.data.code == 0
			return _id
		else
			Verifications.remove _id
			throw new Meteor.Error 'Failed',
      	response.content['msg'],
      	response.content['detail']

	'verify.sms.verify': (_id, code) ->

		if code == Verifications.findOne(_id).code
			return true
		else
			throw new Meteor.Error 'Failed',
      	'Code does not match, login failed.'