n = input()
l = map(int,raw_input().split())
s = []
c = 0
g = 0
for i in l :
	if i >= 0 :
		s.append(i)
	else :
	    	if len(s) != 0 :
		    	top = s.pop()
		    	if i+top == 0 :
		        	c += 2
		else :
			s[:] = []
			if g < c :
			    g = c
			c = 0
if c > g :
    print c
else :
    print g

