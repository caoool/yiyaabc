class @User

	constructor: (userId) ->

		@userId = userId


	@getter 'user', () ->

		Meteor.users.findOne _id: @userId