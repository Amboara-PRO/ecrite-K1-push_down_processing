import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DataRetriever {

    public List<CoutReparationStat> getCoutReparationParMarqueEtMecanicien() throws Exception {

        List<CoutReparationStat> result = new ArrayList<>();

        String sql = """
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
            ORDER BY mv.marque, m.nom
        """;

        DBConnection dbConnection = new DBConnection();
        Connection connection = dbConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();

        while (rs.next()) {

            CoutReparationStat stat = new CoutReparationStat();

            stat.setMarque(rs.getString("marque"));
            stat.setNomMecanicien(rs.getString("nom_mecanicien"));
            stat.setCoutReparation(rs.getDouble("cout_reparation"));

            result.add(stat);
        }

        return result;
    }

    public MecanicienMoinsRentable getMecanicienMoinsRentable() throws Exception {

        String sql = """
            SELECT
                m.nom AS mecanicien,
                SUM(r.cout) AS cout_reparation_rapporte
            FROM Mecanicien m
            JOIN Reparation r
                ON r.id_mecanicien = m.id
            GROUP BY m.nom
            ORDER BY cout_reparation_rapporte ASC
            LIMIT 1
        """;

        DBConnection dbConnection = new DBConnection();
        Connection connection = dbConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();

        MecanicienMoinsRentable result = null;

        if (rs.next()) {

            result = new MecanicienMoinsRentable();

            result.setMecanicien(rs.getString("mecanicien"));
            result.setCoutReparationRapporte(rs.getDouble("cout_reparation_rapporte"));
        }

        return result;
    }
}