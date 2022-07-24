using System;
using System.Collections.Generic;
using System.Text;

namespace NestedObjectHelper
{
    public class NestObjectKeyNotFoundException : Exception
    {
        public NestObjectKeyNotFoundException():this("Key not found or invalid key")
        {
           
        }

        public NestObjectKeyNotFoundException(string message) : base(message)
        {
            
        }

      
    }
}
