DROP PROCEDURE IF EXISTS ReajustarDiariaHotel;
DELIMITER //
CREATE PROCEDURE ReajustarDiariaHotel(
    IN HotelDestino INT,
    IN TaxaReajuste DECIMAL(10, 2)
)
BEGIN
    DECLARE ValorAtualDiaria DECIMAL(10, 2);
    DECLARE NovoValorDiaria DECIMAL(10, 2);
    -- Obter o valor atual da diária do hotel
    SELECT ValorDiaria INTO ValorAtualDiaria
    FROM hotel
    WHERE idHotel = HotelDestino;
    
    -- Verificar se o hotel existe
    IF ValorAtualDiaria IS NOT NULL THEN
        -- Calcular o novo valor da diária com base na taxa de reajuste
        
        SET NovoValorDiaria = ValorAtualDiaria * (1 + TaxaReajuste / 100);
        
        -- Atualizar o valor da diária do hotel
        UPDATE hotel
        SET ValorDiaria = NovoValorDiaria
        WHERE idHotel = HotelDestino;
        
        -- Imprimir mensagem de sucesso
        SELECT CONCAT('Diária do hotel ID ', HotelDestino, ' reajustada para ', NovoValorDiaria, ' (', TaxaReajuste, '% de reajuste)') AS Mensagem;
    ELSE
        -- Se o hotel não existe, imprimir mensagem de erro
        SELECT 'Hotel não encontrado.' AS Mensagem;
    END IF;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS CalcularCustoTotalPacoteTuristico;
DELIMITER //

CREATE PROCEDURE CalcularCustoTotalPacoteTuristico(IN PacoteTuristicoID INT)
BEGIN
    DECLARE ValorDaDiaria DECIMAL(10, 2);
    DECLARE ValorDaRefeicao DECIMAL(10, 2);
    DECLARE ValorTotal DECIMAL(10, 2);
    DECLARE DiasDePermanencia INT;
    DECLARE NumerosDeRefeicao INT;

    -- Obter o valor da diária do hotel do pacote turístico
    SELECT h.ValorDiaria INTO ValorDaDiaria
    FROM pacoteturismo pt
    INNER JOIN hotel h ON pt.hotel_idHotel = h.idHotel
    WHERE pt.idPacoteTurismo = PacoteTuristicoID;

    -- Obter o valor das refeições, se inclusas no pacote
    SELECT r.ValorRefeicao INTO ValorDaRefeicao
    FROM pacoteturismo pt
    INNER JOIN Restaurante r ON pt.Restaurante_idRestaurante = r.idRestaurante
    WHERE pt.idPacoteTurismo = PacoteTuristicoID AND pt.incluiRestaurante = 1;

	-- Obter Numeros de Permanencia 
    SELECT pt.DiasPerman INTO DiasDePermanencia
    FROM pacoteturismo pt
    WHERE pt.idPacoteTurismo = PacoteTuristicoID;

	-- Obter Refeicoes Diarias
	SELECT pt.RefeicaoDiaria INTO NumerosDeRefeicao
    FROM pacoteturismo pt
    WHERE pt.idPacoteTurismo = PacoteTuristicoID;
    -- Calcular o valor total do pacote turístico
    SET ValorTotal = ValorDaDiaria * DiasDePermanencia;

    IF ValorDaRefeicao IS NOT NULL THEN
        SET ValorTotal = ValorTotal + (ValorDaRefeicao * DiasDePermanencia *NumerosDeRefeicao );
    END IF;

    -- Atualizar o valor total do pacote turístico na tabela
    UPDATE pacoteturismo pt
    SET pt.valorTotalPacote = ValorTotal
    WHERE pt.idPacoteTurismo = PacotTuristicoID;

END;
//

DELIMITER ;

