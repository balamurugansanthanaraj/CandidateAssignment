using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Console
{
    public class MetaDataService
    {
        private readonly string _server;
        private readonly string _endPoint;
        private readonly string _apiVersion;
        public MetaDataService():this("http://169.254.169.254", "2021-02-01")
        {
            
        }

        public MetaDataService(string server,string apiVersion)
        {
            _server = server;
            _endPoint = _server + "/metadata/instance";
            _apiVersion = apiVersion;
        }
        public async Task<string> GetMetaDataInJsonFormat()
        {
            string uri = _endPoint + "?api-version=" + _apiVersion;
            string jsonResult = string.Empty;
            using var httpClient = new HttpClient();
            WebProxy proxy = new WebProxy(); // proxy is required.
            HttpClient.DefaultProxy = proxy;
            httpClient.DefaultRequestHeaders.Add("Metadata", "True");
            try
            {
                jsonResult = await httpClient.GetStringAsync(uri);
            }
            catch (AggregateException ex)
            {
                System.Console.WriteLine("Request failed: " + ex.GetBaseException());
            }

            return jsonResult;
        }
    }
}
