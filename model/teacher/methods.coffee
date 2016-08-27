Meteor.methods


	'teacher.availability.insert': (start) ->

		new SimpleSchema
			start: type: Date
		.validate
			start: start

		teacher = new Teacher Meteor.userId()

		teacher.availability_insert start