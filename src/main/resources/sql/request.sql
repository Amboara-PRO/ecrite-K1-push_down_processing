-- a) Le nombre de réparation effectuée par marque et modèle de voiture :
SELECT
    mv.marque,
    mv.modele,
    COUNT(r.id) AS nbre_reparation
FROM Reparation r
         JOIN Modele_voiture mv
              ON r.id_modele_voiture = mv.id
GROUP BY mv.marque, mv.modele
ORDER BY mv.marque, mv.modele;

-- b) Le pourcentage de réparation par modèle dont le résultat doit être retourné en une seule ligne, par exemple :
SELECT
    ROUND(100.0 * SUM(CASE WHEN mv.modele = 'RANGER' THEN 1 ELSE 0 END) / COUNT(*), 2) AS nbre_reparation_ranger,
    ROUND(100.0 * SUM(CASE WHEN mv.modele = 'EVEREST' THEN 1 ELSE 0 END) / COUNT(*), 2) AS nbre_reparation_everest,
    ROUND(100.0 * SUM(CASE WHEN mv.modele = 'YUKON' THEN 1 ELSE 0 END) / COUNT(*), 2) AS nbre_reparation_yukon,
    ROUND(100.0 * SUM(CASE WHEN mv.modele = 'RAM' THEN 1 ELSE 0 END) / COUNT(*), 2) AS nbre_reparation_ram
FROM Reparation r
         JOIN Modele_voiture mv
              ON r.id_modele_voiture = mv.id;

-- c) Le cout de réparation de modèle de voiture par marque et par mécanicien représenté par son nom :
SELECT
    mv.marque,
    m.nom AS nom_mecanicien,
    COALESCE(SUM(r.cout),0) AS cout_reparation
FROM Mecanicien m
         LEFT JOIN Reparation r
                   ON r.id_mecanicien = m.id
         LEFT JOIN Modele_voiture mv
                   ON r.id_modele_voiture = mv.id
GROUP BY mv.marque, m.nom
ORDER BY mv.marque, m.nom;

-- d) Le nom du mécanicien qui a le moins rapporté de l’argent au garage, autrement dit dont la somme de coût de réparation
-- est la moins élevée, avec le montant total du coût de réparation (1 seule ligne de résultat est attendu)
SELECT
    m.nom AS mecanicien,
    SUM(r.cout) AS cout_reparation_rapporte
FROM Mecanicien m
         JOIN Reparation r
              ON r.id_mecanicien = m.id
GROUP BY m.nom
ORDER BY cout_reparation_rapporte ASC
    LIMIT 1;