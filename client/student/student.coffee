Template.student.onCreated ->

	@subscribe 'teachers.all'
	@subscribe 'relations.student'
	@subscribe 'lessons.student'

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


	'click #student_teacher_reserve': (event) ->

		event.preventDefault()

		availabilityId = @_id
		relationId = $(event.target).attr 'relationId'

		Meteor.call 'lessons.insert',
			availabilityId: availabilityId
			relationId: relationId


	'click #student_lesson_cancel': (event) ->

		event.preventDefault()

		Meteor.call 'lessons.remove', @_id


Template.student.helpers

	teachers: ->

		Meteor.users.find()


	relations: ->

		Relations.find()


	myTeacher: (teacherId) ->

		Meteor.users.findOne teacherId


	availabilities: (teacherId) ->

		Availabilities.find teacherId: teacherId


	lessons: ->

		Lessons.find()