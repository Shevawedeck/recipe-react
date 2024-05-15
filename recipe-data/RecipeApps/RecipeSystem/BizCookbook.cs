using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeSystem
{
    public class BizCookbook: BizObject<BizCookbook>
    {
        public BizCookbook() { }

        private int _cookbookId;
        private int _usernameId;
        private string _cookbookName = "";
        private decimal _price;
        private DateTime _dateCreated;
        private string _skillDesc;
        private string _author;
        private string _cookbookImage;
        
        public List<BizCookbook> Search(string cookbooknameval)
        {
            SqlCommand cmd = SQLUtility.GetSQLCommand(this.GetSprocName);
            SQLUtility.SetParamValue(cmd, "CookbookName", cookbooknameval);
            DataTable dt = SQLUtility.GetDataTable(cmd);
            return this.GetListFromDataTable(dt);
        }
        public int CookbookId
        {
            get { return _cookbookId; }
            set
            {
                if (_cookbookId != value)
                {
                    _cookbookId = value;
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
        public string CookbookName
        {
            get { return _cookbookName; }
            set
            {
                if (_cookbookName != value)
                {
                    _cookbookName = value;
                    InvokePropertyChanged();
                }
            }
        }
        public decimal Price
        {
            get { return _price; }
            set
            {
                if (_price != value)
                {
                    _price = value;
                    InvokePropertyChanged();
                }
            }
        }
        public string SkillDesc
        {
            get { return _skillDesc; }
            set
            {
                if( _skillDesc != value)
                {
                    _skillDesc = value;
                    InvokePropertyChanged();
                }
            }
        }
        public string Author
        {
            get { return _author; }
            set
            {
                if (_author != value)
                {
                    _author = value;
                    InvokePropertyChanged();
                }
            }
        }
        public string CookbookImage
        {
            get { return _cookbookImage; }
            set
            {
                if (_cookbookImage != value)
                {
                    _cookbookImage = value;
                    InvokePropertyChanged();
                }
            }
        }
        public DateTime DateCreated
        {
            get { return _dateCreated; }
            set
            {
                if (_dateCreated != value)
                {
                    _dateCreated = value;
                    InvokePropertyChanged();
                }
            }
        }
    }
}
