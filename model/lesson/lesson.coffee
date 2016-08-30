class @Lesson

	constructor: (@uid=null) ->

		lesson = Lessons.findOne @uid

		if lesson?
			@availabilityId = lesson.availabilityId
			@start = lesson.start
			@end = lesson.end
			@relationId = lesson.relationId
			@studentId = lesson.studentId
			@teacherId = lesson.teacherId
			

	insert: (lesson) ->

		Lessons.insert lesson


	remove: (uid=null) ->

		Lessons.remove uid or @uid