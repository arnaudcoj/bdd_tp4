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
(SELECT realisateur as aid FROM Films GROUP BY aid HAVING COUNT(fid) >= 3);

--E1Q9
SELECT titre FROM Films WHERE fid NOT IN (SELECT fid FROM Roles);

--E1Q10
SELECT SUM(cout), fid FROM Roles GROUP BY fid HAVING SUM(cout) < SOME(SELECT SUM(cout) FROM Roles GROUP BY fid);

--E1Q11
SELECT fid, COUNT(aid), AVG(COUT) FROM Roles GROUP BY fid ORDER BY fid;

--E1Q12
SELECT fid, COUNT(aid), SUM(cout) FROM Roles GROUP BY fid HAVING count(aid) >=2;

--E1Q13

SELECT fid, COUNT(aid), SUM(cout) FROM Roles WHERE cout > 10000 GROUP BY fid;
