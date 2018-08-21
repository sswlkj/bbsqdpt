package cc.mrbird.common.exception;

public class LimitAccessException extends Exception {

    public static String value = "";

    public LimitAccessException(String message) {
        super(message);
        value = message;
    }
}