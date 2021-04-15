
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace STEKI.Service
{
    public class MotionService
    {

        //Action platform mechanical parameters
        public uint AccessDistanceUnit { get; set; }//350
        public uint LeadDistanceUnit { get; set; }  //10
        public uint OneTurnPulseNum { get; set; }   //10000

        //Control protocol packet
        private const ushort confirmCode = 0x55aa;
        private const ushort passCode = 0;
        private const ushort functionCode = 0x1401;
        private const ushort objectChannel = 1;
        private const ushort whoAccpet = 0xFFFF;
        private const ushort whoReply = 0;
        private const ushort line = 0;
        private uint absTime = 50;//millisecond
        private uint xPos = 0;
        private uint yPos = 0;
        private uint zPos = 0;
        private uint uPos = 0;
        private uint vPos = 0;
        private uint wPos = 0;
        private uint baseDout1 = 0;
        private uint baseDout2 = 0;
        private const uint dac = 0;
        private uint baseDout3 = 0;
        private uint baseDout4 = 0;
        private uint effects = 0;

        //udp
        private IPEndPoint mboxIPE = null;
        private Socket socket = null;


        /// <summary>
        /// Initialization
        /// </summary>
        public MotionService(uint accessDistanceUnit, uint leadDistanceUnit, uint oneTurnPulseNum)
        {
            AccessDistanceUnit = accessDistanceUnit;
            LeadDistanceUnit = leadDistanceUnit;
            OneTurnPulseNum = oneTurnPulseNum;

            mboxIPE = new IPEndPoint(IPAddress.Parse("192.168.15.255"), 7408);
            socket = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);
        } 


        /// <summary>
        /// 
        /// </summary>
        public void SetPosition(uint x, uint y, uint z, uint u, uint v, uint w, uint millisecond = 50)
        {
            xPos = x;
            yPos = y;
            zPos = z;
            uPos = u;
            vPos = v;
            wPos = w;
            absTime = millisecond;
            udpSendMotionData();
        }

        /// <summary>
        /// Reset
        /// </summary>
        public void Reset()
        {
            string str = "55aa000012010002ffffffff000000010000";
            byte[] sendBuf = HexStringToByteArray(str);
            socket.SendTo(sendBuf, mboxIPE);
        }


        /// <summary>
        /// Send data packet
        /// </summary>
        private void udpSendMotionData()
        {
            StringBuilder str = new StringBuilder();

            uint _xPos = (AccessDistanceUnit / LeadDistanceUnit) * OneTurnPulseNum * xPos / 255;
            uint _yPos = (AccessDistanceUnit / LeadDistanceUnit) * OneTurnPulseNum * yPos / 255;
            uint _zPos = (AccessDistanceUnit / LeadDistanceUnit) * OneTurnPulseNum * zPos / 255;
            uint _uPos = (AccessDistanceUnit / LeadDistanceUnit) * OneTurnPulseNum * uPos / 255;
            uint _vPos = (AccessDistanceUnit / LeadDistanceUnit) * OneTurnPulseNum * vPos / 255;
            uint _wPos = (AccessDistanceUnit / LeadDistanceUnit) * OneTurnPulseNum * wPos / 255;

            str.Append(confirmCode.ToString("X4"));
            str.Append(passCode.ToString("X4"));
            str.Append(functionCode.ToString("X4"));
            str.Append(objectChannel.ToString("X4"));
            str.Append(whoAccpet.ToString("X4"));
            str.Append(whoReply.ToString("X4"));
            str.Append(line.ToString("X8"));
            str.Append(absTime.ToString("X8"));
            str.Append(_xPos.ToString("X8"));
            str.Append(_yPos.ToString("X8"));
            str.Append(_zPos.ToString("X8"));
            str.Append(_uPos.ToString("X8"));
            str.Append(_vPos.ToString("X8"));
            str.Append(_wPos.ToString("X8"));
            str.Append(baseDout1.ToString("X2"));
            str.Append(baseDout4.ToString("X2"));
            str.Append(dac.ToString("X8"));
            str.Append(baseDout3.ToString("X2"));
            str.Append(baseDout2.ToString("X2"));
            string sendStr = str.ToString().ToLower();

            byte[] sendBuf = HexStringToByteArray(sendStr);
            socket.SendTo(sendBuf, mboxIPE);
        }


        private byte[] HexStringToByteArray(string s)
        {
            //s = s.Replace(" ", "");
            byte[] buffer = new byte[s.Length / 2];
            for (int i = 0; i < s.Length; i += 2)
            {
                buffer[i / 2] = (byte)Convert.ToByte(s.Substring(i, 2), 16);
            }
            return buffer;
        }

    }
}
