use universidade;
-- 1. Obter o os nomes dos professores que são do departamento denominado 'Informática', sejam doutores,
-- e que, em 932 (2osemestre de 1993),ministraram alguma turma de disciplina do departamento 'Informática' 
-- que tenha mais que três créditos.

CREATE VIEW profturmadisc AS
SELECT profTurma.*
FROM profturma,disciplina
WHERE profturma.codDepto=(
	SELECT depto.codDepto 
    FROM depto 
    WHERE depto.nomeDepto='informatica'
    )
and profTurma.anoSem='932'
and disciplina.codDepto=(
	SELECT depto.codDepto 
    FROM depto 
    WHERE depto.nomeDepto='informatica'
    )
and disciplina.creditosDisc>3
and disciplina.numDisc=profturma.numDisc;

SELECT distinct `professor`.`nomeProf`
FROM `universidade`.`professor`,profturmadisc
WHERE codTit=(
	SELECT codTit 
    FROM titulacao 
    WHERE nomeTit='doutor') 
and professor.codDepto=(
	SELECT depto.codDepto 
    FROM depto 
    WHERE depto.nomeDepto='informatica'
    )
and profturmadisc.codProf=professor.codProf;

-- 2. Obter o número de disciplinas do departamento de ‘Informática’.

SELECT count(numDisc) as 'Numeros de Disciplina'
FROM `universidade`.`disciplina`
WHERE disciplina.codDepto=(
	SELECT depto.codDepto 
    FROM depto 
    WHERE depto.nomeDepto='informatica'
    );


-- 3. Obter o número de salas que foram usadas no ano-semestre 941 (1osemestre de 1994) 
-- por turmas do departamento de 'Informática'.

SELECT numDisc,siglaTur,count(numSala)
FROM horario 
WHERE codDepto=(
	SELECT codDepto 
    FROM depto 
    WHERE nomeDepto='informatica'
    )
and horario.anoSem='941' 
GROUP BY siglaTur,numDisc
ORDER BY numDisc;

-- 4. Obter os nomes das disciplinas do departamento denominado 'Informática' que têm o maior número
-- de créditos dentre as disciplinas deste departamento.
SELECT disciplina.nomeDisc
FROM disciplina
WHERE disciplina.codDepto=(
	SELECT codDepto 
    FROM depto 
    WHERE nomeDepto='informatica'
    )
and creditosDisc=(
	SELECT max(creditosDisc)
    FROM disciplina
    );
    
-- 5. Para cada departamento, obter seu nome e o número de disciplinas do departamento. Obter o resultado em ordem descendente de número de 
-- créditos.
SELECT nomeDepto, count(numDisc) 
FROM depto
LEFT JOIN disciplina
ON depto.codDepto=disciplina.codDepto
GROUP BY nomeDepto;

-- 6. Nomes dos departamentos que possuem disciplinas que não apresentam pré requisito.
SELECT nomeDepto
FROM depto 
WHERE EXISTS(
	SELECT disciplina.codDepto
	FROM disciplina,prereq
    WHERE prereq.codDepto!=disciplina.codDepto and prereq.numDisc!=disciplina.numDisc
    );


-- 7. Obter os códigos dos professores que são do departamento de 'Informática' e que ministraram ao menos uma turma em 1994/1.
SELECT professor.codProf
FROM `universidade`.`professor`
JOIN profturma
ON profturma.codProf=professor.codProf and profturma.anoSem='941'
WHERE professor.codDepto=(
	SELECT depto.codDepto 
    FROM depto 
    WHERE depto.nomeDepto='informatica'
    )
GROUP BY professor.codProf;

-- 8. Obtenha os nomes dos departamentos em que há pelo menos uma disciplina com mais de três créditos.
SELECT nomeDepto
FROM depto
WHERE EXISTS(SELECT disciplina.codDepto 
    FROM disciplina 
    WHERE disciplina.codDepto=depto.codDepto
    and disciplina.creditosDisc>3
    );
    
-- 9. Obter os identificadores das salas (código do prédio e número da sala) que,
-- em 1994/1: nas segundas-feiras (dia da semana = 2), tiveram ao menos uma turma
-- do departamento 'Informática'.
SELECT horario.codPred,horario.numSala
FROM horario
WHERE horario.codDepto=(
	SELECT depto.codDepto 
	FROM depto 
	WHERE depto.nomeDepto='informatica'
	)
and horario.diaSem='2'
and horario.anoSem='941';
    
-- 10. Mostre a ocupação média das salas em cada prédio no primeiro semestre de 1994.
SELECT P.nomePred, AVG(T.capacidade), AVG(S.capacidade)
FROM Turma T 
	JOIN horario H 
    ON T.anoSem = H.anoSem 
	and T.codDepto = H.codDepto 
	and T.numDisc = H.numDisc 
    and T.siglaTur = H.siglaTur
JOIN sala S 
	ON H.codPred = S.codPred 
	and H.numSala = S.numSala 
JOIN predio P 
    ON S.codPred = P.codPred
WHERE T.anoSem = 941 
GROUP BY P.nomePred;

-- 11. Para cada prédio, liste a sala que tem a maior capacidade.
SELECT nomePred, numSala, sala.capacidade 
FROM sala, predio
WHERE sala.capacidade = (
    SELECT max(sala.capacidade) 
    FROM sala s2
    WHERE s2.codPred = sala.codPred)
GROUP BY nomePred;

-- 12. Qual é a sala mais utilizada? Liste o número da sala e quantas vezes ela foi usada.
SELECT H.numsala, COUNT(*) as quantUso, H.codPred 
FROM Horario H
GROUP BY H.numsala 
ORDER BY quantUso DESC limit 1;

-- 13. Liste o número da sala e quantas vezes ela foi usada (ordem decrescente).
SELECT H.numsala, COUNT(*) as quantUso
FROM Horario H 
GROUP BY H.numsala 
ORDER BY quantUso desc;

-- 14. Crie duas visões para as seguintes consultas:
-- ● Obter o código da sala e o código do prédio, desde que a sala tenha capacidade superior a 35 lugares.
-- ● Sabendo que cada crédito de disciplina corresponde a 15 hora/aula,retorne o nome da disciplina e o seu número de horas-aula.

CREATE VIEW salaMaior35 as 
	SELECT numSala, codPred
    FROM Sala 
    WHERE sala.capacidade > 35;

CREATE VIEW disiciplinaHorasAula as
	SELECT nomedisc, creditosdisc * 15
    FROM Disciplina;
    
SELECT * FROM salaMaior35;
SELECT * FROM disiciplinaHorasAula;