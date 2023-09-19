DROP TRIGGER IF EXISTS CalcularCustoTrigger;
DELIMITER //
CREATE TRIGGER CalcularCustoTrigger
BEFORE INSERT ON PacoteTurismo FOR EACH ROW
BEGIN
    DECLARE hotelCost DECIMAL(10, 2);
    DECLARE restauranteCost DECIMAL(10, 2);
    DECLARE passeioCost DECIMAL(10, 2);
    DECLARE totalCost DECIMAL(10, 2);

    -- Obter o custo do hotel do pacote
    SELECT ValorDiaria INTO hotelCost FROM turismo.hotel WHERE idHotel = NEW.Hotel_idHotel;

    -- Obter o custo do restaurante do pacote
    SELECT ValorRefeicao INTO restauranteCost FROM turismo.restaurante WHERE idRestaurante = NEW.Restaurante_idRestaurante;

    -- Obter o custo dos passeios turísticos opcionais do pacote
    SELECT SUM(ptv.Valor) INTO passeioCost
    FROM pacoteturismo pt
    INNER JOIN Pacote_passeio pp ON pt.idPacoteTurismo = pp.pacoteturismo_idPacoteTurismo
    LEFT JOIN passeioTuristico ptv ON ptv.idPasseioTuristico = pp.passeioturistico_idPasseioTuristico
    WHERE pt.idPacoteTurismo = NEW.idPacoteTurismo;

    -- Calcular o custo total
    SET totalCost = hotelCost + restauranteCost;
    IF passeioCost IS NOT NULL THEN
        SET totalCost = totalCost + passeioCost;
    END IF;

    -- Atualizar o valorTotalPacote na tabela pacoteturismo    
    SET NEW.dataCriacao = NOW();
    SET NEW.valorTotalPacote = totalCost;
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS PacoteTurismo_DepoisUpdate;

DELIMITER //
CREATE TRIGGER PacoteTurismo_DepoisUpdate
AFTER UPDATE ON PacoteTurismo FOR EACH ROW
BEGIN
    INSERT INTO pacotes_turisticos_alterados (PacoteTuristicoID, CampoAlterado, ValorAntigo, ValorNovo, Usuario, DataAlteracao)
    VALUES (
        NEW.idPacoteTurismo,
        'ValorTotalDoPacote',
        OLD.ValorTotalPacote,
        NEW.ValorTotalPacote,
        CURRENT_USER(),
        NOW()
    );
END;
//

DELIMITER ;
DROP TRIGGER IF EXISTS VerificarCidadeHotelRestaurante;

DELIMITER //
CREATE TRIGGER VerificarCidadeHotelRestaurante
BEFORE INSERT ON PacoteTurismo
FOR EACH ROW
BEGIN
    DECLARE HotelCidade INT;
    DECLARE RestauranteCidade INT;

    -- Obter o ID da cidade do hotel
    SELECT Cidade_idCidade INTO HotelCidade
    FROM Hotel
    WHERE idHotel = NEW.Hotel_idHotel;

    -- Obter o ID da cidade do restaurante (se houver)
    IF NEW.incluiRestaurante = 1 THEN
        SELECT Cidade_idCidade INTO RestauranteCidade
        FROM Restaurante
        WHERE idRestaurante = NEW.Restaurante_idRestaurante;
    END IF;

    -- Verificar se o hotel e o restaurante (se houver) estão na mesma cidade
    IF HotelCidade <> NEW.Cidade_idCidade OR (NEW.incluiRestaurante = 1 AND RestauranteCidade <> NEW.Cidade_idCidade) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O hotel e o restaurante (se houver) devem estar na mesma cidade.';
    END IF;
END;
//

DELIMITER ;
