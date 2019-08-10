/**
 * here all the string utility operation will be done
 */
package com.cits.lms.utils;

public class StringUtil {

    public static String toCommaSeperatedString(Object[] items) {
        StringBuilder sb = new StringBuilder();

        for (Object item : items) {
            if(items!=null)
                sb.append(item).append(",");
        }

        if (sb.length() > 0) {
            sb.deleteCharAt(sb.length() - 1);
        }
        System.out.println("----------- string item: "+sb.toString());
        return sb.toString();
    }
}
