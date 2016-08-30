Meteor.methods


	'relation.insert': (userId) ->

		relation = new Relation
		relation.insert userId


	'relation.remove': (uid=null) ->

		relation = new Relation uid
		relation.remove uid


	'relation.teacherIds': (uid=null) ->

		relation = new Relation uid
		relation.getTeacherIds uid