Template.teacher.onCreated ->

	@subscribe 'availabilities.teacher'


Template.teacher.events

	'click #teacher_logout': (event) ->

		Meteor.logout()


	'click #teacher_availability_insert': () ->

		now = new Date()
		Meteor.call 'teacher.availability.insert',
			now


Template.teacher.helpers

	availabilities: ->

		Availabilities.find()