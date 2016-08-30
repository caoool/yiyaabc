Meteor.publish 'relations.student', ->
	
	return @ready() if !@userId?
	
	Relations.find studentId : @userId


Meteor.publish 'relations.teacher', ->
	
	return @ready() if !@userId?
	
	Relations.find teacherId : @userId