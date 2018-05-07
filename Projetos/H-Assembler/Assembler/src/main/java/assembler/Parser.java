/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 */

package assembler;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

/**
 * Encapsula o código de leitura. Carrega as instruções na linguagem assembly,
 * analisa, e oferece acesso as partes da instrução  (campos e símbolos).
 * Além disso, remove todos os espaços em branco e comentários.
 */
public class Parser {

    BufferedReader reader = null;
	String command;

    /** Enumerator para os tipos de comandos do Assembler. */
    public enum CommandType {
        A_COMMAND,      // comandos LEA, que armazenam no registrador A
        C_COMMAND,      // comandos de calculos
        L_COMMAND       // comandos de Label (símbolos)
    }

    /**
     * Abre o arquivo de entrada NASM e se prepara para analisá-lo.
     * @param file arquivo NASM que será feito o parser.
     */
    public Parser(String file) {
    	
    	try {
    		FileReader arq = new FileReader(file);
		    BufferedReader reader = new BufferedReader(arq);
		}

		// Trata o erro FileNotFoundException, se ele acontecer.
		catch(FileNotFoundException exception) {
			System.out.println(exception);
		}

		// Trata o erro IOException, se ele acontecer.
        catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

    /**
     * Carrega uma instrução e avança seu apontador interno para o próxima
     * linha do arquivo de entrada. Caso não haja mais linhas no arquivo de
     * entrada o método retorna "Falso", senão retorna "Verdadeiro".
     * @return Verdadeiro se ainda há instruções, Falso se as instruções terminaram.
     */
    public Boolean advance() {
        try {
            String line;
			line = reader.readLine();
            if (line != null) {
                return true;
            }
            else {
            	return false;
            }
        }
		catch(IOException exception) {
			System.out.println(exception);
		}
        return false;
    }

    /**
     * Retorna o comando "intrução" atual (sem o avanço)
     * @return a instrução atual para ser analilisada
     */
    public String command() {
        try {
			command = reader.readLine();
			for(int x = 0; x < command.length();x++){
    		    if (command.charAt(x) == ';'){
    			    command = command.substring(0, x);
                }
			}
		} 
        catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
        }
    	return command;
    }

    /**
     * Retorna o tipo da instrução passada no argumento:
     *  A_COMMAND para leaw, por exemplo leaw $1,%A
     *  L_COMMAND para labels, por exemplo Xyz: , onde Xyz é um símbolo.
     *  C_COMMAND para todos os outros comandos
     * @param  command instrução a ser analisada.
     * @return o tipo da instrução.
     */
    public CommandType commandType(String command) {
        if (command.substring(0,3) == "leaw"){
    		return CommandType.A_COMMAND;
        }
        else if (command.charAt(command.length() - 1) == ':'){
            return CommandType.L_COMMAND;
        }
        else{
            return CommandType.C_COMMAND;
        }
    }

    /**
     * Retorna o símbolo ou valor numérico da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é A_COMMAND.
     * @param  command instrução a ser analisada.
     * @return somente o símbolo ou o valor número da instrução.
     */
    public String symbol(String command) {
        int marcador = 0;
        String symbol = "";
        if (commandType(command) == CommandType.A_COMMAND){
             for(int x = 0; x < command.length();x++){
                if (command.charAt(x) == '$'){
                    marcador = x;
                }
    		    else if (command.charAt(x) == ','){
    			    symbol = command.substring(marcador, x);
                }
            }
        }        
    	return symbol;
    }

    /**
     * Retorna o símbolo da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é L_COMMAND.
     * @param  command instrução a ser analisada.
     * @return o símbolo da instrução (sem os dois pontos).
     */
    public String label(String command) {
        String label = "";
        if (commandType(command) == CommandType.L_COMMAND){
            label = command.substring(0,command.length()-2);
        }
    	return label;
    }

    /**
     * Separa os mnemônicos da instrução fornecida em tokens em um vetor de Strings.
     * Deve ser chamado somente quando CommandType () é C_COMMAND.
     * @param  command instrução a ser analisada.
     * @return um vetor de string contento os tokens da instrução (as partes do comando).
     */
   public String[] instruction(String command) {
        if (commandType(command) == CommandType.C_COMMAND){
            String[] instruction = new String[3];
            command = command.replace(',',' ');
            instruction = command.split(" ");
        }
        return instruction;
   }
}
