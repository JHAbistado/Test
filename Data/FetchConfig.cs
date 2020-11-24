using System.Web.Configuration;

namespace MHD.FetchConfig
{
    public static class FetchConfig
    {
        public static string GetConfig(string key)
        {
            return WebConfigurationManager.AppSettings[key];
        }
    }
}
