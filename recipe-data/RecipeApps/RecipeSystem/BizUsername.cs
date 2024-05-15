using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeSystem
{
    public class BizUsername: BizObject<BizUsername>
    {
        private int _usernameid;
        private string _usernamename = "";
        private string _lastname = "";
        private string _firstname = "";

        public int UsernameId
        {
            get { return _usernameid; }
            set 
            { 
                _usernameid = value;
                InvokePropertyChanged();
            }
        }
        public string UsernameName
        {
            get { return _usernamename; }
            set
            {
                _usernamename = value;
                InvokePropertyChanged();
            }
        }
        public string Lastname
        {
            get { return _lastname; }
            set
            {
                _lastname = value;
                InvokePropertyChanged();
            }
        }
        public string FirstName
        {
            get { return _firstname; }
            set
            {
                _firstname = value;
                InvokePropertyChanged();
            }
        }
    }
}
