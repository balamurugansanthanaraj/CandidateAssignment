using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using NestedObjectHelper;
using Newtonsoft.Json;


namespace Console
{
    class Program
    {
        static async Task Main(string[] args)
        {
            var metaDataService = new MetaDataService();
            var jsonResult = await metaDataService.GetMetaDataInJsonFormat();
            System.Console.WriteLine(jsonResult);

        }

      
    }
}
