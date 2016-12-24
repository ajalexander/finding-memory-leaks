using System.Collections.ObjectModel;

namespace LeakyApplication.Models
{
    public class Category : ObservableObject
    {
        private string _name;

        public string Name
        {
            get { return _name; }
            set
            {
                _name = value;
                RaiseEvent("Name");
            }
        }

        public ObservableCollection<CategoryItem> Items { get; private set; }

        public Category()
        {
            Items = new ObservableCollection<CategoryItem>();
        }
    }
}
