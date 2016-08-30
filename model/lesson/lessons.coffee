class LessonsCollection extends Mongo.Collection
	
	insert: (lesson, callback) ->

		availability = Availabilities.findOne lesson.availabilityId

		if availability.status == 'busy'
			throw new Meteor.Error 500,
				'Teacher is not available during this time period.'

		lesson.start = availability.start
		lesson.end = availability.end

		relation = Relations.findOne lesson.relationId

		lesson.studentId = relation.studentId
		lesson.teacherId = relation.teacherId

		super lesson, callback


	update: (selector, modifier, callback) ->

		super selector, modifier, callback


	remove: (selector, callback) ->

		super selector, callback


@Lessons = new LessonsCollection 'lessons'


Lessons.after.insert (userId, doc) ->

	availability = new Availability doc.availabilityId
	availability.setBusy()


Lessons.after.remove (userId, doc) ->

	availability = new Availability doc.availabilityId
	availability.setFree()


Lessons.deny

	insert: -> true
	update: -> true
	remove: -> true


Lessons.schema = new SimpleSchema

	availabilityId:
		type: String


	start:
		type: Date


	end:
		type: Date


	relationId:
		type: String


	studentId:
		type: String


	teacherId:
		type: String


Lessons.attachSchema Lessons.schema