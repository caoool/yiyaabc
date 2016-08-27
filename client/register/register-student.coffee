code_id = undefined
phone = undefined

Template.register_student.events

	'click .register_student #verify': (event) ->

		event.preventDefault()

		Meteor.call 'verify.sms.send',
			phone = $('.register_student #phone').val(),
			(error, result) ->
				if error
					console.log error
				else
					code_id = result
					console.log 'success'


	'click .register_student #register': (event) ->

		event.preventDefault()

		Meteor.call 'verify.sms.verify',
			code_id,
			$('.register_student #code').val(),
			(error, result) ->
				if error
					console.log error
				else
					Accounts.createUser
						username: phone
						password: $('.register_student #password').val()
						, (error, result) ->
							if error
								console.log error
							else
								Meteor.call 'roles.addToRole',
									Meteor.userId(),
									'student'
								Router.go '/'
								console.log 'student created'
