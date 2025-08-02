# Task 1: calculate the production rate per hour
def production_rate_per_hour:
	if . <= 4 then . * 221
	elif . <= 8 then . * 221 * 0.9
	elif . == 9 then . * 221 * 0.8
	elif . == 10 then . * 221 * 0.77
	else .
	end
;

# Task 2: calculate the number of working items produces per minute
def working_items_per_minute:
	production_rate_per_hour / 60 | trunc
;

.speed | (production_rate_per_hour, working_items_per_minute)
