class VerificationsCollection extends Mongo.Collection
	
	insert: (verification, callback) ->

		Meteor.setTimeout ->
			Verifications.remove verification._id
		, 300000

		super verification, callback


	update: (selector, modifier, callback) ->

		super selector, modifier, callback


	remove: (selector, callback) ->

		super selector, callback


@Verifications = new VerificationsCollection 'verifications'


Verifications.deny

	insert: -> true
	update: -> true
	remove: -> true


Verifications.schema = new SimpleSchema

	code:
		
		type: String
		autoValue: ->
			if @isInsert
				"#{Helpers.randomInt 100000, 999999}"
			else @unset()


Verifications.attachSchema Verifications.schema