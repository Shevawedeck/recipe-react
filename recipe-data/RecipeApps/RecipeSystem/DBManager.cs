using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace RecipeSystem
{
    public class DBManager
    {
        public static void SetConnectionString(string connectionstring, bool tryopen, string userid = "", string password = "")
        {
            SQLUtility.SetConnectionString(connectionstring, tryopen, userid, password);
        }
    }
}
