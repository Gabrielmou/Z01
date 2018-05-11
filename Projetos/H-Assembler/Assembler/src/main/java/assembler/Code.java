/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 */



package assembler;

/**
 * Traduz mnemÃ´nicos da linguagem assembly para cÃ³digos binÃ¡rios da arquitetura Z0.
 */
public class Code {
	private static int vectorSize;
	private static int number;

    /**
     * Retorna o cÃ³digo binÃ¡rio do(s) registrador(es) que vÃ£o receber o valor da instruÃ§Ã£o.
     * @param  mnemnonic vetor de mnemÃ´nicos "instruÃ§Ã£o" a ser analisada.
     * @return Opcode (String de 4 bits) com cÃ³digo em linguagem de mÃ¡quina para a instruÃ§Ã£o.
     */
    public static String dest(String[] mnemnonic) throws InvalidDestException{
    	vectorSize = mnemnonic.length;
    	if (mnemnonic[0] != "movw" && mnemnonic[0] != "jg" 
    			&& mnemnonic[0] != "je"
    			&& mnemnonic[0] != "jge"
    			&& mnemnonic[0] != "jl"
    			&& mnemnonic[0] != "jne"
    			&& mnemnonic[0] != "jle"
    			&& mnemnonic[0] != "jmp"
    			&& mnemnonic[0] != "nop"){ //PEGANDO OS CASOS QUE NÃO SÃO MOVE MAS AINDA SÃO VÁLIDOS
        	if (mnemnonic[vectorSize - 1] == "%A") {
        		return "1000";
        	}
        	
        	else if(mnemnonic[vectorSize - 1] == "%D") {
        		return "0010";    		
        	}
        	
        	else if(mnemnonic[vectorSize - 1] == "(%A)") {
        		return "0001";
        	}
        	else {
        		throw new InvalidDestException();
        	}
    	}
    	else{
    		if (mnemnonic[0] == "nop"
    			|| mnemnonic[0] == "je"
    			|| mnemnonic[0] == "jge"
    			|| mnemnonic[0] == "jl"
    			|| mnemnonic[0] == "jne"
    			|| mnemnonic[0] == "jle"
    			|| mnemnonic[0] == "jmp") {
    			return "0000";
    		}
    		else if (vectorSize <= 3) { //SEPARANDO OS CASOS DO MOVE
	        	if (mnemnonic[vectorSize - 1] == "%A") {
	        		return "1000";
	        	}
	        	
	        	else if(mnemnonic[vectorSize - 1] == "%D") {
	        		return "0010";    		
	        	}
	        	
	        	else if(mnemnonic[vectorSize - 1] == "(%A)") {
	        		return "0001";
	        	}
    		}
    	    else if (vectorSize == 4) { //PEGANDO OS CASOS DE MOVE COM MAIS DE 4 
    	    	if (mnemnonic[vectorSize - 2] == "%D") {
    	    		if(mnemnonic[vectorSize - 1] == "(%A)") {
    	    			return "0011";
    	    		}
    	    		if(mnemnonic[vectorSize - 1] == "%S") {
    	    			return "0110";
    	    		}
    	    	}
    	    	if (mnemnonic[vectorSize - 2] == "%S") {
    	    		if(mnemnonic[vectorSize - 1] == "%D") {
    	    			return "0110";
    	    		}
    	    	}
    	    }
    		throw new InvalidDestException();
    	}
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 8 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) throws InvalidCompException{  	
    	//Jumps - Depende da segunda string, ou é %D ou %S
		if (mnemnonic[0] == "je"
    			|| mnemnonic[0] == "jge"
    			|| mnemnonic[0] == "jl"
    			|| mnemnonic[0] == "jne"
    			|| mnemnonic[0] == "jle"
    			|| mnemnonic[0] == "jmp") { 
    		if (mnemnonic[1] == "%D") {
    			return "00001100";
    		}
    		else if (mnemnonic[1] == "%S") {
    			return "01001100";
    		}
    	}
    	
    	//Movs - Nesse caso a segunda string é a determinante, a terceira é ignorada
		//Sempre que a terceira string é (%A) ela importa
		else if(mnemnonic[0] == "movw") {
			if (mnemnonic[1] == "%A") {
				return "00110000";
			}
			else if (mnemnonic[1] == "%S") {
				if (mnemnonic[2] == ("(%A)")) {
					return "11001100";
				}
				else {
					return "01001100";
				}
			}
			else if (mnemnonic[1] == "%D") {
				if (mnemnonic[2] == ("(%A)")) {
					return "10001100";
				}
				else {
					return "00001100";
				}
			}
			else if (mnemnonic[1] == "(%A)") {
				return "10110000";
			}
		}
    	
    	//Adds - Depende dos dois primeiros
		else if(mnemnonic[0] == "addw") {
			if (mnemnonic[1] == "%A") {
				if (mnemnonic[2] == "%S") {
					return "01000010";
				}
				else if(mnemnonic[2] == "%D") {
					return "00000010";
				}
			}
			else if (mnemnonic[1] == "(%A)") {
				if (mnemnonic[2] == "%S") {
					return "11000010";
				}
				else if(mnemnonic[2] == "%D") {
					return "10000010";
				}
			}
		}
    	
    	//Inc
		else if (mnemnonic[0] == "incw") {
			if (mnemnonic[1] == "%A") {
				return "00110111";
			}
			else if (mnemnonic[1] == "%S") {
				return "01011111";
			}
			else if (mnemnonic[1] == "%D") {
				return "00011111";
			}
			else if (mnemnonic[1] == "(%A)") {
				return "10110111";
			}
		}
		
		//nop
		else if (mnemnonic[0] == "nop") {
			return "00000000";
		}
		
		else {
			throw new InvalidCompException();
		}
    	
    	
 
    	
    	
    	return null;
    }

    /**
     * Retorna o cÃ³digo binÃ¡rio do mnemÃ´nico para realizar uma operaÃ§Ã£o de jump (salto).
     * @param  mnemnonic vetor de mnemÃ´nicos "instruÃ§Ã£o" a ser analisada.
     * @return Opcode (String de 3 bits) com cÃ³digo em linguagem de mÃ¡quina para a instruÃ§Ã£o.
     */
    public static String jump(String[] mnemnonic) throws InvalidJumpException{
    	vectorSize = mnemnonic.length;
		if (mnemnonic[0] == "jg") {
			return "001";
		}
		
		else if(mnemnonic[0] == "je") {
			return "010";
		}
		
		else if(mnemnonic[0] == "jge") {
			return "011";
		}
		
		else if(mnemnonic[0] == "jl") {
			return "100";
		}
		
		else if(mnemnonic[0] == "jne") {
			return "101";
		}
		
		else if(mnemnonic[0] == "jle") {
			return "110";
		}
		
		else if(mnemnonic[0] == "jmp") {
			return "111";
		}
		
		else if(mnemnonic[0] == "movw"
				|| mnemnonic[0] == "addw"
				|| mnemnonic[0] == "incw"
				|| mnemnonic[0] == "nop"
				|| mnemnonic[0] == "subw"
				|| mnemnonic[0] == "rsubw"
				|| mnemnonic[0] == "decw"
				|| mnemnonic[0] == "rsubw"
				|| mnemnonic[0] == "negw"
				|| mnemnonic[0] == "orw"
				|| mnemnonic[0] == "notw"
				|| mnemnonic[0] == "andw") {
			return "000";
		}
		else {
			throw new InvalidJumpException();
		}
    }

    /**
     * Retorna o cÃ³digo binÃ¡rio de um valor decimal armazenado numa String.
     * @param  symbol valor numÃ©rico decimal armazenado em uma String.
     * @return Valor em binÃ¡rio (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        number = Integer.parseInt(symbol);
    	StringBuilder result = new StringBuilder();
    	if(number == 0) {
    		return "000000000000000";
    	}
        while (number > 0){
            result.append(number%2);
            number = number/2;
        }
        while (result.length() < 15) {
        	result.append("0");
        }
        result = result.reverse();
        return result.toString();
    }

}
