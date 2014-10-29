--Arnaud Cojez, L3S5, G4, TP4

--E1Q1
SELECT anom FROM Artists
       WHERE aid IN (SELECT aid FROM Roles);

--E1Q2
SELECT titre FROM Films
       WHERE fid IN (SELECT fid FROM Roles GROUP BY fid HAVING count(aid) >=2);

--E1Q3
SELECT fid FROM Films
       WHERE realisateur IN (SELECT aid FROM Artists
       	     WHERE anom <> 'MarcelloMastroianni');

SELECT fid FROM Films
EXCEPT
(SELECT fid FROM Films
       WHERE realisateur IN (SELECT aid FROM Artists
       	     WHERE anom = 'MarcelloMastroianni'));

--E1Q4
SELECT anom FROM Artists
       WHERE aid IN (SELECT aid FROM Roles 
       	     WHERE fid IN (SELECT fid FROM Films
	     	   WHERE realisateur IN (SELECT aid FROM Artists
       	     	   	 WHERE anom = 'MarcelloMastroianni')));


SELECT anom FROM Artists
       WHERE aid IN (SELECT aid FROM Roles 
       	     WHERE fid IN (SELECT fid FROM Films
	     	   WHERE realisateur IN (SELECT aid FROM Artists))
	     EXCEPT
	     (SELECT aid FROM Roles 
		   WHERE fid IN (SELECT fid FROM Films
	     	   	   WHERE realisateur IN (SELECT aid FROM Artists
       	     	   	   	 WHERE anom <> 'MarcelloMastroianni'))));

--E1Q5
SELECT fid FROM Films
       WHERE fid IN (SELECT fid FROM Roles GROUP BY fid 
       	     HAVING SUM(cout) >= 20000);

--E1Q6
SELECT aid FROM Roles GROUP BY aid HAVING count(fid) <= (SELECT count(fid) FROM Films);

SELECT aid FROM Roles
EXCEPT
SELECT aid FROM Roles GROUP BY aid HAVING count(fid) <= (SELECT count(fid) FROM Films);

--E1Q7 
SELECT realisateur AS aid FROM Films
UNION ALL
SELECT aid FROM Roles;

--E1Q8
SELECT anom FROM Artists WHERE aid IN
(SELECT realisateur as aid FROM Films GROUP BY aid HAVING count(fid) >= 3);
