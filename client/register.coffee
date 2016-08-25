code_id = undefined
phone = undefined

Template.register.events

	'click #verify': (event) ->

		event.preventDefault()

		Meteor.call 'verify.sms.send',
			phone = $('#phone').val(),
			(error, result) ->
				if error
					console.log error
				else
					code_id = result
					console.log 'success'


	'click #register': (event) ->

		event.preventDefault()

		Accounts.createUser
			username: $('#phone').val(),
			password: $('#password').val()
			, (error, result) ->
				if error
					console.log error
				else
					# Roles.addUsersToRoles result, ['student']
					Router.go '/'
					console.log 'user created'

		# Meteor.call 'verify.sms.verify',
		# 	code_id,
		# 	$('#code').val(),
		# 	(error, result) ->
		# 		if error
		# 			console.log error
		# 		else
		# 			Accounts.createUser
		# 				username: phone
		# 				password: $('#password').val()
		# 			, (error, result) ->
		# 					if error
		# 						console.log error
		# 					else
		# 						console.log 'user created'
