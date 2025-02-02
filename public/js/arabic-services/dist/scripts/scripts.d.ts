import { type OldArabicOptions } from '../options';
/**
 * Remove all tashkeel from text
 * @param text string to remove tashkeel from
 * @returns string without tashkeel
 * @example
 *   Input: "الخَيْلُ وَاللّيْلُ وَالبَيْداءُ تَعرِفُني"
 *   Output: "الخيل والليل والبيداء تعرفني"
 */
export declare function removeTashkeel(text: string): string;
/**
 * Remove all dots & tashkeel from text
 * @param sentence string to convert to old arabic
 * @param option
 * @returns string in old arabic
 * @example
 *   Input: "الخَيْلُ وَاللّيْلُ وَالبَيْداءُ تَعرِفُني"
 *   Output: "الحىل واللىل والٮىدا ٮعرڡٮى"
 */
export declare function toOldArabic(sentence: string, option?: OldArabicOptions): string;
export declare function toOldArabicAndTashfeerBannedWords(sentence: string, levelOfTashfeer?: number): string;
/**
 * Remove all tatweel from text
 * @param text string to remove tatweel from
 * @returns string without tatweel
 * @example
 *   Input: "رائـــــــع"
 *   Output: "رائع"
 */
export declare function removeTatweel(text: string): string;
/**
 * Converts a word to its pronounced letter representations based on PRONOUNCED_LETTERS.
 * @param {string} word - The word to convert.
 * @returns {string} The word with pronounced letters separated by spaces.
 */
export declare function wordToLetters(word: string): string;
/**
 * Removes predefined affixes (prefixes and suffixes) from an Arabic text if words start or end with those affixes.
 * This function is designed specifically for processing Arabic text, where certain affixes might need to be removed
 * for linguistic, stylistic, or morphological reasons.
 *
 * @param {string} text - The Arabic text from which the affixes are to be removed.
 * @returns {string} The text after removing any matching affixes from each word. Returns the original text trimmed if no affix matches are found.
 */
export declare function removeArabicAffixes(text: string): string;
/**
 * Performs tashfeer encryption on a given sentence.
 * @param {string} sentence - The input sentence to be encrypted.
 * @returns {string} The encrypted sentence.
 */
export declare function tashfeer(sentence: string, levelOfTashfeer?: number): string;
/**
 * Performs tashfeer encryption on a given sentence, but only for words that are considered "banned" words.
 * Banned words are determined based on a predefined similarity ratio.
 *
 * @param {string} sentence - The input sentence to be encrypted.
 * @param {number} [levelOfTashfeer=2] - The encryption level (default is 2).
 * @returns {string} The encrypted sentence with tashfeer applied to banned words.
 */
export declare function tashfeerBannedWords(sentence: string, levelOfTashfeer?: number): string;
