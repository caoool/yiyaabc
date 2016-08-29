Meteor.methods


	'teacher.availabilities.insert': (start) ->

		new SimpleSchema
			start: type: Date
		.validate
			start: start

		teacher = new Teacher Meteor.userId()

		teacher.insertAvailability start