Meteor.publish 'currentUser', ->
	
  return @ready() if !@userId?

  Meteor.users.find @userId,
  	fields:
  		profile: 1