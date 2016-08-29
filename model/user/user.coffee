class @User

	constructor: (uid) ->

		@uid = uid


	@getter 'user', ->

		Meteor.users.findOne _id: @uid