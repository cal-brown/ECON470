# Calvin Brown and Jonathan Hagendoorn

using Plots

#q1
function leap_year(year)
	return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
end

#q2.p1
function sum_of_squares(n)
	return reduce(+, map(x -> x^2, 1:n))
end

#q2.p2
function square_of_sums(n)
	# changed from sum_of_squares(n)^2 --> before it was computing like 
	# (1^2 + 2^2 + 3^2)^2, but it should be doing (1 + 2 + 3)^2 (i think)
	return reduce(+, 1:n)^2
end

#q2.p3
function difference_in_squares(n)
	return sum_of_squares(n) - square_of_sums(n)
end

#q3
function NPV(c, r) 
	# changed i --> i-1 line 32
	sum = 0
	for i in eachindex(c)
		sum += c[i]/((1+r)^(i-1))
	end
	return sum
end

#q4.p1
function NFV_end(c, r)
	sum = 0
	n = length(c)
	for i in eachindex(c)
		sum += c[i]*(1+r)^(n-i+1)
	end
	return sum
end

#q4.p2
function NFV_end_2(c, r)  # CHECK
	sum = 0
	n = length(c)
	for i in eachindex(c)
		sum += c[i]
		sum *= 1+r[i]
	end
	return sum
end

#q5.p1
function expense(x)
	if x < 25
		return x*.8
	end
	if x < 250
		return x*.7
	end
	return x*.6
end

#q5.p2
function plot_expense()
	x = range(0, 300)
	y = expense.(x)
	plot(x, y)
end

#q6.p1
function salary(w, L)
	if w < 0
		return "please enter a non-negative hourly wage"
	end
	if L < 0
		return "please enter a non-negative number of hours worked"
	end
	if L > 12
		return "please enter a number of hours worked no greater than 12"
	end
	if L < 8
		return w*L
	else
		return w*8+w*1.5*(L-8)
	end
end

function plot_salary()
	x = range(1, 12, length=12)
	y = salary.(20,x)
	plot(x,y)
end

# some very quick tests
println("Leap years:", leap_year(2000), leap_year(2100), leap_year(234123), leap_year(4328))
println("Sum of squares:", sum_of_squares(5))
println("Square of sums:", square_of_sums(5))
println("Diff in squares:", difference_in_squares(5))

plot_expense()
plot_salary()
