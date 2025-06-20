package org.litepal.exceptions;

/* loaded from: classes.dex */
public class ParseConfigurationFileException extends RuntimeException {
    public static final String CAN_NOT_FIND_LITEPAL_FILE = "litepal.xml file is missing. Please ensure it under assets folder.";
    public static final String FILE_FORMAT_IS_NOT_CORRECT = "can not parse the litepal.xml, check if it's in correct format";
    public static final String IO_EXCEPTION = "IO exception happened";
    public static final String PARSE_CONFIG_FAILED = "parse configuration is failed";
    private static final long serialVersionUID = 1;

    public ParseConfigurationFileException(String str) {
        super(str);
    }
}
