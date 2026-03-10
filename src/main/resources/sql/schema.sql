CREATE TYPE marque_voiture AS ENUM ('FORD', 'GMC', 'DODGE');

CREATE TYPE modele_voiture_enum AS ENUM ('RANGER', 'EVEREST', 'YUKON', 'RAM');

CREATE TABLE Modele_voiture (
                                id SERIAL PRIMARY KEY,
                                marque marque_voiture NOT NULL,
                                modele modele_voiture_enum NOT NULL
);

CREATE TABLE Mecanicien (
                            id SERIAL PRIMARY KEY,
                            nom VARCHAR(100) NOT NULL,
                            marque marque_voiture NOT NULL
);

CREATE TABLE Reparation (
                            id SERIAL PRIMARY KEY,
                            id_mecanicien INT REFERENCES Mecanicien(id),
                            id_modele_voiture INT REFERENCES Modele_voiture(id),
                            cout NUMERIC
);