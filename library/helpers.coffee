@Helpers = {}


Helpers.printCallback = (error, result) ->

	if error then console.log error
	else console.log result


Helpers.randomInt = (lower, upper) ->

  [lower, upper] = [0, lower]     unless upper?           # Called with one argument
  [lower, upper] = [upper, lower] if lower > upper        # Lower must be less then upper
  Math.floor(Math.random() * (upper - lower + 1) + lower) # Last statement is a return value