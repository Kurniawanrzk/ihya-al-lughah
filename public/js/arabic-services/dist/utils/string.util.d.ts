/**
 * Sets the character at a specified index in a string.
 *
 * @param {string} str - The input string.
 * @param {number} index - The index at which to set the character.
 * @param {string} chr - The character to set at the specified index.
 * @returns {string} A new string with the character set at the specified index.
 */
export declare function setCharAt(str: string, index: number, chr: string): string;
/**
 * Calculates a similarity score between two strings, potentially based on their edit distance.
 *
 * @param {string} s1 - The first string to compare.
 * @param {string} s2 - The second string to compare.
 * @returns {number} A similarity score representing how similar the two strings are. The score is between 0 and 1.
 */
export declare function similarityScore(s1: string, s2: string): number;
