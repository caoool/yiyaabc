Meteor.methods


	'lessons.insert': (lesson) ->

		if !@userId?
			throw new Meteor.Error 403,
				'Access restricted',
				'Operation only available to users.'

		_lesson = new Lesson
		_lesson.insert lesson


	'lessons.remove': (uid) ->

		if !@userId?
			throw new Meteor.Error 403,
				'Access restricted',
				'Operation only available to users.'

		_lesson = new Lesson
		_lesson.remove uid