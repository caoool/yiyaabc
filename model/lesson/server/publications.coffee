Meteor.publish 'lessons.student', (studentId=null) ->
	
	return @ready() if !@userId?
  
	Lessons.find
		studentId: studentId or @userId


Meteor.publish 'lessons.teacher', (teacherId=null) ->
	
	return @ready() if !@userId?
  
	Lessons.find
		teacherId: teacherId or @userId