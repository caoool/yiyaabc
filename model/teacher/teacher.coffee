require '../user/user.coffee'

class @Teacher extends User

	'availability_insert': (start) ->

		teacherId = @uid

		availability =
			teacherId: teacherId
			start: start

		Availabilities.insert availability