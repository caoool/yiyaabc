Meteor.publish 'teachers.all', ->
	
	return @ready() if !@userId?

	Meteor.users.find
		roles: ['teacher']
	, fields: profile: 1


# Meteor.publish 'teachers.student', ->

# 	return @ready() if !@userId?

# 	relations = Relations.find studentId : @userId
# 	relationIds = 