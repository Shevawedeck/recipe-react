using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeSystem
{
    public class Direction
    {
        public static DataTable LoadByRecipeId(int recipeid)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = SQLUtility.GetSQLCommand("DirectionGet");
            cmd.Parameters["@RecipeId"].Value = recipeid;
            dt = SQLUtility.GetDataTable(cmd);
            return dt;
        }
        public static void SaveTable(DataTable dt, int recipeid)
        {
            foreach (DataRow r in dt.Select("", "", DataViewRowState.Added))
            {
                r["RecipeId"] = recipeid;
            }
            SQLUtility.SaveDataTable(dt, "DirectionUpdate");
        }
        public static void Delete(int directionid)
        {
            SqlCommand cmd = SQLUtility.GetSQLCommand("DirectionDelete");
            cmd.Parameters["@DirectionId"].Value = directionid;
            SQLUtility.ExecuteSQL(cmd);
        }
    }
}
