package assembler;


public class InvalidJumpException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public InvalidJumpException() {	}
	public InvalidJumpException(String message) {
		super(message);
	}
}
