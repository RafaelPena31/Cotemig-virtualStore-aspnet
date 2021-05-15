using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace VirtualStore_RP
{
    public class MySqlDAL
    {
        private static string server = "localhost";
        private static string database = "VirtualStore";
        private static string user = "root";
        private static string password = "";

        private string stringConnection = "SERVER=" + server + "; DATABASE=" + database + "; UID=" + user + "; PWD=" + password;

        public MySqlConnection connection;

        public void Connect()
        {
            try
            {
                connection = new MySqlConnection(stringConnection);
                connection.Open();
            }
            catch (Exception error)
            {
                throw new Exception("Não foi possível conectar a base de dados. Erro: " + error.Message);
            }
        }

        public void ExecutionSQL(string sql)
        {
            try
            {
                Connect();
                MySqlCommand command = new MySqlCommand(sql, connection);
                command.ExecuteNonQuery();
            }
            catch (Exception error)
            {
                throw new Exception("Não foi possível executar a instrução na base de dados. Erro: " + error.Message);
            }
            finally
            {
                connection.Close();
            }
        }

        public DataTable QueryExecution(string sql)
        {
            try
            {
                Connect();
                DataTable dt = new DataTable();
                MySqlDataAdapter data = new MySqlDataAdapter(sql, connection);
                data.Fill(dt);
                return dt;
            }
            catch (Exception error)
            {
                throw new Exception("Não foi possível executar a consulta no banco de dados. Erro:" + error.Message);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}