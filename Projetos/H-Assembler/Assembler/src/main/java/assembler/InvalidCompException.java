package assembler;

public class InvalidCompException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public InvalidCompException() {	}
	public InvalidCompException(String message) {
		super(message);
	}
}