
disease(eye-disease,eye-pain).

disease(fracture,bone-pain).
disease(fracture,blood).

disease(heartpain,numbness).
disease(heartpain,dizziness).

disease(fever,cold).
disease(fever,cough).
disease(fever,headache).

disease(ear-disease,ear-pain).
disease(ear-disease,sound).



doctor(khanna,delhi,eye).
doctor(n.khanna,agra,ear).
doctor(priya,hyd,heart).
doctor(mahesh,hyd,heart).
doctor(pritam,mum,heart).
doctor(heera,agra,heart).
doctor(veera,delhi,heart).
doctor(fareem,agra,heart).
doctor(priyal,kolkata,ortho).
doctor(mani,delhi,physician).
doctor(shivam,agra,physician).
doctor(iva,agra,physician).
doctor(seeta,mum,physician).
doctor(geeta,delhi,physician).
doctor(sheela,mum,physician).
doctor(bala,hyd,physician).
doctor(suri,hyd,physician).
doctor(reena,kolkata,physician).
doctor(navs,kolkata,physician).
doctor(priyal,kolkata,ortho).
doctor(pr,mum,ortho).
doctor(jai,kolkata,ortho).
doctor(shree,mum,ortho).
doctor(uma,delhi,ortho).
doctor(umesh,delhi,ortho).
doctor(dia,delhi,ortho).
doctor(ria,delhi,ortho).
doctor(surya,kolkata,ortho).
doctor(satya,hyd,ortho).
doctor(reddy,hyd,eye).
doctor(naidu,hyd,ear).
doctor(meera,mum,eye).
doctor(mishra,agra,eye).
doctor(agarwaal,hyd,ear).
doctor(tom,delhi,eye).

special(eye,eye-disease).
special(ortho,fracture).
special(physician,fever).
special(heart,heartpain).
special(ear,ear-disease).




remedies(fever,hotwater).
remedies(fever,medicine).
remedies(fracture,protien-diet).
remedies(fracture,bedrest).
remedies(fracture,medicine).
remedies(fever,sleeping).
remedies(heartpain,healthydiet).
remedies(heartpain,exercise).
remedies(ear-disease,drops).
remedies(ear-disease,medicine).
remedies(eye-disease,glasses).
remedies(eye-disease,medicine).




find-spe-sym(A,B):-
	disease(C,B),special(A,C).

find-doc-dis(X,Y):-
	special(C,Y),doctor(X,_,C).

find-doc-spe(X,Y):-
	doctor(X,_,Y).

find-doc-area(A,Y):-
			doctor(A,Y,_).

find-doc-sym(A,B,[X]):-
    disease(Y,X), special(Z,Y), doctor(A,B,Z).

find-doc-sym(A,B,[H|T]):-
	find-doc-sym(A,B,T), disease(Y,H),special(Z,Y),doctor(A,B,Z).


find-doccount-area(A,B):-
	aggregate_all(count,doctor(_,B,_),A).
find-doccount-special(A,B):-
	aggregate_all(count,doctor(_,_,B),A).
find-doccount-area-spe(A,B,C):-
	aggregate_all(count,doctor(_,B,C),A).

find-dis-sym(A,[X]):-
	disease(A,X).


find-dis-sym(A,[H|T]):-
	find-dis-sym(A,T),disease(A,H).



find-doc-areas(B,Bag,S):-
	findall(Name,doctor(Name,B,_),Bag),
	findall(Spe,doctor(_,B,Spe),S).


find-rem-sym(A,[X]):-
	disease(B,X),remedies(B,A).
find-rem-sym(A,[H|T]):-
	find-rem-sym(A,T),disease(B,H),remedies(B,A).

