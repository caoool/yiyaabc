Template.teacher.onCreated ->

	@subscribe 'availabilities.teacher'


Template.teacher.events

	'click #teacher_logout': (event) ->

		Meteor.logout()


	'click #teacher_availabilities_insert': (event) ->

		datetime = $('#teacher_available_datetime').val()
		start = new Date datetime
		Meteor.call 'teacher.availabilities.insert',
			start


	'click #teacher_availability_set_busy': (event) ->

		Meteor.call 'availability.setBusy',
			@_id


	'click #teacher_availability_set_free': (event) ->

		Meteor.call 'availability.setFree',
			@_id


	'click #teacher_availability_remove': (event) ->

		Meteor.call 'availability.remove',
			@_id


Template.teacher.helpers

	availabilities: ->

		Availabilities.find()