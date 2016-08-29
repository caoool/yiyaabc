class AvailabilitiesCollection extends Mongo.Collection
	
	insert: (availability, callback) ->

		# console.log availability.start

		# count = Availabilities.find
		# 	teacherId: availability.teacherId
		# 	start: $eq: ISODate availability.start
		# .count()

		# console.log count

		# return if count != 0

		super availability, callback


	update: (selector, modifier, callback) ->

		super selector, modifier, callback


	remove: (selector, callback) ->

		super selector, callback


@Availabilities = new AvailabilitiesCollection 'availabilities'


Availabilities.deny

	insert: -> true
	update: -> true
	remove: -> true


Availabilities.schema = new SimpleSchema

	teacherId:
		type: String


	start:
		type: Date
		autoValue: ->
			if @isInsert
				Helpers.sharpTime @value
			else
				@insert


	end:
		type: Date
		autoValue: ->
			if @isInsert
				start = @field 'start'
				Helpers.addHh new Date start.value
			else
				@insert


	status:
		type: String
		allowedValues: [
			'free'
			'busy'
		]
		defaultValue: 'free'


Availabilities.attachSchema Availabilities.schema