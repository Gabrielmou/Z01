/**
 * Curso: Elementos de Sistemas
 * Arquivo: Assemble.java
 * Created by Luciano <lpsoares@insper.edu.br> 
 * Date: 04/02/2017
 *
 * 2018 @ Rafael Corsi
 */

package assembler;

import java.io.*;
import java.util.*;

import assembler.Parser.CommandType;

/**
 * Faz a geração do código gerenciando os demais módulos
 */
public class Assemble {
    private String inputFile;              // arquivo de entrada nasm
    File hackFile = null;                  // arquivo de saída hack
    private PrintWriter outHACK = null;    // grava saida do código de máquina em Hack
    boolean debug;                         // flag que especifica se mensagens de debug são impressas
    private SymbolTable table;             // tabela de símbolos (variáveis e marcadores)
    private Parser parser;
    
    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public Assemble(String inFile, String outFileHack, boolean debug) throws IOException {
        this.debug = debug;
        inputFile  = inFile;
        hackFile   = new File(outFileHack);                      // Cria arquivo de saída .hack
        outHACK    = new PrintWriter(new FileWriter(hackFile));  // Cria saída do print para
                                                                 // o arquivo hackfile
        table      = new SymbolTable();                      // Cria e inicializa a tabela de simbolos
    	parser 	   = new Parser(inputFile);

    }

    /**
     * primeiro passo para a construção da tabela de símbolos de marcadores (labels)
     * varre o código em busca de Símbolos novos Labels e Endereços de memórias
     * e atualiza a tabela de símbolos com os endereços.
     *
     * Dependencia : Parser, SymbolTable
     */
    public void fillSymbolTable() throws FileNotFoundException, IOException {
    	String command = null;
    	CommandType commandType = null;
    	String symbol = null;
    	String label = null;
    	String[] instruction = null;
    	int address = 16;
    	
    	while (parser.advance()) {
    		command = parser.command();
    		commandType = parser.commandType(command);
    		if (commandType == CommandType.A_COMMAND) {
    			symbol = parser.symbol(command);
			}
    		else if (commandType == CommandType.L_COMMAND) {
				label = parser.label(command);
			}
    		else if (commandType == CommandType.C_COMMAND) {
				instruction = parser.instruction(command);
			}
    		
    		if (!table.contains(symbol)){
    			table.addEntry(symbol, address);
    		}
    		address ++;
    	}
    	
    }

    /**
     * Segundo passo para a geração do código de máquina
     * Varre o código em busca de instruções do tipo A, C
     * gerando a linguagem de máquina a partir do parse das instruções.
     *
     * Dependencias : Parser, Code
     */
    public void generateMachineCode() throws FileNotFoundException, IOException{
        Parser newParser = new Parser(inputFile); //Abre o arquivo e aponta para o come�o
        String command = null;
    	CommandType commandType = null;
    	String symbol = null;
    	String[] instruction = null;
    	String machineCode = "";
    	Code code = new Code();
        while (newParser.advance()) {
    		command = newParser.command();
    		commandType = newParser.commandType(command);
    		if (commandType == CommandType.A_COMMAND) {
    			symbol = newParser.symbol(command);
    			machineCode = "0" + code.toBinary(symbol);
    		}
    	
    		else if (commandType == CommandType.C_COMMAND) {
				
			}
    		
    	}

    }

    /**
     * Fecha arquivo de escrita
     */
    public void close() throws IOException {
        if(outHACK!=null) {
            outHACK.close();
        }
    }

    /**
     * Remove o arquivo de .hack se algum erro for encontrado
     */
    public void delete() {
        try{
            if(hackFile!=null) {
                hackFile.delete();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

}
