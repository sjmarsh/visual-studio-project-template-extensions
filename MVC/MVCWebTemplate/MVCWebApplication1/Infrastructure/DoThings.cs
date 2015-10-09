namespace MVCWebApplication1.Infrastructure
{
    public interface IDoThings
    {
        string Do();
    }

    public class DoThings : IDoThings
    {
        public string Do()
        {
            return "I don't actually do anything.";
        }
    }
}