# Calvin Brown and Jonathan Hagendoorn

using Plots
using Test

#q1
function leap_year(year)
	return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
end


@show leap_year(2023) == false
@show leap_year(2024) == true
@show leap_year(2100) == false
@show leap_year(2400) == true

#q2.p1
function sum_of_squares(n)
	return reduce(+, map(x -> x^2, 1:n))
end

@show sum_of_squares(1) == 1
@show sum_of_squares(5) == 55

#q2.p2
function square_of_sums(n)
	return reduce(+, 1:n)^2
end

@show square_of_sums(1) == 1
@show square_of_sums(5) == 225

#q2.p3
function difference_in_squares(n)
	return sum_of_squares(n) - square_of_sums(n)
end

@show difference_in_squares(1) == 0 
@show difference_in_squares(5) == -170

#q3
function NPV(c, r) 
	sum = 0
	for i in eachindex(c)
		sum += c[i]/((1+r)^(i-1))
	end
	return sum
end

@show NPV([1000, 1100, 1210], .10) ≈ 3000 

#q4.p1
function NFV_end(c, r::Real)
	sum = 0
	n = length(c)
	for i in eachindex(c)
		sum += c[i]*(1+r)^(n-i+1)
	end
	return sum
end

@show NFV_end([1000, 1000, 1000], .10) ≈ 1100 + 1210 + 1331

#q4.p2
function NFV_end(c, r::Array)
	sum = 0
	for i in eachindex(c)
		sum += c[i]
		sum *= 1+r[i]
	end
	return sum
end

@show NFV_end([1000, 1000, 1000], [.10, .10, .10]) ≈ NFV_end([1000, 1000, 1000], .10)
@show NFV_end([1000, 1000, 1000], [.20, .10, .05]) ≈ 3591 

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

@show expense(20) ≈ 20 * 0.8
@show expense(200) ≈ 200 * 0.7
@show expense(500) ≈ 500 * 0.6

#q5.p2
function plot_expense()
	x = range(0, 300)
	y = expense.(x)
	plot(x, y)
end

@show plot_expense()

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

@show salary(-1, 0) == "please enter a non-negative hourly wage" 
@show salary(1, -1) == "please enter a non-negative number of hours worked"
@show salary(1, 13) == "please enter a number of hours worked no greater than 12"
@show salary(18, 6) ≈ 6 * 18
@show salary(17, 10) ≈ 8 * 17 + 2.0 * 17 * 1.5

function plot_salary()
	x = range(1, 12, length=12)
	y = salary.(20,x)
	plot(x,y)
end

# some very quick tests
#plot_expense()
@show plot_salary()
