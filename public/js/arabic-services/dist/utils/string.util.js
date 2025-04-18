"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.similarityScore = exports.setCharAt = void 0;
/**
 * Sets the character at a specified index in a string.
 *
 * @param {string} str - The input string.
 * @param {number} index - The index at which to set the character.
 * @param {string} chr - The character to set at the specified index.
 * @returns {string} A new string with the character set at the specified index.
 */
function setCharAt(str, index, chr) {
    if (index > str.length - 1)
        return str;
    return str.substring(0, index) + chr + str.substring(index + 1);
}
exports.setCharAt = setCharAt;
/**
 * Calculates a similarity score between two strings, potentially based on their edit distance.
 *
 * @param {string} s1 - The first string to compare.
 * @param {string} s2 - The second string to compare.
 * @returns {number} A similarity score representing how similar the two strings are. The score is between 0 and 1.
 */
function similarityScore(s1, s2) {
    var longer = s1;
    var shorter = s2;
    // swap them if s1 is bigger than s2
    if (s1.length < s2.length) {
        longer = s2;
        shorter = s1;
    }
    var longerLength = longer.length;
    // if both are empty strings return 1 (100% similarity)
    if (longerLength === 0) {
        return 1.0;
    }
    // calculate the similarity score
    return (longerLength - editDistance(longer, shorter)) / (longerLength * 1.0);
}
exports.similarityScore = similarityScore;
/**
 * Calculates the edit distance (Levenshtein distance) between two strings.
 * The edit distance is the minimum number of operations (insertions, deletions, or substitutions)
 * required to change one string into the other.
 *
 * @param {string} s1 - The first string to compare.
 * @param {string} s2 - The second string to compare.
 * @returns {number} The edit distance between the two strings.
 */
function editDistance(s1, s2) {
    s1 = s1.toLowerCase();
    s2 = s2.toLowerCase();
    var costs = new Array();
    for (var i = 0; i <= s1.length; i++) {
        var lastValue = i;
        for (var j = 0; j <= s2.length; j++) {
            if (i == 0)
                costs[j] = j;
            else if (j > 0) {
                var newValue = costs[j - 1];
                if (s1.charAt(i - 1) != s2.charAt(j - 1))
                    newValue = Math.min(Math.min(newValue, lastValue), costs[j]) + 1;
                costs[j - 1] = lastValue;
                lastValue = newValue;
            }
        }
        if (i > 0)
            costs[s2.length] = lastValue;
    }
    return costs[s2.length];
}
