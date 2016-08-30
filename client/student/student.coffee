Template.student.onCreated ->

	@subscribe 'teachers.all'
	@subscribe 'relations.student'

	Tracker.autorun ->
		relation = Relations.findOne()
		if relation?
			relation = new Relation relation._id
			Meteor.subscribe 'availabilities.teachers', relation.getTeacherIds()


Template.student.events

	'click #student_logout': (event) ->

		event.preventDefault()

		Meteor.logout()


	'click #student_teacher_assign': (event) ->

		event.preventDefault()

		Meteor.call 'relation.insert', @_id


	'click #student_teacher_unassign': (event) ->

		event.preventDefault()

		Meteor.call 'relation.remove', @_id


Template.student.helpers

	teachers: ->

		Meteor.users.find()


	relations: ->

		Relations.find()


	myTeacher: (teacherId) ->

		Meteor.users.findOne teacherId


	availabilities: (teacherId) ->

		Availabilities.find teacherId: teacherId