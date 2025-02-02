import * as constants from './constants';
import * as utils from './utils';
import { OldArabicOptions } from './options';
export declare const ArabicServices: {
    removeTashkeel(text: string): string;
    toOldArabic(sentence: string, option?: OldArabicOptions): string;
    toOldArabicAndTashfeerBannedWords(sentence: string, levelOfTashfeer?: number): string;
    removeTatweel(text: string): string;
    wordToLetters(word: string): string;
    removeArabicAffixes(text: string): string;
    tashfeer(sentence: string, levelOfTashfeer?: number): string;
    tashfeerBannedWords(sentence: string, levelOfTashfeer?: number): string;
    constants: typeof constants;
    utils: typeof utils;
};
export type { OldArabicOptions };
