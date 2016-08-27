Meteor.publish 'availabilities.teacher', ->
	
  return @ready() if !@userId?
  return Availabilities.find teacherId : @userId