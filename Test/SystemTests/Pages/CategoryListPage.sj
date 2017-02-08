function Init(window)
{
    var page = this;

    this.View = function()
    {
        return window.MainContent().WPFObject("CategoryListView", "", 1);
    }

    this.MainGrid = function()
    {
        return this.View().WPFObject("Grid", "", 1);
    }

    this.CategoryItems = function()
    {
        return this.MainGrid().WPFObject("ItemsControl", "", 1);
        
    }

    this.CategoryItem = function(index)
    {
        return this.CategoryItems().WPFObject("ContentPresenter", "", index).WPFObject("StackPanel", "", 1);
    }

    this.Name = function(index)
    {
        return this.CategoryItem(index).WPFObject("CategoryName").Text;
    }

    this.ItemCount = function(index)
    {
        return this.CategoryItem(index).WPFObject("CategoryName").Text;
    }
}
