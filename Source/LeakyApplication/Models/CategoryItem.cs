namespace LeakyApplication.Models
{
    public class CategoryItem : ObservableObject
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
    }
}
