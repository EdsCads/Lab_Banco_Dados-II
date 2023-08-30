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
and disciplina.codDepto=(
	SELECT depto.codDepto 
    FROM depto 
    WHERE depto.nomeDepto='informatica'
    )
and profTurma.anoSem='932'
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