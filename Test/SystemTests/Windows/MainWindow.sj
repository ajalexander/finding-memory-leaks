//USEUNIT CategoryListPage
//USEUNIT EditCategoryPage

function Init(app)
{
    var window = this;

    this.App = app;

    this.WindowHandle = function()
    {
        return this.App.Process().WPFObject("HwndSource: MainWindow", "*");
    }

    this.Window = function()
    {
        return this.WindowHandle().WPFObject("MainWindow", "*", 1);
    }

    this.MainGrid = function()
    {
        return this.Window().WPFObject("Grid", "", 1);
    }

    this.MainContent = function()
    {
        return this.MainGrid().WPFObject("ContentPresenter", "", 1);
    }

    this.Close = function()
    {
        this.Window().Close();
    }

    this.ShowList = function()
    {
        this.MainGrid().WPFObject("StackPanel", "", 1).WPFObject("CategoryListButton").ClickButton();
    }

    this.ShowEditView = function()
    {
        this.MainGrid().WPFObject("StackPanel", "", 1).WPFObject("EditCategoryButton").ClickButton();
    }

    this.Pages =
    {
        List: new CategoryListPage.Init(window),
        Edit: new EditCategoryPage.Init(window)
    };
}
