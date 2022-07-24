using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace NestedObjectHelper
{
    public static class ObjectExtension
    {
        public static Dictionary<string, object> Destructure(this object obj)
        {
            Dictionary<string, object> dictionary = new Dictionary<string, object>();

            Type objectType = obj.GetType();
            IList<PropertyInfo> props = new List<PropertyInfo>(objectType.GetProperties());

            foreach (PropertyInfo prop in props)
            {
                object propValue = prop.GetValue(obj, null);
                dictionary.Add(prop.Name, propValue);
            }

            return dictionary;
        }
    }
}
