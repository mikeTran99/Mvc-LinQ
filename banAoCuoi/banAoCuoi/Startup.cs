using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(banAoCuoi.Startup))]
namespace banAoCuoi
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
