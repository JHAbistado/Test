using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace MHD.FetchConfig
{
    public class Connection
    {
        public DataTable Start(string procedurename, string[][] paramsbindings)
        {
            try
            {
                string Constring = FetchConfig.GetConfig("DB_CONF");
                SqlConnection connection = new SqlConnection(Constring);
                connection.Open();
                SqlCommand command = new SqlCommand(procedurename);
                command.CommandType = CommandType.StoredProcedure;
                command.Connection = connection;
                if (paramsbindings.Length > 0)
                {
                    for (int iterate = 0; iterate < paramsbindings.Length; iterate++)
                    {
                        command.Parameters.AddWithValue("@" + paramsbindings[iterate][0], paramsbindings[iterate][1]);
                    }
                }
                using (SqlDataAdapter da = new SqlDataAdapter(command))
                {
                    DataTable records = new DataTable();
                    da.Fill(records);
                    connection.Close();
                    return records;
                }
            }
            catch (Exception ex) {
                DataTable dt = new DataTable();
                dt.Clear();
                dt.Columns.Add("Error");
                dt.Columns.Add("Message");
                dt.Rows.Add(new object[] { "500", ex.Message});
                return dt;

            }


        }
    }
}
