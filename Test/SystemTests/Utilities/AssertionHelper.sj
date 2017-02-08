var Assert = new Init();

function Init()
{
    var forceStrings = function(value)
    {
        return value + "";
    };

    this.AreEqual = function (expected, actual)
    {
        expected = forceStrings(expected);
        actual = forceStrings(expected);

        var message = "Expected: '" + expected + "'\nActual: '" + actual + "'";

        if (expected === actual)
        {
            Log.Message(message);
        }
        else
        {
            Log.Error(message);
        }
    }

    this.IsTrue = function (actual)
    {
        this.AreEqual("true", actual);
    }

    this.IsFalse = function (actual, comment, defect)
    {
        this.AreEqual("false", actual);
    }
}
