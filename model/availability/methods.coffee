require './availability.coffee'


Meteor.methods


	'availability.setBusy': (uid) ->

		availability = new Availability uid

		availability.setBusy()


	'availability.setFree': (uid) ->

		availability = new Availability uid

		availability.setFree()


	'availability.remove': (uid) ->

		availability = new Availability uid

		availability.remove()