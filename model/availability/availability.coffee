class @Availability

	constructor: (@uid=null) ->


	setFree: ->

		Availabilities.update @uid,
			$set:
				status: 'free'


	setBusy: ->

		Availabilities.update @uid,
			$set:
				status: 'busy'


	remove: ->

		Availabilities.remove @uid