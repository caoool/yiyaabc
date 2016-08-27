class @Availability

	constructor: (uid) ->

		@uid = uid


	setFree: ->

		Availabilities.update uid,
			$set:
				status: 'free'


	setBusy: ->

		Availabilities.update uid,
			$set:
				status: 'busy'