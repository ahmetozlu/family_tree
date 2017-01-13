:-dynamic(male/1). 
:-dynamic(female/1). 
:-dynamic(gender/2).
:-dynamic(birthDate/2). 
:-dynamic(husband/1). 
:-dynamic(parent/2). 
:-dynamic(mother/2). 
:-dynamic(childCount/2).
:-dynamic(wife/1). 
:-dynamic(retract/2).
:-dynamic(deadDate/2). 
:-dynamic(getInfo/0). 
:-dynamic(deletePerson/0). 
:-dynamic(husband/2).
:-dynamic(wife/2).

male('Erdem Ozlu').
male('Erdi Ozlu').
male('Ali Karabag').
male('Ali Ozlu').
male('Ahmet Tanis').
male('Orhan Karabag').
male('Tolga Tanis').

female('Ayse Ozlu').
female('Sibel Ozlu').
female('Seda Karabag').
female('Deniz Ozlu').
female('Melis Tanis').
female('Gunes Ozlu').
female('Secil Karabag').
female('Derya Ozlu').

gender('Erdem Ozlu','m').
gender('Erdi Ozlu','m').
gender('Ali Karabag','m').
gender('Ali Ozlu','m').
gender('Ahmet Tanis','m').
gender('Orhan Karabag','m').
gender('Tolga Tanis','m').
gender('Ismail Conker','m').
gender('Selim Conker','m').
gender('Ayse Ozlu','f').
gender('Sibel Ozlu','f').
gender('Seda Karabag','f').
gender('Deniz Ozlu','f').
gender('Melis Tanis','f').
gender('Gunes Ozlu','f').
gender('Secil Karabag','f').
gender('Derya Ozlu','f').

birthDate('Erdem Ozlu',1920).
birthDate('Erdi Ozlu',1950).
birthDate('Ali Karabag',1948).
birthDate('Ali Ozlu',1960).
birthDate('Ahmet Tanis',1960).
birthDate('Orhan Karabag',1978).
birthDate('Tolga Tanis',1982).
birthDate('Ayse Ozlu',1925).
birthDate('Sibel Ozlu',1949).
birthDate('Seda Karabag',1952).
birthDate('Deniz Ozlu',1960).
birthDate('Melis Tanis',1961).
birthDate('Gunes Ozlu',1980).
birthDate('Secil Karabag',1975).
birthDate('Derya Ozlu',1982).


deadDate('Erdem Ozlu',2006).
deadDate('Ayse Ozlu',1999).

parent('Erdem Ozlu','Erdi Ozlu').
parent('Erdem Ozlu','Ali Ozlu').
parent('Erdem Ozlu','Seda Karabag').
parent('Erdem Ozlu','Melis Tanis').
parent('Erdi Ozlu','Gunes Ozlu').
parent('Ali Karabag','Secil Karabag').
parent('Ali Karabag','Orhan Karabag').
parent('Ali Ozlu','Derya Conker').
parent('Ahmet Tanis','Tolga Tanis').
parent('Ayse Ozlu','Erdi Ozlu').
parent('Ayse Ozlu','Ali Ozlu').
parent('Ayse Ozlu','Seda Karabag').
parent('Ayse Ozlu','Melis Tanis').
parent('Sibel Ozlu','Gunes Ozlu').
parent('Seda Karabag','Secil Karabag').
parent('Seda Karabag','Orhan Karabag').
parent('Deniz Ozlu','Derya Conker').
parent('Melis Tanis','Tolga Tanis').

mother('mother','child').

childCount(4,'Ayse Ozlu').

husband('Erdem Ozlu','Ayse Ozlu').
husband('Erdi Ozlu','Sibel Ozlu').
husband('Ali Karabag','Seda Karabag').
husband('Ali Ozlu','Deniz Ozlu').
husband('Ahmet Tanis','Melis Tanis').

wife('Ayse Ozlu','Erdem Ozlu').
wife('Sibel Ozlu','Erdi Ozlu').
wife('Seda Karabag','Ali Karabag').
wife('Deniz Ozlu','Ali Ozlu').
wife('Melis Tanis','Ahmet Tanis').
   
:- initialization(loop_entry).
   
loop_entry:-    
    writeln('1-)Ask relation'),
    writeln('2-)Add/Delete/Update person'),
    writeln('3-)Get information of any person'),
    writeln('4-)print the family tree'),
    writeln('5-)Control under 18 age marriage'),
    writeln('6-)Terminate the program'),
    nl,
    writeln('Please choose an operation!'),
    read(SECIM),
    (
        SECIM==1->showRelation();
        SECIM==2->
        writeln('1-)Add person'),
        writeln('2-)Delete person'),
        writeln('3-)Update person'),
        writeln('Please choose an operation!'),
        read(SECIM1),
        (
            SECIM1==1->
            writeln('1-)Add placeholder person'),
            writeln('2-)Add father'),
            writeln('3-)Add mother'),
            writeln('4-)Add child'),
            writeln('Please choose an operation!'),
            read(SECIM1_1),
            (
                SECIM1_1==1->addPlaceholderPerson();
                SECIM1_1==2->addFather();
                SECIM1_1==3->addMother();
                SECIM1_1==4->addChild()
            );
            SECIM1==2->deletePerson();
            SECIM1==3->updatePerson()
        );
        SECIM==3->getInfo();
        SECIM==4->printTree();
        SECIM==5->foreach(male(X),marriageControlA(X));
        SECIM==6->halt(0)
    ),
loop_entry.

marriageControlA(XinEng):-
    birthDate(XinEng, X),
    (
    wife(YinEng,XinEng)->
    birthDate(YinEng, Y),
    /* The rest of your code goes here */
    (  
    (2016-X<18,married(XinEng,YinEng))-> writeln('Under 18 age marriage!'),writeln(XinEng - YinEng);  
    (2016-Y<18,married(XinEng,YinEng))-> writeln('Under 18 age marriage!'),writeln(XinEng - YinEng);
    writeln('')
    )
    ),
    loop_entry.
     
addPlaceholderPerson():-
    write('please type the person name and surname:'),
    nl,
    read(X),
    assert(male(X)),
    write('please type the person gender:'),
    nl,
    read(Y),
    assert(gender(X,Y)),
    write('please type the person birth date:'),
    nl,
    read(Z),
    assert(birthDate(X,Z)),
    write('the person is dead?(yes or no)'),
    nl,
    read(Q),
    (
        Q==yes->write('please type the person dead date:'),
        nl,
        read(R),
        assert(deadDate(X,R));
        write('the person has father?(yes or no)'),
        nl,
        read(QQ),
        (
            QQ==yes->write('please type the father of person name and surname:'),
            nl,
            read(T),
            male(T),
            assert(parent(T,X))
        ),
        write('the person has mother?(yes or no)'),
        nl,
        read(QQQ),
        (
            QQ==yes->write('please type the mother of person name and surname:'),
            nl,
            read(S),
            female(S),
            assert(parent(S,X))
        )
    ).
  
deletePerson():-
    write('please type the person name and surname to delete:'),
    nl,
    read(X),
    birthDate(X,BDX),
    XLX is BDX,    
    (
    married(X,TTT)->retract(husband(X,TTT)),retract(wife(TTT,X));
    write('')
    ),
    (
    parent(X,CHLD)->retract(parent(X,CHLD));
    write('')
    ),
    (
        male(X)->retract(male(X)),retract(gender(X,A)),retract(birthDate(X,XLX));
        female(X)->retract(female(X)),retract(gender(X,'f')),retract(birthDate(X,XLX))
    ).
   
updatePerson():-
    write('please type the person name and surname to update:'),
    nl,
    read(X),
    deleteThePerson(X),
    writeln('---ENTER THE INFORMATION FOR UPDATING THE PERSON---'),
    addPlaceholderPerson().
    
deleteThePerson(X):-
    birthDate(X,BDX),
    XLX is BDX,    
    (
    married(X,TTT)->retract(husband(X,TTT)),retract(wife(TTT,X));
    write('')
    ),
    (
    parent(X,CHLD)->retract(parent(X,CHLD));
    write('')
    ),
    (
        male(X)->retract(male(X)),retract(gender(X,A)),retract(birthDate(X,XLX));
        female(X)->retract(female(X)),retract(gender(X,'f')),retract(birthDate(X,XLX))
    ).
  
getInfo():-
    write('please type the person name and surname:'),
    nl,
    read(X),
    (
    deadDate(X, Y)->
    (  
        2016>Y -> writeln('DEAD');  
        writeln('ALIVE')
    );
    write('')
    ),
    birthDate(X,Z),
    A is 2016-Z,
    write('Age:'),
    writeln(A),
    (
        greatgrandfather(X,YA)->writeln('Level=3');
        greatgrandmother(X,YA)->writeln('Level=3');
        grandfather(X,YA)->writeln('Level=2');
        grandmother(X,YA)->writeln('Level=2');
        father(X,YA)->writeln('Level=1');
        mother(X,YA)->writeln('Level=1');
        writeln('Level=0')
    ),
    findall(QZ,mother(X,QZ),L),
    length(L, AA),
    findall(QQZ,father(X,QQZ),LL),
    length(LL, AAA),
    AAAA is AA+AAA,
    write('Total child: '),writeln(AAAA),
    assert(childCount(AAAA,X)),
    nl.
    
addChild():-
    write('please type the father person name and surname:'),
    nl,
    read(X),
    write('please type the mother person name and surname:'),
    nl,
    read(Y),
    write('father person is dead?(type yes or no)'),
    nl,
    read(QONE),
    (
        QONE==yes->write('type dead date:'),
        nl,
        read(DDF),
        assert(deadDate(X,DDF));
        writeln('')
    ),
    birthDate(X,BDF),
    birthDate(Y,BDM),
    write('mother person is dead?(type yes or no)'),
    nl,
    read(QTWO),
    (
        QTWO==yes->write('type dead date:'),
        nl,
        read(DDM),
        assert(deadDate(Y,DDM));
        writeln('')
    ),
    (
        father(X,Y)->writeln('Baba-EVLENEMEZ');
        mother(X,Y)->writeln('Anne-EVLENEMEZ');
        abi(X,Y)->writeln('Abi-EVLENEMEZ');
        erkekKardes(X,Y)->writeln('Erkek kardes-EVLENEMEZ');
        abla(X,Y)->writeln('Abla-EVLENEMEZ');
        kizKardes(X,Y)->writeln('Kiz kardes-EVLENEMEZ');
        teyze(X,Y)->writeln('Teyze-EVLENEMEZ');
        dayi(X,Y)->writeln('Dayi-EVLENEMEZ');
        dayi1(X,Y)->writeln('Dayi-EVLENEMEZ');
        eniste(X,Y)->writeln('Eniste-EVLENEMEZ');   
        eniste1(X,Y)->writeln('Eniste-EVLENEMEZ'); 
        eniste2(X,Y)->writeln('Eniste-EVLENEMEZ'); 
        eniste3(X,Y)->writeln('Eniste-EVLENEMEZ'); 
        kayinBirader(X,Y)->writeln('Kayinbirader-EVLENEMEZ');
        kayinBirader1(X,Y)->writeln('Kayinbirader-EVLENEMEZ');
        bacanak(X,Y)->writeln('bacanak-EVLENEMEZ');
        bacanak1(X,Y)->writeln('bacanak-EVLENEMEZ');
        elti(X,Y)->writeln('Elti-EVLENEMEZ');
        elti1(X,Y)->writeln('Elti-EVLENEMEZ'); 
        son(X,Y)->writeln('Ogul-EVLENEMEZ');
        daughter(X,Y)->writeln('Kiz-EVLENEMEZ');
        uncle(X,Y)->writeln('Amca-EVLENEMEZ');    
        hala(X,Y)->writeln('Hala-EVLENEMEZ');
        aunty(X,Y)->writeln('Yenge-EVLENEMEZ');
        aunty1(X,Y)->writeln('Yenge-EVLENEMEZ');
        aunty2(X,Y)->writeln('Yenge-EVLENEMEZ');
        nephew(X,Y)->writeln('Erkek yegen-EVLENEMEZ');
        niece(X,Y)->writeln('Kiz yegen-EVLENEMEZ');
        brotherinlaw(X,Y)->writeln('Kayinbirader-EVLENEMEZ');
        motherinlaw(X,Y)->writeln('Kayinvalide-EVLENEMEZ');
        fatherinlaw(X,Y)->writeln('Kayinpeder-EVLENEMEZ');
        soninlaw(X,Y)->writeln('Damat-EVLENEMEZ');
        daughterilaw(X,Y)->writeln('Gelin-EVLENEMEZ');
        (
            write('please type the child person name and surname:'),
            nl,
            read(Z),
            write('please type the birthdate of child person name and surname:'),
            nl,
            read(BDC),
            (
                BDF>BDC->writeln('Child can not be older than his father');
                BDM>BDC->writeln('Child can not be older than his mother');
                QONE==yes->
                (                   
                    DDF<BDC->writeln('Person can not have child after his died')
                );
                QTWO==yes->
                (                    
                    DDM<BDC->writeln('Person can not have child after her died')
                );                              
                assert(parent(X,Z)),assert(parent(Y,Z)),
                write('please type the child person gender:'),
                nl,
                read(ZG),
                assert(gender(Z,ZG)),
                (
                    ZG==m-> assert(male(Z));
                    ZG==f-> assert(female(Z));
                    writeln('gecersiz cinsiyet')
                )
            )
        )
    ).
	
addMother():-
    write('please type the mother person name and surname to add:'),
    nl,
    read(X),
	write('please type the child person name and surname:'),
    nl,
    read(Y),
	(
        mother(Q,Y)->write('Already has mother');
        writeln('uygun'),
        assert(female(X)),
        assert(parent(X,Y)),
        assert(mother(X,Y)),
        assert(gender(X,'f')),
        write('please type birth date of the mother person'),
        nl,
        read(BDFP),
        assert(birthDate(X,BDFP)),
        write('the person is dead?(yes or no)'),
        nl,
        read(Q),
        (
            Q==yes->write('please type the person dead date:'),
            nl,
            read(R),
            assert(deadDate(X,R)),
            writeln('eklendi'),
            loop_entry;
            writeln('eklendi'),
            loop_entry
        )
    ).
	
addFather():-
    write('please type the father person name and surname to add:'),
    nl,
    read(X),
	write('please type the child person name and surname:'),
    nl,
    read(Y),
	(
        father(Q,Y)->write('Already has father');
        writeln('uygun'),
        assert(male(X)),
        assert(parent(X,Y)),
        assert(gender(X,'m')),
        write('please type birth date of the father person'),
        nl,
        read(BDFP),
        assert(birthDate(X,BDFP)),
        write('the person is dead?(yes or no)'),
        nl,
        read(Q),
        (
            Q==yes->write('please type the person dead date:'),
            nl,
            read(R),
            assert(deadDate(X,R)),
            writeln('eklendi'),
            loop_entry;
            writeln('eklendi'),
            loop_entry
        )
    ).
 
getTheLevel3(X):-
    (
        greatgrandfather(X,Y)->wife(Z,X),writeln(X - Z);
        greatgrandmother(X,Y)->write('');
        grandfather(X,Y)->write('');
        grandmother(X,Y)->write('');
        father(X,Y)->write('');
        mother(X,Y)->write('');
        write('')
    ).
    
getTheLevel2(X):-
    (
        greatgrandfather(X,Y)->write('');
        greatgrandmother(X,Y)->write('');
        grandfather(X,Y)->wife(ZZ,X),writeln(X - ZZ);
        grandmother(X,Y)->write('');
        father(X,Y)->write('');
        mother(X,Y)->write('');
        write('')
    ).
    
getTheLevel1(X):-
    (
        greatgrandfather(X,Y)->write('');
        greatgrandmother(X,Y)->write('');
        grandfather(X,Y)->write('');
        grandmother(X,Y)->write('');
        father(X,Y)->wife(ZZZ,X),writeln(X - ZZZ);
        mother(X,Y)->write('');
        write('')
    ).
 
getTheLevel0(X):-
    (
        greatgrandfather(X,Y)->write('');
        greatgrandmother(X,Y)->write('');
        grandfather(X,Y)->write('');
        grandmother(X,Y)->write('');
        father(X,Y)->write('');
        mother(X,Y)->write('');
        writeln(X)
    ).
 
getTheLevel():-
    write('please type the person name and surname to get level:'),
    nl,
    read(X),
    (
    greatgrandfather(X,Y)->write('Level=3');
    greatgrandmother(X,Y)->write('Level=3');
    grandfather(X,Y)->write('Level=2');
    grandmother(X,Y)->write('Level=2');
    father(X,Y)->write('Level=1');
    mother(X,Y)->write('Level=1');
    write('Level=0')
    ).
    
people(L) :- findall(X, (male(X)), L).
                
printTree():-
    writeln('---LEVEL 3---'),
    foreach(male(X),getTheLevel3(X)),
    nl,
    writeln('---LEVEL 2---'),
    foreach(male(X),getTheLevel2(X)),
    nl,
    writeln('---LEVEL 1---'),
    foreach(male(X),getTheLevel1(X)),
    nl,
    writeln('---LEVEL 0---'),
    foreach(male(X),getTheLevel0(X)),
    foreach(female(X),getTheLevel0(X)),
    nl.

    
married(X,Y):-husband(X,Y).
married(X,Y):-wife(X,Y).

is_adult(name,birthDateOf):-birthDate(name,birthDateOf),birthDateOf>17.

father(X,Y):-parent(X,Y),male(X).

mother(X,Y):-husband(Z,X),father(Z,Y),female(X).

brother(X,Y):-father(Z,X),father(Z,Y),X\=Y,male(X).

abi(X,Y):-father(Z,X),father(Z,Y),X\=Y,male(X),birthDate(X,BDX),birthDate(Y,BDY),BDX<BDY.
erkekKardes(X,Y):-father(Z,X),father(Z,Y),X\=Y,male(X),birthDate(X,BDX),birthDate(Y,BDY),BDX>BDY.

sister(X,Y):-father(Z,X),father(Z,Y),X\=Y,female(X).

abla(X,Y):-father(Z,X),father(Z,Y),X\=Y,female(X),birthDate(X,BDX),birthDate(Y,BDY),BDX<BDY.
kizKardes(X,Y):-father(Z,X),father(Z,Y),X\=Y,female(X),birthDate(X,BDX),birthDate(Y,BDY),BDX>BDY.

siblings(X,Y):-parent(Z,X),parent(Z,Y),X\=Y.

son(X,Y):-father(Y,X),male(X).
son(X,Y):-mother(Y,X),male(X).

daughter(X,Y):-father(Y,X),female(X).
daughter(X,Y):-mother(Y,X),female(X).

grandparents(X,Y):-parent(X,Z),parent(Z,Y).

grandmother(X,Y):-parent(X,Z),parent(Z,Y),female(X).

grandfather(X,Y):-parent(X,Z),parent(Z,Y),male(X).

greatgrandparents(X,Y):-grandparents(Z,Y),parent(X,Z).

greatgrandfather(X,Y):-grandparents(Z,Y),parent(X,Z),male(X).

greatgrandmother(X,Y):-grandparents(Z,Y),parent(X,Z),female(X).

uncle(X,Y):-brother(Z,X),parent(Z,Y),male(X).
uncle(X,Y):-married(X,Z),parent(W,Y),siblings(W,Z),male(X).

dayi(X,Y):-sister(Z,X),parent(Z,Y),male(X).
dayi1(X,Y):-married(X,Z),parent(W,Y),siblings(W,Z),male(X).

aunty(X,Y):-uncle(Z,Y),married(Z,X),female(X).
aunty1(X,Y):-dayi(Z,Y),married(Z,X),female(X).
aunty2(X,Y):-dayi1(Z,Y),married(Z,X),female(X).
aunty(X,Y):-siblings(Z,X),sister(X,Z),father(Z,Y),female(X).

hala(X,Y):-father(Z,Y),sister(X,Z),female(X).
/*hala(X,Y):-siblings(Z,X),sister(X,Z),father(Z,Y),female(X).*/

teyze(X,Y):-mother(Z,Y),sister(X,Z),female(X).

eniste(X,Y):-abla(Z,Y),husband(X,Z).
eniste1(X,Y):-kizKardes(Z,Y),husband(X,Z).
eniste2(X,Y):-teyze(Z,Y),husband(X,Z).
eniste3(X,Y):-hala(Z,Y),husband(X,Z).

kayinBirader(X,Y):-eniste(Y,X),male(X).
kayinBirader1(X,Y):-eniste1(Y,X),male(X).

bacanak(X,Y):-male(X),male(Y),wife(Z,X),wife(T,Y),abla(Z,T).
bacanak1(X,Y):-male(X),male(Y),wife(Z,X),wife(T,Y),kizKardes(Z,T).

elti(X,Y):-husband(Z,X),husband(T,Y),male(Z),male(T),abi(Z,T).
elti1(X,Y):-husband(Z,X),husband(T,Y),male(Z),male(T),erkekKardes(Z,T).

nephew(X,Y):-siblings(Z,Y),son(X,Z),male(X).

torun(X,Y):-grandmother(Y,X).
torun1(X,Y):-grandfather(Y,X).


niece(X,Y):-siblings(Z,Y),daughter(X,Z),female(X).

cousin(X,Y):-parent(Z,X),parent(W,Y),siblings(Z,W),\+brother(X,Y),\+sister(X,Y),X\=Y.

brotherinlaw(X,Y):-married(X,Z),siblings(Z,Y),male(X).

sisterinlaw(X,Y):-married(X,Z),siblings(Z,Y),female(X).

baldiz(X,Y):-husband(Y,Z),sister(X,Z),female(X),female(Z).

motherinlaw(X,Y):-married(Y,Z),mother(X,Z),female(X).

fatherinlaw(X,Y):-married(Y,Z),father(X,Z),male(X).

soninlaw(X,Y):-married(X,Z),daughter(Z,Y),male(X).

daughterilaw(X,Y):-married(X,Z),son(Z,Y),female(X).

showRelation():-
    write('please type first person name and surname:'),
    nl,
    read(X),
    write('please type second person name and surname:'),
    nl,
    read(Y),
    (father(X,Y)->writeln('Father');
    mother(X,Y)->writeln('Mother');
    abi(X,Y)->writeln('Brother');
    erkekKardes(X,Y)->writeln('Brother');
    abla(X,Y)->writeln('Elder Sister');
    kizKardes(X,Y)->writeln('Sister');
    teyze(X,Y)->writeln('Aunt');
    dayi(X,Y)->writeln('Uncle');
    dayi1(X,Y)->writeln('Uncle');
    eniste(X,Y)->writeln('Uncle');   
    eniste1(X,Y)->writeln('Brother-in-law'); 
    eniste2(X,Y)->writeln('Brother-in-law'); 
    eniste3(X,Y)->writeln('Brother-in-law'); 
    kayinBirader(X,Y)->writeln('Brother-in-law');
    kayinBirader1(X,Y)->writeln('Brother-in-law');
    bacanak(X,Y)->writeln('Brother-in-law');
    bacanak1(X,Y)->writeln('Brother-in-law');
    elti(X,Y)->writeln('Sister-in-law');
    elti1(X,Y)->writeln('Sister-in-law'); 
    son(X,Y)->writeln('Son');
    daughter(X,Y)->writeln('Sister');
    uncle(X,Y)->writeln('Uncle');    
    hala(X,Y)->writeln('Aunt');
    aunty(X,Y)->writeln('Aunt-in-law');
    aunty1(X,Y)->writeln('Aunt-in-law');
    aunty2(X,Y)->writeln('Aunt-in-law');
    nephew(X,Y)->writeln('Nephew');
    niece(X,Y)->writeln('Niece');
    cousin(X,Y)->writeln('Cousin');
    brotherinlaw(X,Y)->writeln('Brother-in-law');
    baldiz(X,Y)->writeln('Sister-in-law');
    sisterinlaw(X,Y)->writeln('Sister-in-law');    
    motherinlaw(X,Y)->writeln('Mother-in-law');
    fatherinlaw(X,Y)->writeln('Father-in-law');
    soninlaw(X,Y)->writeln('Son-in-law');
    daughterilaw(X,Y)->writeln('Daughter-in-law');
    grandfather(X,Y)->writeln('Granfather');
    grandmother(X,Y)->writeln('Grandmother');
    torun(X,Y)->writeln('Grandchild');
    torun1(X,Y)->writeln('Grandchild');
    writeln('No relation')).