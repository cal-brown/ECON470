#q1
function leap_year(year)
	return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)

#q2.p1
function sum_of_squares(n)
	return reduce(+, map(x -> x^2, 1:n))

#q2.p2
function square_of_sums(n)
	return sum_of_squares(n)^2

#q2.p3
function difference_in_squares(n)
	return sum_of_squres(n) - square_of_sums(n)

#q3
function NPV(c, r)
	sum = 0
	for i in eachindex(c)
		sum += c[i]/((1+r)^i)
	end
	return sum


#q4.p1
function NFV_end(c, r)
	sum = 0
	n = length(c)
	for i in eachindex(c)
		sum += c[i]*(1+r)^(n-i+1)
	end
	return sum

#q4.p2
function NFV_end_2(c, r)
	sum = 0
	n = length(c)
	for i in eachindex(c)
		sum += c[i]
		sum *= 1+r[i]
	end
	return sum

#q5.p1
function expense(x)
	if x < 25
		return x*.8
	end
	if x < 250
		return x*.7
	end
	return x*.6

#q5.p2

#q6.p1
function salary(w, L)
	if w < 0
		return "please enter a non-negative hourly wage"
	if L < 0
		return "please enter a non-negative number of hours worked"
	if L > 12
		return "please enter a number of hours worked no greater than 12"
	if L < 8
		return w*L
	else
		return w*8+w*1.5*(L-8)


