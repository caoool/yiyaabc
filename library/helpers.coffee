@Helpers = {}


Helpers.printCallback = (error, result) ->

	if error then console.log error
	else console.log result


Helpers.randomInt = (lower, upper) ->

  [lower, upper] = [0, lower]     unless upper?           # Called with one argument
  [lower, upper] = [upper, lower] if lower > upper        # Lower must be less then upper
  Math.floor(Math.random() * (upper - lower + 1) + lower) # Last statement is a return value


Helpers.sharpTime = (time) ->

	if time.getMinutes() >= 30
		time = new Date time.setMinutes 30
	else
		time = new Date time.setMinutes 0
	time = new Date time.setSeconds 0


Helpers.addHh = (time) ->

	new Date time.setTime time.getTime() + 30 * 60 * 1000