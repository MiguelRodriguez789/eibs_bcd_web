/*
 * Created on Feb 23, 2010
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package datapro.eibs.tools.io;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import datapro.eibs.beans.DataPatterns;

/**
 * @author Catalina
 * 
 * TODO To change the template for this generated type comment go to Window -
 * Preferences - Java - Code Style - Code Templates
 */
public class ReportReaderAutomata extends ReportReader {
	
	private static final char SPACE = '0';
	private static final char SYMBOL = '1';
	private static final char LETTER = '2';
	private static final char DIGIT = '3';
	private static final char DOT_COLON = '4';

	private int[][] automata = new int[21][5];
	
	private Map resultingPatterns;

	/**
	 * PDFTextParser Constructor
	 *  
	 */
	public ReportReaderAutomata(BufferedReader reader) {
		super(reader);
		
		for (int i = 0; i < 20; i++) {
			for (int j = 0; j < 5; j++) {
				automata[i][j] = -1;
			}
		}

		automata[0][0] = 0;
		automata[0][1] = 9;
		automata[0][2] = 14;
		automata[0][3] = 1;
		automata[0][4] = 9;
		automata[1][0] = 12;
		automata[1][1] = 9;
		automata[1][2] = 2;
		automata[1][3] = 7;
		automata[1][4] = 7;
		automata[2][0] = 3;
		automata[4][0] = 5;
		automata[4][1] = 18;
		automata[4][2] = 4;
		automata[4][4] = 4;
		automata[5][0] = 6;
		automata[5][2] = 4;
		automata[7][0] = 3;
		automata[7][1] = 9;
		automata[7][3] = 7;
		automata[7][4] = 19;
		automata[8][0] = 3;
		automata[8][2] = 4;
		automata[9][0] = 10;
		automata[9][1] = 9;
		automata[9][2] = 17;
		automata[9][3] = 11;
		automata[11][0] = 13;
		automata[11][1] = 9;
		automata[11][3] = 11;
		automata[14][0] = 8;
		automata[14][1] = 9;
		automata[14][2] = 4;
		automata[14][3] = 15;
		automata[14][4] = 9;
		automata[15][0] = 16;
		automata[15][3] = 14;
		automata[17][0] = 5;
		automata[17][1] = 9;		
		automata[17][2] = 4;
		automata[17][4] = 9;
		automata[18][0] = 6;
		automata[18][1] = 18;
		automata[18][2] = 4;
		automata[18][3] = 20;
		automata[18][4] = 18;
		automata[19][3] = 7;
		automata[20][0] = 5;
		automata[20][1] = 18;
		automata[20][2] = 4;
		automata[20][3] = 20;
		
		
	}
	
	/**
	 * classifyToken: Classifies the character o either 4 of the categories
	 * considered in the tokenizer
	 * 
	 * @param a
	 * @return 
	 * 	' ' = The current character is and space. 
	 * 	'0' = The current character is a letter 
	 *  '1' = The current character is a number 
	 *  '2' = The current character is a symbol 
	 *  '3' = The current character is a dot or a colon
	 */
	private char classifyToken(char a) {
		if (Character.isDigit(a)) {
			return DIGIT;
		} else if (a == ' ') {
			return SPACE;
		} else if (Character.isLetter(a)) {
			return LETTER;
		} else if (a == '.' || a == ',') {
			return DOT_COLON;
		} else {
			return SYMBOL;
		}
	}

	protected CharSequence[] formatBody(String line) {
		//The body Lines
		DataPatterns pt = new DataPatterns();
		formatBodyData(line, pt);
		if(pt.getColumnCount() == 0){
			return toCells(" ");
		} else {
			int index = findPatternInListWithIndex(pt);
			
			if (index != -1){
				DataPatterns definitivePattern = (DataPatterns)resultingPatterns.get(String.valueOf(index));
				pt.setPattern(definitivePattern.getPattern());
			} else {
				pt.setWords();
			}
			return pt.newCells();
		}
	}
	
	protected void bufferHeader() throws IOException {
		List selectedPatterns = new ArrayList();
		int selectedIndex = 0;
		
		String currentLine = "";
		do {
			if (getCurrentPageNumber() > MAXIMUM_HEADER_PAGES){
				break;
			}
			while((currentLine = readLine())!=null){
				if (!onHeader()) {
					//The body Lines
					DataPatterns data = new DataPatterns();
					formatBodyData(currentLine, data);
					
					if (data.getColumnCount() != 0){
						selectedPatterns.add(selectedIndex, data);
						selectedIndex ++;
					}
				}
			}
		} while (nextPage());
		
		searchColumnPatterns(selectedPatterns);
	}

	protected CharSequence[] formatHeader(String headerLine) {
		List columns = new ArrayList();
		//char [] lineChars = headerLine.toCharArray();
		char[] word = new char[headerLine.length()];
		
		
		int temp = 0;//lex();
		int estado = 0;
		int i = 0;
		while (i < headerLine.length()) {
			
			temp = Integer.parseInt(Character.toString(classifyToken(headerLine.charAt(i))));
			if (automata[estado][temp] != -1) {
				estado = automata[estado][temp];
				word[i] = headerLine.charAt(i);
			} else {
				columns.add(new String(word));
				word = new char[headerLine.length()];
				estado = 0;
				i--;
			}
			i++;
			
		}
		return (CharSequence[]) columns.toArray();
	}
	
	/**
	 * 
	 * @return
	 */
	private String formatBodyData(String currentLine, DataPatterns pattern) {
		List columnsLength = new ArrayList();
		//char previusChar = data[0];
		int countChars = 0;
		StringBuffer buff = new StringBuffer();
		char [] lineChars = currentLine.toCharArray();
		char[] word = new char[currentLine.length()+1];
		//word[0] = '\'';
				
		int temp = 0;//lex();
		int estado = 0;
		int i = 0;
		
		int columnCount = 0;
		while (i < lineChars.length) {
			
			temp = Integer.parseInt(Character.toString(classifyToken(lineChars[i])));		
			if (automata[estado][temp] != -1) {
				estado = automata[estado][temp];
				word[i] = lineChars[i];
				countChars++;
								
				//last Column
				if(i == lineChars.length - 1){
					String newWord = new String(word);
					if(columnsLength != null){					
						columnsLength.add(Integer.toString(countChars));					
					}
					buff.append(newWord);
					columnCount ++;
					
					
				}
			} else {
				//word[i] = lineChars[i];
				String newWord = new String(word);				
	
				if(columnsLength != null){					
					columnsLength.add(Integer.toString(countChars));					
				}
				buff.append(newWord);
				buff.append(',');
				word = new char[currentLine.length()+1];
				word[0] = '\'';
				estado = 0;
				columnCount ++;
				countChars = 0;
				i--;

			}
			i++;
			
		}
		buff.append('\n');
		
		pattern.setColumnCount(columnCount);
		pattern.setColumnLengths(columnsLength);
		pattern.setLineData(currentLine);
		pattern.setWords();

		return buff.toString();
	}
	

	/**
	 * searchColumnPatterns
	 * 
	 * @param filteredData
	 * @return
	 */
	private void searchColumnPatterns(List filteredData) {
		
		int sampleSize = filteredData.size();
		if(resultingPatterns == null)
			resultingPatterns = new HashMap();
		int i = 0;		
		
		Map resultingMap = new HashMap();
		while (i < sampleSize){
			DataPatterns currentData = (DataPatterns)filteredData.get(i);
			List columns = currentData.getColumnLengths();
			int j = i + 1;
			while ( j < sampleSize ){
				DataPatterns nextData = (DataPatterns)filteredData.get(j);
				resultingMap = new HashMap();
				if(currentData.matchPattern(nextData, resultingMap)){
					if(!findPatternInList(resultingPatterns, resultingMap)){
						currentData.setPattern(resultingMap);
						if(!matchesAnyIncluded(currentData)){
							resultingPatterns.put(String.valueOf(currentData.getColumnCount()), currentData);
						}						
					}					
				}
				j++;
			}			
			i++;
		}
	}
	
		
	/**
	 * 
	 * @param array
	 * @param value
	 * @param size
	 * @return
	 */
	private boolean findValueInArray(int [] array, int value, int size){
		boolean result = false;
		for(int i =0; i<size; i++){
			if(array[i] == value){
				result =  true;
				break;
			}
		}
		return result;
		
	}
	
	/**
	 * 
	 * @param list
	 * @param pattern
	 * @return
	 */
	private boolean findPatternInList(Map list, Map pattern){
		boolean result = false;
		if(list.containsKey(String.valueOf(pattern.size()))){
			DataPatterns defData = (DataPatterns)list.get(String.valueOf(pattern.size()));
			Map currentPattern = defData.getPattern();
			if(currentPattern.size() == pattern.size()){
				int j=0;
				int [] xy = (int [])currentPattern.get(DataPatterns.COLUMN + 0);
				int [] xyCompare = (int [])pattern.get(DataPatterns.COLUMN + 0);
				while ((xy[0] == xyCompare[0])&&(xy[1] == xyCompare[1]) && j < currentPattern.size()){
					j++;
				}				
				
				if(j >= currentPattern.size()){
					result =  true;					
				}
			}
			
		}
		return result;		
	}
	
	/**
	 * 
	 * @param list
	 * @param pattern
	 * @return
	 */
	private boolean matchesAnyIncluded(DataPatterns pattern){
		boolean result = false;
		Map looking = pattern.getPattern();
		
		Set keySet = resultingPatterns.keySet();
		int i = 0;
		Map resultingPattern;
		for(Iterator iter = keySet.iterator(); iter.hasNext();){			
			int key = Integer.parseInt((String)iter.next());
		
			if(Math.abs(key - pattern.getColumnCount()) < 2){
				DataPatterns defData = (DataPatterns)resultingPatterns.get(String.valueOf(key));
				resultingPattern = new HashMap();
				if(defData.matchPattern(pattern, resultingPattern)){
					resultingPatterns.remove(String.valueOf(key));
					resultingPatterns.put(String.valueOf(resultingPattern.size()), defData);
					result = true;
					break;
				}
			}
		}
		return result;		
	}
	
	/**
	 * 
	 * @param list
	 * @param pattern
	 * @return
	 */
	private int findPatternInListWithIndex(DataPatterns pattern){
		int result = -1;
		Map looking = pattern.getPattern();
		Set keySet = resultingPatterns.keySet();
		for(Iterator iter = keySet.iterator(); iter.hasNext();){
			int key = Integer.parseInt((String)iter.next());
			if(key == pattern.getColumnCount()){
				result =  key;
			} else {
				if(Math.abs(key - pattern.getColumnCount()) <= 2){
					DataPatterns definitivePattern = (DataPatterns)resultingPatterns.get(String.valueOf(key));
					if (pattern.matchPattern(definitivePattern, new HashMap())){
						result = key;
					}
				}
			}
		}
		return result;
		
	}
		
}