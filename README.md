# Pampoo
 A tool that replace English punctuations to Chinese ones and add spaces to format texts.

### How to use it
You can simply use the built file at `build/js/pampoo.min.js` and put it on your page:

```html
<script type="text/javascript" src="./path/to/pampoo.min.js" charset="utf-8"></script>
```

Then you will be able to clean up and formatting your text with the powerful function:
```javascript
var text = '你的一些文字some of your "best" text.可以随便写100字或者200行噢!';
var cleanedText = Pampoo.cleanUp(text);
console.log(cleanedText);
```
You will get the result in the console like:
`
你的一些文字 some of your “best” text. 可以随便写 100 字或者 200 行噢！
`

### How to contribute

If you are about to make some contribution to it, you can do `npm install` and everything will work for you then.



### Bugs to be solved
- URLs and Emails are not well treated.
- Inline code and code blocks still needs to be dealt with.
- Continuously repeating punctuation are going to be removed.
- The spacing between numerical value and unit symbol should be updated.

### Reference
[SmartQuotesJS](https://github.com/kellym/smartquotesjs)
[CurlyQuotes](http://alexlur.github.io/curlyquotes/)
