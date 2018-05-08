/**
 * Curso: Elementos de Sistemas
 * Arquivo: SymbolTable.java
 */

package assembler;
import java.util.Hashtable;
import java.util.Set;
/**
 * Mant�m uma tabela com a correspond�ncia entre os r�tulos simb�licos e endere�os num�ricos de mem�ria.
 */
public class SymbolTable {

    /**
     * Cria a tabela de s�mbolos.
     */
	
	/*Symbol Table as ST*/
	public Hashtable <String, Integer> sT = new Hashtable<String,Integer>();
	
	
	
    public SymbolTable() {
    	   	
    	sT.put ("R0", 0);
    	sT.put ("R1", 1);
    	sT.put ("R2", 2);
    	sT.put ("R3", 3);
    	sT.put ("R4", 4);
    	sT.put ("R5", 5);
    	sT.put ("R6", 6);
    	sT.put ("R7", 7);
    	sT.put ("R8", 8);
    	sT.put ("R9", 9);
    	sT.put ("R10", 10);
    	sT.put ("R11", 11);
    	sT.put ("R12", 12);
    	sT.put ("R13", 13);
    	sT.put ("R14", 14);
    	sT.put ("R15", 15);
    	sT.put ("SP", 0);
    	sT.put ("LCL", 1);
    	sT.put ("ARG", 2);
    	sT.put ("THIS", 3);
    	sT.put ("THAT", 4);
    	sT.put ("SCREEN", 16384) ;
    	sT.put ("LCD", 21184);
    	sT.put ("SW", 21185) ;
    }

    /**
     * Insere uma entrada de um s�mbolo com seu endere�o num�rico na tabela de s�mbolos.
     * @param  symbol s�mbolo a ser armazenado na tabela de s�mbolos.
     * @param  address s�mbolo a ser armazenado na tabela de s�mbolos.
     */
    public void addEntry(String symbol, int address) {
    	sT.put(symbol,address);

    }

    /**
     * Confere se o s�mbolo informado j� foi inserido na tabela de s�mbolos.
     * @param  symbol s�mbolo a ser procurado na tabela de s�mbolos.
     * @return Verdadeiro se s�mbolo est� na tabela de s�mbolos, Falso se n�o est� na tabela de s�mbolos.
     */
    public Boolean contains(String symbol) {
    	
    	boolean onTable = false;
    	
    	
    	Set<String> chave = sT.keySet();
    	for (String key:chave){
    		if (key.equals(symbol)){
    			onTable = true;
    		}
    	}
    	
    	return onTable;
    }

    /**
     * Retorna o valor n�merico associado a um s�mbolo j� inserido na tabela de s�mbolos.
     * @param  symbol s�mbolo a ser procurado na tabela de s�mbolos.
     * @return valor num�rico associado ao s�mbolo procurado.
     */
    public Integer getAddress(String symbol) {
    	return (int)(sT.get(symbol));
    }

}
