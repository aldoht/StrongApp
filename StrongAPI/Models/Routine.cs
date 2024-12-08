namespace StrongAPI.Models;

public class Routine
{
    public int routine_id { get; set; }
    public string user_id { get; set; }
    public string description { get; set; }
    public string routine_name { get; set; }
    public DateTime creation_date { get; set; }
    public DateTime last_modification_date { get; set; }
}
