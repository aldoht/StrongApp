using MySqlConnector;
using StrongAPI.Models;

namespace StrongAPI.Repositories;

public class RoutineRepository(MySqlDataSource db)
{
    public async Task InsertRoutine(Routine newRoutine)
    {
        newRoutine.creation_date = DateTime.UtcNow;
        newRoutine.last_modification_date = newRoutine.creation_date;
        using var connection = await db.OpenConnectionAsync();
        using var command = connection.CreateCommand();
        command.CommandText = @"INSERT INTO Routine (user_id, description, routine_name, creation_date, last_modification_date) VALUES (@user_id, @description, @routine_name, @creation_date, @last_modification_date);";
        command.Parameters.AddWithValue("@user_id", newRoutine.user_id);
        command.Parameters.AddWithValue("@description", newRoutine.description);
        command.Parameters.AddWithValue("@routine_name", newRoutine.routine_name);
        command.Parameters.AddWithValue("@creation_date", newRoutine.creation_date);
        command.Parameters.AddWithValue("last_modification_date", newRoutine.last_modification_date);
        await command.ExecuteNonQueryAsync();
        await connection.CloseAsync();
    }
}
