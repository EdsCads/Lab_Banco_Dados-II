-- Obter o os nomes dos professores que são do departamento denominado'Informática', sejam doutores,
-- e que, em 932 (2osemestre de 1993),ministraram alguma turma de disciplina do departamento 'Informática' 
-- que tenha mais que três créditos.

SELECT `professor`.`codProf`,
    `professor`.`nomeProf`,
    `professor`.`codTit`,
    `professor`.`codDepto`
FROM `universidade`.`professor`
INNER JOIN profturma ON professor.codProf=profturma.codProf and anoSem='932'
INNER JOIN titulacao
ON professor.codTit=titulacao.codTit and nomeTit='Doutor'
INNER JOIN depto
ON depto.codDepto=professor.codDepto and nomeDepto='informatica'
INNER JOIN new_view  NV
ON NV.numDisc=profturma.numDisc and NV.siglaTur=profturma.siglaTur
GROUP BY nomeProf;

-- 2. Obter o número de disciplinas do departamento de ‘Informática’.

SELECT Disc.codDepto,Disc.numDisc,Disc.nomeDisc,Disc.creditosDisc FROM universidade.disciplina as Disc JOIN universidade.depto DPT ON  Disc.codDepto=DPT.codDepto and DPT.nomeDepto='informatica';

-- Obter o número de salas que foram usadas no ano-semestre 941 (1osemestre de 1994) 
-- por turmas do departamento de 'Informática'.
