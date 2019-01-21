using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace GPSParser.DBLogic
{
    public static class WriteIntoFile
    {
        public static void write(string content)
        {
            if (!File.Exists(@"C:\GPSPacket.txt"))
                File.Create(@"C:\GPSPacket.txt");
            using (System.IO.StreamWriter file = new System.IO.StreamWriter(@"C:\GPSPacket.txt", true))
            {
                file.WriteLine(content+ @"\n\");
            }
        }
    }
}
