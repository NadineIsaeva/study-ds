My solutions for the 6th programming exercise in Coursera ML with Andrew Ng

Support vector machines: using a subset of [SpamAssassin Public Corpus](https://spamassassin.apache.org/old/publiccorpus/),
build a spam classifier

Course link: https://www.coursera.org/learn/machine-learning/

## Notes
## Steps for preprocessing and normalization of emails:
- Lower-casing: The entire email is converted into lower case, so that captialization is ignored (e.g., IndIcaTE is treated the same as indicate).
- Stripping HTML: All HTML tags are removed from the emails. Many emails often come with HTML formatting; we remove all the HTML tags, so that only the content remains.
- Normalizing URLs: All URLs are replaced with the text "httpaddr".
- Normalizing Email Addresses: All email addresses are replaced with the text "emailaddr".
- Normalizing Numbers: All numbers are replaced with the text 'number'.
- Normalizing Dollars: All dollar signs ($) are replaced with the text 'dollar'.
- Word Stemming: Words are reduced to their stemmed form.
- Removal of non-words: Non-words and punctuation have been removed. 
- All white spaces (tabs, newlines, spaces) have all been trimmed to a single space character.

## Steps to build spam classifier:
- preprocess emails
- create vocabulary list
- process emails (map word->index in vocabulary list)
- extract features from emails
- divide emails into train, cv and test sets
- train SVM for binary classification