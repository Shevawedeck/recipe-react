using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeSystem
{
    public class BizMeal:BizObject<BizMeal>
    {
        public BizMeal() { }

        private int _mealId;
        private int _usernameId;
        private string _mealName = "";
        private DateTime _dateCreated;
        private string _mealDesc = "";
        private string _user = "";
        private string _isActive = "";

        public List<BizMeal> Search(string mealnameval)
        {
            SqlCommand cmd = SQLUtility.GetSQLCommand(this.GetSprocName);
            SQLUtility.SetParamValue(cmd, "MealName", mealnameval);
            DataTable dt = SQLUtility.GetDataTable(cmd);
            return this.GetListFromDataTable(dt);
        }

        public int MealId
        {
            get { return _mealId; }
            set
            { 
                if (_mealId != value)
                {
                    _mealId = value;
                    InvokePropertyChanged();
                }
            } 
        }
        public int UsernameId
        {
            get { return _usernameId; }
            set
            {
                if (_usernameId != value)
                {
                    _usernameId = value;
                    InvokePropertyChanged();
                }
            }
        }
        public string MealName
        {
            get { return _mealName; }
            set
            {
                if(_mealName != value)
                {
                    _mealName = value;
                    InvokePropertyChanged();
                }
            }
        }
        public string MealDesc
        {
            get { return _mealDesc; }
            set
            {
                if( _mealDesc != value)
                {
                    _mealDesc = value;
                    InvokePropertyChanged();
                }
            }
        }
        public string User
        {
            get { return _user; }
            set
            {
                if (_user != value)
                {
                    _user = value;
                    InvokePropertyChanged();
                }
            }
        }
        public string IsActive
        {
            get { return _isActive; }
            set
            {
                if (_isActive != value)
                {
                    _isActive = value;
                    InvokePropertyChanged();
                }
            }
        }
        public DateTime DateCreated
        {
            get { return _dateCreated; }
            set
            {
                if( _dateCreated != value)
                {
                    _dateCreated = value;
                    InvokePropertyChanged();
                }
            }
        }
    }
}
