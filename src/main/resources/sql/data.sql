INSERT INTO Modele_voiture (marque, modele) VALUES
                                                ('FORD', 'RANGER'),
                                                ('FORD', 'EVEREST'),
                                                ('GMC', 'YUKON'),
                                                ('DODGE', 'RAM');

INSERT INTO Mecanicien (nom, marque) VALUES
                                         ('Rakoto', 'FORD'),
                                         ('Rabe', 'DODGE'),
                                         ('Jean', 'GMC');

INSERT INTO Reparation (id_mecanicien, id_modele_voiture, cout) VALUES
                                                                    (1,1,200000),
                                                                    (1,2,120000),
                                                                    (2,4,35000),
                                                                    (1,1,100000),
                                                                    (3,3,80000),
                                                                    (3,3,20000);