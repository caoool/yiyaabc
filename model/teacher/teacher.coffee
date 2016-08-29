require '../user/user.coffee'

class @Teacher extends User

	'insertAvailability': (start) ->

		teacherId = @uid

		availability =
			teacherId: teacherId
			start: start

		Availabilities.insert availability