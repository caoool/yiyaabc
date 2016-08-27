Template.login.events

	'click #login': (event) ->

		event.preventDefault()

		Meteor.loginWithPassword $('#username').val(),
			$('#password').val(),
			(error, result) ->
				if error
					console.log error
				else
					console.log 'success'
					Router.go '/'