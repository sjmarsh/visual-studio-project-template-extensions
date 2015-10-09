using MVCWebApplication1.Infrastructure;
using Ninject.Modules;

namespace MVCWebApplication1
{
    public class WebModule : NinjectModule
    {
        public override void Load()
        {
            Bind<IDoThings>().To<DoThings>();
        }
    }
}