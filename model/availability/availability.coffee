class @Availability

	constructor: (@uid=null) ->


	remove: (uid=null) ->

		Availabilities.remove uid or @uid


	setFree: ->

		Availabilities.update @uid,
			$set:
				status: 'free'


	setBusy: ->

		Availabilities.update @uid,
			$set:
				status: 'busy'