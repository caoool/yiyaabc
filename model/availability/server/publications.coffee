Meteor.publish 'availabilities.teacher', (teacherId=null) ->
	
  return @ready() if !@userId?
  
  Availabilities.find
  	teacherId: teacherId or @userId


Meteor.publish 'availabilities.teachers', (teacherIds) ->

	return @ready() if !@userId?

	Availabilities.find
		teacherId: $in: teacherIds
