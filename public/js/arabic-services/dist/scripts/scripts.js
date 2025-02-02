"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.tashfeerBannedWords = exports.tashfeer = exports.removeArabicAffixes = exports.wordToLetters = exports.removeTatweel = exports.toOldArabicAndTashfeerBannedWords = exports.toOldArabic = exports.removeTashkeel = void 0;
var constants_1 = require("../constants");
var arabic_letters_1 = require("../constants/arabic-letters");
var options_1 = require("../options");
var utils_1 = require("../utils");
/**
 * Remove all tashkeel from text
 * @param text string to remove tashkeel from
 * @returns string without tashkeel
 * @example
 *   Input: "الخَيْلُ وَاللّيْلُ وَالبَيْداءُ تَعرِفُني"
 *   Output: "الخيل والليل والبيداء تعرفني"
 */
function removeTashkeel(text) {
    return text
        .trim()
        .replace(new RegExp('[' + constants_1.TASHKEEL.join('') + ']', 'g'), '')
        .replace(/ٱ/g, 'ا');
}
exports.removeTashkeel = removeTashkeel;
/**
 * Remove all dots & tashkeel from text
 * @param sentence string to convert to old arabic
 * @param option
 * @returns string in old arabic
 * @example
 *   Input: "الخَيْلُ وَاللّيْلُ وَالبَيْداءُ تَعرِفُني"
 *   Output: "الحىل واللىل والٮىدا ٮعرڡٮى"
 */
function toOldArabic(sentence, option) {
    if (option === void 0) { option = {}; }
    var _a = (0, options_1.fillDefaultOptions)(option), replaceMidNoonWithBah = _a.replaceMidNoonWithBah, replaceMidYahWithBah = _a.replaceMidYahWithBah;
    sentence = removeTashkeel(sentence.trim());
    var newSentence = '';
    for (var letter = 0; letter < sentence.length; letter++) {
        // if letter is not Arabic letter => append to newSentence
        if (!constants_1.ARABIC_DOTLESS_DICT.hasOwnProperty(sentence[letter])) {
            newSentence += sentence[letter];
        }
        // Handle 'ن' Issue:
        // if 'ن' is not last character && next character is Arabic letter or 'ـ'
        // then replace it with 'ب' corresponding dotless letter => 'ٮ'
        else if (replaceMidNoonWithBah &&
            sentence[letter] == 'ن' &&
            letter + 1 < sentence.length &&
            (constants_1.ARABIC_DOTLESS_DICT.hasOwnProperty(sentence[letter + 1]) || sentence[letter + 1] == 'ـ')) {
            newSentence += constants_1.ARABIC_DOTLESS_DICT['ب'];
        }
        // Handle 'ي' Issue
        // if 'ي' is not last character && next character is Arabic letter or 'ـ'
        // then replace it with 'ب' corresponding dotless letter => 'ٮ'
        else if (replaceMidYahWithBah &&
            sentence[letter] == 'ي' &&
            letter + 1 < sentence.length &&
            (constants_1.ARABIC_DOTLESS_DICT.hasOwnProperty(sentence[letter + 1]) || sentence[letter + 1] == 'ـ')) {
            newSentence += constants_1.ARABIC_DOTLESS_DICT['ب'];
        }
        else {
            // if letter is Arabic letter => append corresponding dotless letter to newSentence
            newSentence += constants_1.ARABIC_DOTLESS_DICT[sentence[letter]];
        }
    }
    return newSentence;
}
exports.toOldArabic = toOldArabic;
function toOldArabicAndTashfeerBannedWords(sentence, levelOfTashfeer) {
    if (levelOfTashfeer === void 0) { levelOfTashfeer = 2; }
    var new_sentence = '';
    var words = sentence.trim().split(' ');
    for (var _i = 0, words_1 = words; _i < words_1.length; _i++) {
        var word = words_1[_i];
        if (checkIfBannedWord(word)) {
            new_sentence += tashfeerHandler(word, levelOfTashfeer) + ' ';
        }
        else {
            new_sentence += toOldArabic(word) + ' ';
        }
    }
    return new_sentence.trim();
}
exports.toOldArabicAndTashfeerBannedWords = toOldArabicAndTashfeerBannedWords;
/**
 * Remove all tatweel from text
 * @param text string to remove tatweel from
 * @returns string without tatweel
 * @example
 *   Input: "رائـــــــع"
 *   Output: "رائع"
 */
function removeTatweel(text) {
    return text.trim().replace(/ـ/g, '');
}
exports.removeTatweel = removeTatweel;
/**
 * Converts a word to its pronounced letter representations based on PRONOUNCED_LETTERS.
 * @param {string} word - The word to convert.
 * @returns {string} The word with pronounced letters separated by spaces.
 */
function wordToLetters(word) {
    var trimmedWord = word.trim();
    var newWord = '';
    // Loop through each character in the input word
    for (var i = 0; i < trimmedWord.length; i++) {
        var letter = trimmedWord[i];
        // Check if the current letter has a pronunciation in PRONOUNCED_LETTERS
        if (arabic_letters_1.PRONOUNCED_LETTERS.hasOwnProperty(letter)) {
            newWord += arabic_letters_1.PRONOUNCED_LETTERS[letter];
            // Add a space after the pronounced letter unless it's the last letter in the word
            if (i !== trimmedWord.length - 1) {
                newWord += ' ';
            }
        }
        else {
            // If the letter is not in PRONOUNCED_LETTERS, keep it unchanged
            newWord += letter;
        }
    }
    return newWord.trim();
}
exports.wordToLetters = wordToLetters;
/**
 * Removes predefined affixes (prefixes and suffixes) from an Arabic word if it starts or ends with those affixes.
 * This function is designed specifically for processing Arabic text, where certain affixes might need to be removed
 * for linguistic, stylistic, or morphological reasons.
 *
 * @param {string} word - The Arabic word from which the affixes are to be removed.
 * @returns {string} The word after removing any matching affixes. Returns the original word trimmed if no affix matches are found.
 */
function removeArabicAffixesFromWord(word) {
    word = word.trim();
    if (arabic_letters_1.ARABIC_PREFIXES.includes(word.substring(0, 2))) {
        // For: ALEF & LAM
        word = (0, utils_1.setCharAt)(word, 0, '');
        word = (0, utils_1.setCharAt)(word, 0, '');
    }
    else if (arabic_letters_1.ARABIC_PREFIXES.includes(word.substring(0, 1))) {
        word = (0, utils_1.setCharAt)(word, 0, '');
    }
    if (arabic_letters_1.ARABIC_SUFFIXES.includes(word.substring(word.length - 2))) {
        word = (0, utils_1.setCharAt)(word, word.length - 1, '');
        word = (0, utils_1.setCharAt)(word, word.length - 1, '');
    }
    else if (arabic_letters_1.ARABIC_SUFFIXES.includes(word[word.length - 1])) {
        word = (0, utils_1.setCharAt)(word, word.length - 1, '');
    }
    return word;
}
/**
 * Removes predefined affixes (prefixes and suffixes) from an Arabic text if words start or end with those affixes.
 * This function is designed specifically for processing Arabic text, where certain affixes might need to be removed
 * for linguistic, stylistic, or morphological reasons.
 *
 * @param {string} text - The Arabic text from which the affixes are to be removed.
 * @returns {string} The text after removing any matching affixes from each word. Returns the original text trimmed if no affix matches are found.
 */
function removeArabicAffixes(text) {
    var new_sentence = '';
    text = text.trim();
    for (var _i = 0, _a = text.split(' '); _i < _a.length; _i++) {
        var word = _a[_i];
        new_sentence += removeArabicAffixesFromWord(word) + ' ';
    }
    return new_sentence.trim();
}
exports.removeArabicAffixes = removeArabicAffixes;
/**
 * Calculates the encryption level based on the input level and word length.
 * @param {number} level - The input encryption level.
 * @param {number} wordLength - The length of the word to be encrypted.
 * @returns {number} The calculated encryption level.
 */
function calculateEncryptionLevel(level, wordLength) {
    // Check if the word length is less than or equal to 4
    if (wordLength <= 4) {
        // If so, return the minimum of (1 + level) and the word length
        return Math.min(1 + level, wordLength);
    }
    else if (wordLength < 8) {
        // If the word length is less than 8
        // Return the minimum of (2 + level) and the word length
        return Math.min(2 + level, wordLength);
    }
    else {
        // If the word length is 8 or greater
        // Return the minimum of (3 + level) and the word length
        return Math.min(3 + level, wordLength);
    }
}
/**
 * Generates a list of random indexes for encryption.
 * @param {number} numOfIndexesToNeeded - The number of random indexes to generate.
 * @param {number} wordLength - The length of the word.
 * @returns {number[]} An array of random indexes.
 */
function getRandomIndexes(numOfIndexesToNeeded, wordLength) {
    // Create a Set to store unique random indexes
    var randomIndexes = new Set();
    // Continue generating random indexes until the desired number is reached
    while (randomIndexes.size !== numOfIndexesToNeeded) {
        // Generate a random index within the word length
        randomIndexes.add(Math.floor(Math.random() * wordLength));
    }
    // Convert the Set to an array and sort the indexes
    return Array.from(randomIndexes).sort(function (a, b) { return a - b; });
}
/**
 * Processes the word for encryption using random indexes.
 * @param {string} word - The word to be encrypted.
 * @param {number[]} randomIndexes - The random indexes for encryption.
 * @returns {string} The encrypted word.
 */
function tashfeerWord(word, randomIndexes) {
    var outputWord = '';
    for (var i = 0; i < word.length; i++) {
        // Check if the character is a standard Arabic letter and needs to be replaced
        // and ignore any other character such as Latin or digits
        // Also, check if the current index is in the list of random indexes for replacement
        if (arabic_letters_1.STANDARD_LETTERS.includes(word[i]) && randomIndexes.includes(i)) {
            // Get the replacement letter for the current character
            var letter = tashfeerCharacter(word[i]);
            // Check if the previous character is not an "alone" letter
            if (i !== 0 && !arabic_letters_1.ALONE_LETTERS.includes(word[i - 1])) {
                // Add a Maddah character for better readability
                outputWord += 'ـ';
            }
            // Add the replacement letter to the encrypted word
            outputWord += letter;
        }
        else {
            // If the character doesn't need to be replaced, add it as it is
            outputWord += word[i];
        }
    }
    return outputWord;
}
/**
 * Returns a randomly selected replacement character for the input character based on the tashfeer rules.
 * @param {string} character - The input character to be replaced.
 * @returns {string} The randomly selected replacement character.
 */
function tashfeerCharacter(character) {
    if (arabic_letters_1.ALEF.includes(character)) {
        character = 'ا';
    }
    if (arabic_letters_1.WAW.includes(character)) {
        character = 'و';
    }
    if (arabic_letters_1.YAA.includes(character)) {
        character = 'ي';
    }
    // Get the list of possible replacement characters for the input character
    var REPLACEMENT_CHAR_LIST = arabic_letters_1.LETTERS_TASHFEER_REPLACEMENT_DICT[character];
    // Generate a random index to select a replacement character
    var randomIndex = Math.floor(Math.random() * REPLACEMENT_CHAR_LIST.length);
    // Get the randomly selected replacement character
    var replacementCharacter = REPLACEMENT_CHAR_LIST[randomIndex];
    return replacementCharacter;
}
/**
 * Performs tashfeer encryption on a given word.
 * @param {string} word - The input word to be encrypted.
 * @param {number} [level=0] - The encryption level (default is 0).
 * @returns {string} The encrypted word.
 */
function tashfeerHandler(word, level) {
    if (level === void 0) { level = 0; }
    var wordLength = word.length;
    // Calculate the encryption level based on the input level and word length
    var n = calculateEncryptionLevel(level, wordLength);
    // Generate a list of random indexes for encryption
    var randomIndexes = getRandomIndexes(n, wordLength);
    // Process the word for encryption using random indexes
    var outputWord = tashfeerWord(word, randomIndexes);
    return outputWord;
}
/**
 * Performs tashfeer encryption on a given sentence.
 * @param {string} sentence - The input sentence to be encrypted.
 * @returns {string} The encrypted sentence.
 */
function tashfeer(sentence, levelOfTashfeer) {
    if (levelOfTashfeer === void 0) { levelOfTashfeer = 1; }
    sentence = sentence.trim();
    var new_sentence = '';
    for (var _i = 0, _a = sentence.split(' '); _i < _a.length; _i++) {
        var word = _a[_i];
        new_sentence += tashfeerHandler(word, levelOfTashfeer) + ' ';
    }
    return new_sentence.trim();
}
exports.tashfeer = tashfeer;
/**
 * Calculates a ratio that likely represents the degree of similarity of a given string to elements in a 'banned' array.
 *
 * @param {string} string - The string to be compared against the elements in the 'banned' array.
 * @returns {number} The highest similarity ratio found between the string and elements in 'banned'.
 */
function bannedSimilarityRatio(string) {
    var maximumSimilarity = -1;
    for (var i in constants_1.BANNED_WORDS) {
        var calculatedSimilarity = (0, utils_1.similarityScore)(string, constants_1.BANNED_WORDS[i]);
        if (calculatedSimilarity > maximumSimilarity) {
            maximumSimilarity = calculatedSimilarity;
        }
    }
    return maximumSimilarity * 100;
}
/**
 * Checks if a string is similar to any 'banned' words based on a predefined similarity ratio.
 *
 * @param {string} string - The string to be checked.
 * @returns {boolean} True if the string is similar to any 'banned' word, false otherwise.
 */
function checkIfBannedWord(string) {
    var std_ratio = 70;
    return bannedSimilarityRatio(removeArabicAffixes(string)) >= std_ratio;
}
/**
 * Performs tashfeer encryption on a given sentence, but only for words that are considered "banned" words.
 * Banned words are determined based on a predefined similarity ratio.
 *
 * @param {string} sentence - The input sentence to be encrypted.
 * @param {number} [levelOfTashfeer=2] - The encryption level (default is 2).
 * @returns {string} The encrypted sentence with tashfeer applied to banned words.
 */
function tashfeerBannedWords(sentence, levelOfTashfeer) {
    if (levelOfTashfeer === void 0) { levelOfTashfeer = 2; }
    var new_sentence = '';
    sentence = sentence.trim();
    for (var _i = 0, _a = sentence.split(' '); _i < _a.length; _i++) {
        var word = _a[_i];
        if (checkIfBannedWord(word)) {
            new_sentence += tashfeerHandler(word, levelOfTashfeer) + ' ';
        }
        else {
            new_sentence += word + ' ';
        }
    }
    return new_sentence.trim();
}
exports.tashfeerBannedWords = tashfeerBannedWords;
