/**
 * Curso: Elementos de Sistemas
 * Arquivo: SymbolTable.java
 */

package assembler;
import java.util.Hashtable;
import java.util.Set;
/**
 * Mantém uma tabela com a correspondência entre os rótulos simbólicos e endereços numéricos de memória.
 */
public class SymbolTable {

    /**
     * Cria a tabela de símbolos.
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
     * Insere uma entrada de um símbolo com seu endereço numérico na tabela de símbolos.
     * @param  symbol símbolo a ser armazenado na tabela de símbolos.
     * @param  address símbolo a ser armazenado na tabela de símbolos.
     */
    public void addEntry(String symbol, int address) {
    	sT.put(symbol,address);

    }

    /**
     * Confere se o símbolo informado já foi inserido na tabela de símbolos.
     * @param  symbol símbolo a ser procurado na tabela de símbolos.
     * @return Verdadeiro se símbolo está na tabela de símbolos, Falso se não está na tabela de símbolos.
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
     * Retorna o valor númerico associado a um símbolo já inserido na tabela de símbolos.
     * @param  symbol símbolo a ser procurado na tabela de símbolos.
     * @return valor numérico associado ao símbolo procurado.
     */
    public Integer getAddress(String symbol) {
    	return (int)(sT.get(symbol));
    }

}
