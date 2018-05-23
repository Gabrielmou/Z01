/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 * Created by Luciano Soares <lpsoares@insper.edu.br>
 * Date: 2/05/2017
 *
 * Adaptado por Rafael Corsi <rafael.corsi@insper.edu.br>
 * Date: 5/2018
 */
package vmtranslator;

import java.io.*;

import javax.swing.JOptionPane;

/**
 * Encapsula o código de leitura. Carrega as instruções na linguagem de máquina virtual a pilha,
 * analisa, e oferece acesso aos comandos.
 * Além disso, remove todos os espaços em branco e comentários.
 */
public class Parser {

    public String currentCommand = "";  // comando atual
    private BufferedReader fileReader;  // leitor de arquivo

    /** Enumerator para os tipos de comandos de Linguagem de Máquina Virtua a Pilha. */
    public static enum CommandType {
        C_ARITHMETIC,      // comandos aritméticos
        C_PUSH,            // comandos de push
        C_POP,             // comandos de pop
        C_LABEL,           // label
        C_GOTO,            // comando goto
        C_IF,              // comando if-goto
        C_FUNCTION,        // declaracao de funcao
        C_RETURN,          // retorno de funcao
        C_CALL             // chamada de funcao
    }

    /**
     * Abre o arquivo de entrada VM e se prepara para analisá-lo.
     * @param file arquivo VM que será feito o parser.
     */
    public Parser(String file) throws FileNotFoundException {
        this.fileReader = new BufferedReader(new FileReader(file));
    }

    /**
     * Carrega um comando e avança seu apontador interno para o próxima
     * linha do arquivo de entrada. Caso não haja mais linhas no arquivo de
     * entrada o método retorna "Falso", senão retorna "Verdadeiro".
     * @return Verdadeiro se ainda há instruções, Falso se as instruções terminaram.
     */
    public Boolean advance() throws IOException {
    	String line = fileReader.readLine();
    	Boolean advance = null;
    	if (line != null) {
    		advance = true;
    		this.currentCommand = line;
		}
    	else if (line == null) {
    		advance = false;
		}
    	
    	return advance;
   		
    }

    /**
     * Retorna o comando "instrução" atual (sem o avanço)
     * @return a instrução atual para ser analilisada
     */
    public String command() {
      return currentCommand;
    }

    /**
     * Retorna o tipo da instrução passada no argumento:
     *  C_PUSH para push, por exemplo push constant 1
     *  C_POP para pop, por exemplo pop constant 2
     * @param  command instrução a ser analisada.
     * @return o tipo da instrução.
     */
    public CommandType commandType(String command) {
    	String line[] = command.split(" ");
    	command = line[0];
    	if (command.startsWith("push")) {
			return CommandType.C_PUSH;
		}
    	else if (command.startsWith("pop")) {
			return CommandType.C_POP;
		}
    	else if (command.startsWith("label")) {
			return CommandType.C_LABEL;
		}
    	else if (command.startsWith("goto")) {
			return CommandType.C_GOTO;
		}
    	else if (command.startsWith("if")) {
			return CommandType.C_IF;
		}
    	else if (command.startsWith("function")) {
			return CommandType.C_FUNCTION;
		}
    	else if (command.startsWith("return")) {
			return CommandType.C_RETURN;
		}
    	else if (command.startsWith("call")) {
			return CommandType.C_CALL;
		}
    	else {
			return CommandType.C_ARITHMETIC;
		}
    	
		
    }


    /**
     * Retorna o primeiro argumento de um comando push ou pop passada no argumento.
     * Se for um comando aritmético, retorna o próprio texto do comando
     * Deve ser chamado somente quando commandType() é diferente de C_RETURN.
     * @param  command instrução a ser analisada.
     * @return somente o símbolo ou o valor número da instrução.
     */
    public String arg1(String command) {
    	String arg1 = null;
    	try{
    		
        	CommandType type = commandType(command);
        	if (type != CommandType.C_RETURN) {
        		String line[] = command.split(" ");
    			if (type == CommandType.C_ARITHMETIC) {
    				arg1 = line[0];
    				//System.out.println(arg1);
//    				return arg1;
    			}
    			else {
    				arg1 = line[1];
    				//System.out.println(arg1);
//    				return arg1;
    			}
    		}    		
    	}
    	catch (Exception e) {
    		System.out.println(e);
    		JOptionPane.showMessageDialog(null, e, "Error", JOptionPane.ERROR_MESSAGE);

    	}
		return arg1;
    }

    /**
     * Retorna o segundo argumento de um comando push ou pop passada no argumento.
     * Deve ser chamado somente quando commandType() é C_PUSH, C_POP, C_FUNCTION, ou C_CALL.
     * @param  command instrução a ser analisada.
     * @return o símbolo da instrução (sem os dois pontos).
     */
    public Integer arg2(String command) {
    	Integer arg2_int = null;
    	try {
        	CommandType type = commandType(command);
			if (type == CommandType.C_PUSH || type == CommandType.C_POP || type == CommandType.C_FUNCTION || type == CommandType.C_CALL) {
        		String line[] = command.split(" ");
        		String arg2 = line[2];
        		arg2_int = Integer.parseInt(arg2);
			}
		} catch (Exception e) {
			System.out.println(e);
    		JOptionPane.showMessageDialog(null, e, "Error", JOptionPane.ERROR_MESSAGE);
		}
		return arg2_int;
    }

    // fecha o arquivo de leitura
    public void close() throws IOException {
        fileReader.close();
    }

}
