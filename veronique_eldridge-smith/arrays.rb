#1
Days_of_the_week = %w{Monday Tuesday Wednesday Thursday Friday Saturday Sunday}

#2
temp = days_of_the_week.pop
days_of_the_week.unshift temp
#OR
Days_of_the_week.unshift days_of_the_week.pop 
#EQUALS
Days_of_the_week.unshift (days_of_the_week.pop) 
→ says unshift what you just popped … rather than using the variable “temp”

#3
days_of_the_week = [days_of_the_week[1..5], [days_of_the_week
.last, days_of_the_week.first]]
OR
days_of_the_week = [%w{Monday Tuesday Wednesday Thursday Friday}, %w{Saturday Sunday}]

#4
days_of_the_week.shift

#5
days_of_the_week.flatten
days_of_the_week.sort

#Bonus
bros = ['Groucho','Harpo','Chico','Zeppo']
puts bros # Will put each of the brothers on their own line
p bros # This will print them on the same line but print them as an array
puts bros.join ' ' # .join says takes the elements of the array and join them together in some way and because we then have ' ' it will put a space between them.


