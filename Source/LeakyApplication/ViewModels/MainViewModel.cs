using System.Windows.Input;
using LeakyApplication.Models;
using LeakyApplication.Utilities;

namespace LeakyApplication.ViewModels
{
    public class MainViewModel : ObservableObject
    {
        private object _contentModel;

        public object ContentModel
        {
            get { return _contentModel; }
            private set
            {
                _contentModel = value;
                RaiseEvent("ContentModel");
            }
        }

        public ICommand ListCommand { get; private set; }

        public ICommand EditCommand { get; private set; }

        public MainViewModel()
        {
            ListCommand = new RelayCommand(ShowListView);
            EditCommand = new RelayCommand(ShowEditView);

            ShowListView(null);
        }

        private void ShowListView(object parameter)
        {
            ContentModel = new CategoryListViewModel();
        }

        private void ShowEditView(object parameter)
        {
            ContentModel = new CategoryViewModel();
        }
    }
}