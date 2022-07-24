using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NestedObjectHelper
{
    public class ValueFinder
    {
        public object GetValue(object nestedObject, string keyToFind)
        {
            if (String.IsNullOrEmpty(keyToFind))
            {
                throw new ArgumentNullException(nameof(keyToFind));
            }

            if (nestedObject == null)
            {
                throw new ArgumentNullException(nameof(nestedObject));
            }

            var keys = keyToFind.Split('/');
            var tempObj = nestedObject;
            foreach (string key in keys)
            {
                if (tempObj == default)
                {
                    throw new NestObjectKeyNotFoundException();
                }

                tempObj = tempObj.Destructure().SingleOrDefault(a=>a.Key==key).Value;
            }

            if (tempObj == default)
            {
                throw new NestObjectKeyNotFoundException();
            }
            return tempObj;
        }

        //public object GetValue(object nestedObject, string keyToFind, string defaultValue)
        //{
        //    if (String.IsNullOrEmpty(keyToFind))
        //    {
        //        throw new ArgumentNullException(nameof(keyToFind));
        //    }

        //    if (nestedObject == null)
        //    {
        //        throw new ArgumentNullException(nameof(nestedObject));
        //    }

        //    var keys = keyToFind.Split('/');
        //    var tempObj = nestedObject;
        //    foreach (string key in keys)
        //    {
        //        if (tempObj == default)
        //        {
        //            throw new NestObjectKeyNotFoundException();
        //        }

        //        var destructureValue = tempObj.Destructure();

        //        if (destructureValue.ContainsKey(key))
        //        {
        //            var value = destructureValue[key];
        //            tempObj = value ?? defaultValue;
        //        }
        //        else
        //        {
        //            tempObj = default(object);
        //        }
        //    }

        //    if (tempObj == default)
        //    {
        //        throw new NestObjectKeyNotFoundException();
        //    }
        //    return tempObj;
        //}
    }
}
