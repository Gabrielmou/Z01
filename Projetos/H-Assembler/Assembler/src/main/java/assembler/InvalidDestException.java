package assembler;


public class InvalidDestException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public InvalidDestException() {	}
	public InvalidDestException(String message) {
		super(message);
	}
}