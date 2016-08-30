class @Relation

	constructor: (@uid=null) ->

		relation = Relations.findOne @uid

		if relation?
			@studentId = relation.studentId
			@teacherId = relation.teacherId


	insert: (userId) ->

		_userId = Meteor.userId()

		if Roles.userIsInRole _userId, ['student']
			relation =
				studentId: _userId
				teacherId: userId

		if Roles.userIsInRole _userId, ['teacher']
			relation =
				studentId: userId
				teacherId: _userId

		Relations.insert relation


	remove: (uid=null) ->

		Relations.remove uid or @uid


	getTeacherIds: (studentId=null) ->

		relations = Relations.find
			studentId: studentId or @studentId
		relations = relations.fetch()

		teacherIds = []
		for relation in relations
			teacherIds.push relation.teacherId

		teacherIds