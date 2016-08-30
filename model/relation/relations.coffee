class RelationsCollection extends Mongo.Collection
	
	insert: (relation, callback) ->

		super relation, callback


	update: (selector, modifier, callback) ->

		super selector, modifier, callback


	remove: (selector, callback) ->

		super selector, callback


@Relations = new RelationsCollection 'relations'


Relations.deny

	insert: -> true
	update: -> true
	remove: -> true


Relations.schema = new SimpleSchema

	studentId:
		type: String


	teacherId:
		type: String


Relations.attachSchema Relations.schema