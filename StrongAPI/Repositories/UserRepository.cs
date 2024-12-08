using MySqlConnector;
using StrongAPI.Models;

namespace StrongAPI.Repositories;

public class UserRepository(MySqlDataSource db)
{
    public async Task InsertUser(User newUser)
    {
        newUser.creation_date = DateTime.UtcNow;
        using var connection = await db.OpenConnectionAsync();
        using var command = connection.CreateCommand();
        command.CommandText = @"INSERT INTO User VALUES (@user_id, @creation_date);";
        command.Parameters.AddWithValue("@user_id", newUser.user_id);
        command.Parameters.AddWithValue("@creation_date", newUser.creation_date);
        await command.ExecuteNonQueryAsync();
        await connection.CloseAsync();
    }
}
