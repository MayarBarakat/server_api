package com.example.server_api;

import android.os.Build;

import androidx.annotation.RequiresApi;

import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;

public class HexStringHandler {

    private static final char[] HEX_ARRAY = "0123456789ABCDEF".toCharArray();

    public static byte[] hexToString(String hexStr) {
        byte[] byteVals = new byte[hexStr.length() / 2];
        // StringBuilder output = new StringBuilder();
        String output = "";
        int s = 0;
        for (int i = 0; i < hexStr.length(); i += 2) {
            String str = hexStr.substring(i, i + 2);
            int strInt = Integer.parseInt(str, 16);
            if (strInt < 0) {
                strInt = strInt + 256;
            }
            char ch = (char) strInt;
            if (ch < 0) {
                ch += 256;
            }
            byteVals[s] = (byte) strInt;
            s++;

        }
        output = new String(byteVals);
        return byteVals;
    }

    public static String hexToString2(String hexStr) {
        StringBuilder output = new StringBuilder();
        for (int i = 0; i < hexStr.length(); i += 2) {
            String str = hexStr.substring(i, i + 2);
            output.append((char) Integer.parseInt(str, 16));
        }
        return output.toString();
    }

    public static String bytesToHex(byte[] bytes) {
        char[] hexChars = new char[bytes.length * 2];
        for (int j = 0; j < bytes.length; j++) {
            int v = bytes[j] & 0xFF;
            hexChars[j * 2] = HEX_ARRAY[v >>> 4];
            hexChars[j * 2 + 1] = HEX_ARRAY[v & 0x0F];
        }
        return new String(hexChars);
    }

    public static String to_String_X2(long v) {
        String s = Long.toHexString(v);
        while (s.length() < 2) {
            s = "0" + s;
        }

        if (s.length() > 2) {
            s = s.substring(s.length() - 2, s.length());
        }
        return s;
    }

    public static String to_String_X4(long v) {
        String s = Long.toHexString(v);
        while (s.length() < 4) {
            s = "0" + s;
        }

        if (s.length() > 4) {
            s = s.substring(s.length() - 4, s.length());
        }

        return s;
    }

    public static String to_String_X8(long v) {
        String s = Long.toHexString(v);
        while (s.length() < 8) {
            s = "0" + s;
        }

        if (s.length() > 8) {
            s = s.substring(s.length() - 8, s.length());
        }
        return s;
    }

    public static String to_String_X16(long v) {
        String s = Long.toHexString(v);
        while (s.length() < 16) {
            s = "0" + s;
        }

        if (s.length() > 16) {
            s = s.substring(s.length() - 16, s.length());
        }
        return s;
    }

    public static byte[] stringToCharArray(String hex) {
        int l = hex.length();
        byte[] data = new byte[l / 2];
        for (int i = 0; i < l; i += 2) {
            data[i / 2] = (byte) ((Character.digit(hex.charAt(i), 16) << 4)
                    + Character.digit(hex.charAt(i + 1), 16));
        }
        return data;
    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    public static String getTimeHexString(LocalDateTime localTime) {
        String s = "";
        int seconds = localTime.getSecond();
        int minutes = localTime.getMinute();
        int Hours = localTime.getHour();
        int days = localTime.getDayOfMonth();
        int months = localTime.getMonthValue();
        int years = localTime.getYear() - 2000;
        s += to_String_X2(years);
        s += to_String_X2(months);
        s += to_String_X2(days);
        s += to_String_X2(Hours);
        s += to_String_X2(minutes);
        s += to_String_X2(seconds);

        return s;
    }

    public static String stringToHexArray(String S) {
        String s = "";
        byte[] sbytes = S.getBytes(StandardCharsets.UTF_8);
        for (int i = 0; i < S.length(); i++) {
            s += to_String_X2(sbytes[i]);
        }

        return s;
    }

    public static String calcChecksum(int length, int command, int direction, int year, int month, int day, int hour) {
        int header = 255;    // 0xFF
        int checksum = header + (length & 255) + (direction & 255) + ((length >> 8) & 255) + (command & 255) + ((command >> 8) & 255) + year + month + day + hour;
        checksum &= 0xffff;
        String checkSumStr = to_String_X2(checksum);
        return checkSumStr;
    }
}
