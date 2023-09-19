INSERT INTO `turismo`.`cidade`
VALUES("1","São Luís","Maranhao","https://www.saoluis.ma"),
("2","Belém","Pará","https://www.belem.pa"),
("3","São Paulo","São Paulo","https://www.saopaulo.sp"),
("4","Rio De Janeiro","Rio De Janeiro","https://www.riodejaneiro.rj");

INSERT INTO  `turismo`.`restaurante`
VALUES("1","Le Mon Bijour","30.00","1"),
("2","Caldeirão Minas","45.25","4"),
("3","Crepioca da Cintia","12.45","2");

INSERT INTO  `turismo`.`hotel`
VALUES ("1","O Grande","250.00","1"),
("2","Flor do Mar","450.00","3"),
("4","Recanto e Conforto","375.00","2"),
("3","Barraco da Cristina","50.00","4");

INSERT INTO `turismo`.`pacoteturismo`
VALUES ("1","2023-09-17 23:56:33","2024-02-10","45","0","0","LIMUSINE","0","1","1","1"),
("2","2023-09-17 23:56:33","2024-02-10","45","1","3","LIMUSINE","0","4","3","2");

INSERT INTO `turismo`.`passeioturistico` (`idPasseioTuristico`, `descricao`, `valor`) 
VALUES ('1', 'Passeio pelas cidades mais visitadas', '350'),
 ('2', 'Passeio pelos rios', '180'),
 ('3', 'Conhecer os bistrôs mais caros', '200');

INSERT INTO `turismo`.`pacote_passeio` (`pacoteturismo_idPacoteTurismo`, `passeioturistico_idPasseioTuristico`) 
VALUES ('1', '1'), ('1', '2'), ('1', '3'), ('2', '1'), ('3', '1');
