package datapro.eibs.master;

import java.util.regex.Pattern;

/**
 * Matches strings against <code>?</code>/<code>*</code> wildcard expressions.
 * Multiple expressions can be separated with a colon (:). In this case the
 * expression matches if at least one part matches.
 */

public class WildcardMatcher {

	private final String expression;
	private Pattern pattern;

	/**
	 * Creates a new matcher with the given expression.
	 * 
	 * @param expression
	 *            wildcard expressions
	 */
	public WildcardMatcher(String expression) {
		this.expression = expression;
	}
	
	private void compile(boolean multipart) {
		if (multipart) {
			final String[] parts = expression.split("\\:");
			//final StringBuilder regex = new StringBuilder(expression.length() * 2);
			final StringBuffer regex = new StringBuffer(expression.length() * 2);
			
			boolean next = false;
			for (int i = 0; i < parts.length; i++) {
				if (next) {
					regex.append('|');
				}
				regex.append('(').append(toRegex(parts[i])).append(')');
				next = true;
			}
			pattern = Pattern.compile(regex.toString());
		} else {
			pattern = Pattern.compile(toRegex(expression).toString());
		}
	}

	private static CharSequence toRegex(String expression) {
		//final StringBuilder regex = new StringBuilder(expression.length() * 2);
		final StringBuffer regex = new StringBuffer(expression.length() * 2);
		char[] chars = expression.toCharArray();
		for (int i = 0; i < chars.length; i++) {
			switch (chars[i]) {
				case '?':
					regex.append(".?");
					break;
				case '*':
					regex.append(".*");
					//regex.append(".*?");
					break;
				default:
					regex.append(Pattern.quote(String.valueOf(chars[i])));
					break;
			}
		}
		return regex;
	}
	
	private boolean matchesImpl_2(String text) {
		if (pattern == null) 
			compile(expression.indexOf("\\:") != -1);
		return pattern.matcher(text).matches();
	}
	
	private boolean matchesImpl_1(String text) {
		// add sentinel so don't need to worry about *'s at end of pattern
		text += '\0';
		String expression = this.expression + '\0';

		int N = expression.length();

		boolean[] states = new boolean[N + 1];
		boolean[] old = new boolean[N + 1];
		old[0] = true;

		for (int i = 0; i < text.length(); i++) {
			char c = text.charAt(i);
			states = new boolean[N + 1]; // initialized to false
			for (int j = 0; j < N; j++) {
				char p = expression.charAt(j);

				// hack to handle *'s that match 0 characters
				if (old[j] && (p == '*'))
					old[j + 1] = true;

				if (old[j] && (p == c))
					states[j + 1] = true;
				if (old[j] && (p == '.'))
					states[j + 1] = true;
				if (old[j] && (p == '*'))
					states[j] = true;
				if (old[j] && (p == '*'))
					states[j + 1] = true;
			}
			old = states;
		}
		return states[N];
	}
	
	/**
	 * 
	 * Matches the given string against the expressions of this matcher.
	 * 
	 * @param text string to test
	 * 
	 * @return <code>true</code>, if the expression matches
	 */	
	public boolean matches(String text) {
		return matchesImpl_1(text);
	}

}
