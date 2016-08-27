Meteor.publish 'currentUser', ->
	
  return @ready() if !@userId?
  return Meteor.users.find _id : @userId