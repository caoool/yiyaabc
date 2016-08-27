Template.register_teacher.events

	'click .register_teacher #register': (event) ->

		event.preventDefault()

		Accounts.createUser
			username: $('.register_teacher #email').val()
			password: $('.register_teacher #password').val()
			, (error, result) ->
				if error
					console.log error
				else
					Meteor.call 'roles.addToRole',
						Meteor.userId(),
						'teacher'
					Router.go '/'
					console.log 'teacher created'
