function Init(window)
{
    var page = this;

    this.View = function()
    {
        return window.MainContent().WPFObject("CategoryView", "", 1);
    }

    this.MainGrid = function()
    {
        return this.View().WPFObject("Grid", "", 1);
    }

    this.CategoryList = function()
    {
        return this.MainGrid().WPFObject("ComboBox", "", 1);
    }

    this.SelectCategory = function(categoryName)
    {
        this.CategoryList().SelectedIndex = -1;
        this.CategoryList().Keys(categoryName);
    }

    this.EditGrid = function()
    {
        return this.MainGrid().WPFObject("Grid", "", 1);
    }

    this.Name = function()
    {
        return this.EditGrid().WPFObject("CategoryName");
    }

    this.ItemCount = function()
    {
        return this.EditGrid().WPFObject("ItemCount");
    }

    this.Items = function()
    {
        return this.EditGrid().WPFObject("Items");
    }

    this.NewItemName = function()
    {
        return this.EditGrid().WPFObject("NewItemName");
    }

    this.AddItem = function(itemName)
    {
        this.NewItemName().Keys(itemName);
        this.EditGrid().WPFObject("AddItemButton").ClickButton();
    }

    this.AddCategory = function()
    {
        this.MainGrid().WPFObject("NewCategoryButton").ClickButton();
    }
    
    this.RemoveCategory = function()
    {
        this.MainGrid().WPFObject("RemoveCategoryButton").ClickButton();
    }
}
