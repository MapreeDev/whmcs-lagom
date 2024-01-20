/*!
 * 
 * Super simple wysiwyg editor v0.8.18
 * https://summernote.org
 * 
 * 
 * Copyright 2013- Alan Hong. and other contributors
 * summernote may be freely distributed under the MIT license.
 * 
 * Date: 2020-05-20T18:09Z
 * 
 */
(function webpackUniversalModuleDefinition(root, factory) {
	if(typeof exports === 'object' && typeof module === 'object')
		module.exports = factory(require("jquery"));
	else if(typeof define === 'function' && define.amd)
		define(["jquery"], factory);
	else {
		var a = typeof exports === 'object' ? factory(require("jquery")) : factory(root["jQuery"]);
		for(var i in a) (typeof exports === 'object' ? exports : root)[i] = a[i];
	}
})(window, function(__WEBPACK_EXTERNAL_MODULE__0__) {
return /******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 51);
/******/ })
/************************************************************************/
/******/ ({

/***/ 0:
/***/ (function(module, exports) {

module.exports = __WEBPACK_EXTERNAL_MODULE__0__;

/***/ }),

/***/ 1:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var jquery__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(0);
/* harmony import */ var jquery__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(jquery__WEBPACK_IMPORTED_MODULE_0__);
function _typeof(obj) { "@babel/helpers - typeof"; if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }



var Renderer = /*#__PURE__*/function () {
  function Renderer(markup, children, options, callback) {
    _classCallCheck(this, Renderer);

    this.markup = markup;
    this.children = children;
    this.options = options;
    this.callback = callback;
  }

  _createClass(Renderer, [{
    key: "render",
    value: function render($parent) {
      var $node = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this.markup);

      if (this.options && this.options.contents) {
        $node.html(this.options.contents);
      }

      if (this.options && this.options.className) {
        $node.addClass(this.options.className);
      }

      if (this.options && this.options.data) {
        jquery__WEBPACK_IMPORTED_MODULE_0___default.a.each(this.options.data, function (k, v) {
          $node.attr('data-' + k, v);
        });
      }

      if (this.options && this.options.click) {
        $node.on('click', this.options.click);
      }

      if (this.children) {
        var $container = $node.find('.note-children-container');
        this.children.forEach(function (child) {
          child.render($container.length ? $container : $node);
        });
      }

      if (this.callback) {
        this.callback($node, this.options);
      }

      if (this.options && this.options.callback) {
        this.options.callback($node);
      }

      if ($parent) {
        $parent.append($node);
      }

      return $node;
    }
  }]);

  return Renderer;
}();

/* harmony default export */ __webpack_exports__["a"] = ({
  create: function create(markup, callback) {
    return function () {
      var options = _typeof(arguments[1]) === 'object' ? arguments[1] : arguments[0];
      var children = Array.isArray(arguments[0]) ? arguments[0] : [];

      if (options && options.children) {
        children = options.children;
      }

      return new Renderer(markup, children, options, callback);
    };
  }
});

/***/ }),

/***/ 2:
/***/ (function(module, exports) {

/* WEBPACK VAR INJECTION */(function(__webpack_amd_options__) {/* globals __webpack_amd_options__ */
module.exports = __webpack_amd_options__;

/* WEBPACK VAR INJECTION */}.call(this, {}))

/***/ }),

/***/ 3:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";

// EXTERNAL MODULE: external {"root":"jQuery","commonjs2":"jquery","commonjs":"jquery","amd":"jquery"}
var external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_ = __webpack_require__(0);
var external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default = /*#__PURE__*/__webpack_require__.n(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_);

// CONCATENATED MODULE: ./src/js/base/summernote-en-US.js

external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote || {
  lang: {}
};
external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.extend(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.lang, {
  'en-US': {
    font: {
      bold: 'Bold',
      italic: 'Italic',
      underline: 'Underline',
      clear: 'Remove Font Style',
      height: 'Line Height',
      name: 'Font Family',
      strikethrough: 'Strikethrough',
      subscript: 'Subscript',
      superscript: 'Superscript',
      size: 'Font Size',
      sizeunit: 'Font Size Unit'
    },
    image: {
      image: 'Picture',
      insert: 'Insert Image',
      resizeFull: 'Resize full',
      resizeHalf: 'Resize half',
      resizeQuarter: 'Resize quarter',
      resizeNone: 'Original size',
      floatLeft: 'Float Left',
      floatRight: 'Float Right',
      floatNone: 'Remove float',
      shapeRounded: 'Shape: Rounded',
      shapeCircle: 'Shape: Circle',
      shapeThumbnail: 'Shape: Thumbnail',
      shapeNone: 'Shape: None',
      dragImageHere: 'Drag image or text here',
      dropImage: 'Drop image or Text',
      selectFromFiles: 'Select from files',
      maximumFileSize: 'Maximum file size',
      maximumFileSizeError: 'Maximum file size exceeded.',
      url: 'Image URL',
      remove: 'Remove Image',
      original: 'Original'
    },
    video: {
      video: 'Video',
      videoLink: 'Video Link',
      insert: 'Insert Video',
      url: 'Video URL',
      providers: '(YouTube, Vimeo, Vine, Instagram, DailyMotion or Youku)'
    },
    link: {
      link: 'Link',
      insert: 'Insert Link',
      unlink: 'Unlink',
      edit: 'Edit',
      textToDisplay: 'Text to display',
      url: 'To what URL should this link go?',
      openInNewWindow: 'Open in new window',
      useProtocol: 'Use default protocol'
    },
    table: {
      table: 'Table',
      addRowAbove: 'Add row above',
      addRowBelow: 'Add row below',
      addColLeft: 'Add column left',
      addColRight: 'Add column right',
      delRow: 'Delete row',
      delCol: 'Delete column',
      delTable: 'Delete table'
    },
    hr: {
      insert: 'Insert Horizontal Rule'
    },
    style: {
      style: 'Style',
      p: 'Normal',
      blockquote: 'Quote',
      pre: 'Code',
      h1: 'Header 1',
      h2: 'Header 2',
      h3: 'Header 3',
      h4: 'Header 4',
      h5: 'Header 5',
      h6: 'Header 6'
    },
    lists: {
      unordered: 'Unordered list',
      ordered: 'Ordered list'
    },
    options: {
      help: 'Help',
      fullscreen: 'Full Screen',
      codeview: 'Code View'
    },
    paragraph: {
      paragraph: 'Paragraph',
      outdent: 'Outdent',
      indent: 'Indent',
      left: 'Align left',
      center: 'Align center',
      right: 'Align right',
      justify: 'Justify full'
    },
    color: {
      recent: 'Recent Color',
      more: 'More Color',
      background: 'Background Color',
      foreground: 'Text Color',
      transparent: 'Transparent',
      setTransparent: 'Set transparent',
      reset: 'Reset',
      resetToDefault: 'Reset to default',
      cpSelect: 'Select'
    },
    shortcut: {
      shortcuts: 'Keyboard shortcuts',
      close: 'Close',
      textFormatting: 'Text formatting',
      action: 'Action',
      paragraphFormatting: 'Paragraph formatting',
      documentStyle: 'Document Style',
      extraKeys: 'Extra keys'
    },
    help: {
      'escape': 'Escape',
      'insertParagraph': 'Insert Paragraph',
      'undo': 'Undo the last command',
      'redo': 'Redo the last command',
      'tab': 'Tab',
      'untab': 'Untab',
      'bold': 'Set a bold style',
      'italic': 'Set a italic style',
      'underline': 'Set a underline style',
      'strikethrough': 'Set a strikethrough style',
      'removeFormat': 'Clean a style',
      'justifyLeft': 'Set left align',
      'justifyCenter': 'Set center align',
      'justifyRight': 'Set right align',
      'justifyFull': 'Set full align',
      'insertUnorderedList': 'Toggle unordered list',
      'insertOrderedList': 'Toggle ordered list',
      'outdent': 'Outdent on current paragraph',
      'indent': 'Indent on current paragraph',
      'formatPara': 'Change current block\'s format as a paragraph(P tag)',
      'formatH1': 'Change current block\'s format as H1',
      'formatH2': 'Change current block\'s format as H2',
      'formatH3': 'Change current block\'s format as H3',
      'formatH4': 'Change current block\'s format as H4',
      'formatH5': 'Change current block\'s format as H5',
      'formatH6': 'Change current block\'s format as H6',
      'insertHorizontalRule': 'Insert horizontal rule',
      'linkDialog.show': 'Show Link Dialog'
    },
    history: {
      undo: 'Undo',
      redo: 'Redo'
    },
    specialChar: {
      specialChar: 'SPECIAL CHARACTERS',
      select: 'Select Special characters'
    },
    output: {
      noSelection: 'No Selection Made!'
    }
  }
});
// CONCATENATED MODULE: ./src/js/base/core/env.js

var isSupportAmd = typeof define === 'function' && __webpack_require__(2); // eslint-disable-line

/**
 * returns whether font is installed or not.
 *
 * @param {String} fontName
 * @return {Boolean}
 */

var genericFontFamilies = ['sans-serif', 'serif', 'monospace', 'cursive', 'fantasy'];

function validFontName(fontName) {
  return external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.inArray(fontName.toLowerCase(), genericFontFamilies) === -1 ? "'".concat(fontName, "'") : fontName;
}

function env_isFontInstalled(fontName) {
  var testFontName = fontName === 'Comic Sans MS' ? 'Courier New' : 'Comic Sans MS';
  var testText = 'mmmmmmmmmmwwwww';
  var testSize = '200px';
  var canvas = document.createElement('canvas');
  var context = canvas.getContext('2d');
  context.font = testSize + " '" + testFontName + "'";
  var originalWidth = context.measureText(testText).width;
  context.font = testSize + ' ' + validFontName(fontName) + ', "' + testFontName + '"';
  var width = context.measureText(testText).width;
  return originalWidth !== width;
}

var userAgent = navigator.userAgent;
var isMSIE = /MSIE|Trident/i.test(userAgent);
var browserVersion;

if (isMSIE) {
  var matches = /MSIE (\d+[.]\d+)/.exec(userAgent);

  if (matches) {
    browserVersion = parseFloat(matches[1]);
  }

  matches = /Trident\/.*rv:([0-9]{1,}[.0-9]{0,})/.exec(userAgent);

  if (matches) {
    browserVersion = parseFloat(matches[1]);
  }
}

var isEdge = /Edge\/\d+/.test(userAgent);
var isSupportTouch = 'ontouchstart' in window || navigator.MaxTouchPoints > 0 || navigator.msMaxTouchPoints > 0; // [workaround] IE doesn't have input events for contentEditable
// - see: https://goo.gl/4bfIvA

var inputEventName = isMSIE ? 'DOMCharacterDataModified DOMSubtreeModified DOMNodeInserted' : 'input';
/**
 * @class core.env
 *
 * Object which check platform and agent
 *
 * @singleton
 * @alternateClassName env
 */

/* harmony default export */ var env = ({
  isMac: navigator.appVersion.indexOf('Mac') > -1,
  isMSIE: isMSIE,
  isEdge: isEdge,
  isFF: !isEdge && /firefox/i.test(userAgent),
  isPhantom: /PhantomJS/i.test(userAgent),
  isWebkit: !isEdge && /webkit/i.test(userAgent),
  isChrome: !isEdge && /chrome/i.test(userAgent),
  isSafari: !isEdge && /safari/i.test(userAgent) && !/chrome/i.test(userAgent),
  browserVersion: browserVersion,
  jqueryVersion: parseFloat(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.fn.jquery),
  isSupportAmd: isSupportAmd,
  isSupportTouch: isSupportTouch,
  isFontInstalled: env_isFontInstalled,
  isW3CRangeSupport: !!document.createRange,
  inputEventName: inputEventName,
  genericFontFamilies: genericFontFamilies,
  validFontName: validFontName
});
// CONCATENATED MODULE: ./src/js/base/core/func.js

/**
 * @class core.func
 *
 * func utils (for high-order func's arg)
 *
 * @singleton
 * @alternateClassName func
 */

function eq(itemA) {
  return function (itemB) {
    return itemA === itemB;
  };
}

function eq2(itemA, itemB) {
  return itemA === itemB;
}

function peq2(propName) {
  return function (itemA, itemB) {
    return itemA[propName] === itemB[propName];
  };
}

function ok() {
  return true;
}

function fail() {
  return false;
}

function not(f) {
  return function () {
    return !f.apply(f, arguments);
  };
}

function and(fA, fB) {
  return function (item) {
    return fA(item) && fB(item);
  };
}

function func_self(a) {
  return a;
}

function func_invoke(obj, method) {
  return function () {
    return obj[method].apply(obj, arguments);
  };
}

var idCounter = 0;
/**
 * reset globally-unique id
 *
 */

function resetUniqueId() {
  idCounter = 0;
}
/**
 * generate a globally-unique id
 *
 * @param {String} [prefix]
 */


function uniqueId(prefix) {
  var id = ++idCounter + '';
  return prefix ? prefix + id : id;
}
/**
 * returns bnd (bounds) from rect
 *
 * - IE Compatibility Issue: http://goo.gl/sRLOAo
 * - Scroll Issue: http://goo.gl/sNjUc
 *
 * @param {Rect} rect
 * @return {Object} bounds
 * @return {Number} bounds.top
 * @return {Number} bounds.left
 * @return {Number} bounds.width
 * @return {Number} bounds.height
 */


function rect2bnd(rect) {
  var $document = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(document);
  return {
    top: rect.top + $document.scrollTop(),
    left: rect.left + $document.scrollLeft(),
    width: rect.right - rect.left,
    height: rect.bottom - rect.top
  };
}
/**
 * returns a copy of the object where the keys have become the values and the values the keys.
 * @param {Object} obj
 * @return {Object}
 */


function invertObject(obj) {
  var inverted = {};

  for (var key in obj) {
    if (Object.prototype.hasOwnProperty.call(obj, key)) {
      inverted[obj[key]] = key;
    }
  }

  return inverted;
}
/**
 * @param {String} namespace
 * @param {String} [prefix]
 * @return {String}
 */


function namespaceToCamel(namespace, prefix) {
  prefix = prefix || '';
  return prefix + namespace.split('.').map(function (name) {
    return name.substring(0, 1).toUpperCase() + name.substring(1);
  }).join('');
}
/**
 * Returns a function, that, as long as it continues to be invoked, will not
 * be triggered. The function will be called after it stops being called for
 * N milliseconds. If `immediate` is passed, trigger the function on the
 * leading edge, instead of the trailing.
 * @param {Function} func
 * @param {Number} wait
 * @param {Boolean} immediate
 * @return {Function}
 */


function debounce(func, wait, immediate) {
  var timeout;
  return function () {
    var context = this;
    var args = arguments;

    var later = function later() {
      timeout = null;

      if (!immediate) {
        func.apply(context, args);
      }
    };

    var callNow = immediate && !timeout;
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);

    if (callNow) {
      func.apply(context, args);
    }
  };
}
/**
 *
 * @param {String} url
 * @return {Boolean}
 */


function isValidUrl(url) {
  var expression = /[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/gi;
  return expression.test(url);
}

/* harmony default export */ var func = ({
  eq: eq,
  eq2: eq2,
  peq2: peq2,
  ok: ok,
  fail: fail,
  self: func_self,
  not: not,
  and: and,
  invoke: func_invoke,
  resetUniqueId: resetUniqueId,
  uniqueId: uniqueId,
  rect2bnd: rect2bnd,
  invertObject: invertObject,
  namespaceToCamel: namespaceToCamel,
  debounce: debounce,
  isValidUrl: isValidUrl
});
// CONCATENATED MODULE: ./src/js/base/core/lists.js

/**
 * returns the first item of an array.
 *
 * @param {Array} array
 */

function lists_head(array) {
  return array[0];
}
/**
 * returns the last item of an array.
 *
 * @param {Array} array
 */


function lists_last(array) {
  return array[array.length - 1];
}
/**
 * returns everything but the last entry of the array.
 *
 * @param {Array} array
 */


function initial(array) {
  return array.slice(0, array.length - 1);
}
/**
 * returns the rest of the items in an array.
 *
 * @param {Array} array
 */


function tail(array) {
  return array.slice(1);
}
/**
 * returns item of array
 */


function find(array, pred) {
  for (var idx = 0, len = array.length; idx < len; idx++) {
    var item = array[idx];

    if (pred(item)) {
      return item;
    }
  }
}
/**
 * returns true if all of the values in the array pass the predicate truth test.
 */


function lists_all(array, pred) {
  for (var idx = 0, len = array.length; idx < len; idx++) {
    if (!pred(array[idx])) {
      return false;
    }
  }

  return true;
}
/**
 * returns true if the value is present in the list.
 */


function contains(array, item) {
  if (array && array.length && item) {
    if (array.indexOf) {
      return array.indexOf(item) !== -1;
    } else if (array.contains) {
      // `DOMTokenList` doesn't implement `.indexOf`, but it implements `.contains`
      return array.contains(item);
    }
  }

  return false;
}
/**
 * get sum from a list
 *
 * @param {Array} array - array
 * @param {Function} fn - iterator
 */


function sum(array, fn) {
  fn = fn || func.self;
  return array.reduce(function (memo, v) {
    return memo + fn(v);
  }, 0);
}
/**
 * returns a copy of the collection with array type.
 * @param {Collection} collection - collection eg) node.childNodes, ...
 */


function from(collection) {
  var result = [];
  var length = collection.length;
  var idx = -1;

  while (++idx < length) {
    result[idx] = collection[idx];
  }

  return result;
}
/**
 * returns whether list is empty or not
 */


function lists_isEmpty(array) {
  return !array || !array.length;
}
/**
 * cluster elements by predicate function.
 *
 * @param {Array} array - array
 * @param {Function} fn - predicate function for cluster rule
 * @param {Array[]}
 */


function clusterBy(array, fn) {
  if (!array.length) {
    return [];
  }

  var aTail = tail(array);
  return aTail.reduce(function (memo, v) {
    var aLast = lists_last(memo);

    if (fn(lists_last(aLast), v)) {
      aLast[aLast.length] = v;
    } else {
      memo[memo.length] = [v];
    }

    return memo;
  }, [[lists_head(array)]]);
}
/**
 * returns a copy of the array with all false values removed
 *
 * @param {Array} array - array
 * @param {Function} fn - predicate function for cluster rule
 */


function compact(array) {
  var aResult = [];

  for (var idx = 0, len = array.length; idx < len; idx++) {
    if (array[idx]) {
      aResult.push(array[idx]);
    }
  }

  return aResult;
}
/**
 * produces a duplicate-free version of the array
 *
 * @param {Array} array
 */


function unique(array) {
  var results = [];

  for (var idx = 0, len = array.length; idx < len; idx++) {
    if (!contains(results, array[idx])) {
      results.push(array[idx]);
    }
  }

  return results;
}
/**
 * returns next item.
 * @param {Array} array
 */


function lists_next(array, item) {
  if (array && array.length && item) {
    var idx = array.indexOf(item);
    return idx === -1 ? null : array[idx + 1];
  }

  return null;
}
/**
 * returns prev item.
 * @param {Array} array
 */


function prev(array, item) {
  if (array && array.length && item) {
    var idx = array.indexOf(item);
    return idx === -1 ? null : array[idx - 1];
  }

  return null;
}
/**
 * @class core.list
 *
 * list utils
 *
 * @singleton
 * @alternateClassName list
 */


/* harmony default export */ var lists = ({
  head: lists_head,
  last: lists_last,
  initial: initial,
  tail: tail,
  prev: prev,
  next: lists_next,
  find: find,
  contains: contains,
  all: lists_all,
  sum: sum,
  from: from,
  isEmpty: lists_isEmpty,
  clusterBy: clusterBy,
  compact: compact,
  unique: unique
});
// CONCATENATED MODULE: ./src/js/base/core/dom.js




var NBSP_CHAR = String.fromCharCode(160);
var ZERO_WIDTH_NBSP_CHAR = "\uFEFF";
/**
 * @method isEditable
 *
 * returns whether node is `note-editable` or not.
 *
 * @param {Node} node
 * @return {Boolean}
 */

function isEditable(node) {
  return node && external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(node).hasClass('note-editable');
}
/**
 * @method isControlSizing
 *
 * returns whether node is `note-control-sizing` or not.
 *
 * @param {Node} node
 * @return {Boolean}
 */


function isControlSizing(node) {
  return node && external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(node).hasClass('note-control-sizing');
}
/**
 * @method makePredByNodeName
 *
 * returns predicate which judge whether nodeName is same
 *
 * @param {String} nodeName
 * @return {Function}
 */


function makePredByNodeName(nodeName) {
  nodeName = nodeName.toUpperCase();
  return function (node) {
    return node && node.nodeName.toUpperCase() === nodeName;
  };
}
/**
 * @method isText
 *
 *
 *
 * @param {Node} node
 * @return {Boolean} true if node's type is text(3)
 */


function isText(node) {
  return node && node.nodeType === 3;
}
/**
 * @method isElement
 *
 *
 *
 * @param {Node} node
 * @return {Boolean} true if node's type is element(1)
 */


function isElement(node) {
  return node && node.nodeType === 1;
}
/**
 * ex) br, col, embed, hr, img, input, ...
 * @see http://www.w3.org/html/wg/drafts/html/master/syntax.html#void-elements
 */


function isVoid(node) {
  return node && /^BR|^IMG|^HR|^IFRAME|^BUTTON|^INPUT|^AUDIO|^VIDEO|^EMBED/.test(node.nodeName.toUpperCase());
}

function isPara(node) {
  if (isEditable(node)) {
    return false;
  } // Chrome(v31.0), FF(v25.0.1) use DIV for paragraph


  return node && /^DIV|^P|^LI|^H[1-7]/.test(node.nodeName.toUpperCase());
}

function isHeading(node) {
  return node && /^H[1-7]/.test(node.nodeName.toUpperCase());
}

var isPre = makePredByNodeName('PRE');
var isLi = makePredByNodeName('LI');

function isPurePara(node) {
  return isPara(node) && !isLi(node);
}

var isTable = makePredByNodeName('TABLE');
var isData = makePredByNodeName('DATA');

function dom_isInline(node) {
  return !isBodyContainer(node) && !isList(node) && !isHr(node) && !isPara(node) && !isTable(node) && !isBlockquote(node) && !isData(node);
}

function isList(node) {
  return node && /^UL|^OL/.test(node.nodeName.toUpperCase());
}

var isHr = makePredByNodeName('HR');

function dom_isCell(node) {
  return node && /^TD|^TH/.test(node.nodeName.toUpperCase());
}

var isBlockquote = makePredByNodeName('BLOCKQUOTE');

function isBodyContainer(node) {
  return dom_isCell(node) || isBlockquote(node) || isEditable(node);
}

var isAnchor = makePredByNodeName('A');

function isParaInline(node) {
  return dom_isInline(node) && !!dom_ancestor(node, isPara);
}

function isBodyInline(node) {
  return dom_isInline(node) && !dom_ancestor(node, isPara);
}

var isBody = makePredByNodeName('BODY');
/**
 * returns whether nodeB is closest sibling of nodeA
 *
 * @param {Node} nodeA
 * @param {Node} nodeB
 * @return {Boolean}
 */

function isClosestSibling(nodeA, nodeB) {
  return nodeA.nextSibling === nodeB || nodeA.previousSibling === nodeB;
}
/**
 * returns array of closest siblings with node
 *
 * @param {Node} node
 * @param {function} [pred] - predicate function
 * @return {Node[]}
 */


function withClosestSiblings(node, pred) {
  pred = pred || func.ok;
  var siblings = [];

  if (node.previousSibling && pred(node.previousSibling)) {
    siblings.push(node.previousSibling);
  }

  siblings.push(node);

  if (node.nextSibling && pred(node.nextSibling)) {
    siblings.push(node.nextSibling);
  }

  return siblings;
}
/**
 * blank HTML for cursor position
 * - [workaround] old IE only works with &nbsp;
 * - [workaround] IE11 and other browser works with bogus br
 */


var blankHTML = env.isMSIE && env.browserVersion < 11 ? '&nbsp;' : '<br>';
/**
 * @method nodeLength
 *
 * returns #text's text size or element's childNodes size
 *
 * @param {Node} node
 */

function nodeLength(node) {
  if (isText(node)) {
    return node.nodeValue.length;
  }

  if (node) {
    return node.childNodes.length;
  }

  return 0;
}
/**
 * returns whether deepest child node is empty or not.
 *
 * @param {Node} node
 * @return {Boolean}
 */


function deepestChildIsEmpty(node) {
  do {
    if (node.firstElementChild === null || node.firstElementChild.innerHTML === '') break;
  } while (node = node.firstElementChild);

  return dom_isEmpty(node);
}
/**
 * returns whether node is empty or not.
 *
 * @param {Node} node
 * @return {Boolean}
 */


function dom_isEmpty(node) {
  var len = nodeLength(node);

  if (len === 0) {
    return true;
  } else if (!isText(node) && len === 1 && node.innerHTML === blankHTML) {
    // ex) <p><br></p>, <span><br></span>
    return true;
  } else if (lists.all(node.childNodes, isText) && node.innerHTML === '') {
    // ex) <p></p>, <span></span>
    return true;
  }

  return false;
}
/**
 * padding blankHTML if node is empty (for cursor position)
 */


function paddingBlankHTML(node) {
  if (!isVoid(node) && !nodeLength(node)) {
    node.innerHTML = blankHTML;
  }
}
/**
 * find nearest ancestor predicate hit
 *
 * @param {Node} node
 * @param {Function} pred - predicate function
 */


function dom_ancestor(node, pred) {
  while (node) {
    if (pred(node)) {
      return node;
    }

    if (isEditable(node)) {
      break;
    }

    node = node.parentNode;
  }

  return null;
}
/**
 * find nearest ancestor only single child blood line and predicate hit
 *
 * @param {Node} node
 * @param {Function} pred - predicate function
 */


function singleChildAncestor(node, pred) {
  node = node.parentNode;

  while (node) {
    if (nodeLength(node) !== 1) {
      break;
    }

    if (pred(node)) {
      return node;
    }

    if (isEditable(node)) {
      break;
    }

    node = node.parentNode;
  }

  return null;
}
/**
 * returns new array of ancestor nodes (until predicate hit).
 *
 * @param {Node} node
 * @param {Function} [optional] pred - predicate function
 */


function listAncestor(node, pred) {
  pred = pred || func.fail;
  var ancestors = [];
  dom_ancestor(node, function (el) {
    if (!isEditable(el)) {
      ancestors.push(el);
    }

    return pred(el);
  });
  return ancestors;
}
/**
 * find farthest ancestor predicate hit
 */


function lastAncestor(node, pred) {
  var ancestors = listAncestor(node);
  return lists.last(ancestors.filter(pred));
}
/**
 * returns common ancestor node between two nodes.
 *
 * @param {Node} nodeA
 * @param {Node} nodeB
 */


function dom_commonAncestor(nodeA, nodeB) {
  var ancestors = listAncestor(nodeA);

  for (var n = nodeB; n; n = n.parentNode) {
    if (ancestors.indexOf(n) > -1) return n;
  }

  return null; // difference document area
}
/**
 * listing all previous siblings (until predicate hit).
 *
 * @param {Node} node
 * @param {Function} [optional] pred - predicate function
 */


function listPrev(node, pred) {
  pred = pred || func.fail;
  var nodes = [];

  while (node) {
    if (pred(node)) {
      break;
    }

    nodes.push(node);
    node = node.previousSibling;
  }

  return nodes;
}
/**
 * listing next siblings (until predicate hit).
 *
 * @param {Node} node
 * @param {Function} [pred] - predicate function
 */


function listNext(node, pred) {
  pred = pred || func.fail;
  var nodes = [];

  while (node) {
    if (pred(node)) {
      break;
    }

    nodes.push(node);
    node = node.nextSibling;
  }

  return nodes;
}
/**
 * listing descendant nodes
 *
 * @param {Node} node
 * @param {Function} [pred] - predicate function
 */


function listDescendant(node, pred) {
  var descendants = [];
  pred = pred || func.ok; // start DFS(depth first search) with node

  (function fnWalk(current) {
    if (node !== current && pred(current)) {
      descendants.push(current);
    }

    for (var idx = 0, len = current.childNodes.length; idx < len; idx++) {
      fnWalk(current.childNodes[idx]);
    }
  })(node);

  return descendants;
}
/**
 * wrap node with new tag.
 *
 * @param {Node} node
 * @param {Node} tagName of wrapper
 * @return {Node} - wrapper
 */


function wrap(node, wrapperName) {
  var parent = node.parentNode;
  var wrapper = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<' + wrapperName + '>')[0];
  parent.insertBefore(wrapper, node);
  wrapper.appendChild(node);
  return wrapper;
}
/**
 * insert node after preceding
 *
 * @param {Node} node
 * @param {Node} preceding - predicate function
 */


function insertAfter(node, preceding) {
  var next = preceding.nextSibling;
  var parent = preceding.parentNode;

  if (next) {
    parent.insertBefore(node, next);
  } else {
    parent.appendChild(node);
  }

  return node;
}
/**
 * append elements.
 *
 * @param {Node} node
 * @param {Collection} aChild
 */


function appendChildNodes(node, aChild) {
  external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(aChild, function (idx, child) {
    node.appendChild(child);
  });
  return node;
}
/**
 * returns whether boundaryPoint is left edge or not.
 *
 * @param {BoundaryPoint} point
 * @return {Boolean}
 */


function isLeftEdgePoint(point) {
  return point.offset === 0;
}
/**
 * returns whether boundaryPoint is right edge or not.
 *
 * @param {BoundaryPoint} point
 * @return {Boolean}
 */


function isRightEdgePoint(point) {
  return point.offset === nodeLength(point.node);
}
/**
 * returns whether boundaryPoint is edge or not.
 *
 * @param {BoundaryPoint} point
 * @return {Boolean}
 */


function isEdgePoint(point) {
  return isLeftEdgePoint(point) || isRightEdgePoint(point);
}
/**
 * returns whether node is left edge of ancestor or not.
 *
 * @param {Node} node
 * @param {Node} ancestor
 * @return {Boolean}
 */


function dom_isLeftEdgeOf(node, ancestor) {
  while (node && node !== ancestor) {
    if (dom_position(node) !== 0) {
      return false;
    }

    node = node.parentNode;
  }

  return true;
}
/**
 * returns whether node is right edge of ancestor or not.
 *
 * @param {Node} node
 * @param {Node} ancestor
 * @return {Boolean}
 */


function isRightEdgeOf(node, ancestor) {
  if (!ancestor) {
    return false;
  }

  while (node && node !== ancestor) {
    if (dom_position(node) !== nodeLength(node.parentNode) - 1) {
      return false;
    }

    node = node.parentNode;
  }

  return true;
}
/**
 * returns whether point is left edge of ancestor or not.
 * @param {BoundaryPoint} point
 * @param {Node} ancestor
 * @return {Boolean}
 */


function isLeftEdgePointOf(point, ancestor) {
  return isLeftEdgePoint(point) && dom_isLeftEdgeOf(point.node, ancestor);
}
/**
 * returns whether point is right edge of ancestor or not.
 * @param {BoundaryPoint} point
 * @param {Node} ancestor
 * @return {Boolean}
 */


function isRightEdgePointOf(point, ancestor) {
  return isRightEdgePoint(point) && isRightEdgeOf(point.node, ancestor);
}
/**
 * returns offset from parent.
 *
 * @param {Node} node
 */


function dom_position(node) {
  var offset = 0;

  while (node = node.previousSibling) {
    offset += 1;
  }

  return offset;
}

function hasChildren(node) {
  return !!(node && node.childNodes && node.childNodes.length);
}
/**
 * returns previous boundaryPoint
 *
 * @param {BoundaryPoint} point
 * @param {Boolean} isSkipInnerOffset
 * @return {BoundaryPoint}
 */


function dom_prevPoint(point, isSkipInnerOffset) {
  var node;
  var offset;

  if (point.offset === 0) {
    if (isEditable(point.node)) {
      return null;
    }

    node = point.node.parentNode;
    offset = dom_position(point.node);
  } else if (hasChildren(point.node)) {
    node = point.node.childNodes[point.offset - 1];
    offset = nodeLength(node);
  } else {
    node = point.node;
    offset = isSkipInnerOffset ? 0 : point.offset - 1;
  }

  return {
    node: node,
    offset: offset
  };
}
/**
 * returns next boundaryPoint
 *
 * @param {BoundaryPoint} point
 * @param {Boolean} isSkipInnerOffset
 * @return {BoundaryPoint}
 */


function dom_nextPoint(point, isSkipInnerOffset) {
  var node, offset;

  if (nodeLength(point.node) === point.offset) {
    if (isEditable(point.node)) {
      return null;
    }

    var nextTextNode = getNextTextNode(point.node);

    if (nextTextNode) {
      node = nextTextNode;
      offset = 0;
    } else {
      node = point.node.parentNode;
      offset = dom_position(point.node) + 1;
    }
  } else if (hasChildren(point.node)) {
    node = point.node.childNodes[point.offset];
    offset = 0;
  } else {
    node = point.node;
    offset = isSkipInnerOffset ? nodeLength(point.node) : point.offset + 1;
  }

  return {
    node: node,
    offset: offset
  };
}
/**
 * returns next boundaryPoint with empty node
 *
 * @param {BoundaryPoint} point
 * @param {Boolean} isSkipInnerOffset
 * @return {BoundaryPoint}
 */


function nextPointWithEmptyNode(point, isSkipInnerOffset) {
  var node, offset; // if node is empty string node, return current node's sibling.

  if (dom_isEmpty(point.node)) {
    node = point.node.nextSibling;
    offset = 0;
    return {
      node: node,
      offset: offset
    };
  }

  if (nodeLength(point.node) === point.offset) {
    if (isEditable(point.node)) {
      return null;
    }

    var nextTextNode = getNextTextNode(point.node);

    if (nextTextNode) {
      node = nextTextNode;
      offset = 0;
    } else {
      node = point.node.parentNode;
      offset = dom_position(point.node) + 1;
    } // if next node is editable, return current node's sibling node.


    if (isEditable(node)) {
      node = point.node.nextSibling;
      offset = 0;
    }
  } else if (hasChildren(point.node)) {
    node = point.node.childNodes[point.offset];
    offset = 0;

    if (dom_isEmpty(node)) {
      return null;
    }
  } else {
    node = point.node;
    offset = isSkipInnerOffset ? nodeLength(point.node) : point.offset + 1;

    if (dom_isEmpty(node)) {
      return null;
    }
  }

  return {
    node: node,
    offset: offset
  };
}
/*
* returns the next Text node index or 0 if not found.
*/


function getNextTextNode(actual) {
  if (!actual.nextSibling) return undefined;
  if (actual.parent !== actual.nextSibling.parent) return undefined;
  if (isText(actual.nextSibling)) return actual.nextSibling;
  return getNextTextNode(actual.nextSibling);
}
/**
 * returns whether pointA and pointB is same or not.
 *
 * @param {BoundaryPoint} pointA
 * @param {BoundaryPoint} pointB
 * @return {Boolean}
 */


function isSamePoint(pointA, pointB) {
  return pointA.node === pointB.node && pointA.offset === pointB.offset;
}
/**
 * returns whether point is visible (can set cursor) or not.
 *
 * @param {BoundaryPoint} point
 * @return {Boolean}
 */


function isVisiblePoint(point) {
  if (isText(point.node) || !hasChildren(point.node) || dom_isEmpty(point.node)) {
    return true;
  }

  var leftNode = point.node.childNodes[point.offset - 1];
  var rightNode = point.node.childNodes[point.offset];

  if ((!leftNode || isVoid(leftNode)) && (!rightNode || isVoid(rightNode))) {
    return true;
  }

  return false;
}
/**
 * @method prevPointUtil
 *
 * @param {BoundaryPoint} point
 * @param {Function} pred
 * @return {BoundaryPoint}
 */


function prevPointUntil(point, pred) {
  while (point) {
    if (pred(point)) {
      return point;
    }

    point = dom_prevPoint(point);
  }

  return null;
}
/**
 * @method nextPointUntil
 *
 * @param {BoundaryPoint} point
 * @param {Function} pred
 * @return {BoundaryPoint}
 */


function nextPointUntil(point, pred) {
  while (point) {
    if (pred(point)) {
      return point;
    }

    point = dom_nextPoint(point);
  }

  return null;
}
/**
 * returns whether point has character or not.
 *
 * @param {Point} point
 * @return {Boolean}
 */


function isCharPoint(point) {
  if (!isText(point.node)) {
    return false;
  }

  var ch = point.node.nodeValue.charAt(point.offset - 1);
  return ch && ch !== ' ' && ch !== NBSP_CHAR;
}
/**
 * returns whether point has space or not.
 *
 * @param {Point} point
 * @return {Boolean}
 */


function isSpacePoint(point) {
  if (!isText(point.node)) {
    return false;
  }

  var ch = point.node.nodeValue.charAt(point.offset - 1);
  return ch === ' ' || ch === NBSP_CHAR;
}
/**
 * @method walkPoint
 *
 * @param {BoundaryPoint} startPoint
 * @param {BoundaryPoint} endPoint
 * @param {Function} handler
 * @param {Boolean} isSkipInnerOffset
 */


function walkPoint(startPoint, endPoint, handler, isSkipInnerOffset) {
  var point = startPoint;

  while (point) {
    handler(point);

    if (isSamePoint(point, endPoint)) {
      break;
    }

    var isSkipOffset = isSkipInnerOffset && startPoint.node !== point.node && endPoint.node !== point.node;
    point = nextPointWithEmptyNode(point, isSkipOffset);
  }
}
/**
 * @method makeOffsetPath
 *
 * return offsetPath(array of offset) from ancestor
 *
 * @param {Node} ancestor - ancestor node
 * @param {Node} node
 */


function makeOffsetPath(ancestor, node) {
  var ancestors = listAncestor(node, func.eq(ancestor));
  return ancestors.map(dom_position).reverse();
}
/**
 * @method fromOffsetPath
 *
 * return element from offsetPath(array of offset)
 *
 * @param {Node} ancestor - ancestor node
 * @param {array} offsets - offsetPath
 */


function fromOffsetPath(ancestor, offsets) {
  var current = ancestor;

  for (var i = 0, len = offsets.length; i < len; i++) {
    if (current.childNodes.length <= offsets[i]) {
      current = current.childNodes[current.childNodes.length - 1];
    } else {
      current = current.childNodes[offsets[i]];
    }
  }

  return current;
}
/**
 * @method splitNode
 *
 * split element or #text
 *
 * @param {BoundaryPoint} point
 * @param {Object} [options]
 * @param {Boolean} [options.isSkipPaddingBlankHTML] - default: false
 * @param {Boolean} [options.isNotSplitEdgePoint] - default: false
 * @param {Boolean} [options.isDiscardEmptySplits] - default: false
 * @return {Node} right node of boundaryPoint
 */


function splitNode(point, options) {
  var isSkipPaddingBlankHTML = options && options.isSkipPaddingBlankHTML;
  var isNotSplitEdgePoint = options && options.isNotSplitEdgePoint;
  var isDiscardEmptySplits = options && options.isDiscardEmptySplits;

  if (isDiscardEmptySplits) {
    isSkipPaddingBlankHTML = true;
  } // edge case


  if (isEdgePoint(point) && (isText(point.node) || isNotSplitEdgePoint)) {
    if (isLeftEdgePoint(point)) {
      return point.node;
    } else if (isRightEdgePoint(point)) {
      return point.node.nextSibling;
    }
  } // split #text


  if (isText(point.node)) {
    return point.node.splitText(point.offset);
  } else {
    var childNode = point.node.childNodes[point.offset];
    var clone = insertAfter(point.node.cloneNode(false), point.node);
    appendChildNodes(clone, listNext(childNode));

    if (!isSkipPaddingBlankHTML) {
      paddingBlankHTML(point.node);
      paddingBlankHTML(clone);
    }

    if (isDiscardEmptySplits) {
      if (dom_isEmpty(point.node)) {
        remove(point.node);
      }

      if (dom_isEmpty(clone)) {
        remove(clone);
        return point.node.nextSibling;
      }
    }

    return clone;
  }
}
/**
 * @method splitTree
 *
 * split tree by point
 *
 * @param {Node} root - split root
 * @param {BoundaryPoint} point
 * @param {Object} [options]
 * @param {Boolean} [options.isSkipPaddingBlankHTML] - default: false
 * @param {Boolean} [options.isNotSplitEdgePoint] - default: false
 * @return {Node} right node of boundaryPoint
 */


function splitTree(root, point, options) {
  // ex) [#text, <span>, <p>]
  var ancestors = listAncestor(point.node, func.eq(root));

  if (!ancestors.length) {
    return null;
  } else if (ancestors.length === 1) {
    return splitNode(point, options);
  }

  return ancestors.reduce(function (node, parent) {
    if (node === point.node) {
      node = splitNode(point, options);
    }

    return splitNode({
      node: parent,
      offset: node ? dom_position(node) : nodeLength(parent)
    }, options);
  });
}
/**
 * split point
 *
 * @param {Point} point
 * @param {Boolean} isInline
 * @return {Object}
 */


function splitPoint(point, isInline) {
  // find splitRoot, container
  //  - inline: splitRoot is a child of paragraph
  //  - block: splitRoot is a child of bodyContainer
  var pred = isInline ? isPara : isBodyContainer;
  var ancestors = listAncestor(point.node, pred);
  var topAncestor = lists.last(ancestors) || point.node;
  var splitRoot, container;

  if (pred(topAncestor)) {
    splitRoot = ancestors[ancestors.length - 2];
    container = topAncestor;
  } else {
    splitRoot = topAncestor;
    container = splitRoot.parentNode;
  } // if splitRoot is exists, split with splitTree


  var pivot = splitRoot && splitTree(splitRoot, point, {
    isSkipPaddingBlankHTML: isInline,
    isNotSplitEdgePoint: isInline
  }); // if container is point.node, find pivot with point.offset

  if (!pivot && container === point.node) {
    pivot = point.node.childNodes[point.offset];
  }

  return {
    rightNode: pivot,
    container: container
  };
}

function dom_create(nodeName) {
  return document.createElement(nodeName);
}

function createText(text) {
  return document.createTextNode(text);
}
/**
 * @method remove
 *
 * remove node, (isRemoveChild: remove child or not)
 *
 * @param {Node} node
 * @param {Boolean} isRemoveChild
 */


function remove(node, isRemoveChild) {
  if (!node || !node.parentNode) {
    return;
  }

  if (node.removeNode) {
    return node.removeNode(isRemoveChild);
  }

  var parent = node.parentNode;

  if (!isRemoveChild) {
    var nodes = [];

    for (var i = 0, len = node.childNodes.length; i < len; i++) {
      nodes.push(node.childNodes[i]);
    }

    for (var _i = 0, _len = nodes.length; _i < _len; _i++) {
      parent.insertBefore(nodes[_i], node);
    }
  }

  parent.removeChild(node);
}
/**
 * @method removeWhile
 *
 * @param {Node} node
 * @param {Function} pred
 */


function removeWhile(node, pred) {
  while (node) {
    if (isEditable(node) || !pred(node)) {
      break;
    }

    var parent = node.parentNode;
    remove(node);
    node = parent;
  }
}
/**
 * @method replace
 *
 * replace node with provided nodeName
 *
 * @param {Node} node
 * @param {String} nodeName
 * @return {Node} - new node
 */


function dom_replace(node, nodeName) {
  if (node.nodeName.toUpperCase() === nodeName.toUpperCase()) {
    return node;
  }

  var newNode = dom_create(nodeName);

  if (node.style.cssText) {
    newNode.style.cssText = node.style.cssText;
  }

  appendChildNodes(newNode, lists.from(node.childNodes));
  insertAfter(newNode, node);
  remove(node);
  return newNode;
}

var isTextarea = makePredByNodeName('TEXTAREA');
/**
 * @param {jQuery} $node
 * @param {Boolean} [stripLinebreaks] - default: false
 */

function dom_value($node, stripLinebreaks) {
  var val = isTextarea($node[0]) ? $node.val() : $node.html();

  if (stripLinebreaks) {
    return val.replace(/[\n\r]/g, '');
  }

  return val;
}
/**
 * @method html
 *
 * get the HTML contents of node
 *
 * @param {jQuery} $node
 * @param {Boolean} [isNewlineOnBlock]
 */


function dom_html($node, isNewlineOnBlock) {
  var markup = dom_value($node);

  if (isNewlineOnBlock) {
    var regexTag = /<(\/?)(\b(?!!)[^>\s]*)(.*?)(\s*\/?>)/g;
    markup = markup.replace(regexTag, function (match, endSlash, name) {
      name = name.toUpperCase();
      var isEndOfInlineContainer = /^DIV|^TD|^TH|^P|^LI|^H[1-7]/.test(name) && !!endSlash;
      var isBlockNode = /^BLOCKQUOTE|^TABLE|^TBODY|^TR|^HR|^UL|^OL/.test(name);
      return match + (isEndOfInlineContainer || isBlockNode ? '\n' : '');
    });
    markup = markup.trim();
  }

  return markup;
}

function posFromPlaceholder(placeholder) {
  var $placeholder = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(placeholder);
  var pos = $placeholder.offset();
  var height = $placeholder.outerHeight(true); // include margin

  return {
    left: pos.left,
    top: pos.top + height
  };
}

function attachEvents($node, events) {
  Object.keys(events).forEach(function (key) {
    $node.on(key, events[key]);
  });
}

function detachEvents($node, events) {
  Object.keys(events).forEach(function (key) {
    $node.off(key, events[key]);
  });
}
/**
 * @method isCustomStyleTag
 *
 * assert if a node contains a "note-styletag" class,
 * which implies that's a custom-made style tag node
 *
 * @param {Node} an HTML DOM node
 */


function isCustomStyleTag(node) {
  return node && !isText(node) && lists.contains(node.classList, 'note-styletag');
}

/* harmony default export */ var dom = ({
  /** @property {String} NBSP_CHAR */
  NBSP_CHAR: NBSP_CHAR,

  /** @property {String} ZERO_WIDTH_NBSP_CHAR */
  ZERO_WIDTH_NBSP_CHAR: ZERO_WIDTH_NBSP_CHAR,

  /** @property {String} blank */
  blank: blankHTML,

  /** @property {String} emptyPara */
  emptyPara: "<p>".concat(blankHTML, "</p>"),
  makePredByNodeName: makePredByNodeName,
  isEditable: isEditable,
  isControlSizing: isControlSizing,
  isText: isText,
  isElement: isElement,
  isVoid: isVoid,
  isPara: isPara,
  isPurePara: isPurePara,
  isHeading: isHeading,
  isInline: dom_isInline,
  isBlock: func.not(dom_isInline),
  isBodyInline: isBodyInline,
  isBody: isBody,
  isParaInline: isParaInline,
  isPre: isPre,
  isList: isList,
  isTable: isTable,
  isData: isData,
  isCell: dom_isCell,
  isBlockquote: isBlockquote,
  isBodyContainer: isBodyContainer,
  isAnchor: isAnchor,
  isDiv: makePredByNodeName('DIV'),
  isLi: isLi,
  isBR: makePredByNodeName('BR'),
  isSpan: makePredByNodeName('SPAN'),
  isB: makePredByNodeName('B'),
  isU: makePredByNodeName('U'),
  isS: makePredByNodeName('S'),
  isI: makePredByNodeName('I'),
  isImg: makePredByNodeName('IMG'),
  isTextarea: isTextarea,
  deepestChildIsEmpty: deepestChildIsEmpty,
  isEmpty: dom_isEmpty,
  isEmptyAnchor: func.and(isAnchor, dom_isEmpty),
  isClosestSibling: isClosestSibling,
  withClosestSiblings: withClosestSiblings,
  nodeLength: nodeLength,
  isLeftEdgePoint: isLeftEdgePoint,
  isRightEdgePoint: isRightEdgePoint,
  isEdgePoint: isEdgePoint,
  isLeftEdgeOf: dom_isLeftEdgeOf,
  isRightEdgeOf: isRightEdgeOf,
  isLeftEdgePointOf: isLeftEdgePointOf,
  isRightEdgePointOf: isRightEdgePointOf,
  prevPoint: dom_prevPoint,
  nextPoint: dom_nextPoint,
  nextPointWithEmptyNode: nextPointWithEmptyNode,
  isSamePoint: isSamePoint,
  isVisiblePoint: isVisiblePoint,
  prevPointUntil: prevPointUntil,
  nextPointUntil: nextPointUntil,
  isCharPoint: isCharPoint,
  isSpacePoint: isSpacePoint,
  walkPoint: walkPoint,
  ancestor: dom_ancestor,
  singleChildAncestor: singleChildAncestor,
  listAncestor: listAncestor,
  lastAncestor: lastAncestor,
  listNext: listNext,
  listPrev: listPrev,
  listDescendant: listDescendant,
  commonAncestor: dom_commonAncestor,
  wrap: wrap,
  insertAfter: insertAfter,
  appendChildNodes: appendChildNodes,
  position: dom_position,
  hasChildren: hasChildren,
  makeOffsetPath: makeOffsetPath,
  fromOffsetPath: fromOffsetPath,
  splitTree: splitTree,
  splitPoint: splitPoint,
  create: dom_create,
  createText: createText,
  remove: remove,
  removeWhile: removeWhile,
  replace: dom_replace,
  html: dom_html,
  value: dom_value,
  posFromPlaceholder: posFromPlaceholder,
  attachEvents: attachEvents,
  detachEvents: detachEvents,
  isCustomStyleTag: isCustomStyleTag
});
// CONCATENATED MODULE: ./src/js/base/Context.js
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }






var Context_Context = /*#__PURE__*/function () {
  /**
   * @param {jQuery} $note
   * @param {Object} options
   */
  function Context($note, options) {
    _classCallCheck(this, Context);

    this.$note = $note;
    this.memos = {};
    this.modules = {};
    this.layoutInfo = {};
    this.options = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.extend(true, {}, options); // init ui with options

    external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.ui = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.ui_template(this.options);
    this.ui = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.ui;
    this.initialize();
  }
  /**
   * create layout and initialize modules and other resources
   */


  _createClass(Context, [{
    key: "initialize",
    value: function initialize() {
      this.layoutInfo = this.ui.createLayout(this.$note);

      this._initialize();

      this.$note.hide();
      return this;
    }
    /**
     * destroy modules and other resources and remove layout
     */

  }, {
    key: "destroy",
    value: function destroy() {
      this._destroy();

      this.$note.removeData('summernote');
      this.ui.removeLayout(this.$note, this.layoutInfo);
    }
    /**
     * destory modules and other resources and initialize it again
     */

  }, {
    key: "reset",
    value: function reset() {
      var disabled = this.isDisabled();
      this.code(dom.emptyPara);

      this._destroy();

      this._initialize();

      if (disabled) {
        this.disable();
      }
    }
  }, {
    key: "_initialize",
    value: function _initialize() {
      var _this = this;

      // set own id
      this.options.id = func.uniqueId(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.now()); // set default container for tooltips, popovers, and dialogs

      this.options.container = this.options.container || this.layoutInfo.editor; // add optional buttons

      var buttons = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.extend({}, this.options.buttons);
      Object.keys(buttons).forEach(function (key) {
        _this.memo('button.' + key, buttons[key]);
      });
      var modules = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.extend({}, this.options.modules, external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.plugins || {}); // add and initialize modules

      Object.keys(modules).forEach(function (key) {
        _this.module(key, modules[key], true);
      });
      Object.keys(this.modules).forEach(function (key) {
        _this.initializeModule(key);
      });
    }
  }, {
    key: "_destroy",
    value: function _destroy() {
      var _this2 = this;

      // destroy modules with reversed order
      Object.keys(this.modules).reverse().forEach(function (key) {
        _this2.removeModule(key);
      });
      Object.keys(this.memos).forEach(function (key) {
        _this2.removeMemo(key);
      }); // trigger custom onDestroy callback

      this.triggerEvent('destroy', this);
    }
  }, {
    key: "code",
    value: function code(html) {
      var isActivated = this.invoke('codeview.isActivated');

      if (html === undefined) {
        this.invoke('codeview.sync');
        return isActivated ? this.layoutInfo.codable.val() : this.layoutInfo.editable.html();
      } else {
        if (isActivated) {
          this.invoke('codeview.sync', html);
        } else {
          this.layoutInfo.editable.html(html);
        }

        this.$note.val(html);
        this.triggerEvent('change', html, this.layoutInfo.editable);
      }
    }
  }, {
    key: "isDisabled",
    value: function isDisabled() {
      return this.layoutInfo.editable.attr('contenteditable') === 'false';
    }
  }, {
    key: "enable",
    value: function enable() {
      this.layoutInfo.editable.attr('contenteditable', true);
      this.invoke('toolbar.activate', true);
      this.triggerEvent('disable', false);
      this.options.editing = true;
    }
  }, {
    key: "disable",
    value: function disable() {
      // close codeview if codeview is opend
      if (this.invoke('codeview.isActivated')) {
        this.invoke('codeview.deactivate');
      }

      this.layoutInfo.editable.attr('contenteditable', false);
      this.options.editing = false;
      this.invoke('toolbar.deactivate', true);
      this.triggerEvent('disable', true);
    }
  }, {
    key: "triggerEvent",
    value: function triggerEvent() {
      var namespace = lists.head(arguments);
      var args = lists.tail(lists.from(arguments));
      var callback = this.options.callbacks[func.namespaceToCamel(namespace, 'on')];

      if (callback) {
        callback.apply(this.$note[0], args);
      }

      this.$note.trigger('summernote.' + namespace, args);
    }
  }, {
    key: "initializeModule",
    value: function initializeModule(key) {
      var module = this.modules[key];
      module.shouldInitialize = module.shouldInitialize || func.ok;

      if (!module.shouldInitialize()) {
        return;
      } // initialize module


      if (module.initialize) {
        module.initialize();
      } // attach events


      if (module.events) {
        dom.attachEvents(this.$note, module.events);
      }
    }
  }, {
    key: "module",
    value: function module(key, ModuleClass, withoutIntialize) {
      if (arguments.length === 1) {
        return this.modules[key];
      }

      this.modules[key] = new ModuleClass(this);

      if (!withoutIntialize) {
        this.initializeModule(key);
      }
    }
  }, {
    key: "removeModule",
    value: function removeModule(key) {
      var module = this.modules[key];

      if (module.shouldInitialize()) {
        if (module.events) {
          dom.detachEvents(this.$note, module.events);
        }

        if (module.destroy) {
          module.destroy();
        }
      }

      delete this.modules[key];
    }
  }, {
    key: "memo",
    value: function memo(key, obj) {
      if (arguments.length === 1) {
        return this.memos[key];
      }

      this.memos[key] = obj;
    }
  }, {
    key: "removeMemo",
    value: function removeMemo(key) {
      if (this.memos[key] && this.memos[key].destroy) {
        this.memos[key].destroy();
      }

      delete this.memos[key];
    }
    /**
     * Some buttons need to change their visual style immediately once they get pressed
     */

  }, {
    key: "createInvokeHandlerAndUpdateState",
    value: function createInvokeHandlerAndUpdateState(namespace, value) {
      var _this3 = this;

      return function (event) {
        _this3.createInvokeHandler(namespace, value)(event);

        _this3.invoke('buttons.updateCurrentStyle');
      };
    }
  }, {
    key: "createInvokeHandler",
    value: function createInvokeHandler(namespace, value) {
      var _this4 = this;

      return function (event) {
        event.preventDefault();
        var $target = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(event.target);

        _this4.invoke(namespace, value || $target.closest('[data-value]').data('value'), $target);
      };
    }
  }, {
    key: "invoke",
    value: function invoke() {
      var namespace = lists.head(arguments);
      var args = lists.tail(lists.from(arguments));
      var splits = namespace.split('.');
      var hasSeparator = splits.length > 1;
      var moduleName = hasSeparator && lists.head(splits);
      var methodName = hasSeparator ? lists.last(splits) : lists.head(splits);
      var module = this.modules[moduleName || 'editor'];

      if (!moduleName && this[methodName]) {
        return this[methodName].apply(this, args);
      } else if (module && module[methodName] && module.shouldInitialize()) {
        return module[methodName].apply(module, args);
      }
    }
  }]);

  return Context;
}();


// CONCATENATED MODULE: ./src/js/summernote.js




external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.fn.extend({
  /**
   * Summernote API
   *
   * @param {Object|String}
   * @return {this}
   */
  summernote: function summernote() {
    var type = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.type(lists.head(arguments));
    var isExternalAPICalled = type === 'string';
    var hasInitOptions = type === 'object';
    var options = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.extend({}, external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.options, hasInitOptions ? lists.head(arguments) : {}); // Update options

    options.langInfo = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.extend(true, {}, external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.lang['en-US'], external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.lang[options.lang]);
    options.icons = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.extend(true, {}, external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.options.icons, options.icons);
    options.tooltip = options.tooltip === 'auto' ? !env.isSupportTouch : options.tooltip;
    this.each(function (idx, note) {
      var $note = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(note);

      if (!$note.data('summernote')) {
        var context = new Context_Context($note, options);
        $note.data('summernote', context);
        $note.data('summernote').triggerEvent('init', context.layoutInfo);
      }
    });
    var $note = this.first();

    if ($note.length) {
      var context = $note.data('summernote');

      if (isExternalAPICalled) {
        return context.invoke.apply(context, lists.from(arguments));
      } else if (options.focus) {
        context.invoke('editor.focus');
      }
    }

    return this;
  }
});
// CONCATENATED MODULE: ./src/js/base/core/range.js
function range_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function range_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function range_createClass(Constructor, protoProps, staticProps) { if (protoProps) range_defineProperties(Constructor.prototype, protoProps); if (staticProps) range_defineProperties(Constructor, staticProps); return Constructor; }






/**
 * return boundaryPoint from TextRange, inspired by Andy Na's HuskyRange.js
 *
 * @param {TextRange} textRange
 * @param {Boolean} isStart
 * @return {BoundaryPoint}
 *
 * @see http://msdn.microsoft.com/en-us/library/ie/ms535872(v=vs.85).aspx
 */

function textRangeToPoint(textRange, isStart) {
  var container = textRange.parentElement();
  var offset;
  var tester = document.body.createTextRange();
  var prevContainer;
  var childNodes = lists.from(container.childNodes);

  for (offset = 0; offset < childNodes.length; offset++) {
    if (dom.isText(childNodes[offset])) {
      continue;
    }

    tester.moveToElementText(childNodes[offset]);

    if (tester.compareEndPoints('StartToStart', textRange) >= 0) {
      break;
    }

    prevContainer = childNodes[offset];
  }

  if (offset !== 0 && dom.isText(childNodes[offset - 1])) {
    var textRangeStart = document.body.createTextRange();
    var curTextNode = null;
    textRangeStart.moveToElementText(prevContainer || container);
    textRangeStart.collapse(!prevContainer);
    curTextNode = prevContainer ? prevContainer.nextSibling : container.firstChild;
    var pointTester = textRange.duplicate();
    pointTester.setEndPoint('StartToStart', textRangeStart);
    var textCount = pointTester.text.replace(/[\r\n]/g, '').length;

    while (textCount > curTextNode.nodeValue.length && curTextNode.nextSibling) {
      textCount -= curTextNode.nodeValue.length;
      curTextNode = curTextNode.nextSibling;
    } // [workaround] enforce IE to re-reference curTextNode, hack


    var dummy = curTextNode.nodeValue; // eslint-disable-line

    if (isStart && curTextNode.nextSibling && dom.isText(curTextNode.nextSibling) && textCount === curTextNode.nodeValue.length) {
      textCount -= curTextNode.nodeValue.length;
      curTextNode = curTextNode.nextSibling;
    }

    container = curTextNode;
    offset = textCount;
  }

  return {
    cont: container,
    offset: offset
  };
}
/**
 * return TextRange from boundary point (inspired by google closure-library)
 * @param {BoundaryPoint} point
 * @return {TextRange}
 */


function pointToTextRange(point) {
  var textRangeInfo = function textRangeInfo(container, offset) {
    var node, isCollapseToStart;

    if (dom.isText(container)) {
      var prevTextNodes = dom.listPrev(container, func.not(dom.isText));
      var prevContainer = lists.last(prevTextNodes).previousSibling;
      node = prevContainer || container.parentNode;
      offset += lists.sum(lists.tail(prevTextNodes), dom.nodeLength);
      isCollapseToStart = !prevContainer;
    } else {
      node = container.childNodes[offset] || container;

      if (dom.isText(node)) {
        return textRangeInfo(node, 0);
      }

      offset = 0;
      isCollapseToStart = false;
    }

    return {
      node: node,
      collapseToStart: isCollapseToStart,
      offset: offset
    };
  };

  var textRange = document.body.createTextRange();
  var info = textRangeInfo(point.node, point.offset);
  textRange.moveToElementText(info.node);
  textRange.collapse(info.collapseToStart);
  textRange.moveStart('character', info.offset);
  return textRange;
}
/**
   * Wrapped Range
   *
   * @constructor
   * @param {Node} sc - start container
   * @param {Number} so - start offset
   * @param {Node} ec - end container
   * @param {Number} eo - end offset
   */


var range_WrappedRange = /*#__PURE__*/function () {
  function WrappedRange(sc, so, ec, eo) {
    range_classCallCheck(this, WrappedRange);

    this.sc = sc;
    this.so = so;
    this.ec = ec;
    this.eo = eo; // isOnEditable: judge whether range is on editable or not

    this.isOnEditable = this.makeIsOn(dom.isEditable); // isOnList: judge whether range is on list node or not

    this.isOnList = this.makeIsOn(dom.isList); // isOnAnchor: judge whether range is on anchor node or not

    this.isOnAnchor = this.makeIsOn(dom.isAnchor); // isOnCell: judge whether range is on cell node or not

    this.isOnCell = this.makeIsOn(dom.isCell); // isOnData: judge whether range is on data node or not

    this.isOnData = this.makeIsOn(dom.isData);
  } // nativeRange: get nativeRange from sc, so, ec, eo


  range_createClass(WrappedRange, [{
    key: "nativeRange",
    value: function nativeRange() {
      if (env.isW3CRangeSupport) {
        var w3cRange = document.createRange();
        w3cRange.setStart(this.sc, this.so);
        w3cRange.setEnd(this.ec, this.eo);
        return w3cRange;
      } else {
        var textRange = pointToTextRange({
          node: this.sc,
          offset: this.so
        });
        textRange.setEndPoint('EndToEnd', pointToTextRange({
          node: this.ec,
          offset: this.eo
        }));
        return textRange;
      }
    }
  }, {
    key: "getPoints",
    value: function getPoints() {
      return {
        sc: this.sc,
        so: this.so,
        ec: this.ec,
        eo: this.eo
      };
    }
  }, {
    key: "getStartPoint",
    value: function getStartPoint() {
      return {
        node: this.sc,
        offset: this.so
      };
    }
  }, {
    key: "getEndPoint",
    value: function getEndPoint() {
      return {
        node: this.ec,
        offset: this.eo
      };
    }
    /**
     * select update visible range
     */

  }, {
    key: "select",
    value: function select() {
      var nativeRng = this.nativeRange();

      if (env.isW3CRangeSupport) {
        var selection = document.getSelection();

        if (selection.rangeCount > 0) {
          selection.removeAllRanges();
        }

        selection.addRange(nativeRng);
      } else {
        nativeRng.select();
      }

      return this;
    }
    /**
     * Moves the scrollbar to start container(sc) of current range
     *
     * @return {WrappedRange}
     */

  }, {
    key: "scrollIntoView",
    value: function scrollIntoView(container) {
      var height = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(container).height();

      if (container.scrollTop + height < this.sc.offsetTop) {
        container.scrollTop += Math.abs(container.scrollTop + height - this.sc.offsetTop);
      }

      return this;
    }
    /**
     * @return {WrappedRange}
     */

  }, {
    key: "normalize",
    value: function normalize() {
      /**
       * @param {BoundaryPoint} point
       * @param {Boolean} isLeftToRight - true: prefer to choose right node
       *                                - false: prefer to choose left node
       * @return {BoundaryPoint}
       */
      var getVisiblePoint = function getVisiblePoint(point, isLeftToRight) {
        if (!point) {
          return point;
        } // Just use the given point [XXX:Adhoc]
        //  - case 01. if the point is on the middle of the node
        //  - case 02. if the point is on the right edge and prefer to choose left node
        //  - case 03. if the point is on the left edge and prefer to choose right node
        //  - case 04. if the point is on the right edge and prefer to choose right node but the node is void
        //  - case 05. if the point is on the left edge and prefer to choose left node but the node is void
        //  - case 06. if the point is on the block node and there is no children


        if (dom.isVisiblePoint(point)) {
          if (!dom.isEdgePoint(point) || dom.isRightEdgePoint(point) && !isLeftToRight || dom.isLeftEdgePoint(point) && isLeftToRight || dom.isRightEdgePoint(point) && isLeftToRight && dom.isVoid(point.node.nextSibling) || dom.isLeftEdgePoint(point) && !isLeftToRight && dom.isVoid(point.node.previousSibling) || dom.isBlock(point.node) && dom.isEmpty(point.node)) {
            return point;
          }
        } // point on block's edge


        var block = dom.ancestor(point.node, dom.isBlock);
        var hasRightNode = false;

        if (!hasRightNode) {
          var prevPoint = dom.prevPoint(point) || {
            node: null
          };
          hasRightNode = (dom.isLeftEdgePointOf(point, block) || dom.isVoid(prevPoint.node)) && !isLeftToRight;
        }

        var hasLeftNode = false;

        if (!hasLeftNode) {
          var _nextPoint = dom.nextPoint(point) || {
            node: null
          };

          hasLeftNode = (dom.isRightEdgePointOf(point, block) || dom.isVoid(_nextPoint.node)) && isLeftToRight;
        }

        if (hasRightNode || hasLeftNode) {
          // returns point already on visible point
          if (dom.isVisiblePoint(point)) {
            return point;
          } // reverse direction


          isLeftToRight = !isLeftToRight;
        }

        var nextPoint = isLeftToRight ? dom.nextPointUntil(dom.nextPoint(point), dom.isVisiblePoint) : dom.prevPointUntil(dom.prevPoint(point), dom.isVisiblePoint);
        return nextPoint || point;
      };

      var endPoint = getVisiblePoint(this.getEndPoint(), false);
      var startPoint = this.isCollapsed() ? endPoint : getVisiblePoint(this.getStartPoint(), true);
      return new WrappedRange(startPoint.node, startPoint.offset, endPoint.node, endPoint.offset);
    }
    /**
     * returns matched nodes on range
     *
     * @param {Function} [pred] - predicate function
     * @param {Object} [options]
     * @param {Boolean} [options.includeAncestor]
     * @param {Boolean} [options.fullyContains]
     * @return {Node[]}
     */

  }, {
    key: "nodes",
    value: function nodes(pred, options) {
      pred = pred || func.ok;
      var includeAncestor = options && options.includeAncestor;
      var fullyContains = options && options.fullyContains; // TODO compare points and sort

      var startPoint = this.getStartPoint();
      var endPoint = this.getEndPoint();
      var nodes = [];
      var leftEdgeNodes = [];
      dom.walkPoint(startPoint, endPoint, function (point) {
        if (dom.isEditable(point.node)) {
          return;
        }

        var node;

        if (fullyContains) {
          if (dom.isLeftEdgePoint(point)) {
            leftEdgeNodes.push(point.node);
          }

          if (dom.isRightEdgePoint(point) && lists.contains(leftEdgeNodes, point.node)) {
            node = point.node;
          }
        } else if (includeAncestor) {
          node = dom.ancestor(point.node, pred);
        } else {
          node = point.node;
        }

        if (node && pred(node)) {
          nodes.push(node);
        }
      }, true);
      return lists.unique(nodes);
    }
    /**
     * returns commonAncestor of range
     * @return {Element} - commonAncestor
     */

  }, {
    key: "commonAncestor",
    value: function commonAncestor() {
      return dom.commonAncestor(this.sc, this.ec);
    }
    /**
     * returns expanded range by pred
     *
     * @param {Function} pred - predicate function
     * @return {WrappedRange}
     */

  }, {
    key: "expand",
    value: function expand(pred) {
      var startAncestor = dom.ancestor(this.sc, pred);
      var endAncestor = dom.ancestor(this.ec, pred);

      if (!startAncestor && !endAncestor) {
        return new WrappedRange(this.sc, this.so, this.ec, this.eo);
      }

      var boundaryPoints = this.getPoints();

      if (startAncestor) {
        boundaryPoints.sc = startAncestor;
        boundaryPoints.so = 0;
      }

      if (endAncestor) {
        boundaryPoints.ec = endAncestor;
        boundaryPoints.eo = dom.nodeLength(endAncestor);
      }

      return new WrappedRange(boundaryPoints.sc, boundaryPoints.so, boundaryPoints.ec, boundaryPoints.eo);
    }
    /**
     * @param {Boolean} isCollapseToStart
     * @return {WrappedRange}
     */

  }, {
    key: "collapse",
    value: function collapse(isCollapseToStart) {
      if (isCollapseToStart) {
        return new WrappedRange(this.sc, this.so, this.sc, this.so);
      } else {
        return new WrappedRange(this.ec, this.eo, this.ec, this.eo);
      }
    }
    /**
     * splitText on range
     */

  }, {
    key: "splitText",
    value: function splitText() {
      var isSameContainer = this.sc === this.ec;
      var boundaryPoints = this.getPoints();

      if (dom.isText(this.ec) && !dom.isEdgePoint(this.getEndPoint())) {
        this.ec.splitText(this.eo);
      }

      if (dom.isText(this.sc) && !dom.isEdgePoint(this.getStartPoint())) {
        boundaryPoints.sc = this.sc.splitText(this.so);
        boundaryPoints.so = 0;

        if (isSameContainer) {
          boundaryPoints.ec = boundaryPoints.sc;
          boundaryPoints.eo = this.eo - this.so;
        }
      }

      return new WrappedRange(boundaryPoints.sc, boundaryPoints.so, boundaryPoints.ec, boundaryPoints.eo);
    }
    /**
     * delete contents on range
     * @return {WrappedRange}
     */

  }, {
    key: "deleteContents",
    value: function deleteContents() {
      if (this.isCollapsed()) {
        return this;
      }

      var rng = this.splitText();
      var nodes = rng.nodes(null, {
        fullyContains: true
      }); // find new cursor point

      var point = dom.prevPointUntil(rng.getStartPoint(), function (point) {
        return !lists.contains(nodes, point.node);
      });
      var emptyParents = [];
      external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(nodes, function (idx, node) {
        // find empty parents
        var parent = node.parentNode;

        if (point.node !== parent && dom.nodeLength(parent) === 1) {
          emptyParents.push(parent);
        }

        dom.remove(node, false);
      }); // remove empty parents

      external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(emptyParents, function (idx, node) {
        dom.remove(node, false);
      });
      return new WrappedRange(point.node, point.offset, point.node, point.offset).normalize();
    }
    /**
     * makeIsOn: return isOn(pred) function
     */

  }, {
    key: "makeIsOn",
    value: function makeIsOn(pred) {
      return function () {
        var ancestor = dom.ancestor(this.sc, pred);
        return !!ancestor && ancestor === dom.ancestor(this.ec, pred);
      };
    }
    /**
     * @param {Function} pred
     * @return {Boolean}
     */

  }, {
    key: "isLeftEdgeOf",
    value: function isLeftEdgeOf(pred) {
      if (!dom.isLeftEdgePoint(this.getStartPoint())) {
        return false;
      }

      var node = dom.ancestor(this.sc, pred);
      return node && dom.isLeftEdgeOf(this.sc, node);
    }
    /**
     * returns whether range was collapsed or not
     */

  }, {
    key: "isCollapsed",
    value: function isCollapsed() {
      return this.sc === this.ec && this.so === this.eo;
    }
    /**
     * wrap inline nodes which children of body with paragraph
     *
     * @return {WrappedRange}
     */

  }, {
    key: "wrapBodyInlineWithPara",
    value: function wrapBodyInlineWithPara() {
      if (dom.isBodyContainer(this.sc) && dom.isEmpty(this.sc)) {
        this.sc.innerHTML = dom.emptyPara;
        return new WrappedRange(this.sc.firstChild, 0, this.sc.firstChild, 0);
      }
      /**
       * [workaround] firefox often create range on not visible point. so normalize here.
       *  - firefox: |<p>text</p>|
       *  - chrome: <p>|text|</p>
       */


      var rng = this.normalize();

      if (dom.isParaInline(this.sc) || dom.isPara(this.sc)) {
        return rng;
      } // find inline top ancestor


      var topAncestor;

      if (dom.isInline(rng.sc)) {
        var ancestors = dom.listAncestor(rng.sc, func.not(dom.isInline));
        topAncestor = lists.last(ancestors);

        if (!dom.isInline(topAncestor)) {
          topAncestor = ancestors[ancestors.length - 2] || rng.sc.childNodes[rng.so];
        }
      } else {
        topAncestor = rng.sc.childNodes[rng.so > 0 ? rng.so - 1 : 0];
      }

      if (topAncestor) {
        // siblings not in paragraph
        var inlineSiblings = dom.listPrev(topAncestor, dom.isParaInline).reverse();
        inlineSiblings = inlineSiblings.concat(dom.listNext(topAncestor.nextSibling, dom.isParaInline)); // wrap with paragraph

        if (inlineSiblings.length) {
          var para = dom.wrap(lists.head(inlineSiblings), 'p');
          dom.appendChildNodes(para, lists.tail(inlineSiblings));
        }
      }

      return this.normalize();
    }
    /**
     * insert node at current cursor
     *
     * @param {Node} node
     * @return {Node}
     */

  }, {
    key: "insertNode",
    value: function insertNode(node) {
      var rng = this;

      if (dom.isText(node) || dom.isInline(node)) {
        rng = this.wrapBodyInlineWithPara().deleteContents();
      }

      var info = dom.splitPoint(rng.getStartPoint(), dom.isInline(node));

      if (info.rightNode) {
        info.rightNode.parentNode.insertBefore(node, info.rightNode);

        if (dom.isEmpty(info.rightNode) && dom.isPara(node)) {
          info.rightNode.parentNode.removeChild(info.rightNode);
        }
      } else {
        info.container.appendChild(node);
      }

      return node;
    }
    /**
     * insert html at current cursor
     */

  }, {
    key: "pasteHTML",
    value: function pasteHTML(markup) {
      markup = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.trim(markup);
      var contentsContainer = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<div></div>').html(markup)[0];
      var childNodes = lists.from(contentsContainer.childNodes); // const rng = this.wrapBodyInlineWithPara().deleteContents();

      var rng = this;
      var reversed = false;

      if (rng.so >= 0) {
        childNodes = childNodes.reverse();
        reversed = true;
      }

      childNodes = childNodes.map(function (childNode) {
        return rng.insertNode(childNode);
      });

      if (reversed) {
        childNodes = childNodes.reverse();
      }

      return childNodes;
    }
    /**
     * returns text in range
     *
     * @return {String}
     */

  }, {
    key: "toString",
    value: function toString() {
      var nativeRng = this.nativeRange();
      return env.isW3CRangeSupport ? nativeRng.toString() : nativeRng.text;
    }
    /**
     * returns range for word before cursor
     *
     * @param {Boolean} [findAfter] - find after cursor, default: false
     * @return {WrappedRange}
     */

  }, {
    key: "getWordRange",
    value: function getWordRange(findAfter) {
      var endPoint = this.getEndPoint();

      if (!dom.isCharPoint(endPoint)) {
        return this;
      }

      var startPoint = dom.prevPointUntil(endPoint, function (point) {
        return !dom.isCharPoint(point);
      });

      if (findAfter) {
        endPoint = dom.nextPointUntil(endPoint, function (point) {
          return !dom.isCharPoint(point);
        });
      }

      return new WrappedRange(startPoint.node, startPoint.offset, endPoint.node, endPoint.offset);
    }
    /**
     * returns range for words before cursor
     *
     * @param {Boolean} [findAfter] - find after cursor, default: false
     * @return {WrappedRange}
     */

  }, {
    key: "getWordsRange",
    value: function getWordsRange(findAfter) {
      var endPoint = this.getEndPoint();

      var isNotTextPoint = function isNotTextPoint(point) {
        return !dom.isCharPoint(point) && !dom.isSpacePoint(point);
      };

      if (isNotTextPoint(endPoint)) {
        return this;
      }

      var startPoint = dom.prevPointUntil(endPoint, isNotTextPoint);

      if (findAfter) {
        endPoint = dom.nextPointUntil(endPoint, isNotTextPoint);
      }

      return new WrappedRange(startPoint.node, startPoint.offset, endPoint.node, endPoint.offset);
    }
    /**
     * returns range for words before cursor that match with a Regex
     *
     * example:
     *  range: 'hi @Peter Pan'
     *  regex: '/@[a-z ]+/i'
     *  return range: '@Peter Pan'
     *
     * @param {RegExp} [regex]
     * @return {WrappedRange|null}
     */

  }, {
    key: "getWordsMatchRange",
    value: function getWordsMatchRange(regex) {
      var endPoint = this.getEndPoint();
      var startPoint = dom.prevPointUntil(endPoint, function (point) {
        if (!dom.isCharPoint(point) && !dom.isSpacePoint(point)) {
          return true;
        }

        var rng = new WrappedRange(point.node, point.offset, endPoint.node, endPoint.offset);
        var result = regex.exec(rng.toString());
        return result && result.index === 0;
      });
      var rng = new WrappedRange(startPoint.node, startPoint.offset, endPoint.node, endPoint.offset);
      var text = rng.toString();
      var result = regex.exec(text);

      if (result && result[0].length === text.length) {
        return rng;
      } else {
        return null;
      }
    }
    /**
     * create offsetPath bookmark
     *
     * @param {Node} editable
     */

  }, {
    key: "bookmark",
    value: function bookmark(editable) {
      return {
        s: {
          path: dom.makeOffsetPath(editable, this.sc),
          offset: this.so
        },
        e: {
          path: dom.makeOffsetPath(editable, this.ec),
          offset: this.eo
        }
      };
    }
    /**
     * create offsetPath bookmark base on paragraph
     *
     * @param {Node[]} paras
     */

  }, {
    key: "paraBookmark",
    value: function paraBookmark(paras) {
      return {
        s: {
          path: lists.tail(dom.makeOffsetPath(lists.head(paras), this.sc)),
          offset: this.so
        },
        e: {
          path: lists.tail(dom.makeOffsetPath(lists.last(paras), this.ec)),
          offset: this.eo
        }
      };
    }
    /**
     * getClientRects
     * @return {Rect[]}
     */

  }, {
    key: "getClientRects",
    value: function getClientRects() {
      var nativeRng = this.nativeRange();
      return nativeRng.getClientRects();
    }
  }]);

  return WrappedRange;
}();
/**
 * Data structure
 *  * BoundaryPoint: a point of dom tree
 *  * BoundaryPoints: two boundaryPoints corresponding to the start and the end of the Range
 *
 * See to http://www.w3.org/TR/DOM-Level-2-Traversal-Range/ranges.html#Level-2-Range-Position
 */


/* harmony default export */ var range = ({
  /**
   * create Range Object From arguments or Browser Selection
   *
   * @param {Node} sc - start container
   * @param {Number} so - start offset
   * @param {Node} ec - end container
   * @param {Number} eo - end offset
   * @return {WrappedRange}
   */
  create: function create(sc, so, ec, eo) {
    if (arguments.length === 4) {
      return new range_WrappedRange(sc, so, ec, eo);
    } else if (arguments.length === 2) {
      // collapsed
      ec = sc;
      eo = so;
      return new range_WrappedRange(sc, so, ec, eo);
    } else {
      var wrappedRange = this.createFromSelection();

      if (!wrappedRange && arguments.length === 1) {
        var bodyElement = arguments[0];

        if (dom.isEditable(bodyElement)) {
          bodyElement = bodyElement.lastChild;
        }

        return this.createFromBodyElement(bodyElement, dom.emptyPara === arguments[0].innerHTML);
      }

      return wrappedRange;
    }
  },
  createFromBodyElement: function createFromBodyElement(bodyElement) {
    var isCollapseToStart = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
    var wrappedRange = this.createFromNode(bodyElement);
    return wrappedRange.collapse(isCollapseToStart);
  },
  createFromSelection: function createFromSelection() {
    var sc, so, ec, eo;

    if (env.isW3CRangeSupport) {
      var selection = document.getSelection();

      if (!selection || selection.rangeCount === 0) {
        return null;
      } else if (dom.isBody(selection.anchorNode)) {
        // Firefox: returns entire body as range on initialization.
        // We won't never need it.
        return null;
      }

      var nativeRng = selection.getRangeAt(0);
      sc = nativeRng.startContainer;
      so = nativeRng.startOffset;
      ec = nativeRng.endContainer;
      eo = nativeRng.endOffset;
    } else {
      // IE8: TextRange
      var textRange = document.selection.createRange();
      var textRangeEnd = textRange.duplicate();
      textRangeEnd.collapse(false);
      var textRangeStart = textRange;
      textRangeStart.collapse(true);
      var startPoint = textRangeToPoint(textRangeStart, true);
      var endPoint = textRangeToPoint(textRangeEnd, false); // same visible point case: range was collapsed.

      if (dom.isText(startPoint.node) && dom.isLeftEdgePoint(startPoint) && dom.isTextNode(endPoint.node) && dom.isRightEdgePoint(endPoint) && endPoint.node.nextSibling === startPoint.node) {
        startPoint = endPoint;
      }

      sc = startPoint.cont;
      so = startPoint.offset;
      ec = endPoint.cont;
      eo = endPoint.offset;
    }

    return new range_WrappedRange(sc, so, ec, eo);
  },

  /**
   * @method
   *
   * create WrappedRange from node
   *
   * @param {Node} node
   * @return {WrappedRange}
   */
  createFromNode: function createFromNode(node) {
    var sc = node;
    var so = 0;
    var ec = node;
    var eo = dom.nodeLength(ec); // browsers can't target a picture or void node

    if (dom.isVoid(sc)) {
      so = dom.listPrev(sc).length - 1;
      sc = sc.parentNode;
    }

    if (dom.isBR(ec)) {
      eo = dom.listPrev(ec).length - 1;
      ec = ec.parentNode;
    } else if (dom.isVoid(ec)) {
      eo = dom.listPrev(ec).length;
      ec = ec.parentNode;
    }

    return this.create(sc, so, ec, eo);
  },

  /**
   * create WrappedRange from node after position
   *
   * @param {Node} node
   * @return {WrappedRange}
   */
  createFromNodeBefore: function createFromNodeBefore(node) {
    return this.createFromNode(node).collapse(true);
  },

  /**
   * create WrappedRange from node after position
   *
   * @param {Node} node
   * @return {WrappedRange}
   */
  createFromNodeAfter: function createFromNodeAfter(node) {
    return this.createFromNode(node).collapse();
  },

  /**
   * @method
   *
   * create WrappedRange from bookmark
   *
   * @param {Node} editable
   * @param {Object} bookmark
   * @return {WrappedRange}
   */
  createFromBookmark: function createFromBookmark(editable, bookmark) {
    var sc = dom.fromOffsetPath(editable, bookmark.s.path);
    var so = bookmark.s.offset;
    var ec = dom.fromOffsetPath(editable, bookmark.e.path);
    var eo = bookmark.e.offset;
    return new range_WrappedRange(sc, so, ec, eo);
  },

  /**
   * @method
   *
   * create WrappedRange from paraBookmark
   *
   * @param {Object} bookmark
   * @param {Node[]} paras
   * @return {WrappedRange}
   */
  createFromParaBookmark: function createFromParaBookmark(bookmark, paras) {
    var so = bookmark.s.offset;
    var eo = bookmark.e.offset;
    var sc = dom.fromOffsetPath(lists.head(paras), bookmark.s.path);
    var ec = dom.fromOffsetPath(lists.last(paras), bookmark.e.path);
    return new range_WrappedRange(sc, so, ec, eo);
  }
});
// CONCATENATED MODULE: ./src/js/base/core/key.js


var KEY_MAP = {
  'BACKSPACE': 8,
  'TAB': 9,
  'ENTER': 13,
  'ESCAPE': 27,
  'SPACE': 32,
  'DELETE': 46,
  // Arrow
  'LEFT': 37,
  'UP': 38,
  'RIGHT': 39,
  'DOWN': 40,
  // Number: 0-9
  'NUM0': 48,
  'NUM1': 49,
  'NUM2': 50,
  'NUM3': 51,
  'NUM4': 52,
  'NUM5': 53,
  'NUM6': 54,
  'NUM7': 55,
  'NUM8': 56,
  // Alphabet: a-z
  'B': 66,
  'E': 69,
  'I': 73,
  'J': 74,
  'K': 75,
  'L': 76,
  'R': 82,
  'S': 83,
  'U': 85,
  'V': 86,
  'Y': 89,
  'Z': 90,
  'SLASH': 191,
  'LEFTBRACKET': 219,
  'BACKSLASH': 220,
  'RIGHTBRACKET': 221,
  // Navigation
  'HOME': 36,
  'END': 35,
  'PAGEUP': 33,
  'PAGEDOWN': 34
};
/**
 * @class core.key
 *
 * Object for keycodes.
 *
 * @singleton
 * @alternateClassName key
 */

/* harmony default export */ var core_key = ({
  /**
   * @method isEdit
   *
   * @param {Number} keyCode
   * @return {Boolean}
   */
  isEdit: function isEdit(keyCode) {
    return lists.contains([KEY_MAP.BACKSPACE, KEY_MAP.TAB, KEY_MAP.ENTER, KEY_MAP.SPACE, KEY_MAP.DELETE], keyCode);
  },

  /**
   * @method isMove
   *
   * @param {Number} keyCode
   * @return {Boolean}
   */
  isMove: function isMove(keyCode) {
    return lists.contains([KEY_MAP.LEFT, KEY_MAP.UP, KEY_MAP.RIGHT, KEY_MAP.DOWN], keyCode);
  },

  /**
   * @method isNavigation
   *
   * @param {Number} keyCode
   * @return {Boolean}
   */
  isNavigation: function isNavigation(keyCode) {
    return lists.contains([KEY_MAP.HOME, KEY_MAP.END, KEY_MAP.PAGEUP, KEY_MAP.PAGEDOWN], keyCode);
  },

  /**
   * @property {Object} nameFromCode
   * @property {String} nameFromCode.8 "BACKSPACE"
   */
  nameFromCode: func.invertObject(KEY_MAP),
  code: KEY_MAP
});
// CONCATENATED MODULE: ./src/js/base/core/async.js

/**
 * @method readFileAsDataURL
 *
 * read contents of file as representing URL
 *
 * @param {File} file
 * @return {Promise} - then: dataUrl
 */

function readFileAsDataURL(file) {
  return external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.Deferred(function (deferred) {
    external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.extend(new FileReader(), {
      onload: function onload(e) {
        var dataURL = e.target.result;
        deferred.resolve(dataURL);
      },
      onerror: function onerror(err) {
        deferred.reject(err);
      }
    }).readAsDataURL(file);
  }).promise();
}
/**
 * @method createImage
 *
 * create `<image>` from url string
 *
 * @param {String} url
 * @return {Promise} - then: $image
 */

function createImage(url) {
  return external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.Deferred(function (deferred) {
    var $img = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<img>');
    $img.one('load', function () {
      $img.off('error abort');
      deferred.resolve($img);
    }).one('error abort', function () {
      $img.off('load').detach();
      deferred.reject($img);
    }).css({
      display: 'none'
    }).appendTo(document.body).attr('src', url);
  }).promise();
}
// CONCATENATED MODULE: ./src/js/base/editing/History.js
function History_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function History_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function History_createClass(Constructor, protoProps, staticProps) { if (protoProps) History_defineProperties(Constructor.prototype, protoProps); if (staticProps) History_defineProperties(Constructor, staticProps); return Constructor; }



var History_History = /*#__PURE__*/function () {
  function History(context) {
    History_classCallCheck(this, History);

    this.stack = [];
    this.stackOffset = -1;
    this.context = context;
    this.$editable = context.layoutInfo.editable;
    this.editable = this.$editable[0];
  }

  History_createClass(History, [{
    key: "makeSnapshot",
    value: function makeSnapshot() {
      var rng = range.create(this.editable);
      var emptyBookmark = {
        s: {
          path: [],
          offset: 0
        },
        e: {
          path: [],
          offset: 0
        }
      };
      return {
        contents: this.$editable.html(),
        bookmark: rng && rng.isOnEditable() ? rng.bookmark(this.editable) : emptyBookmark
      };
    }
  }, {
    key: "applySnapshot",
    value: function applySnapshot(snapshot) {
      if (snapshot.contents !== null) {
        this.$editable.html(snapshot.contents);
      }

      if (snapshot.bookmark !== null) {
        range.createFromBookmark(this.editable, snapshot.bookmark).select();
      }
    }
    /**
    * @method rewind
    * Rewinds the history stack back to the first snapshot taken.
    * Leaves the stack intact, so that "Redo" can still be used.
    */

  }, {
    key: "rewind",
    value: function rewind() {
      // Create snap shot if not yet recorded
      if (this.$editable.html() !== this.stack[this.stackOffset].contents) {
        this.recordUndo();
      } // Return to the first available snapshot.


      this.stackOffset = 0; // Apply that snapshot.

      this.applySnapshot(this.stack[this.stackOffset]);
    }
    /**
    *  @method commit
    *  Resets history stack, but keeps current editor's content.
    */

  }, {
    key: "commit",
    value: function commit() {
      // Clear the stack.
      this.stack = []; // Restore stackOffset to its original value.

      this.stackOffset = -1; // Record our first snapshot (of nothing).

      this.recordUndo();
    }
    /**
    * @method reset
    * Resets the history stack completely; reverting to an empty editor.
    */

  }, {
    key: "reset",
    value: function reset() {
      // Clear the stack.
      this.stack = []; // Restore stackOffset to its original value.

      this.stackOffset = -1; // Clear the editable area.

      this.$editable.html(''); // Record our first snapshot (of nothing).

      this.recordUndo();
    }
    /**
     * undo
     */

  }, {
    key: "undo",
    value: function undo() {
      // Create snap shot if not yet recorded
      if (this.$editable.html() !== this.stack[this.stackOffset].contents) {
        this.recordUndo();
      }

      if (this.stackOffset > 0) {
        this.stackOffset--;
        this.applySnapshot(this.stack[this.stackOffset]);
      }
    }
    /**
     * redo
     */

  }, {
    key: "redo",
    value: function redo() {
      if (this.stack.length - 1 > this.stackOffset) {
        this.stackOffset++;
        this.applySnapshot(this.stack[this.stackOffset]);
      }
    }
    /**
     * recorded undo
     */

  }, {
    key: "recordUndo",
    value: function recordUndo() {
      this.stackOffset++; // Wash out stack after stackOffset

      if (this.stack.length > this.stackOffset) {
        this.stack = this.stack.slice(0, this.stackOffset);
      } // Create new snapshot and push it to the end


      this.stack.push(this.makeSnapshot()); // If the stack size reachs to the limit, then slice it

      if (this.stack.length > this.context.options.historyLimit) {
        this.stack.shift();
        this.stackOffset -= 1;
      }
    }
  }]);

  return History;
}();


// CONCATENATED MODULE: ./src/js/base/editing/Style.js
function Style_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function Style_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function Style_createClass(Constructor, protoProps, staticProps) { if (protoProps) Style_defineProperties(Constructor.prototype, protoProps); if (staticProps) Style_defineProperties(Constructor, staticProps); return Constructor; }







var Style_Style = /*#__PURE__*/function () {
  function Style() {
    Style_classCallCheck(this, Style);
  }

  Style_createClass(Style, [{
    key: "jQueryCSS",

    /**
     * @method jQueryCSS
     *
     * [workaround] for old jQuery
     * passing an array of style properties to .css()
     * will result in an object of property-value pairs.
     * (compability with version < 1.9)
     *
     * @private
     * @param  {jQuery} $obj
     * @param  {Array} propertyNames - An array of one or more CSS properties.
     * @return {Object}
     */
    value: function jQueryCSS($obj, propertyNames) {
      if (env.jqueryVersion < 1.9) {
        var result = {};
        external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(propertyNames, function (idx, propertyName) {
          result[propertyName] = $obj.css(propertyName);
        });
        return result;
      }

      return $obj.css(propertyNames);
    }
    /**
     * returns style object from node
     *
     * @param {jQuery} $node
     * @return {Object}
     */

  }, {
    key: "fromNode",
    value: function fromNode($node) {
      var properties = ['font-family', 'font-size', 'text-align', 'list-style-type', 'line-height'];
      var styleInfo = this.jQueryCSS($node, properties) || {};
      var fontSize = $node[0].style.fontSize || styleInfo['font-size'];
      styleInfo['font-size'] = parseInt(fontSize, 10);
      styleInfo['font-size-unit'] = fontSize.match(/[a-z%]+$/);
      return styleInfo;
    }
    /**
     * paragraph level style
     *
     * @param {WrappedRange} rng
     * @param {Object} styleInfo
     */

  }, {
    key: "stylePara",
    value: function stylePara(rng, styleInfo) {
      external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(rng.nodes(dom.isPara, {
        includeAncestor: true
      }), function (idx, para) {
        external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(para).css(styleInfo);
      });
    }
    /**
     * insert and returns styleNodes on range.
     *
     * @param {WrappedRange} rng
     * @param {Object} [options] - options for styleNodes
     * @param {String} [options.nodeName] - default: `SPAN`
     * @param {Boolean} [options.expandClosestSibling] - default: `false`
     * @param {Boolean} [options.onlyPartialContains] - default: `false`
     * @return {Node[]}
     */

  }, {
    key: "styleNodes",
    value: function styleNodes(rng, options) {
      rng = rng.splitText();
      var nodeName = options && options.nodeName || 'SPAN';
      var expandClosestSibling = !!(options && options.expandClosestSibling);
      var onlyPartialContains = !!(options && options.onlyPartialContains);

      if (rng.isCollapsed()) {
        return [rng.insertNode(dom.create(nodeName))];
      }

      var pred = dom.makePredByNodeName(nodeName);
      var nodes = rng.nodes(dom.isText, {
        fullyContains: true
      }).map(function (text) {
        return dom.singleChildAncestor(text, pred) || dom.wrap(text, nodeName);
      });

      if (expandClosestSibling) {
        if (onlyPartialContains) {
          var nodesInRange = rng.nodes(); // compose with partial contains predication

          pred = func.and(pred, function (node) {
            return lists.contains(nodesInRange, node);
          });
        }

        return nodes.map(function (node) {
          var siblings = dom.withClosestSiblings(node, pred);
          var head = lists.head(siblings);
          var tails = lists.tail(siblings);
          external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(tails, function (idx, elem) {
            dom.appendChildNodes(head, elem.childNodes);
            dom.remove(elem);
          });
          return lists.head(siblings);
        });
      } else {
        return nodes;
      }
    }
    /**
     * get current style on cursor
     *
     * @param {WrappedRange} rng
     * @return {Object} - object contains style properties.
     */

  }, {
    key: "current",
    value: function current(rng) {
      var $cont = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(!dom.isElement(rng.sc) ? rng.sc.parentNode : rng.sc);
      var styleInfo = this.fromNode($cont); // document.queryCommandState for toggle state
      // [workaround] prevent Firefox nsresult: "0x80004005 (NS_ERROR_FAILURE)"

      try {
        styleInfo = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.extend(styleInfo, {
          'font-bold': document.queryCommandState('bold') ? 'bold' : 'normal',
          'font-italic': document.queryCommandState('italic') ? 'italic' : 'normal',
          'font-underline': document.queryCommandState('underline') ? 'underline' : 'normal',
          'font-subscript': document.queryCommandState('subscript') ? 'subscript' : 'normal',
          'font-superscript': document.queryCommandState('superscript') ? 'superscript' : 'normal',
          'font-strikethrough': document.queryCommandState('strikethrough') ? 'strikethrough' : 'normal',
          'font-family': document.queryCommandValue('fontname') || styleInfo['font-family']
        });
      } catch (e) {} // eslint-disable-next-line
      // list-style-type to list-style(unordered, ordered)


      if (!rng.isOnList()) {
        styleInfo['list-style'] = 'none';
      } else {
        var orderedTypes = ['circle', 'disc', 'disc-leading-zero', 'square'];
        var isUnordered = orderedTypes.indexOf(styleInfo['list-style-type']) > -1;
        styleInfo['list-style'] = isUnordered ? 'unordered' : 'ordered';
      }

      var para = dom.ancestor(rng.sc, dom.isPara);

      if (para && para.style['line-height']) {
        styleInfo['line-height'] = para.style.lineHeight;
      } else {
        var lineHeight = parseInt(styleInfo['line-height'], 10) / parseInt(styleInfo['font-size'], 10);
        styleInfo['line-height'] = lineHeight.toFixed(1);
      }

      styleInfo.anchor = rng.isOnAnchor() && dom.ancestor(rng.sc, dom.isAnchor);
      styleInfo.ancestors = dom.listAncestor(rng.sc, dom.isEditable);
      styleInfo.range = rng;
      return styleInfo;
    }
  }]);

  return Style;
}();


// CONCATENATED MODULE: ./src/js/base/editing/Bullet.js
function Bullet_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function Bullet_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function Bullet_createClass(Constructor, protoProps, staticProps) { if (protoProps) Bullet_defineProperties(Constructor.prototype, protoProps); if (staticProps) Bullet_defineProperties(Constructor, staticProps); return Constructor; }







var Bullet_Bullet = /*#__PURE__*/function () {
  function Bullet() {
    Bullet_classCallCheck(this, Bullet);
  }

  Bullet_createClass(Bullet, [{
    key: "insertOrderedList",

    /**
     * toggle ordered list
     */
    value: function insertOrderedList(editable) {
      this.toggleList('OL', editable);
    }
    /**
     * toggle unordered list
     */

  }, {
    key: "insertUnorderedList",
    value: function insertUnorderedList(editable) {
      this.toggleList('UL', editable);
    }
    /**
     * indent
     */

  }, {
    key: "indent",
    value: function indent(editable) {
      var _this = this;

      var rng = range.create(editable).wrapBodyInlineWithPara();
      var paras = rng.nodes(dom.isPara, {
        includeAncestor: true
      });
      var clustereds = lists.clusterBy(paras, func.peq2('parentNode'));
      external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(clustereds, function (idx, paras) {
        var head = lists.head(paras);

        if (dom.isLi(head)) {
          var previousList = _this.findList(head.previousSibling);

          if (previousList) {
            paras.map(function (para) {
              return previousList.appendChild(para);
            });
          } else {
            _this.wrapList(paras, head.parentNode.nodeName);

            paras.map(function (para) {
              return para.parentNode;
            }).map(function (para) {
              return _this.appendToPrevious(para);
            });
          }
        } else {
          external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(paras, function (idx, para) {
            external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(para).css('marginLeft', function (idx, val) {
              return (parseInt(val, 10) || 0) + 25;
            });
          });
        }
      });
      rng.select();
    }
    /**
     * outdent
     */

  }, {
    key: "outdent",
    value: function outdent(editable) {
      var _this2 = this;

      var rng = range.create(editable).wrapBodyInlineWithPara();
      var paras = rng.nodes(dom.isPara, {
        includeAncestor: true
      });
      var clustereds = lists.clusterBy(paras, func.peq2('parentNode'));
      external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(clustereds, function (idx, paras) {
        var head = lists.head(paras);

        if (dom.isLi(head)) {
          _this2.releaseList([paras]);
        } else {
          external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(paras, function (idx, para) {
            external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(para).css('marginLeft', function (idx, val) {
              val = parseInt(val, 10) || 0;
              return val > 25 ? val - 25 : '';
            });
          });
        }
      });
      rng.select();
    }
    /**
     * toggle list
     *
     * @param {String} listName - OL or UL
     */

  }, {
    key: "toggleList",
    value: function toggleList(listName, editable) {
      var _this3 = this;

      var rng = range.create(editable).wrapBodyInlineWithPara();
      var paras = rng.nodes(dom.isPara, {
        includeAncestor: true
      });
      var bookmark = rng.paraBookmark(paras);
      var clustereds = lists.clusterBy(paras, func.peq2('parentNode')); // paragraph to list

      if (lists.find(paras, dom.isPurePara)) {
        var wrappedParas = [];
        external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(clustereds, function (idx, paras) {
          wrappedParas = wrappedParas.concat(_this3.wrapList(paras, listName));
        });
        paras = wrappedParas; // list to paragraph or change list style
      } else {
        var diffLists = rng.nodes(dom.isList, {
          includeAncestor: true
        }).filter(function (listNode) {
          return !external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.nodeName(listNode, listName);
        });

        if (diffLists.length) {
          external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(diffLists, function (idx, listNode) {
            dom.replace(listNode, listName);
          });
        } else {
          paras = this.releaseList(clustereds, true);
        }
      }

      range.createFromParaBookmark(bookmark, paras).select();
    }
    /**
     * @param {Node[]} paras
     * @param {String} listName
     * @return {Node[]}
     */

  }, {
    key: "wrapList",
    value: function wrapList(paras, listName) {
      var head = lists.head(paras);
      var last = lists.last(paras);
      var prevList = dom.isList(head.previousSibling) && head.previousSibling;
      var nextList = dom.isList(last.nextSibling) && last.nextSibling;
      var listNode = prevList || dom.insertAfter(dom.create(listName || 'UL'), last); // P to LI

      paras = paras.map(function (para) {
        return dom.isPurePara(para) ? dom.replace(para, 'LI') : para;
      }); // append to list(<ul>, <ol>)

      dom.appendChildNodes(listNode, paras);

      if (nextList) {
        dom.appendChildNodes(listNode, lists.from(nextList.childNodes));
        dom.remove(nextList);
      }

      return paras;
    }
    /**
     * @method releaseList
     *
     * @param {Array[]} clustereds
     * @param {Boolean} isEscapseToBody
     * @return {Node[]}
     */

  }, {
    key: "releaseList",
    value: function releaseList(clustereds, isEscapseToBody) {
      var _this4 = this;

      var releasedParas = [];
      external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(clustereds, function (idx, paras) {
        var head = lists.head(paras);
        var last = lists.last(paras);
        var headList = isEscapseToBody ? dom.lastAncestor(head, dom.isList) : head.parentNode;
        var parentItem = headList.parentNode;

        if (headList.parentNode.nodeName === 'LI') {
          paras.map(function (para) {
            var newList = _this4.findNextSiblings(para);

            if (parentItem.nextSibling) {
              parentItem.parentNode.insertBefore(para, parentItem.nextSibling);
            } else {
              parentItem.parentNode.appendChild(para);
            }

            if (newList.length) {
              _this4.wrapList(newList, headList.nodeName);

              para.appendChild(newList[0].parentNode);
            }
          });

          if (headList.children.length === 0) {
            parentItem.removeChild(headList);
          }

          if (parentItem.childNodes.length === 0) {
            parentItem.parentNode.removeChild(parentItem);
          }
        } else {
          var lastList = headList.childNodes.length > 1 ? dom.splitTree(headList, {
            node: last.parentNode,
            offset: dom.position(last) + 1
          }, {
            isSkipPaddingBlankHTML: true
          }) : null;
          var middleList = dom.splitTree(headList, {
            node: head.parentNode,
            offset: dom.position(head)
          }, {
            isSkipPaddingBlankHTML: true
          });
          paras = isEscapseToBody ? dom.listDescendant(middleList, dom.isLi) : lists.from(middleList.childNodes).filter(dom.isLi); // LI to P

          if (isEscapseToBody || !dom.isList(headList.parentNode)) {
            paras = paras.map(function (para) {
              return dom.replace(para, 'P');
            });
          }

          external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(lists.from(paras).reverse(), function (idx, para) {
            dom.insertAfter(para, headList);
          }); // remove empty lists

          var rootLists = lists.compact([headList, middleList, lastList]);
          external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(rootLists, function (idx, rootList) {
            var listNodes = [rootList].concat(dom.listDescendant(rootList, dom.isList));
            external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(listNodes.reverse(), function (idx, listNode) {
              if (!dom.nodeLength(listNode)) {
                dom.remove(listNode, true);
              }
            });
          });
        }

        releasedParas = releasedParas.concat(paras);
      });
      return releasedParas;
    }
    /**
     * @method appendToPrevious
     *
     * Appends list to previous list item, if
     * none exist it wraps the list in a new list item.
     *
     * @param {HTMLNode} ListItem
     * @return {HTMLNode}
     */

  }, {
    key: "appendToPrevious",
    value: function appendToPrevious(node) {
      return node.previousSibling ? dom.appendChildNodes(node.previousSibling, [node]) : this.wrapList([node], 'LI');
    }
    /**
     * @method findList
     *
     * Finds an existing list in list item
     *
     * @param {HTMLNode} ListItem
     * @return {Array[]}
     */

  }, {
    key: "findList",
    value: function findList(node) {
      return node ? lists.find(node.children, function (child) {
        return ['OL', 'UL'].indexOf(child.nodeName) > -1;
      }) : null;
    }
    /**
     * @method findNextSiblings
     *
     * Finds all list item siblings that follow it
     *
     * @param {HTMLNode} ListItem
     * @return {HTMLNode}
     */

  }, {
    key: "findNextSiblings",
    value: function findNextSiblings(node) {
      var siblings = [];

      while (node.nextSibling) {
        siblings.push(node.nextSibling);
        node = node.nextSibling;
      }

      return siblings;
    }
  }]);

  return Bullet;
}();


// CONCATENATED MODULE: ./src/js/base/editing/Typing.js
function Typing_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function Typing_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function Typing_createClass(Constructor, protoProps, staticProps) { if (protoProps) Typing_defineProperties(Constructor.prototype, protoProps); if (staticProps) Typing_defineProperties(Constructor, staticProps); return Constructor; }





/**
 * @class editing.Typing
 *
 * Typing
 *
 */

var Typing_Typing = /*#__PURE__*/function () {
  function Typing(context) {
    Typing_classCallCheck(this, Typing);

    // a Bullet instance to toggle lists off
    this.bullet = new Bullet_Bullet();
    this.options = context.options;
  }
  /**
   * insert tab
   *
   * @param {WrappedRange} rng
   * @param {Number} tabsize
   */


  Typing_createClass(Typing, [{
    key: "insertTab",
    value: function insertTab(rng, tabsize) {
      var tab = dom.createText(new Array(tabsize + 1).join(dom.NBSP_CHAR));
      rng = rng.deleteContents();
      rng.insertNode(tab, true);
      rng = range.create(tab, tabsize);
      rng.select();
    }
    /**
     * insert paragraph
     *
     * @param {jQuery} $editable
     * @param {WrappedRange} rng Can be used in unit tests to "mock" the range
     *
     * blockquoteBreakingLevel
     *   0 - No break, the new paragraph remains inside the quote
     *   1 - Break the first blockquote in the ancestors list
     *   2 - Break all blockquotes, so that the new paragraph is not quoted (this is the default)
     */

  }, {
    key: "insertParagraph",
    value: function insertParagraph(editable, rng) {
      rng = rng || range.create(editable); // deleteContents on range.

      rng = rng.deleteContents(); // Wrap range if it needs to be wrapped by paragraph

      rng = rng.wrapBodyInlineWithPara(); // finding paragraph

      var splitRoot = dom.ancestor(rng.sc, dom.isPara);
      var nextPara; // on paragraph: split paragraph

      if (splitRoot) {
        // if it is an empty line with li
        if (dom.isLi(splitRoot) && (dom.isEmpty(splitRoot) || dom.deepestChildIsEmpty(splitRoot))) {
          // toggle UL/OL and escape
          this.bullet.toggleList(splitRoot.parentNode.nodeName);
          return;
        } else {
          var blockquote = null;

          if (this.options.blockquoteBreakingLevel === 1) {
            blockquote = dom.ancestor(splitRoot, dom.isBlockquote);
          } else if (this.options.blockquoteBreakingLevel === 2) {
            blockquote = dom.lastAncestor(splitRoot, dom.isBlockquote);
          }

          if (blockquote) {
            // We're inside a blockquote and options ask us to break it
            nextPara = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(dom.emptyPara)[0]; // If the split is right before a <br>, remove it so that there's no "empty line"
            // after the split in the new blockquote created

            if (dom.isRightEdgePoint(rng.getStartPoint()) && dom.isBR(rng.sc.nextSibling)) {
              external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(rng.sc.nextSibling).remove();
            }

            var split = dom.splitTree(blockquote, rng.getStartPoint(), {
              isDiscardEmptySplits: true
            });

            if (split) {
              split.parentNode.insertBefore(nextPara, split);
            } else {
              dom.insertAfter(nextPara, blockquote); // There's no split if we were at the end of the blockquote
            }
          } else {
            nextPara = dom.splitTree(splitRoot, rng.getStartPoint()); // not a blockquote, just insert the paragraph

            var emptyAnchors = dom.listDescendant(splitRoot, dom.isEmptyAnchor);
            emptyAnchors = emptyAnchors.concat(dom.listDescendant(nextPara, dom.isEmptyAnchor));
            external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(emptyAnchors, function (idx, anchor) {
              dom.remove(anchor);
            }); // replace empty heading, pre or custom-made styleTag with P tag

            if ((dom.isHeading(nextPara) || dom.isPre(nextPara) || dom.isCustomStyleTag(nextPara)) && dom.isEmpty(nextPara)) {
              nextPara = dom.replace(nextPara, 'p');
            }
          }
        } // no paragraph: insert empty paragraph

      } else {
        var next = rng.sc.childNodes[rng.so];
        nextPara = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(dom.emptyPara)[0];

        if (next) {
          rng.sc.insertBefore(nextPara, next);
        } else {
          rng.sc.appendChild(nextPara);
        }
      }

      range.create(nextPara, 0).normalize().select().scrollIntoView(editable);
    }
  }]);

  return Typing;
}();


// CONCATENATED MODULE: ./src/js/base/editing/Table.js
function Table_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function Table_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function Table_createClass(Constructor, protoProps, staticProps) { if (protoProps) Table_defineProperties(Constructor.prototype, protoProps); if (staticProps) Table_defineProperties(Constructor, staticProps); return Constructor; }





/**
 * @class Create a virtual table to create what actions to do in change.
 * @param {object} startPoint Cell selected to apply change.
 * @param {enum} where  Where change will be applied Row or Col. Use enum: TableResultAction.where
 * @param {enum} action Action to be applied. Use enum: TableResultAction.requestAction
 * @param {object} domTable Dom element of table to make changes.
 */

var TableResultAction = function TableResultAction(startPoint, where, action, domTable) {
  var _startPoint = {
    'colPos': 0,
    'rowPos': 0
  };
  var _virtualTable = [];
  var _actionCellList = []; /// ///////////////////////////////////////////
  // Private functions
  /// ///////////////////////////////////////////

  /**
   * Set the startPoint of action.
   */

  function setStartPoint() {
    if (!startPoint || !startPoint.tagName || startPoint.tagName.toLowerCase() !== 'td' && startPoint.tagName.toLowerCase() !== 'th') {
      // Impossible to identify start Cell point
      return;
    }

    _startPoint.colPos = startPoint.cellIndex;

    if (!startPoint.parentElement || !startPoint.parentElement.tagName || startPoint.parentElement.tagName.toLowerCase() !== 'tr') {
      // Impossible to identify start Row point
      return;
    }

    _startPoint.rowPos = startPoint.parentElement.rowIndex;
  }
  /**
   * Define virtual table position info object.
   *
   * @param {int} rowIndex Index position in line of virtual table.
   * @param {int} cellIndex Index position in column of virtual table.
   * @param {object} baseRow Row affected by this position.
   * @param {object} baseCell Cell affected by this position.
   * @param {bool} isSpan Inform if it is an span cell/row.
   */


  function setVirtualTablePosition(rowIndex, cellIndex, baseRow, baseCell, isRowSpan, isColSpan, isVirtualCell) {
    var objPosition = {
      'baseRow': baseRow,
      'baseCell': baseCell,
      'isRowSpan': isRowSpan,
      'isColSpan': isColSpan,
      'isVirtual': isVirtualCell
    };

    if (!_virtualTable[rowIndex]) {
      _virtualTable[rowIndex] = [];
    }

    _virtualTable[rowIndex][cellIndex] = objPosition;
  }
  /**
   * Create action cell object.
   *
   * @param {object} virtualTableCellObj Object of specific position on virtual table.
   * @param {enum} resultAction Action to be applied in that item.
   */


  function getActionCell(virtualTableCellObj, resultAction, virtualRowPosition, virtualColPosition) {
    return {
      'baseCell': virtualTableCellObj.baseCell,
      'action': resultAction,
      'virtualTable': {
        'rowIndex': virtualRowPosition,
        'cellIndex': virtualColPosition
      }
    };
  }
  /**
   * Recover free index of row to append Cell.
   *
   * @param {int} rowIndex Index of row to find free space.
   * @param {int} cellIndex Index of cell to find free space in table.
   */


  function recoverCellIndex(rowIndex, cellIndex) {
    if (!_virtualTable[rowIndex]) {
      return cellIndex;
    }

    if (!_virtualTable[rowIndex][cellIndex]) {
      return cellIndex;
    }

    var newCellIndex = cellIndex;

    while (_virtualTable[rowIndex][newCellIndex]) {
      newCellIndex++;

      if (!_virtualTable[rowIndex][newCellIndex]) {
        return newCellIndex;
      }
    }
  }
  /**
   * Recover info about row and cell and add information to virtual table.
   *
   * @param {object} row Row to recover information.
   * @param {object} cell Cell to recover information.
   */


  function addCellInfoToVirtual(row, cell) {
    var cellIndex = recoverCellIndex(row.rowIndex, cell.cellIndex);
    var cellHasColspan = cell.colSpan > 1;
    var cellHasRowspan = cell.rowSpan > 1;
    var isThisSelectedCell = row.rowIndex === _startPoint.rowPos && cell.cellIndex === _startPoint.colPos;
    setVirtualTablePosition(row.rowIndex, cellIndex, row, cell, cellHasRowspan, cellHasColspan, false); // Add span rows to virtual Table.

    var rowspanNumber = cell.attributes.rowSpan ? parseInt(cell.attributes.rowSpan.value, 10) : 0;

    if (rowspanNumber > 1) {
      for (var rp = 1; rp < rowspanNumber; rp++) {
        var rowspanIndex = row.rowIndex + rp;
        adjustStartPoint(rowspanIndex, cellIndex, cell, isThisSelectedCell);
        setVirtualTablePosition(rowspanIndex, cellIndex, row, cell, true, cellHasColspan, true);
      }
    } // Add span cols to virtual table.


    var colspanNumber = cell.attributes.colSpan ? parseInt(cell.attributes.colSpan.value, 10) : 0;

    if (colspanNumber > 1) {
      for (var cp = 1; cp < colspanNumber; cp++) {
        var cellspanIndex = recoverCellIndex(row.rowIndex, cellIndex + cp);
        adjustStartPoint(row.rowIndex, cellspanIndex, cell, isThisSelectedCell);
        setVirtualTablePosition(row.rowIndex, cellspanIndex, row, cell, cellHasRowspan, true, true);
      }
    }
  }
  /**
   * Process validation and adjust of start point if needed
   *
   * @param {int} rowIndex
   * @param {int} cellIndex
   * @param {object} cell
   * @param {bool} isSelectedCell
   */


  function adjustStartPoint(rowIndex, cellIndex, cell, isSelectedCell) {
    if (rowIndex === _startPoint.rowPos && _startPoint.colPos >= cell.cellIndex && cell.cellIndex <= cellIndex && !isSelectedCell) {
      _startPoint.colPos++;
    }
  }
  /**
   * Create virtual table of cells with all cells, including span cells.
   */


  function createVirtualTable() {
    var rows = domTable.rows;

    for (var rowIndex = 0; rowIndex < rows.length; rowIndex++) {
      var cells = rows[rowIndex].cells;

      for (var cellIndex = 0; cellIndex < cells.length; cellIndex++) {
        addCellInfoToVirtual(rows[rowIndex], cells[cellIndex]);
      }
    }
  }
  /**
   * Get action to be applied on the cell.
   *
   * @param {object} cell virtual table cell to apply action
   */


  function getDeleteResultActionToCell(cell) {
    switch (where) {
      case TableResultAction.where.Column:
        if (cell.isColSpan) {
          return TableResultAction.resultAction.SubtractSpanCount;
        }

        break;

      case TableResultAction.where.Row:
        if (!cell.isVirtual && cell.isRowSpan) {
          return TableResultAction.resultAction.AddCell;
        } else if (cell.isRowSpan) {
          return TableResultAction.resultAction.SubtractSpanCount;
        }

        break;
    }

    return TableResultAction.resultAction.RemoveCell;
  }
  /**
   * Get action to be applied on the cell.
   *
   * @param {object} cell virtual table cell to apply action
   */


  function getAddResultActionToCell(cell) {
    switch (where) {
      case TableResultAction.where.Column:
        if (cell.isColSpan) {
          return TableResultAction.resultAction.SumSpanCount;
        } else if (cell.isRowSpan && cell.isVirtual) {
          return TableResultAction.resultAction.Ignore;
        }

        break;

      case TableResultAction.where.Row:
        if (cell.isRowSpan) {
          return TableResultAction.resultAction.SumSpanCount;
        } else if (cell.isColSpan && cell.isVirtual) {
          return TableResultAction.resultAction.Ignore;
        }

        break;
    }

    return TableResultAction.resultAction.AddCell;
  }

  function init() {
    setStartPoint();
    createVirtualTable();
  } /// ///////////////////////////////////////////
  // Public functions
  /// ///////////////////////////////////////////

  /**
   * Recover array os what to do in table.
   */


  this.getActionList = function () {
    var fixedRow = where === TableResultAction.where.Row ? _startPoint.rowPos : -1;
    var fixedCol = where === TableResultAction.where.Column ? _startPoint.colPos : -1;
    var actualPosition = 0;
    var canContinue = true;

    while (canContinue) {
      var rowPosition = fixedRow >= 0 ? fixedRow : actualPosition;
      var colPosition = fixedCol >= 0 ? fixedCol : actualPosition;
      var row = _virtualTable[rowPosition];

      if (!row) {
        canContinue = false;
        return _actionCellList;
      }

      var cell = row[colPosition];

      if (!cell) {
        canContinue = false;
        return _actionCellList;
      } // Define action to be applied in this cell


      var resultAction = TableResultAction.resultAction.Ignore;

      switch (action) {
        case TableResultAction.requestAction.Add:
          resultAction = getAddResultActionToCell(cell);
          break;

        case TableResultAction.requestAction.Delete:
          resultAction = getDeleteResultActionToCell(cell);
          break;
      }

      _actionCellList.push(getActionCell(cell, resultAction, rowPosition, colPosition));

      actualPosition++;
    }

    return _actionCellList;
  };

  init();
};
/**
*
* Where action occours enum.
*/


TableResultAction.where = {
  'Row': 0,
  'Column': 1
};
/**
*
* Requested action to apply enum.
*/

TableResultAction.requestAction = {
  'Add': 0,
  'Delete': 1
};
/**
*
* Result action to be executed enum.
*/

TableResultAction.resultAction = {
  'Ignore': 0,
  'SubtractSpanCount': 1,
  'RemoveCell': 2,
  'AddCell': 3,
  'SumSpanCount': 4
};
/**
 *
 * @class editing.Table
 *
 * Table
 *
 */

var Table_Table = /*#__PURE__*/function () {
  function Table() {
    Table_classCallCheck(this, Table);
  }

  Table_createClass(Table, [{
    key: "tab",

    /**
     * handle tab key
     *
     * @param {WrappedRange} rng
     * @param {Boolean} isShift
     */
    value: function tab(rng, isShift) {
      var cell = dom.ancestor(rng.commonAncestor(), dom.isCell);
      var table = dom.ancestor(cell, dom.isTable);
      var cells = dom.listDescendant(table, dom.isCell);
      var nextCell = lists[isShift ? 'prev' : 'next'](cells, cell);

      if (nextCell) {
        range.create(nextCell, 0).select();
      }
    }
    /**
     * Add a new row
     *
     * @param {WrappedRange} rng
     * @param {String} position (top/bottom)
     * @return {Node}
     */

  }, {
    key: "addRow",
    value: function addRow(rng, position) {
      var cell = dom.ancestor(rng.commonAncestor(), dom.isCell);
      var currentTr = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(cell).closest('tr');
      var trAttributes = this.recoverAttributes(currentTr);
      var html = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<tr' + trAttributes + '></tr>');
      var vTable = new TableResultAction(cell, TableResultAction.where.Row, TableResultAction.requestAction.Add, external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(currentTr).closest('table')[0]);
      var actions = vTable.getActionList();

      for (var idCell = 0; idCell < actions.length; idCell++) {
        var currentCell = actions[idCell];
        var tdAttributes = this.recoverAttributes(currentCell.baseCell);

        switch (currentCell.action) {
          case TableResultAction.resultAction.AddCell:
            html.append('<td' + tdAttributes + '>' + dom.blank + '</td>');
            break;

          case TableResultAction.resultAction.SumSpanCount:
            {
              if (position === 'top') {
                var baseCellTr = currentCell.baseCell.parent;
                var isTopFromRowSpan = (!baseCellTr ? 0 : currentCell.baseCell.closest('tr').rowIndex) <= currentTr[0].rowIndex;

                if (isTopFromRowSpan) {
                  var newTd = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<div></div>').append(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<td' + tdAttributes + '>' + dom.blank + '</td>').removeAttr('rowspan')).html();
                  html.append(newTd);
                  break;
                }
              }

              var rowspanNumber = parseInt(currentCell.baseCell.rowSpan, 10);
              rowspanNumber++;
              currentCell.baseCell.setAttribute('rowSpan', rowspanNumber);
            }
            break;
        }
      }

      if (position === 'top') {
        currentTr.before(html);
      } else {
        var cellHasRowspan = cell.rowSpan > 1;

        if (cellHasRowspan) {
          var lastTrIndex = currentTr[0].rowIndex + (cell.rowSpan - 2);
          external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(currentTr).parent().find('tr')[lastTrIndex]).after(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(html));
          return;
        }

        currentTr.after(html);
      }
    }
    /**
     * Add a new col
     *
     * @param {WrappedRange} rng
     * @param {String} position (left/right)
     * @return {Node}
     */

  }, {
    key: "addCol",
    value: function addCol(rng, position) {
      var cell = dom.ancestor(rng.commonAncestor(), dom.isCell);
      var row = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(cell).closest('tr');
      var rowsGroup = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(row).siblings();
      rowsGroup.push(row);
      var vTable = new TableResultAction(cell, TableResultAction.where.Column, TableResultAction.requestAction.Add, external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(row).closest('table')[0]);
      var actions = vTable.getActionList();

      for (var actionIndex = 0; actionIndex < actions.length; actionIndex++) {
        var currentCell = actions[actionIndex];
        var tdAttributes = this.recoverAttributes(currentCell.baseCell);

        switch (currentCell.action) {
          case TableResultAction.resultAction.AddCell:
            if (position === 'right') {
              external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(currentCell.baseCell).after('<td' + tdAttributes + '>' + dom.blank + '</td>');
            } else {
              external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(currentCell.baseCell).before('<td' + tdAttributes + '>' + dom.blank + '</td>');
            }

            break;

          case TableResultAction.resultAction.SumSpanCount:
            if (position === 'right') {
              var colspanNumber = parseInt(currentCell.baseCell.colSpan, 10);
              colspanNumber++;
              currentCell.baseCell.setAttribute('colSpan', colspanNumber);
            } else {
              external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(currentCell.baseCell).before('<td' + tdAttributes + '>' + dom.blank + '</td>');
            }

            break;
        }
      }
    }
    /*
    * Copy attributes from element.
    *
    * @param {object} Element to recover attributes.
    * @return {string} Copied string elements.
    */

  }, {
    key: "recoverAttributes",
    value: function recoverAttributes(el) {
      var resultStr = '';

      if (!el) {
        return resultStr;
      }

      var attrList = el.attributes || [];

      for (var i = 0; i < attrList.length; i++) {
        if (attrList[i].name.toLowerCase() === 'id') {
          continue;
        }

        if (attrList[i].specified) {
          resultStr += ' ' + attrList[i].name + '=\'' + attrList[i].value + '\'';
        }
      }

      return resultStr;
    }
    /**
     * Delete current row
     *
     * @param {WrappedRange} rng
     * @return {Node}
     */

  }, {
    key: "deleteRow",
    value: function deleteRow(rng) {
      var cell = dom.ancestor(rng.commonAncestor(), dom.isCell);
      var row = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(cell).closest('tr');
      var cellPos = row.children('td, th').index(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(cell));
      var rowPos = row[0].rowIndex;
      var vTable = new TableResultAction(cell, TableResultAction.where.Row, TableResultAction.requestAction.Delete, external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(row).closest('table')[0]);
      var actions = vTable.getActionList();

      for (var actionIndex = 0; actionIndex < actions.length; actionIndex++) {
        if (!actions[actionIndex]) {
          continue;
        }

        var baseCell = actions[actionIndex].baseCell;
        var virtualPosition = actions[actionIndex].virtualTable;
        var hasRowspan = baseCell.rowSpan && baseCell.rowSpan > 1;
        var rowspanNumber = hasRowspan ? parseInt(baseCell.rowSpan, 10) : 0;

        switch (actions[actionIndex].action) {
          case TableResultAction.resultAction.Ignore:
            continue;

          case TableResultAction.resultAction.AddCell:
            {
              var nextRow = row.next('tr')[0];

              if (!nextRow) {
                continue;
              }

              var cloneRow = row[0].cells[cellPos];

              if (hasRowspan) {
                if (rowspanNumber > 2) {
                  rowspanNumber--;
                  nextRow.insertBefore(cloneRow, nextRow.cells[cellPos]);
                  nextRow.cells[cellPos].setAttribute('rowSpan', rowspanNumber);
                  nextRow.cells[cellPos].innerHTML = '';
                } else if (rowspanNumber === 2) {
                  nextRow.insertBefore(cloneRow, nextRow.cells[cellPos]);
                  nextRow.cells[cellPos].removeAttribute('rowSpan');
                  nextRow.cells[cellPos].innerHTML = '';
                }
              }
            }
            continue;

          case TableResultAction.resultAction.SubtractSpanCount:
            if (hasRowspan) {
              if (rowspanNumber > 2) {
                rowspanNumber--;
                baseCell.setAttribute('rowSpan', rowspanNumber);

                if (virtualPosition.rowIndex !== rowPos && baseCell.cellIndex === cellPos) {
                  baseCell.innerHTML = '';
                }
              } else if (rowspanNumber === 2) {
                baseCell.removeAttribute('rowSpan');

                if (virtualPosition.rowIndex !== rowPos && baseCell.cellIndex === cellPos) {
                  baseCell.innerHTML = '';
                }
              }
            }

            continue;

          case TableResultAction.resultAction.RemoveCell:
            // Do not need remove cell because row will be deleted.
            continue;
        }
      }

      row.remove();
    }
    /**
     * Delete current col
     *
     * @param {WrappedRange} rng
     * @return {Node}
     */

  }, {
    key: "deleteCol",
    value: function deleteCol(rng) {
      var cell = dom.ancestor(rng.commonAncestor(), dom.isCell);
      var row = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(cell).closest('tr');
      var cellPos = row.children('td, th').index(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(cell));
      var vTable = new TableResultAction(cell, TableResultAction.where.Column, TableResultAction.requestAction.Delete, external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(row).closest('table')[0]);
      var actions = vTable.getActionList();

      for (var actionIndex = 0; actionIndex < actions.length; actionIndex++) {
        if (!actions[actionIndex]) {
          continue;
        }

        switch (actions[actionIndex].action) {
          case TableResultAction.resultAction.Ignore:
            continue;

          case TableResultAction.resultAction.SubtractSpanCount:
            {
              var baseCell = actions[actionIndex].baseCell;
              var hasColspan = baseCell.colSpan && baseCell.colSpan > 1;

              if (hasColspan) {
                var colspanNumber = baseCell.colSpan ? parseInt(baseCell.colSpan, 10) : 0;

                if (colspanNumber > 2) {
                  colspanNumber--;
                  baseCell.setAttribute('colSpan', colspanNumber);

                  if (baseCell.cellIndex === cellPos) {
                    baseCell.innerHTML = '';
                  }
                } else if (colspanNumber === 2) {
                  baseCell.removeAttribute('colSpan');

                  if (baseCell.cellIndex === cellPos) {
                    baseCell.innerHTML = '';
                  }
                }
              }
            }
            continue;

          case TableResultAction.resultAction.RemoveCell:
            dom.remove(actions[actionIndex].baseCell, true);
            continue;
        }
      }
    }
    /**
     * create empty table element
     *
     * @param {Number} rowCount
     * @param {Number} colCount
     * @return {Node}
     */

  }, {
    key: "createTable",
    value: function createTable(colCount, rowCount, options) {
      var tds = [];
      var tdHTML;

      for (var idxCol = 0; idxCol < colCount; idxCol++) {
        tds.push('<td>' + dom.blank + '</td>');
      }

      tdHTML = tds.join('');
      var trs = [];
      var trHTML;

      for (var idxRow = 0; idxRow < rowCount; idxRow++) {
        trs.push('<tr>' + tdHTML + '</tr>');
      }

      trHTML = trs.join('');
      var $table = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<table>' + trHTML + '</table>');

      if (options && options.tableClassName) {
        $table.addClass(options.tableClassName);
      }

      return $table[0];
    }
    /**
     * Delete current table
     *
     * @param {WrappedRange} rng
     * @return {Node}
     */

  }, {
    key: "deleteTable",
    value: function deleteTable(rng) {
      var cell = dom.ancestor(rng.commonAncestor(), dom.isCell);
      external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(cell).closest('table').remove();
    }
  }]);

  return Table;
}();


// CONCATENATED MODULE: ./src/js/base/module/Editor.js
function Editor_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function Editor_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function Editor_createClass(Constructor, protoProps, staticProps) { if (protoProps) Editor_defineProperties(Constructor.prototype, protoProps); if (staticProps) Editor_defineProperties(Constructor, staticProps); return Constructor; }














var KEY_BOGUS = 'bogus';
/**
 * @class Editor
 */

var Editor_Editor = /*#__PURE__*/function () {
  function Editor(context) {
    var _this = this;

    Editor_classCallCheck(this, Editor);

    this.context = context;
    this.$note = context.layoutInfo.note;
    this.$editor = context.layoutInfo.editor;
    this.$editable = context.layoutInfo.editable;
    this.options = context.options;
    this.lang = this.options.langInfo;
    this.editable = this.$editable[0];
    this.lastRange = null;
    this.snapshot = null;
    this.style = new Style_Style();
    this.table = new Table_Table();
    this.typing = new Typing_Typing(context);
    this.bullet = new Bullet_Bullet();
    this.history = new History_History(context);
    this.context.memo('help.escape', this.lang.help.escape);
    this.context.memo('help.undo', this.lang.help.undo);
    this.context.memo('help.redo', this.lang.help.redo);
    this.context.memo('help.tab', this.lang.help.tab);
    this.context.memo('help.untab', this.lang.help.untab);
    this.context.memo('help.insertParagraph', this.lang.help.insertParagraph);
    this.context.memo('help.insertOrderedList', this.lang.help.insertOrderedList);
    this.context.memo('help.insertUnorderedList', this.lang.help.insertUnorderedList);
    this.context.memo('help.indent', this.lang.help.indent);
    this.context.memo('help.outdent', this.lang.help.outdent);
    this.context.memo('help.formatPara', this.lang.help.formatPara);
    this.context.memo('help.insertHorizontalRule', this.lang.help.insertHorizontalRule);
    this.context.memo('help.fontName', this.lang.help.fontName); // native commands(with execCommand), generate function for execCommand

    var commands = ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'justifyLeft', 'justifyCenter', 'justifyRight', 'justifyFull', 'formatBlock', 'removeFormat', 'backColor'];

    for (var idx = 0, len = commands.length; idx < len; idx++) {
      this[commands[idx]] = function (sCmd) {
        return function (value) {
          _this.beforeCommand();

          document.execCommand(sCmd, false, value);

          _this.afterCommand(true);
        };
      }(commands[idx]);

      this.context.memo('help.' + commands[idx], this.lang.help[commands[idx]]);
    }

    this.fontName = this.wrapCommand(function (value) {
      return _this.fontStyling('font-family', env.validFontName(value));
    });
    this.fontSize = this.wrapCommand(function (value) {
      var unit = _this.currentStyle()['font-size-unit'];

      return _this.fontStyling('font-size', value + unit);
    });
    this.fontSizeUnit = this.wrapCommand(function (value) {
      var size = _this.currentStyle()['font-size'];

      return _this.fontStyling('font-size', size + value);
    });

    for (var _idx = 1; _idx <= 6; _idx++) {
      this['formatH' + _idx] = function (idx) {
        return function () {
          _this.formatBlock('H' + idx);
        };
      }(_idx);

      this.context.memo('help.formatH' + _idx, this.lang.help['formatH' + _idx]);
    }

    this.insertParagraph = this.wrapCommand(function () {
      _this.typing.insertParagraph(_this.editable);
    });
    this.insertOrderedList = this.wrapCommand(function () {
      _this.bullet.insertOrderedList(_this.editable);
    });
    this.insertUnorderedList = this.wrapCommand(function () {
      _this.bullet.insertUnorderedList(_this.editable);
    });
    this.indent = this.wrapCommand(function () {
      _this.bullet.indent(_this.editable);
    });
    this.outdent = this.wrapCommand(function () {
      _this.bullet.outdent(_this.editable);
    });
    /**
     * insertNode
     * insert node
     * @param {Node} node
     */

    this.insertNode = this.wrapCommand(function (node) {
      if (_this.isLimited(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(node).text().length)) {
        return;
      }

      var rng = _this.getLastRange();

      rng.insertNode(node);

      _this.setLastRange(range.createFromNodeAfter(node).select());
    });
    /**
     * insert text
     * @param {String} text
     */

    this.insertText = this.wrapCommand(function (text) {
      if (_this.isLimited(text.length)) {
        return;
      }

      var rng = _this.getLastRange();

      var textNode = rng.insertNode(dom.createText(text));

      _this.setLastRange(range.create(textNode, dom.nodeLength(textNode)).select());
    });
    /**
     * paste HTML
     * @param {String} markup
     */

    this.pasteHTML = this.wrapCommand(function (markup) {
      if (_this.isLimited(markup.length)) {
        return;
      }

      markup = _this.context.invoke('codeview.purify', markup);

      var contents = _this.getLastRange().pasteHTML(markup);

      _this.setLastRange(range.createFromNodeAfter(lists.last(contents)).select());
    });
    /**
     * formatBlock
     *
     * @param {String} tagName
     */

    this.formatBlock = this.wrapCommand(function (tagName, $target) {
      var onApplyCustomStyle = _this.options.callbacks.onApplyCustomStyle;

      if (onApplyCustomStyle) {
        onApplyCustomStyle.call(_this, $target, _this.context, _this.onFormatBlock);
      } else {
        _this.onFormatBlock(tagName, $target);
      }
    });
    /**
     * insert horizontal rule
     */

    this.insertHorizontalRule = this.wrapCommand(function () {
      var hrNode = _this.getLastRange().insertNode(dom.create('HR'));

      if (hrNode.nextSibling) {
        _this.setLastRange(range.create(hrNode.nextSibling, 0).normalize().select());
      }
    });
    /**
     * lineHeight
     * @param {String} value
     */

    this.lineHeight = this.wrapCommand(function (value) {
      _this.style.stylePara(_this.getLastRange(), {
        lineHeight: value
      });
    });
    /**
     * create link (command)
     *
     * @param {Object} linkInfo
     */

    this.createLink = this.wrapCommand(function (linkInfo) {
      var linkUrl = linkInfo.url;
      var linkText = linkInfo.text;
      var isNewWindow = linkInfo.isNewWindow;
      var checkProtocol = linkInfo.checkProtocol;

      var rng = linkInfo.range || _this.getLastRange();

      var additionalTextLength = linkText.length - rng.toString().length;

      if (additionalTextLength > 0 && _this.isLimited(additionalTextLength)) {
        return;
      }

      var isTextChanged = rng.toString() !== linkText; // handle spaced urls from input

      if (typeof linkUrl === 'string') {
        linkUrl = linkUrl.trim();
      }

      if (_this.options.onCreateLink) {
        linkUrl = _this.options.onCreateLink(linkUrl);
      } else if (checkProtocol) {
        // if url doesn't have any protocol and not even a relative or a label, use http:// as default
        linkUrl = /^([A-Za-z][A-Za-z0-9+-.]*\:|#|\/)/.test(linkUrl) ? linkUrl : _this.options.defaultProtocol + linkUrl;
      }

      var anchors = [];

      if (isTextChanged) {
        rng = rng.deleteContents();
        var anchor = rng.insertNode(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<A>' + linkText + '</A>')[0]);
        anchors.push(anchor);
      } else {
        anchors = _this.style.styleNodes(rng, {
          nodeName: 'A',
          expandClosestSibling: true,
          onlyPartialContains: true
        });
      }

      external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(anchors, function (idx, anchor) {
        external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(anchor).attr('href', linkUrl);

        if (isNewWindow) {
          external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(anchor).attr('target', '_blank');
        } else {
          external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(anchor).removeAttr('target');
        }
      });

      _this.setLastRange(_this.createRangeFromList(anchors).select());
    });
    /**
     * setting color
     *
     * @param {Object} sObjColor  color code
     * @param {String} sObjColor.foreColor foreground color
     * @param {String} sObjColor.backColor background color
     */

    this.color = this.wrapCommand(function (colorInfo) {
      var foreColor = colorInfo.foreColor;
      var backColor = colorInfo.backColor;

      if (foreColor) {
        document.execCommand('foreColor', false, foreColor);
      }

      if (backColor) {
        document.execCommand('backColor', false, backColor);
      }
    });
    /**
     * Set foreground color
     *
     * @param {String} colorCode foreground color code
     */

    this.foreColor = this.wrapCommand(function (colorInfo) {
      document.execCommand('foreColor', false, colorInfo);
    });
    /**
     * insert Table
     *
     * @param {String} dimension of table (ex : "5x5")
     */

    this.insertTable = this.wrapCommand(function (dim) {
      var dimension = dim.split('x');

      var rng = _this.getLastRange().deleteContents();

      rng.insertNode(_this.table.createTable(dimension[0], dimension[1], _this.options));
    });
    /**
     * remove media object and Figure Elements if media object is img with Figure.
     */

    this.removeMedia = this.wrapCommand(function () {
      var $target = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(_this.restoreTarget()).parent();

      if ($target.closest('figure').length) {
        $target.closest('figure').remove();
      } else {
        $target = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(_this.restoreTarget()).detach();
      }

      _this.context.triggerEvent('media.delete', $target, _this.$editable);
    });
    /**
     * float me
     *
     * @param {String} value
     */

    this.floatMe = this.wrapCommand(function (value) {
      var $target = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(_this.restoreTarget());
      $target.toggleClass('note-float-left', value === 'left');
      $target.toggleClass('note-float-right', value === 'right');
      $target.css('float', value === 'none' ? '' : value);
    });
    /**
     * resize overlay element
     * @param {String} value
     */

    this.resize = this.wrapCommand(function (value) {
      var $target = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(_this.restoreTarget());
      value = parseFloat(value);

      if (value === 0) {
        $target.css('width', '');
      } else {
        $target.css({
          width: value * 100 + '%',
          height: ''
        });
      }
    });
  }

  Editor_createClass(Editor, [{
    key: "initialize",
    value: function initialize() {
      var _this2 = this;

      // bind custom events
      this.$editable.on('keydown', function (event) {
        if (event.keyCode === core_key.code.ENTER) {
          _this2.context.triggerEvent('enter', event);
        }

        _this2.context.triggerEvent('keydown', event); // keep a snapshot to limit text on input event


        _this2.snapshot = _this2.history.makeSnapshot();
        _this2.hasKeyShortCut = false;

        if (!event.isDefaultPrevented()) {
          if (_this2.options.shortcuts) {
            _this2.hasKeyShortCut = _this2.handleKeyMap(event);
          } else {
            _this2.preventDefaultEditableShortCuts(event);
          }
        }

        if (_this2.isLimited(1, event)) {
          var lastRange = _this2.getLastRange();

          if (lastRange.eo - lastRange.so === 0) {
            return false;
          }
        }

        _this2.setLastRange(); // record undo in the key event except keyMap.


        if (_this2.options.recordEveryKeystroke) {
          if (_this2.hasKeyShortCut === false) {
            _this2.history.recordUndo();
          }
        }
      }).on('keyup', function (event) {
        _this2.setLastRange();

        _this2.context.triggerEvent('keyup', event);
      }).on('focus', function (event) {
        _this2.setLastRange();

        _this2.context.triggerEvent('focus', event);
      }).on('blur', function (event) {
        _this2.context.triggerEvent('blur', event);
      }).on('mousedown', function (event) {
        _this2.context.triggerEvent('mousedown', event);
      }).on('mouseup', function (event) {
        _this2.setLastRange();

        _this2.history.recordUndo();

        _this2.context.triggerEvent('mouseup', event);
      }).on('scroll', function (event) {
        _this2.context.triggerEvent('scroll', event);
      }).on('paste', function (event) {
        _this2.setLastRange();

        _this2.context.triggerEvent('paste', event);
      }).on('input', function () {
        // To limit composition characters (e.g. Korean)
        if (_this2.isLimited(0) && _this2.snapshot) {
          _this2.history.applySnapshot(_this2.snapshot);
        }
      });
      this.$editable.attr('spellcheck', this.options.spellCheck);
      this.$editable.attr('autocorrect', this.options.spellCheck);

      if (this.options.disableGrammar) {
        this.$editable.attr('data-gramm', false);
      } // init content before set event


      this.$editable.html(dom.html(this.$note) || dom.emptyPara);
      this.$editable.on(env.inputEventName, func.debounce(function () {
        _this2.context.triggerEvent('change', _this2.$editable.html(), _this2.$editable);
      }, 10));
      this.$editable.on('focusin', function (event) {
        _this2.context.triggerEvent('focusin', event);
      }).on('focusout', function (event) {
        _this2.context.triggerEvent('focusout', event);
      });

      if (this.options.airMode) {
        if (this.options.overrideContextMenu) {
          this.$editor.on('contextmenu', function (event) {
            _this2.context.triggerEvent('contextmenu', event);

            return false;
          });
        }
      } else {
        if (this.options.width) {
          this.$editor.outerWidth(this.options.width);
        }

        if (this.options.height) {
          this.$editable.outerHeight(this.options.height);
        }

        if (this.options.maxHeight) {
          this.$editable.css('max-height', this.options.maxHeight);
        }

        if (this.options.minHeight) {
          this.$editable.css('min-height', this.options.minHeight);
        }
      }

      this.history.recordUndo();
      this.setLastRange();
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.$editable.off();
    }
  }, {
    key: "handleKeyMap",
    value: function handleKeyMap(event) {
      var keyMap = this.options.keyMap[env.isMac ? 'mac' : 'pc'];
      var keys = [];

      if (event.metaKey) {
        keys.push('CMD');
      }

      if (event.ctrlKey && !event.altKey) {
        keys.push('CTRL');
      }

      if (event.shiftKey) {
        keys.push('SHIFT');
      }

      var keyName = core_key.nameFromCode[event.keyCode];

      if (keyName) {
        keys.push(keyName);
      }

      var eventName = keyMap[keys.join('+')];

      if (keyName === 'TAB' && !this.options.tabDisable) {
        this.afterCommand();
      } else if (eventName) {
        if (this.context.invoke(eventName) !== false) {
          event.preventDefault(); // if keyMap action was invoked

          return true;
        }
      } else if (core_key.isEdit(event.keyCode)) {
        this.afterCommand();
      }

      return false;
    }
  }, {
    key: "preventDefaultEditableShortCuts",
    value: function preventDefaultEditableShortCuts(event) {
      // B(Bold, 66) / I(Italic, 73) / U(Underline, 85)
      if ((event.ctrlKey || event.metaKey) && lists.contains([66, 73, 85], event.keyCode)) {
        event.preventDefault();
      }
    }
  }, {
    key: "isLimited",
    value: function isLimited(pad, event) {
      pad = pad || 0;

      if (typeof event !== 'undefined') {
        if (core_key.isMove(event.keyCode) || core_key.isNavigation(event.keyCode) || event.ctrlKey || event.metaKey || lists.contains([core_key.code.BACKSPACE, core_key.code.DELETE], event.keyCode)) {
          return false;
        }
      }

      if (this.options.maxTextLength > 0) {
        if (this.$editable.text().length + pad > this.options.maxTextLength) {
          return true;
        }
      }

      return false;
    }
    /**
     * create range
     * @return {WrappedRange}
     */

  }, {
    key: "createRange",
    value: function createRange() {
      this.focus();
      this.setLastRange();
      return this.getLastRange();
    }
    /**
     * create a new range from the list of elements
     *
     * @param {list} dom element list
     * @return {WrappedRange}
     */

  }, {
    key: "createRangeFromList",
    value: function createRangeFromList(lst) {
      var startRange = range.createFromNodeBefore(lists.head(lst));
      var startPoint = startRange.getStartPoint();
      var endRange = range.createFromNodeAfter(lists.last(lst));
      var endPoint = endRange.getEndPoint();
      return range.create(startPoint.node, startPoint.offset, endPoint.node, endPoint.offset);
    }
    /**
     * set the last range
     *
     * if given rng is exist, set rng as the last range
     * or create a new range at the end of the document
     *
     * @param {WrappedRange} rng
     */

  }, {
    key: "setLastRange",
    value: function setLastRange(rng) {
      if (rng) {
        this.lastRange = rng;
      } else {
        this.lastRange = range.create(this.editable);

        if (external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this.lastRange.sc).closest('.note-editable').length === 0) {
          this.lastRange = range.createFromBodyElement(this.editable);
        }
      }
    }
    /**
     * get the last range
     *
     * if there is a saved last range, return it
     * or create a new range and return it
     *
     * @return {WrappedRange}
     */

  }, {
    key: "getLastRange",
    value: function getLastRange() {
      if (!this.lastRange) {
        this.setLastRange();
      }

      return this.lastRange;
    }
    /**
     * saveRange
     *
     * save current range
     *
     * @param {Boolean} [thenCollapse=false]
     */

  }, {
    key: "saveRange",
    value: function saveRange(thenCollapse) {
      if (thenCollapse) {
        this.getLastRange().collapse().select();
      }
    }
    /**
     * restoreRange
     *
     * restore lately range
     */

  }, {
    key: "restoreRange",
    value: function restoreRange() {
      if (this.lastRange) {
        this.lastRange.select();
        this.focus();
      }
    }
  }, {
    key: "saveTarget",
    value: function saveTarget(node) {
      this.$editable.data('target', node);
    }
  }, {
    key: "clearTarget",
    value: function clearTarget() {
      this.$editable.removeData('target');
    }
  }, {
    key: "restoreTarget",
    value: function restoreTarget() {
      return this.$editable.data('target');
    }
    /**
     * currentStyle
     *
     * current style
     * @return {Object|Boolean} unfocus
     */

  }, {
    key: "currentStyle",
    value: function currentStyle() {
      var rng = range.create();

      if (rng) {
        rng = rng.normalize();
      }

      return rng ? this.style.current(rng) : this.style.fromNode(this.$editable);
    }
    /**
     * style from node
     *
     * @param {jQuery} $node
     * @return {Object}
     */

  }, {
    key: "styleFromNode",
    value: function styleFromNode($node) {
      return this.style.fromNode($node);
    }
    /**
     * undo
     */

  }, {
    key: "undo",
    value: function undo() {
      this.context.triggerEvent('before.command', this.$editable.html());
      this.history.undo();
      this.context.triggerEvent('change', this.$editable.html(), this.$editable);
    }
    /*
    * commit
    */

  }, {
    key: "commit",
    value: function commit() {
      this.context.triggerEvent('before.command', this.$editable.html());
      this.history.commit();
      this.context.triggerEvent('change', this.$editable.html(), this.$editable);
    }
    /**
     * redo
     */

  }, {
    key: "redo",
    value: function redo() {
      this.context.triggerEvent('before.command', this.$editable.html());
      this.history.redo();
      this.context.triggerEvent('change', this.$editable.html(), this.$editable);
    }
    /**
     * before command
     */

  }, {
    key: "beforeCommand",
    value: function beforeCommand() {
      this.context.triggerEvent('before.command', this.$editable.html()); // Set styleWithCSS before run a command

      document.execCommand('styleWithCSS', false, this.options.styleWithCSS); // keep focus on editable before command execution

      this.focus();
    }
    /**
     * after command
     * @param {Boolean} isPreventTrigger
     */

  }, {
    key: "afterCommand",
    value: function afterCommand(isPreventTrigger) {
      this.normalizeContent();
      this.history.recordUndo();

      if (!isPreventTrigger) {
        this.context.triggerEvent('change', this.$editable.html(), this.$editable);
      }
    }
    /**
     * handle tab key
     */

  }, {
    key: "tab",
    value: function tab() {
      var rng = this.getLastRange();

      if (rng.isCollapsed() && rng.isOnCell()) {
        this.table.tab(rng);
      } else {
        if (this.options.tabSize === 0) {
          return false;
        }

        if (!this.isLimited(this.options.tabSize)) {
          this.beforeCommand();
          this.typing.insertTab(rng, this.options.tabSize);
          this.afterCommand();
        }
      }
    }
    /**
     * handle shift+tab key
     */

  }, {
    key: "untab",
    value: function untab() {
      var rng = this.getLastRange();

      if (rng.isCollapsed() && rng.isOnCell()) {
        this.table.tab(rng, true);
      } else {
        if (this.options.tabSize === 0) {
          return false;
        }
      }
    }
    /**
     * run given function between beforeCommand and afterCommand
     */

  }, {
    key: "wrapCommand",
    value: function wrapCommand(fn) {
      return function () {
        this.beforeCommand();
        fn.apply(this, arguments);
        this.afterCommand();
      };
    }
    /**
     * insert image
     *
     * @param {String} src
     * @param {String|Function} param
     * @return {Promise}
     */

  }, {
    key: "insertImage",
    value: function insertImage(src, param) {
      var _this3 = this;

      return createImage(src, param).then(function ($image) {
        _this3.beforeCommand();

        if (typeof param === 'function') {
          param($image);
        } else {
          if (typeof param === 'string') {
            $image.attr('data-filename', param);
          }

          $image.css('width', Math.min(_this3.$editable.width(), $image.width()));
        }

        $image.show();

        _this3.getLastRange().insertNode($image[0]);

        _this3.setLastRange(range.createFromNodeAfter($image[0]).select());

        _this3.afterCommand();
      }).fail(function (e) {
        _this3.context.triggerEvent('image.upload.error', e);
      });
    }
    /**
     * insertImages
     * @param {File[]} files
     */

  }, {
    key: "insertImagesAsDataURL",
    value: function insertImagesAsDataURL(files) {
      var _this4 = this;

      external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(files, function (idx, file) {
        var filename = file.name;

        if (_this4.options.maximumImageFileSize && _this4.options.maximumImageFileSize < file.size) {
          _this4.context.triggerEvent('image.upload.error', _this4.lang.image.maximumFileSizeError);
        } else {
          readFileAsDataURL(file).then(function (dataURL) {
            return _this4.insertImage(dataURL, filename);
          }).fail(function () {
            _this4.context.triggerEvent('image.upload.error');
          });
        }
      });
    }
    /**
     * insertImagesOrCallback
     * @param {File[]} files
     */

  }, {
    key: "insertImagesOrCallback",
    value: function insertImagesOrCallback(files) {
      var callbacks = this.options.callbacks; // If onImageUpload set,

      if (callbacks.onImageUpload) {
        this.context.triggerEvent('image.upload', files); // else insert Image as dataURL
      } else {
        this.insertImagesAsDataURL(files);
      }
    }
    /**
     * return selected plain text
     * @return {String} text
     */

  }, {
    key: "getSelectedText",
    value: function getSelectedText() {
      var rng = this.getLastRange(); // if range on anchor, expand range with anchor

      if (rng.isOnAnchor()) {
        rng = range.createFromNode(dom.ancestor(rng.sc, dom.isAnchor));
      }

      return rng.toString();
    }
  }, {
    key: "onFormatBlock",
    value: function onFormatBlock(tagName, $target) {
      // [workaround] for MSIE, IE need `<`
      document.execCommand('FormatBlock', false, env.isMSIE ? '<' + tagName + '>' : tagName); // support custom class

      if ($target && $target.length) {
        // find the exact element has given tagName
        if ($target[0].tagName.toUpperCase() !== tagName.toUpperCase()) {
          $target = $target.find(tagName);
        }

        if ($target && $target.length) {
          var className = $target[0].className || '';

          if (className) {
            var currentRange = this.createRange();
            var $parent = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()([currentRange.sc, currentRange.ec]).closest(tagName);
            $parent.addClass(className);
          }
        }
      }
    }
  }, {
    key: "formatPara",
    value: function formatPara() {
      this.formatBlock('P');
    }
  }, {
    key: "fontStyling",
    value: function fontStyling(target, value) {
      var rng = this.getLastRange();

      if (rng !== '') {
        var spans = this.style.styleNodes(rng);
        this.$editor.find('.note-status-output').html('');
        external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(spans).css(target, value); // [workaround] added styled bogus span for style
        //  - also bogus character needed for cursor position

        if (rng.isCollapsed()) {
          var firstSpan = lists.head(spans);

          if (firstSpan && !dom.nodeLength(firstSpan)) {
            firstSpan.innerHTML = dom.ZERO_WIDTH_NBSP_CHAR;
            range.createFromNode(firstSpan.firstChild).select();
            this.setLastRange();
            this.$editable.data(KEY_BOGUS, firstSpan);
          }
        } else {
          this.setLastRange(this.createRangeFromList(spans).select());
        }
      } else {
        var noteStatusOutput = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.now();
        this.$editor.find('.note-status-output').html('<div id="note-status-output-' + noteStatusOutput + '" class="alert alert-info">' + this.lang.output.noSelection + '</div>');
        setTimeout(function () {
          external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('#note-status-output-' + noteStatusOutput).remove();
        }, 5000);
      }
    }
    /**
     * unlink
     *
     * @type command
     */

  }, {
    key: "unlink",
    value: function unlink() {
      var rng = this.getLastRange();

      if (rng.isOnAnchor()) {
        var anchor = dom.ancestor(rng.sc, dom.isAnchor);
        rng = range.createFromNode(anchor);
        rng.select();
        this.setLastRange();
        this.beforeCommand();
        document.execCommand('unlink');
        this.afterCommand();
      }
    }
    /**
     * returns link info
     *
     * @return {Object}
     * @return {WrappedRange} return.range
     * @return {String} return.text
     * @return {Boolean} [return.isNewWindow=true]
     * @return {String} [return.url=""]
     */

  }, {
    key: "getLinkInfo",
    value: function getLinkInfo() {
      var rng = this.getLastRange().expand(dom.isAnchor); // Get the first anchor on range(for edit).

      var $anchor = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(lists.head(rng.nodes(dom.isAnchor)));
      var linkInfo = {
        range: rng,
        text: rng.toString(),
        url: $anchor.length ? $anchor.attr('href') : ''
      }; // When anchor exists,

      if ($anchor.length) {
        // Set isNewWindow by checking its target.
        linkInfo.isNewWindow = $anchor.attr('target') === '_blank';
      }

      return linkInfo;
    }
  }, {
    key: "addRow",
    value: function addRow(position) {
      var rng = this.getLastRange(this.$editable);

      if (rng.isCollapsed() && rng.isOnCell()) {
        this.beforeCommand();
        this.table.addRow(rng, position);
        this.afterCommand();
      }
    }
  }, {
    key: "addCol",
    value: function addCol(position) {
      var rng = this.getLastRange(this.$editable);

      if (rng.isCollapsed() && rng.isOnCell()) {
        this.beforeCommand();
        this.table.addCol(rng, position);
        this.afterCommand();
      }
    }
  }, {
    key: "deleteRow",
    value: function deleteRow() {
      var rng = this.getLastRange(this.$editable);

      if (rng.isCollapsed() && rng.isOnCell()) {
        this.beforeCommand();
        this.table.deleteRow(rng);
        this.afterCommand();
      }
    }
  }, {
    key: "deleteCol",
    value: function deleteCol() {
      var rng = this.getLastRange(this.$editable);

      if (rng.isCollapsed() && rng.isOnCell()) {
        this.beforeCommand();
        this.table.deleteCol(rng);
        this.afterCommand();
      }
    }
  }, {
    key: "deleteTable",
    value: function deleteTable() {
      var rng = this.getLastRange(this.$editable);

      if (rng.isCollapsed() && rng.isOnCell()) {
        this.beforeCommand();
        this.table.deleteTable(rng);
        this.afterCommand();
      }
    }
    /**
     * @param {Position} pos
     * @param {jQuery} $target - target element
     * @param {Boolean} [bKeepRatio] - keep ratio
     */

  }, {
    key: "resizeTo",
    value: function resizeTo(pos, $target, bKeepRatio) {
      var imageSize;

      if (bKeepRatio) {
        var newRatio = pos.y / pos.x;
        var ratio = $target.data('ratio');
        imageSize = {
          width: ratio > newRatio ? pos.x : pos.y / ratio,
          height: ratio > newRatio ? pos.x * ratio : pos.y
        };
      } else {
        imageSize = {
          width: pos.x,
          height: pos.y
        };
      }

      $target.css(imageSize);
    }
    /**
     * returns whether editable area has focus or not.
     */

  }, {
    key: "hasFocus",
    value: function hasFocus() {
      return this.$editable.is(':focus');
    }
    /**
     * set focus
     */

  }, {
    key: "focus",
    value: function focus() {
      // [workaround] Screen will move when page is scolled in IE.
      //  - do focus when not focused
      if (!this.hasFocus()) {
        this.$editable.focus();
      }
    }
    /**
     * returns whether contents is empty or not.
     * @return {Boolean}
     */

  }, {
    key: "isEmpty",
    value: function isEmpty() {
      return dom.isEmpty(this.$editable[0]) || dom.emptyPara === this.$editable.html();
    }
    /**
     * Removes all contents and restores the editable instance to an _emptyPara_.
     */

  }, {
    key: "empty",
    value: function empty() {
      this.context.invoke('code', dom.emptyPara);
    }
    /**
     * normalize content
     */

  }, {
    key: "normalizeContent",
    value: function normalizeContent() {
      this.$editable[0].normalize();
    }
  }]);

  return Editor;
}();


// CONCATENATED MODULE: ./src/js/base/module/Clipboard.js
function Clipboard_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function Clipboard_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function Clipboard_createClass(Constructor, protoProps, staticProps) { if (protoProps) Clipboard_defineProperties(Constructor.prototype, protoProps); if (staticProps) Clipboard_defineProperties(Constructor, staticProps); return Constructor; }



var Clipboard_Clipboard = /*#__PURE__*/function () {
  function Clipboard(context) {
    Clipboard_classCallCheck(this, Clipboard);

    this.context = context;
    this.$editable = context.layoutInfo.editable;
  }

  Clipboard_createClass(Clipboard, [{
    key: "initialize",
    value: function initialize() {
      this.$editable.on('paste', this.pasteByEvent.bind(this));
    }
    /**
     * paste by clipboard event
     *
     * @param {Event} event
     */

  }, {
    key: "pasteByEvent",
    value: function pasteByEvent(event) {
      var _this = this;

      var clipboardData = event.originalEvent.clipboardData;

      if (clipboardData && clipboardData.items && clipboardData.items.length) {
        var item = clipboardData.items.length > 1 ? clipboardData.items[1] : lists.head(clipboardData.items);

        if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
          // paste img file
          this.context.invoke('editor.insertImagesOrCallback', [item.getAsFile()]);
          event.preventDefault();
        } else if (item.kind === 'string') {
          // paste text with maxTextLength check
          if (this.context.invoke('editor.isLimited', clipboardData.getData('Text').length)) {
            event.preventDefault();
          }
        }
      } else if (window.clipboardData) {
        // for IE
        var text = window.clipboardData.getData('text');

        if (this.context.invoke('editor.isLimited', text.length)) {
          event.preventDefault();
        }
      } // Call editor.afterCommand after proceeding default event handler


      setTimeout(function () {
        _this.context.invoke('editor.afterCommand');
      }, 10);
    }
  }]);

  return Clipboard;
}();


// CONCATENATED MODULE: ./src/js/base/module/Dropzone.js
function Dropzone_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function Dropzone_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function Dropzone_createClass(Constructor, protoProps, staticProps) { if (protoProps) Dropzone_defineProperties(Constructor.prototype, protoProps); if (staticProps) Dropzone_defineProperties(Constructor, staticProps); return Constructor; }



var Dropzone_Dropzone = /*#__PURE__*/function () {
  function Dropzone(context) {
    Dropzone_classCallCheck(this, Dropzone);

    this.context = context;
    this.$eventListener = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(document);
    this.$editor = context.layoutInfo.editor;
    this.$editable = context.layoutInfo.editable;
    this.options = context.options;
    this.lang = this.options.langInfo;
    this.documentEventHandlers = {};
    this.$dropzone = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(['<div class="note-dropzone">', '<div class="note-dropzone-message"></div>', '</div>'].join('')).prependTo(this.$editor);
  }
  /**
   * attach Drag and Drop Events
   */


  Dropzone_createClass(Dropzone, [{
    key: "initialize",
    value: function initialize() {
      if (this.options.disableDragAndDrop) {
        // prevent default drop event
        this.documentEventHandlers.onDrop = function (e) {
          e.preventDefault();
        }; // do not consider outside of dropzone


        this.$eventListener = this.$dropzone;
        this.$eventListener.on('drop', this.documentEventHandlers.onDrop);
      } else {
        this.attachDragAndDropEvent();
      }
    }
    /**
     * attach Drag and Drop Events
     */

  }, {
    key: "attachDragAndDropEvent",
    value: function attachDragAndDropEvent() {
      var _this = this;

      var collection = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()();
      var $dropzoneMessage = this.$dropzone.find('.note-dropzone-message');

      this.documentEventHandlers.onDragenter = function (e) {
        var isCodeview = _this.context.invoke('codeview.isActivated');

        var hasEditorSize = _this.$editor.width() > 0 && _this.$editor.height() > 0;

        if (!isCodeview && !collection.length && hasEditorSize) {
          _this.$editor.addClass('dragover');

          _this.$dropzone.width(_this.$editor.width());

          _this.$dropzone.height(_this.$editor.height());

          $dropzoneMessage.text(_this.lang.image.dragImageHere);
        }

        collection = collection.add(e.target);
      };

      this.documentEventHandlers.onDragleave = function (e) {
        collection = collection.not(e.target); // If nodeName is BODY, then just make it over (fix for IE)

        if (!collection.length || e.target.nodeName === 'BODY') {
          collection = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()();

          _this.$editor.removeClass('dragover');
        }
      };

      this.documentEventHandlers.onDrop = function () {
        collection = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()();

        _this.$editor.removeClass('dragover');
      }; // show dropzone on dragenter when dragging a object to document
      // -but only if the editor is visible, i.e. has a positive width and height


      this.$eventListener.on('dragenter', this.documentEventHandlers.onDragenter).on('dragleave', this.documentEventHandlers.onDragleave).on('drop', this.documentEventHandlers.onDrop); // change dropzone's message on hover.

      this.$dropzone.on('dragenter', function () {
        _this.$dropzone.addClass('hover');

        $dropzoneMessage.text(_this.lang.image.dropImage);
      }).on('dragleave', function () {
        _this.$dropzone.removeClass('hover');

        $dropzoneMessage.text(_this.lang.image.dragImageHere);
      }); // attach dropImage

      this.$dropzone.on('drop', function (event) {
        var dataTransfer = event.originalEvent.dataTransfer; // stop the browser from opening the dropped content

        event.preventDefault();

        if (dataTransfer && dataTransfer.files && dataTransfer.files.length) {
          _this.$editable.focus();

          _this.context.invoke('editor.insertImagesOrCallback', dataTransfer.files);
        } else {
          external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(dataTransfer.types, function (idx, type) {
            // skip moz-specific types
            if (type.toLowerCase().indexOf('_moz_') > -1) {
              return;
            }

            var content = dataTransfer.getData(type);

            if (type.toLowerCase().indexOf('text') > -1) {
              _this.context.invoke('editor.pasteHTML', content);
            } else {
              external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(content).each(function (idx, item) {
                _this.context.invoke('editor.insertNode', item);
              });
            }
          });
        }
      }).on('dragover', false); // prevent default dragover event
    }
  }, {
    key: "destroy",
    value: function destroy() {
      var _this2 = this;

      Object.keys(this.documentEventHandlers).forEach(function (key) {
        _this2.$eventListener.off(key.substr(2).toLowerCase(), _this2.documentEventHandlers[key]);
      });
      this.documentEventHandlers = {};
    }
  }]);

  return Dropzone;
}();


// CONCATENATED MODULE: ./src/js/base/module/Codeview.js
function _createForOfIteratorHelper(o) { if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (o = _unsupportedIterableToArray(o))) { var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var it, normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(n); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function Codeview_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function Codeview_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function Codeview_createClass(Constructor, protoProps, staticProps) { if (protoProps) Codeview_defineProperties(Constructor.prototype, protoProps); if (staticProps) Codeview_defineProperties(Constructor, staticProps); return Constructor; }



/**
 * @class Codeview
 */

var Codeview_CodeView = /*#__PURE__*/function () {
  function CodeView(context) {
    Codeview_classCallCheck(this, CodeView);

    this.context = context;
    this.$editor = context.layoutInfo.editor;
    this.$editable = context.layoutInfo.editable;
    this.$codable = context.layoutInfo.codable;
    this.options = context.options;
    this.CodeMirrorConstructor = window.CodeMirror;

    if (this.options.codemirror.CodeMirrorConstructor) {
      this.CodeMirrorConstructor = this.options.codemirror.CodeMirrorConstructor;
    }
  }

  Codeview_createClass(CodeView, [{
    key: "sync",
    value: function sync(html) {
      var isCodeview = this.isActivated();
      var CodeMirror = this.CodeMirrorConstructor;

      if (isCodeview) {
        if (html) {
          if (CodeMirror) {
            this.$codable.data('cmEditor').getDoc().setValue(html);
          } else {
            this.$codable.val(html);
          }
        } else {
          if (CodeMirror) {
            this.$codable.data('cmEditor').save();
          }
        }
      }
    }
  }, {
    key: "initialize",
    value: function initialize() {
      var _this = this;

      this.$codable.on('keyup', function (event) {
        if (event.keyCode === core_key.code.ESCAPE) {
          _this.deactivate();
        }
      });
    }
    /**
     * @return {Boolean}
     */

  }, {
    key: "isActivated",
    value: function isActivated() {
      return this.$editor.hasClass('codeview');
    }
    /**
     * toggle codeview
     */

  }, {
    key: "toggle",
    value: function toggle() {
      if (this.isActivated()) {
        this.deactivate();
      } else {
        this.activate();
      }

      this.context.triggerEvent('codeview.toggled');
    }
    /**
     * purify input value
     * @param value
     * @returns {*}
     */

  }, {
    key: "purify",
    value: function purify(value) {
      if (this.options.codeviewFilter) {
        // filter code view regex
        value = value.replace(this.options.codeviewFilterRegex, ''); // allow specific iframe tag

        if (this.options.codeviewIframeFilter) {
          var whitelist = this.options.codeviewIframeWhitelistSrc.concat(this.options.codeviewIframeWhitelistSrcBase);
          value = value.replace(/(<iframe.*?>.*?(?:<\/iframe>)?)/gi, function (tag) {
            // remove if src attribute is duplicated
            if (/<.+src(?==?('|"|\s)?)[\s\S]+src(?=('|"|\s)?)[^>]*?>/i.test(tag)) {
              return '';
            }

            var _iterator = _createForOfIteratorHelper(whitelist),
                _step;

            try {
              for (_iterator.s(); !(_step = _iterator.n()).done;) {
                var src = _step.value;

                // pass if src is trusted
                if (new RegExp('src="(https?:)?\/\/' + src.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&') + '\/(.+)"').test(tag)) {
                  return tag;
                }
              }
            } catch (err) {
              _iterator.e(err);
            } finally {
              _iterator.f();
            }

            return '';
          });
        }
      }

      return value;
    }
    /**
     * activate code view
     */

  }, {
    key: "activate",
    value: function activate() {
      var _this2 = this;

      var CodeMirror = this.CodeMirrorConstructor;
      this.$codable.val(dom.html(this.$editable, this.options.prettifyHtml));
      this.$codable.height(this.$editable.height());
      this.context.invoke('toolbar.updateCodeview', true);
      this.context.invoke('airPopover.updateCodeview', true);
      this.$editor.addClass('codeview');
      this.$codable.focus(); // activate CodeMirror as codable

      if (CodeMirror) {
        var cmEditor = CodeMirror.fromTextArea(this.$codable[0], this.options.codemirror); // CodeMirror TernServer

        if (this.options.codemirror.tern) {
          var server = new CodeMirror.TernServer(this.options.codemirror.tern);
          cmEditor.ternServer = server;
          cmEditor.on('cursorActivity', function (cm) {
            server.updateArgHints(cm);
          });
        }

        cmEditor.on('blur', function (event) {
          _this2.context.triggerEvent('blur.codeview', cmEditor.getValue(), event);
        });
        cmEditor.on('change', function () {
          _this2.context.triggerEvent('change.codeview', cmEditor.getValue(), cmEditor);
        }); // CodeMirror hasn't Padding.

        cmEditor.setSize(null, this.$editable.outerHeight());
        this.$codable.data('cmEditor', cmEditor);
      } else {
        this.$codable.on('blur', function (event) {
          _this2.context.triggerEvent('blur.codeview', _this2.$codable.val(), event);
        });
        this.$codable.on('input', function () {
          _this2.context.triggerEvent('change.codeview', _this2.$codable.val(), _this2.$codable);
        });
      }
    }
    /**
     * deactivate code view
     */

  }, {
    key: "deactivate",
    value: function deactivate() {
      var CodeMirror = this.CodeMirrorConstructor; // deactivate CodeMirror as codable

      if (CodeMirror) {
        var cmEditor = this.$codable.data('cmEditor');
        this.$codable.val(cmEditor.getValue());
        cmEditor.toTextArea();
      }

      var value = this.purify(dom.value(this.$codable, this.options.prettifyHtml) || dom.emptyPara);
      var isChange = this.$editable.html() !== value;
      this.$editable.html(value);
      this.$editable.height(this.options.height ? this.$codable.height() : 'auto');
      this.$editor.removeClass('codeview');

      if (isChange) {
        this.context.triggerEvent('change', this.$editable.html(), this.$editable);
      }

      this.$editable.focus();
      this.context.invoke('toolbar.updateCodeview', false);
      this.context.invoke('airPopover.updateCodeview', false);
    }
  }, {
    key: "destroy",
    value: function destroy() {
      if (this.isActivated()) {
        this.deactivate();
      }
    }
  }]);

  return CodeView;
}();


// CONCATENATED MODULE: ./src/js/base/module/Statusbar.js
function Statusbar_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function Statusbar_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function Statusbar_createClass(Constructor, protoProps, staticProps) { if (protoProps) Statusbar_defineProperties(Constructor.prototype, protoProps); if (staticProps) Statusbar_defineProperties(Constructor, staticProps); return Constructor; }


var EDITABLE_PADDING = 24;

var Statusbar_Statusbar = /*#__PURE__*/function () {
  function Statusbar(context) {
    Statusbar_classCallCheck(this, Statusbar);

    this.$document = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(document);
    this.$statusbar = context.layoutInfo.statusbar;
    this.$editable = context.layoutInfo.editable;
    this.options = context.options;
  }

  Statusbar_createClass(Statusbar, [{
    key: "initialize",
    value: function initialize() {
      var _this = this;

      if (this.options.airMode || this.options.disableResizeEditor) {
        this.destroy();
        return;
      }

      this.$statusbar.on('mousedown', function (event) {
        event.preventDefault();
        event.stopPropagation();

        var editableTop = _this.$editable.offset().top - _this.$document.scrollTop();

        var onMouseMove = function onMouseMove(event) {
          var height = event.clientY - (editableTop + EDITABLE_PADDING);
          height = _this.options.minheight > 0 ? Math.max(height, _this.options.minheight) : height;
          height = _this.options.maxHeight > 0 ? Math.min(height, _this.options.maxHeight) : height;

          _this.$editable.height(height);
        };

        _this.$document.on('mousemove', onMouseMove).one('mouseup', function () {
          _this.$document.off('mousemove', onMouseMove);
        });
      });
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.$statusbar.off();
      this.$statusbar.addClass('locked');
    }
  }]);

  return Statusbar;
}();


// CONCATENATED MODULE: ./src/js/base/module/Fullscreen.js
function Fullscreen_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function Fullscreen_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function Fullscreen_createClass(Constructor, protoProps, staticProps) { if (protoProps) Fullscreen_defineProperties(Constructor.prototype, protoProps); if (staticProps) Fullscreen_defineProperties(Constructor, staticProps); return Constructor; }



var Fullscreen_Fullscreen = /*#__PURE__*/function () {
  function Fullscreen(context) {
    var _this = this;

    Fullscreen_classCallCheck(this, Fullscreen);

    this.context = context;
    this.$editor = context.layoutInfo.editor;
    this.$toolbar = context.layoutInfo.toolbar;
    this.$editable = context.layoutInfo.editable;
    this.$codable = context.layoutInfo.codable;
    this.$window = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(window);
    this.$scrollbar = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('html, body');

    this.onResize = function () {
      _this.resizeTo({
        h: _this.$window.height() - _this.$toolbar.outerHeight()
      });
    };
  }

  Fullscreen_createClass(Fullscreen, [{
    key: "resizeTo",
    value: function resizeTo(size) {
      this.$editable.css('height', size.h);
      this.$codable.css('height', size.h);

      if (this.$codable.data('cmeditor')) {
        this.$codable.data('cmeditor').setsize(null, size.h);
      }
    }
    /**
     * toggle fullscreen
     */

  }, {
    key: "toggle",
    value: function toggle() {
      this.$editor.toggleClass('fullscreen');
      var modal = this.$editable.closest('.modal');
      if (modal.length){
        if (this.isFullscreen()) {
          modal.addClass('modal-note-fullscreen');
        }
        else{
          modal.removeClass('modal-note-fullscreen');
        }
      }

      if (this.isFullscreen()) {
        this.$editable.data('orgHeight', this.$editable.css('height'));
        this.$editable.data('orgMaxHeight', this.$editable.css('maxHeight'));
        this.$editable.css('maxHeight', '');
        this.$window.on('resize', this.onResize).trigger('resize');
        this.$scrollbar.css('overflow', 'hidden');
        
      } else {
        this.$window.off('resize', this.onResize);
        this.resizeTo({
          h: this.$editable.data('orgHeight')
        });
        this.$editable.css('maxHeight', this.$editable.css('orgMaxHeight'));
        this.$scrollbar.css('overflow', 'visible');
      }

      this.context.invoke('toolbar.updateFullscreen', this.isFullscreen());
    }
  }, {
    key: "isFullscreen",
    value: function isFullscreen() {
      return this.$editor.hasClass('fullscreen');
    }
  }]);

  return Fullscreen;
}();


// CONCATENATED MODULE: ./src/js/base/module/Handle.js
function Handle_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function Handle_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function Handle_createClass(Constructor, protoProps, staticProps) { if (protoProps) Handle_defineProperties(Constructor.prototype, protoProps); if (staticProps) Handle_defineProperties(Constructor, staticProps); return Constructor; }




var Handle_Handle = /*#__PURE__*/function () {
  function Handle(context) {
    var _this = this;

    Handle_classCallCheck(this, Handle);

    this.context = context;
    this.$document = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(document);
    this.$editingArea = context.layoutInfo.editingArea;
    this.options = context.options;
    this.lang = this.options.langInfo;
    this.events = {
      'summernote.mousedown': function summernoteMousedown(we, e) {
        if (_this.update(e.target, e)) {
          e.preventDefault();
        }
      },
      'summernote.keyup summernote.scroll summernote.change summernote.dialog.shown': function summernoteKeyupSummernoteScrollSummernoteChangeSummernoteDialogShown() {
        _this.update();
      },
      'summernote.disable summernote.blur': function summernoteDisableSummernoteBlur() {
        _this.hide();
      },
      'summernote.codeview.toggled': function summernoteCodeviewToggled() {
        _this.update();
      }
    };
  }

  Handle_createClass(Handle, [{
    key: "initialize",
    value: function initialize() {
      var _this2 = this;

      this.$handle = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(['<div class="note-handle">', '<div class="note-control-selection">', '<div class="note-control-selection-bg"></div>', '<div class="note-control-holder note-control-nw"></div>', '<div class="note-control-holder note-control-ne"></div>', '<div class="note-control-holder note-control-sw"></div>', '<div class="', this.options.disableResizeImage ? 'note-control-holder' : 'note-control-sizing', ' note-control-se"></div>', this.options.disableResizeImage ? '' : '<div class="note-control-selection-info"></div>', '</div>', '</div>'].join('')).prependTo(this.$editingArea);
      this.$handle.on('mousedown', function (event) {
        if (dom.isControlSizing(event.target)) {
          event.preventDefault();
          event.stopPropagation();

          var $target = _this2.$handle.find('.note-control-selection').data('target');

          var posStart = $target.offset();

          var scrollTop = _this2.$document.scrollTop();

          var onMouseMove = function onMouseMove(event) {
            _this2.context.invoke('editor.resizeTo', {
              x: event.clientX - posStart.left,
              y: event.clientY - (posStart.top - scrollTop)
            }, $target, !event.shiftKey);

            _this2.update($target[0], event);
          };

          _this2.$document.on('mousemove', onMouseMove).one('mouseup', function (e) {
            e.preventDefault();

            _this2.$document.off('mousemove', onMouseMove);

            _this2.context.invoke('editor.afterCommand');
          });

          if (!$target.data('ratio')) {
            // original ratio.
            $target.data('ratio', $target.height() / $target.width());
          }
        }
      }); // Listen for scrolling on the handle overlay.

      this.$handle.on('wheel', function (e) {
        e.preventDefault();

        _this2.update();
      });
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.$handle.remove();
    }
  }, {
    key: "update",
    value: function update(target, event) {
      if (this.context.isDisabled()) {
        return false;
      }

      var isImage = dom.isImg(target);
      var $selection = this.$handle.find('.note-control-selection');
      this.context.invoke('imagePopover.update', target, event);

      if (isImage) {
        var $image = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(target);
        var position = $image.position();
        var pos = {
          left: position.left + parseInt($image.css('marginLeft'), 10),
          top: position.top + parseInt($image.css('marginTop'), 10)
        }; // exclude margin

        var imageSize = {
          w: $image.outerWidth(false),
          h: $image.outerHeight(false)
        };
        $selection.css({
          display: 'block',
          left: pos.left,
          top: pos.top,
          width: imageSize.w,
          height: imageSize.h
        }).data('target', $image); // save current image element.

        var origImageObj = new Image();
        origImageObj.src = $image.attr('src');
        var sizingText = imageSize.w + 'x' + imageSize.h + ' (' + this.lang.image.original + ': ' + origImageObj.width + 'x' + origImageObj.height + ')';
        $selection.find('.note-control-selection-info').text(sizingText);
        this.context.invoke('editor.saveTarget', target);
      } else {
        this.hide();
      }

      return isImage;
    }
    /**
     * hide
     *
     * @param {jQuery} $handle
     */

  }, {
    key: "hide",
    value: function hide() {
      this.context.invoke('editor.clearTarget');
      this.$handle.children().hide();
    }
  }]);

  return Handle;
}();


// CONCATENATED MODULE: ./src/js/base/module/AutoLink.js
function AutoLink_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function AutoLink_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function AutoLink_createClass(Constructor, protoProps, staticProps) { if (protoProps) AutoLink_defineProperties(Constructor.prototype, protoProps); if (staticProps) AutoLink_defineProperties(Constructor, staticProps); return Constructor; }




var defaultScheme = 'http://';
var linkPattern = /^([A-Za-z][A-Za-z0-9+-.]*\:[\/]{2}|tel:|mailto:[A-Z0-9._%+-]+@)?(www\.)?(.+)$/i;

var AutoLink_AutoLink = /*#__PURE__*/function () {
  function AutoLink(context) {
    var _this = this;

    AutoLink_classCallCheck(this, AutoLink);

    this.context = context;
    this.options = context.options;
    this.events = {
      'summernote.keyup': function summernoteKeyup(we, e) {
        if (!e.isDefaultPrevented()) {
          _this.handleKeyup(e);
        }
      },
      'summernote.keydown': function summernoteKeydown(we, e) {
        _this.handleKeydown(e);
      }
    };
  }

  AutoLink_createClass(AutoLink, [{
    key: "initialize",
    value: function initialize() {
      this.lastWordRange = null;
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.lastWordRange = null;
    }
  }, {
    key: "replace",
    value: function replace() {
      if (!this.lastWordRange) {
        return;
      }

      var keyword = this.lastWordRange.toString();
      var match = keyword.match(linkPattern);

      if (match && (match[1] || match[2])) {
        var link = match[1] ? keyword : defaultScheme + keyword;
        var urlText = this.options.showDomainOnlyForAutolink ? keyword.replace(/^(?:https?:\/\/)?(?:tel?:?)?(?:mailto?:?)?(?:www\.)?/i, '').split('/')[0] : keyword;
        var node = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<a />').html(urlText).attr('href', link)[0];

        if (this.context.options.linkTargetBlank) {
          external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(node).attr('target', '_blank');
        }

        this.lastWordRange.insertNode(node);
        this.lastWordRange = null;
        this.context.invoke('editor.focus');
      }
    }
  }, {
    key: "handleKeydown",
    value: function handleKeydown(e) {
      if (lists.contains([core_key.code.ENTER, core_key.code.SPACE], e.keyCode)) {
        var wordRange = this.context.invoke('editor.createRange').getWordRange();
        this.lastWordRange = wordRange;
      }
    }
  }, {
    key: "handleKeyup",
    value: function handleKeyup(e) {
      if (lists.contains([core_key.code.ENTER, core_key.code.SPACE], e.keyCode)) {
        this.replace();
      }
    }
  }]);

  return AutoLink;
}();


// CONCATENATED MODULE: ./src/js/base/module/AutoSync.js
function AutoSync_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function AutoSync_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function AutoSync_createClass(Constructor, protoProps, staticProps) { if (protoProps) AutoSync_defineProperties(Constructor.prototype, protoProps); if (staticProps) AutoSync_defineProperties(Constructor, staticProps); return Constructor; }


/**
 * textarea auto sync.
 */

var AutoSync_AutoSync = /*#__PURE__*/function () {
  function AutoSync(context) {
    var _this = this;

    AutoSync_classCallCheck(this, AutoSync);

    this.$note = context.layoutInfo.note;
    this.events = {
      'summernote.change': function summernoteChange() {
        _this.$note.val(context.invoke('code'));
      }
    };
  }

  AutoSync_createClass(AutoSync, [{
    key: "shouldInitialize",
    value: function shouldInitialize() {
      return dom.isTextarea(this.$note[0]);
    }
  }]);

  return AutoSync;
}();


// CONCATENATED MODULE: ./src/js/base/module/AutoReplace.js
function AutoReplace_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function AutoReplace_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function AutoReplace_createClass(Constructor, protoProps, staticProps) { if (protoProps) AutoReplace_defineProperties(Constructor.prototype, protoProps); if (staticProps) AutoReplace_defineProperties(Constructor, staticProps); return Constructor; }





var AutoReplace_AutoReplace = /*#__PURE__*/function () {
  function AutoReplace(context) {
    var _this = this;

    AutoReplace_classCallCheck(this, AutoReplace);

    this.context = context;
    this.options = context.options.replace || {};
    this.keys = [core_key.code.ENTER, core_key.code.SPACE, core_key.code.PERIOD, core_key.code.COMMA, core_key.code.SEMICOLON, core_key.code.SLASH];
    this.previousKeydownCode = null;
    this.events = {
      'summernote.keyup': function summernoteKeyup(we, e) {
        if (!e.isDefaultPrevented()) {
          _this.handleKeyup(e);
        }
      },
      'summernote.keydown': function summernoteKeydown(we, e) {
        _this.handleKeydown(e);
      }
    };
  }

  AutoReplace_createClass(AutoReplace, [{
    key: "shouldInitialize",
    value: function shouldInitialize() {
      return !!this.options.match;
    }
  }, {
    key: "initialize",
    value: function initialize() {
      this.lastWord = null;
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.lastWord = null;
    }
  }, {
    key: "replace",
    value: function replace() {
      if (!this.lastWord) {
        return;
      }

      var self = this;
      var keyword = this.lastWord.toString();
      this.options.match(keyword, function (match) {
        if (match) {
          var node = '';

          if (typeof match === 'string') {
            node = dom.createText(match);
          } else if (match instanceof jQuery) {
            node = match[0];
          } else if (match instanceof Node) {
            node = match;
          }

          if (!node) return;
          self.lastWord.insertNode(node);
          self.lastWord = null;
          self.context.invoke('editor.focus');
        }
      });
    }
  }, {
    key: "handleKeydown",
    value: function handleKeydown(e) {
      // this forces it to remember the last whole word, even if multiple termination keys are pressed
      // before the previous key is let go.
      if (this.previousKeydownCode && lists.contains(this.keys, this.previousKeydownCode)) {
        this.previousKeydownCode = e.keyCode;
        return;
      }

      if (lists.contains(this.keys, e.keyCode)) {
        var wordRange = this.context.invoke('editor.createRange').getWordRange();
        this.lastWord = wordRange;
      }

      this.previousKeydownCode = e.keyCode;
    }
  }, {
    key: "handleKeyup",
    value: function handleKeyup(e) {
      if (lists.contains(this.keys, e.keyCode)) {
        this.replace();
      }
    }
  }]);

  return AutoReplace;
}();


// CONCATENATED MODULE: ./src/js/base/module/Placeholder.js
function Placeholder_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function Placeholder_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function Placeholder_createClass(Constructor, protoProps, staticProps) { if (protoProps) Placeholder_defineProperties(Constructor.prototype, protoProps); if (staticProps) Placeholder_defineProperties(Constructor, staticProps); return Constructor; }



var Placeholder_Placeholder = /*#__PURE__*/function () {
  function Placeholder(context) {
    var _this = this;

    Placeholder_classCallCheck(this, Placeholder);

    this.context = context;
    this.$editingArea = context.layoutInfo.editingArea;
    this.options = context.options;

    if (this.options.inheritPlaceholder === true) {
      // get placeholder value from the original element
      this.options.placeholder = this.context.$note.attr('placeholder') || this.options.placeholder;
    }

    this.events = {
      'summernote.init summernote.change': function summernoteInitSummernoteChange() {
        _this.update();
      },
      'summernote.codeview.toggled': function summernoteCodeviewToggled() {
        _this.update();
      }
    };
  }

  Placeholder_createClass(Placeholder, [{
    key: "shouldInitialize",
    value: function shouldInitialize() {
      return !!this.options.placeholder;
    }
  }, {
    key: "initialize",
    value: function initialize() {
      var _this2 = this;

      this.$placeholder = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<div class="note-placeholder">');
      this.$placeholder.on('click', function () {
        _this2.context.invoke('focus');
      }).html(this.options.placeholder).prependTo(this.$editingArea);
      this.update();
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.$placeholder.remove();
    }
  }, {
    key: "update",
    value: function update() {
      var isShow = !this.context.invoke('codeview.isActivated') && this.context.invoke('editor.isEmpty');
      this.$placeholder.toggle(isShow);
    }
  }]);

  return Placeholder;
}();


// CONCATENATED MODULE: ./src/js/base/module/Buttons.js
function Buttons_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function Buttons_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function Buttons_createClass(Constructor, protoProps, staticProps) { if (protoProps) Buttons_defineProperties(Constructor.prototype, protoProps); if (staticProps) Buttons_defineProperties(Constructor, staticProps); return Constructor; }






var Buttons_Buttons = /*#__PURE__*/function () {
  function Buttons(context) {
    Buttons_classCallCheck(this, Buttons);

    this.ui = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.ui;
    this.context = context;
    this.$toolbar = context.layoutInfo.toolbar;
    this.options = context.options;
    this.lang = this.options.langInfo;
    this.invertedKeyMap = func.invertObject(this.options.keyMap[env.isMac ? 'mac' : 'pc']);
  }

  Buttons_createClass(Buttons, [{
    key: "representShortcut",
    value: function representShortcut(editorMethod) {
      var shortcut = this.invertedKeyMap[editorMethod];

      if (!this.options.shortcuts || !shortcut) {
        return '';
      }

      if (env.isMac) {
        shortcut = shortcut.replace('CMD', '⌘').replace('SHIFT', '⇧');
      }

      shortcut = shortcut.replace('BACKSLASH', '\\').replace('SLASH', '/').replace('LEFTBRACKET', '[').replace('RIGHTBRACKET', ']');
      return ' (' + shortcut + ')';
    }
  }, {
    key: "button",
    value: function button(o) {
      if (!this.options.tooltip && o.tooltip) {
        delete o.tooltip;
      }

      o.container = this.options.container;
      return this.ui.button(o);
    }
  }, {
    key: "initialize",
    value: function initialize() {
      this.addToolbarButtons();
      this.addImagePopoverButtons();
      this.addLinkPopoverButtons();
      this.addTablePopoverButtons();
      this.fontInstalledMap = {};
    }
  }, {
    key: "destroy",
    value: function destroy() {
      delete this.fontInstalledMap;
    }
  }, {
    key: "isFontInstalled",
    value: function isFontInstalled(name) {
      if (!Object.prototype.hasOwnProperty.call(this.fontInstalledMap, name)) {
        this.fontInstalledMap[name] = env.isFontInstalled(name) || lists.contains(this.options.fontNamesIgnoreCheck, name);
      }

      return this.fontInstalledMap[name];
    }
  }, {
    key: "isFontDeservedToAdd",
    value: function isFontDeservedToAdd(name) {
      name = name.toLowerCase();
      return name !== '' && this.isFontInstalled(name) && env.genericFontFamilies.indexOf(name) === -1;
    }
  }, {
    key: "colorPalette",
    value: function colorPalette(className, tooltip, backColor, foreColor) {
      var _this = this;

      return this.ui.buttonGroup({
        className: 'note-color ' + className,
        children: [this.button({
          className: 'note-current-color-button',
          contents: this.ui.icon(this.options.icons.font + ' note-recent-color'),
          tooltip: tooltip,
          click: function click(e) {
            var $button = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(e.currentTarget);

            if (backColor && foreColor) {
              _this.context.invoke('editor.color', {
                backColor: $button.attr('data-backColor'),
                foreColor: $button.attr('data-foreColor')
              });
            } else if (backColor) {
              _this.context.invoke('editor.color', {
                backColor: $button.attr('data-backColor')
              });
            } else if (foreColor) {
              _this.context.invoke('editor.color', {
                foreColor: $button.attr('data-foreColor')
              });
            }
          },
          callback: function callback($button) {
            var $recentColor = $button.find('.note-recent-color');

            if (backColor) {
              $recentColor.css('background-color', _this.options.colorButton.backColor);
              $button.attr('data-backColor', _this.options.colorButton.backColor);
            }

            if (foreColor) {
              $recentColor.css('color', _this.options.colorButton.foreColor);
              $button.attr('data-foreColor', _this.options.colorButton.foreColor);
            } else {
              $recentColor.css('color', 'transparent');
            }
          }
        }), this.button({
          className: 'dropdown-toggle',
          contents: this.ui.dropdownButtonContents('', this.options),
          tooltip: this.lang.color.more,
          data: {
            toggle: 'dropdown'
          }
        }), this.ui.dropdown({
          items: (backColor ? ['<div class="note-palette">', '<div class="note-palette-title">' + this.lang.color.background + '</div>', '<div>', '<button type="button" class="note-color-reset btn btn-light btn-default" data-event="backColor" data-value="transparent">', this.lang.color.transparent, '</button>', '</div>', '<div class="note-holder" data-event="backColor"><!-- back colors --></div>', '<div>', '<button type="button" class="note-color-select btn btn-light btn-default" data-event="openPalette" data-value="backColorPicker">', this.lang.color.cpSelect, '</button>', '<input type="color" id="backColorPicker" class="note-btn note-color-select-btn" value="' + this.options.colorButton.backColor + '" data-event="backColorPalette">', '</div>', '<div class="note-holder-custom" id="backColorPalette" data-event="backColor"></div>', '</div>'].join('') : '') + (foreColor ? ['<div class="note-palette">', '<div class="note-palette-title">' + this.lang.color.foreground + '</div>', '<div>', '<button type="button" class="note-color-reset btn btn-light btn-default" data-event="removeFormat" data-value="foreColor">', this.lang.color.resetToDefault, '</button>', '</div>', '<div class="note-holder" data-event="foreColor"><!-- fore colors --></div>', '<div>', '<button type="button" class="note-color-select btn btn-light btn-default" data-event="openPalette" data-value="foreColorPicker">', this.lang.color.cpSelect, '</button>', '<input type="color" id="foreColorPicker" class="note-btn note-color-select-btn" value="' + this.options.colorButton.foreColor + '" data-event="foreColorPalette">', '</div>', // Fix missing Div, Commented to find easily if it's wrong
          '<div class="note-holder-custom" id="foreColorPalette" data-event="foreColor"></div>', '</div>'].join('') : ''),
          callback: function callback($dropdown) {
            $dropdown.find('.note-holder').each(function (idx, item) {
              var $holder = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(item);
              $holder.append(_this.ui.palette({
                colors: _this.options.colors,
                colorsName: _this.options.colorsName,
                eventName: $holder.data('event'),
                container: _this.options.container,
                tooltip: _this.options.tooltip
              }).render());
            });
            /* TODO: do we have to record recent custom colors within cookies? */

            var customColors = [['#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF']];
            $dropdown.find('.note-holder-custom').each(function (idx, item) {
              var $holder = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(item);
              $holder.append(_this.ui.palette({
                colors: customColors,
                colorsName: customColors,
                eventName: $holder.data('event'),
                container: _this.options.container,
                tooltip: _this.options.tooltip
              }).render());
            });
            $dropdown.find('input[type=color]').each(function (idx, item) {
              external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(item).change(function () {
                var $chip = $dropdown.find('#' + external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this).data('event')).find('.note-color-btn').first();
                var color = this.value.toUpperCase();
                $chip.css('background-color', color).attr('aria-label', color).attr('data-value', color).attr('data-original-title', color);
                $chip.click();
              });
            });
          },
          click: function click(event) {
            event.stopPropagation();
            var $parent = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('.' + className).find('.note-dropdown-menu');
            var $button = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(event.target);
            var eventName = $button.data('event');
            var value = $button.attr('data-value');

            if (eventName === 'openPalette') {
              var $picker = $parent.find('#' + value);
              var $palette = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()($parent.find('#' + $picker.data('event')).find('.note-color-row')[0]); // Shift palette chips

              var $chip = $palette.find('.note-color-btn').last().detach(); // Set chip attributes

              var color = $picker.val();
              $chip.css('background-color', color).attr('aria-label', color).attr('data-value', color).attr('data-original-title', color);
              $palette.prepend($chip);
              $picker.click();
            } else {
              if (lists.contains(['backColor', 'foreColor'], eventName)) {
                var key = eventName === 'backColor' ? 'background-color' : 'color';
                var $color = $button.closest('.note-color').find('.note-recent-color');
                var $currentButton = $button.closest('.note-color').find('.note-current-color-button');
                $color.css(key, value);
                $currentButton.attr('data-' + eventName, value);
              }

              _this.context.invoke('editor.' + eventName, value);
            }
          }
        })]
      }).render();
    }
  }, {
    key: "addToolbarButtons",
    value: function addToolbarButtons() {
      var _this2 = this;

      this.context.memo('button.style', function () {
        return _this2.ui.buttonGroup([_this2.button({
          className: 'dropdown-toggle',
          contents: _this2.ui.dropdownButtonContents(_this2.ui.icon(_this2.options.icons.magic), _this2.options),
          tooltip: _this2.lang.style.style,
          data: {
            toggle: 'dropdown'
          }
        }), _this2.ui.dropdown({
          className: 'dropdown-style',
          items: _this2.options.styleTags,
          title: _this2.lang.style.style,
          template: function template(item) {
            // TBD: need to be simplified
            if (typeof item === 'string') {
              item = {
                tag: item,
                title: Object.prototype.hasOwnProperty.call(_this2.lang.style, item) ? _this2.lang.style[item] : item
              };
            }

            var tag = item.tag;
            var title = item.title;
            var style = item.style ? ' style="' + item.style + '" ' : '';
            var className = item.className ? ' class="' + item.className + '"' : '';
            return '<' + tag + style + className + '>' + title + '</' + tag + '>';
          },
          click: _this2.context.createInvokeHandler('editor.formatBlock')
        })]).render();
      });

      var _loop = function _loop(styleIdx, styleLen) {
        var item = _this2.options.styleTags[styleIdx];

        _this2.context.memo('button.style.' + item, function () {
          return _this2.button({
            className: 'note-btn-style-' + item,
            contents: '<div data-value="' + item + '">' + item.toUpperCase() + '</div>',
            tooltip: _this2.lang.style[item],
            click: _this2.context.createInvokeHandler('editor.formatBlock')
          }).render();
        });
      };

      for (var styleIdx = 0, styleLen = this.options.styleTags.length; styleIdx < styleLen; styleIdx++) {
        _loop(styleIdx, styleLen);
      }

      this.context.memo('button.bold', function () {
        return _this2.button({
          className: 'note-btn-bold',
          contents: _this2.ui.icon(_this2.options.icons.bold),
          tooltip: _this2.lang.font.bold + _this2.representShortcut('bold'),
          click: _this2.context.createInvokeHandlerAndUpdateState('editor.bold')
        }).render();
      });
      this.context.memo('button.italic', function () {
        return _this2.button({
          className: 'note-btn-italic',
          contents: _this2.ui.icon(_this2.options.icons.italic),
          tooltip: _this2.lang.font.italic + _this2.representShortcut('italic'),
          click: _this2.context.createInvokeHandlerAndUpdateState('editor.italic')
        }).render();
      });
      this.context.memo('button.underline', function () {
        return _this2.button({
          className: 'note-btn-underline',
          contents: _this2.ui.icon(_this2.options.icons.underline),
          tooltip: _this2.lang.font.underline + _this2.representShortcut('underline'),
          click: _this2.context.createInvokeHandlerAndUpdateState('editor.underline')
        }).render();
      });
      this.context.memo('button.clear', function () {
        return _this2.button({
          contents: _this2.ui.icon(_this2.options.icons.eraser),
          tooltip: _this2.lang.font.clear + _this2.representShortcut('removeFormat'),
          click: _this2.context.createInvokeHandler('editor.removeFormat')
        }).render();
      });
      this.context.memo('button.strikethrough', function () {
        return _this2.button({
          className: 'note-btn-strikethrough',
          contents: _this2.ui.icon(_this2.options.icons.strikethrough),
          tooltip: _this2.lang.font.strikethrough + _this2.representShortcut('strikethrough'),
          click: _this2.context.createInvokeHandlerAndUpdateState('editor.strikethrough')
        }).render();
      });
      this.context.memo('button.superscript', function () {
        return _this2.button({
          className: 'note-btn-superscript',
          contents: _this2.ui.icon(_this2.options.icons.superscript),
          tooltip: _this2.lang.font.superscript,
          click: _this2.context.createInvokeHandlerAndUpdateState('editor.superscript')
        }).render();
      });
      this.context.memo('button.subscript', function () {
        return _this2.button({
          className: 'note-btn-subscript',
          contents: _this2.ui.icon(_this2.options.icons.subscript),
          tooltip: _this2.lang.font.subscript,
          click: _this2.context.createInvokeHandlerAndUpdateState('editor.subscript')
        }).render();
      });
      this.context.memo('button.fontname', function () {
        var styleInfo = _this2.context.invoke('editor.currentStyle');

        if (_this2.options.addDefaultFonts) {
          // Add 'default' fonts into the fontnames array if not exist
          external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(styleInfo['font-family'].split(','), function (idx, fontname) {
            fontname = fontname.trim().replace(/['"]+/g, '');

            if (_this2.isFontDeservedToAdd(fontname)) {
              if (_this2.options.fontNames.indexOf(fontname) === -1) {
                _this2.options.fontNames.push(fontname);
              }
            }
          });
        }

        return _this2.ui.buttonGroup([_this2.button({
          className: 'dropdown-toggle',
          contents: _this2.ui.dropdownButtonContents('<span class="note-current-fontname"></span>', _this2.options),
          tooltip: _this2.lang.font.name,
          data: {
            toggle: 'dropdown'
          }
        }), _this2.ui.dropdownCheck({
          className: 'dropdown-fontname',
          checkClassName: _this2.options.icons.menuCheck,
          items: _this2.options.fontNames.filter(_this2.isFontInstalled.bind(_this2)),
          title: _this2.lang.font.name,
          template: function template(item) {
            return '<span style="font-family: ' + env.validFontName(item) + '">' + item + '</span>';
          },
          click: _this2.context.createInvokeHandlerAndUpdateState('editor.fontName')
        })]).render();
      });
      this.context.memo('button.fontsize', function () {
        return _this2.ui.buttonGroup([_this2.button({
          className: 'dropdown-toggle',
          contents: _this2.ui.dropdownButtonContents('<span class="note-current-fontsize"></span>', _this2.options),
          tooltip: _this2.lang.font.size,
          data: {
            toggle: 'dropdown'
          }
        }), _this2.ui.dropdownCheck({
          className: 'dropdown-fontsize',
          checkClassName: _this2.options.icons.menuCheck,
          items: _this2.options.fontSizes,
          title: _this2.lang.font.size,
          click: _this2.context.createInvokeHandlerAndUpdateState('editor.fontSize')
        })]).render();
      });
      this.context.memo('button.fontsizeunit', function () {
        return _this2.ui.buttonGroup([_this2.button({
          className: 'dropdown-toggle',
          contents: _this2.ui.dropdownButtonContents('<span class="note-current-fontsizeunit"></span>', _this2.options),
          tooltip: _this2.lang.font.sizeunit,
          data: {
            toggle: 'dropdown'
          }
        }), _this2.ui.dropdownCheck({
          className: 'dropdown-fontsizeunit',
          checkClassName: _this2.options.icons.menuCheck,
          items: _this2.options.fontSizeUnits,
          title: _this2.lang.font.sizeunit,
          click: _this2.context.createInvokeHandlerAndUpdateState('editor.fontSizeUnit')
        })]).render();
      });
      this.context.memo('button.color', function () {
        return _this2.colorPalette('note-color-all', _this2.lang.color.recent, true, true);
      });
      this.context.memo('button.forecolor', function () {
        return _this2.colorPalette('note-color-fore', _this2.lang.color.foreground, false, true);
      });
      this.context.memo('button.backcolor', function () {
        return _this2.colorPalette('note-color-back', _this2.lang.color.background, true, false);
      });
      this.context.memo('button.ul', function () {
        return _this2.button({
          contents: _this2.ui.icon(_this2.options.icons.unorderedlist),
          tooltip: _this2.lang.lists.unordered + _this2.representShortcut('insertUnorderedList'),
          click: _this2.context.createInvokeHandler('editor.insertUnorderedList')
        }).render();
      });
      this.context.memo('button.ol', function () {
        return _this2.button({
          contents: _this2.ui.icon(_this2.options.icons.orderedlist),
          tooltip: _this2.lang.lists.ordered + _this2.representShortcut('insertOrderedList'),
          click: _this2.context.createInvokeHandler('editor.insertOrderedList')
        }).render();
      });
      var justifyLeft = this.button({
        contents: this.ui.icon(this.options.icons.alignLeft),
        tooltip: this.lang.paragraph.left + this.representShortcut('justifyLeft'),
        click: this.context.createInvokeHandler('editor.justifyLeft')
      });
      var justifyCenter = this.button({
        contents: this.ui.icon(this.options.icons.alignCenter),
        tooltip: this.lang.paragraph.center + this.representShortcut('justifyCenter'),
        click: this.context.createInvokeHandler('editor.justifyCenter')
      });
      var justifyRight = this.button({
        contents: this.ui.icon(this.options.icons.alignRight),
        tooltip: this.lang.paragraph.right + this.representShortcut('justifyRight'),
        click: this.context.createInvokeHandler('editor.justifyRight')
      });
      var justifyFull = this.button({
        contents: this.ui.icon(this.options.icons.alignJustify),
        tooltip: this.lang.paragraph.justify + this.representShortcut('justifyFull'),
        click: this.context.createInvokeHandler('editor.justifyFull')
      });
      var outdent = this.button({
        contents: this.ui.icon(this.options.icons.outdent),
        tooltip: this.lang.paragraph.outdent + this.representShortcut('outdent'),
        click: this.context.createInvokeHandler('editor.outdent')
      });
      var indent = this.button({
        contents: this.ui.icon(this.options.icons.indent),
        tooltip: this.lang.paragraph.indent + this.representShortcut('indent'),
        click: this.context.createInvokeHandler('editor.indent')
      });
      this.context.memo('button.justifyLeft', func.invoke(justifyLeft, 'render'));
      this.context.memo('button.justifyCenter', func.invoke(justifyCenter, 'render'));
      this.context.memo('button.justifyRight', func.invoke(justifyRight, 'render'));
      this.context.memo('button.justifyFull', func.invoke(justifyFull, 'render'));
      this.context.memo('button.outdent', func.invoke(outdent, 'render'));
      this.context.memo('button.indent', func.invoke(indent, 'render'));
      this.context.memo('button.paragraph', function () {
        return _this2.ui.buttonGroup([_this2.button({
          className: 'dropdown-toggle',
          contents: _this2.ui.dropdownButtonContents(_this2.ui.icon(_this2.options.icons.alignLeft), _this2.options),
          tooltip: _this2.lang.paragraph.paragraph,
          data: {
            toggle: 'dropdown'
          }
        }), _this2.ui.dropdown([_this2.ui.buttonGroup({
          className: 'note-align',
          children: [justifyLeft, justifyCenter, justifyRight, justifyFull]
        }), _this2.ui.buttonGroup({
          className: 'note-list',
          children: [outdent, indent]
        })])]).render();
      });
      this.context.memo('button.height', function () {
        return _this2.ui.buttonGroup([_this2.button({
          className: 'dropdown-toggle',
          contents: _this2.ui.dropdownButtonContents(_this2.ui.icon(_this2.options.icons.textHeight), _this2.options),
          tooltip: _this2.lang.font.height,
          data: {
            toggle: 'dropdown'
          }
        }), _this2.ui.dropdownCheck({
          items: _this2.options.lineHeights,
          checkClassName: _this2.options.icons.menuCheck,
          className: 'dropdown-line-height',
          title: _this2.lang.font.height,
          click: _this2.context.createInvokeHandler('editor.lineHeight')
        })]).render();
      });
      this.context.memo('button.table', function () {
        return _this2.ui.buttonGroup([_this2.button({
          className: 'dropdown-toggle',
          contents: _this2.ui.dropdownButtonContents(_this2.ui.icon(_this2.options.icons.table), _this2.options),
          tooltip: _this2.lang.table.table,
          data: {
            toggle: 'dropdown'
          }
        }), _this2.ui.dropdown({
          title: _this2.lang.table.table,
          className: 'note-table',
          items: ['<div class="note-dimension-picker">', '<div class="note-dimension-picker-mousecatcher" data-event="insertTable" data-value="1x1"></div>', '<div class="note-dimension-picker-highlighted"></div>', '<div class="note-dimension-picker-unhighlighted"></div>', '</div>', '<div class="note-dimension-display">1 x 1</div>'].join('')
        })], {
          callback: function callback($node) {
            var $catcher = $node.find('.note-dimension-picker-mousecatcher');
            $catcher.css({
              width: _this2.options.insertTableMaxSize.col + 'em',
              height: _this2.options.insertTableMaxSize.row + 'em'
            }).mousedown(_this2.context.createInvokeHandler('editor.insertTable')).on('mousemove', _this2.tableMoveHandler.bind(_this2));
          }
        }).render();
      });
      this.context.memo('button.link', function () {
        return _this2.button({
          contents: _this2.ui.icon(_this2.options.icons.link),
          tooltip: _this2.lang.link.link + _this2.representShortcut('linkDialog.show'),
          click: _this2.context.createInvokeHandler('linkDialog.show')
        }).render();
      });
      this.context.memo('button.picture', function () {
        return _this2.button({
          contents: _this2.ui.icon(_this2.options.icons.picture),
          tooltip: _this2.lang.image.image,
          click: _this2.context.createInvokeHandler('imageDialog.show')
        }).render();
      });
      this.context.memo('button.video', function () {
        return _this2.button({
          contents: _this2.ui.icon(_this2.options.icons.video),
          tooltip: _this2.lang.video.video,
          click: _this2.context.createInvokeHandler('videoDialog.show')
        }).render();
      });
      this.context.memo('button.hr', function () {
        return _this2.button({
          contents: _this2.ui.icon(_this2.options.icons.minus),
          tooltip: _this2.lang.hr.insert + _this2.representShortcut('insertHorizontalRule'),
          click: _this2.context.createInvokeHandler('editor.insertHorizontalRule')
        }).render();
      });
      this.context.memo('button.fullscreen', function () {
        return _this2.button({
          className: 'btn-fullscreen note-codeview-keep',
          contents: _this2.ui.icon(_this2.options.icons.arrowsAlt),
          tooltip: _this2.lang.options.fullscreen,
          click: _this2.context.createInvokeHandler('fullscreen.toggle')
        }).render();
      });
      this.context.memo('button.codeview', function () {
        return _this2.button({
          className: 'btn-codeview note-codeview-keep',
          contents: _this2.ui.icon(_this2.options.icons.code),
          tooltip: _this2.lang.options.codeview,
          click: _this2.context.createInvokeHandler('codeview.toggle')
        }).render();
      });
      this.context.memo('button.redo', function () {
        return _this2.button({
          contents: _this2.ui.icon(_this2.options.icons.redo),
          tooltip: _this2.lang.history.redo + _this2.representShortcut('redo'),
          click: _this2.context.createInvokeHandler('editor.redo')
        }).render();
      });
      this.context.memo('button.undo', function () {
        return _this2.button({
          contents: _this2.ui.icon(_this2.options.icons.undo),
          tooltip: _this2.lang.history.undo + _this2.representShortcut('undo'),
          click: _this2.context.createInvokeHandler('editor.undo')
        }).render();
      });
      this.context.memo('button.help', function () {
        return _this2.button({
          contents: _this2.ui.icon(_this2.options.icons.question),
          tooltip: _this2.lang.options.help,
          click: _this2.context.createInvokeHandler('helpDialog.show')
        }).render();
      });
    }
    /**
     * image: [
     *   ['imageResize', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
     *   ['float', ['floatLeft', 'floatRight', 'floatNone']],
     *   ['remove', ['removeMedia']],
     * ],
     */

  }, {
    key: "addImagePopoverButtons",
    value: function addImagePopoverButtons() {
      var _this3 = this;

      // Image Size Buttons
      this.context.memo('button.resizeFull', function () {
        return _this3.button({
          contents: '<span class="note-fontsize-10">100%</span>',
          tooltip: _this3.lang.image.resizeFull,
          click: _this3.context.createInvokeHandler('editor.resize', '1')
        }).render();
      });
      this.context.memo('button.resizeHalf', function () {
        return _this3.button({
          contents: '<span class="note-fontsize-10">50%</span>',
          tooltip: _this3.lang.image.resizeHalf,
          click: _this3.context.createInvokeHandler('editor.resize', '0.5')
        }).render();
      });
      this.context.memo('button.resizeQuarter', function () {
        return _this3.button({
          contents: '<span class="note-fontsize-10">25%</span>',
          tooltip: _this3.lang.image.resizeQuarter,
          click: _this3.context.createInvokeHandler('editor.resize', '0.25')
        }).render();
      });
      this.context.memo('button.resizeNone', function () {
        return _this3.button({
          contents: _this3.ui.icon(_this3.options.icons.rollback),
          tooltip: _this3.lang.image.resizeNone,
          click: _this3.context.createInvokeHandler('editor.resize', '0')
        }).render();
      }); // Float Buttons

      this.context.memo('button.floatLeft', function () {
        return _this3.button({
          contents: _this3.ui.icon(_this3.options.icons.floatLeft),
          tooltip: _this3.lang.image.floatLeft,
          click: _this3.context.createInvokeHandler('editor.floatMe', 'left')
        }).render();
      });
      this.context.memo('button.floatRight', function () {
        return _this3.button({
          contents: _this3.ui.icon(_this3.options.icons.floatRight),
          tooltip: _this3.lang.image.floatRight,
          click: _this3.context.createInvokeHandler('editor.floatMe', 'right')
        }).render();
      });
      this.context.memo('button.floatNone', function () {
        return _this3.button({
          contents: _this3.ui.icon(_this3.options.icons.rollback),
          tooltip: _this3.lang.image.floatNone,
          click: _this3.context.createInvokeHandler('editor.floatMe', 'none')
        }).render();
      }); // Remove Buttons

      this.context.memo('button.removeMedia', function () {
        return _this3.button({
          contents: _this3.ui.icon(_this3.options.icons.trash),
          tooltip: _this3.lang.image.remove,
          click: _this3.context.createInvokeHandler('editor.removeMedia')
        }).render();
      });
    }
  }, {
    key: "addLinkPopoverButtons",
    value: function addLinkPopoverButtons() {
      var _this4 = this;

      this.context.memo('button.linkDialogShow', function () {
        return _this4.button({
          contents: _this4.ui.icon(_this4.options.icons.link),
          tooltip: _this4.lang.link.edit,
          click: _this4.context.createInvokeHandler('linkDialog.show')
        }).render();
      });
      this.context.memo('button.unlink', function () {
        return _this4.button({
          contents: _this4.ui.icon(_this4.options.icons.unlink),
          tooltip: _this4.lang.link.unlink,
          click: _this4.context.createInvokeHandler('editor.unlink')
        }).render();
      });
    }
    /**
     * table : [
     *  ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
     *  ['delete', ['deleteRow', 'deleteCol', 'deleteTable']]
     * ],
     */

  }, {
    key: "addTablePopoverButtons",
    value: function addTablePopoverButtons() {
      var _this5 = this;

      this.context.memo('button.addRowUp', function () {
        return _this5.button({
          className: 'btn-md',
          contents: _this5.ui.icon(_this5.options.icons.rowAbove),
          tooltip: _this5.lang.table.addRowAbove,
          click: _this5.context.createInvokeHandler('editor.addRow', 'top')
        }).render();
      });
      this.context.memo('button.addRowDown', function () {
        return _this5.button({
          className: 'btn-md',
          contents: _this5.ui.icon(_this5.options.icons.rowBelow),
          tooltip: _this5.lang.table.addRowBelow,
          click: _this5.context.createInvokeHandler('editor.addRow', 'bottom')
        }).render();
      });
      this.context.memo('button.addColLeft', function () {
        return _this5.button({
          className: 'btn-md',
          contents: _this5.ui.icon(_this5.options.icons.colBefore),
          tooltip: _this5.lang.table.addColLeft,
          click: _this5.context.createInvokeHandler('editor.addCol', 'left')
        }).render();
      });
      this.context.memo('button.addColRight', function () {
        return _this5.button({
          className: 'btn-md',
          contents: _this5.ui.icon(_this5.options.icons.colAfter),
          tooltip: _this5.lang.table.addColRight,
          click: _this5.context.createInvokeHandler('editor.addCol', 'right')
        }).render();
      });
      this.context.memo('button.deleteRow', function () {
        return _this5.button({
          className: 'btn-md',
          contents: _this5.ui.icon(_this5.options.icons.rowRemove),
          tooltip: _this5.lang.table.delRow,
          click: _this5.context.createInvokeHandler('editor.deleteRow')
        }).render();
      });
      this.context.memo('button.deleteCol', function () {
        return _this5.button({
          className: 'btn-md',
          contents: _this5.ui.icon(_this5.options.icons.colRemove),
          tooltip: _this5.lang.table.delCol,
          click: _this5.context.createInvokeHandler('editor.deleteCol')
        }).render();
      });
      this.context.memo('button.deleteTable', function () {
        return _this5.button({
          className: 'btn-md',
          contents: _this5.ui.icon(_this5.options.icons.trash),
          tooltip: _this5.lang.table.delTable,
          click: _this5.context.createInvokeHandler('editor.deleteTable')
        }).render();
      });
    }
  }, {
    key: "build",
    value: function build($container, groups) {
      for (var groupIdx = 0, groupLen = groups.length; groupIdx < groupLen; groupIdx++) {
        var group = groups[groupIdx];
        var groupName = Array.isArray(group) ? group[0] : group;
        var buttons = Array.isArray(group) ? group.length === 1 ? [group[0]] : group[1] : [group];
        var $group = this.ui.buttonGroup({
          className: 'note-' + groupName
        }).render();

        for (var idx = 0, len = buttons.length; idx < len; idx++) {
          var btn = this.context.memo('button.' + buttons[idx]);

          if (btn) {
            $group.append(typeof btn === 'function' ? btn(this.context) : btn);
          }
        }

        $group.appendTo($container);
      }
    }
    /**
     * @param {jQuery} [$container]
     */

  }, {
    key: "updateCurrentStyle",
    value: function updateCurrentStyle($container) {
      var _this6 = this;

      var $cont = $container || this.$toolbar;
      var styleInfo = this.context.invoke('editor.currentStyle');
      this.updateBtnStates($cont, {
        '.note-btn-bold': function noteBtnBold() {
          return styleInfo['font-bold'] === 'bold';
        },
        '.note-btn-italic': function noteBtnItalic() {
          return styleInfo['font-italic'] === 'italic';
        },
        '.note-btn-underline': function noteBtnUnderline() {
          return styleInfo['font-underline'] === 'underline';
        },
        '.note-btn-subscript': function noteBtnSubscript() {
          return styleInfo['font-subscript'] === 'subscript';
        },
        '.note-btn-superscript': function noteBtnSuperscript() {
          return styleInfo['font-superscript'] === 'superscript';
        },
        '.note-btn-strikethrough': function noteBtnStrikethrough() {
          return styleInfo['font-strikethrough'] === 'strikethrough';
        }
      });

      if (styleInfo['font-family']) {
        var fontNames = styleInfo['font-family'].split(',').map(function (name) {
          return name.replace(/[\'\"]/g, '').replace(/\s+$/, '').replace(/^\s+/, '');
        });
        var fontName = lists.find(fontNames, this.isFontInstalled.bind(this));
        $cont.find('.dropdown-fontname a').each(function (idx, item) {
          var $item = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(item); // always compare string to avoid creating another func.

          var isChecked = $item.data('value') + '' === fontName + '';
          $item.toggleClass('checked', isChecked);
        });
        $cont.find('.note-current-fontname').text(fontName).css('font-family', fontName);
      }

      if (styleInfo['font-size']) {
        var fontSize = styleInfo['font-size'];
        $cont.find('.dropdown-fontsize a').each(function (idx, item) {
          var $item = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(item); // always compare with string to avoid creating another func.

          var isChecked = $item.data('value') + '' === fontSize + '';
          $item.toggleClass('checked', isChecked);
        });
        $cont.find('.note-current-fontsize').text(fontSize);
        var fontSizeUnit = styleInfo['font-size-unit'];
        $cont.find('.dropdown-fontsizeunit a').each(function (idx, item) {
          var $item = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(item);
          var isChecked = $item.data('value') + '' === fontSizeUnit + '';
          $item.toggleClass('checked', isChecked);
        });
        $cont.find('.note-current-fontsizeunit').text(fontSizeUnit);
      }

      if (styleInfo['line-height']) {
        var lineHeight = styleInfo['line-height'];
        $cont.find('.dropdown-line-height li a').each(function (idx, item) {
          // always compare with string to avoid creating another func.
          var isChecked = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(item).data('value') + '' === lineHeight + '';
          _this6.className = isChecked ? 'checked' : '';
        });
      }
    }
  }, {
    key: "updateBtnStates",
    value: function updateBtnStates($container, infos) {
      var _this7 = this;

      external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.each(infos, function (selector, pred) {
        _this7.ui.toggleBtnActive($container.find(selector), pred());
      });
    }
  }, {
    key: "tableMoveHandler",
    value: function tableMoveHandler(event) {
      var PX_PER_EM = 18;
      var $picker = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(event.target.parentNode); // target is mousecatcher

      var $dimensionDisplay = $picker.next();
      var $catcher = $picker.find('.note-dimension-picker-mousecatcher');
      var $highlighted = $picker.find('.note-dimension-picker-highlighted');
      var $unhighlighted = $picker.find('.note-dimension-picker-unhighlighted');
      var posOffset; // HTML5 with jQuery - e.offsetX is undefined in Firefox

      if (event.offsetX === undefined) {
        var posCatcher = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(event.target).offset();
        posOffset = {
          x: event.pageX - posCatcher.left,
          y: event.pageY - posCatcher.top
        };
      } else {
        posOffset = {
          x: event.offsetX,
          y: event.offsetY
        };
      }

      var dim = {
        c: Math.ceil(posOffset.x / PX_PER_EM) || 1,
        r: Math.ceil(posOffset.y / PX_PER_EM) || 1
      };
      $highlighted.css({
        width: dim.c + 'em',
        height: dim.r + 'em'
      });
      $catcher.data('value', dim.c + 'x' + dim.r);

      if (dim.c > 3 && dim.c < this.options.insertTableMaxSize.col) {
        $unhighlighted.css({
          width: dim.c + 1 + 'em'
        });
      }

      if (dim.r > 3 && dim.r < this.options.insertTableMaxSize.row) {
        $unhighlighted.css({
          height: dim.r + 1 + 'em'
        });
      }

      $dimensionDisplay.html(dim.c + ' x ' + dim.r);
    }
  }]);

  return Buttons;
}();


// CONCATENATED MODULE: ./src/js/base/module/Toolbar.js
function Toolbar_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function Toolbar_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function Toolbar_createClass(Constructor, protoProps, staticProps) { if (protoProps) Toolbar_defineProperties(Constructor.prototype, protoProps); if (staticProps) Toolbar_defineProperties(Constructor, staticProps); return Constructor; }



var Toolbar_Toolbar = /*#__PURE__*/function () {
  function Toolbar(context) {
    Toolbar_classCallCheck(this, Toolbar);

    this.context = context;
    this.$window = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(window);
    this.$document = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(document);
    this.ui = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.ui;
    this.$note = context.layoutInfo.note;
    this.$editor = context.layoutInfo.editor;
    this.$toolbar = context.layoutInfo.toolbar;
    this.$editable = context.layoutInfo.editable;
    this.$statusbar = context.layoutInfo.statusbar;
    this.options = context.options;
    this.isFollowing = false;
    this.followScroll = this.followScroll.bind(this);
  }

  Toolbar_createClass(Toolbar, [{
    key: "shouldInitialize",
    value: function shouldInitialize() {
      return !this.options.airMode;
    }
  }, {
    key: "initialize",
    value: function initialize() {
      var _this = this;

      this.options.toolbar = this.options.toolbar || [];

      if (!this.options.toolbar.length) {
        this.$toolbar.hide();
      } else {
        this.context.invoke('buttons.build', this.$toolbar, this.options.toolbar);
      }

      if (this.options.toolbarContainer) {
        this.$toolbar.appendTo(this.options.toolbarContainer);
      }

      this.changeContainer(false);
      this.$note.on('summernote.keyup summernote.mouseup summernote.change', function () {
        _this.context.invoke('buttons.updateCurrentStyle');
      });
      this.context.invoke('buttons.updateCurrentStyle');

      if (this.options.followingToolbar) {
        this.$window.on('scroll resize', this.followScroll);
      }
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.$toolbar.children().remove();

      if (this.options.followingToolbar) {
        this.$window.off('scroll resize', this.followScroll);
      }
    }
  }, {
    key: "followScroll",
    value: function followScroll() {
      if (this.$editor.hasClass('fullscreen')) {
        return false;
      }

      var editorHeight = this.$editor.outerHeight();
      var editorWidth = this.$editor.width();
      var toolbarHeight = this.$toolbar.height();
      var statusbarHeight = this.$statusbar.height(); // check if the web app is currently using another static bar

      var otherBarHeight = 0;

      if (this.options.otherStaticBar) {
        otherBarHeight = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this.options.otherStaticBar).outerHeight();
      }

      var currentOffset = this.$document.scrollTop();
      var editorOffsetTop = this.$editor.offset().top;
      var editorOffsetBottom = editorOffsetTop + editorHeight;
      var activateOffset = editorOffsetTop - otherBarHeight;
      var deactivateOffsetBottom = editorOffsetBottom - otherBarHeight - toolbarHeight - statusbarHeight;

      if (!this.isFollowing && currentOffset > activateOffset && currentOffset < deactivateOffsetBottom - toolbarHeight) {
        this.isFollowing = true;
        this.$editable.css({
          marginTop: this.$toolbar.outerHeight()
        });
        this.$toolbar.css({
          position: 'fixed',
          top: otherBarHeight,
          width: editorWidth,
          zIndex: 1000
        });
      } else if (this.isFollowing && (currentOffset < activateOffset || currentOffset > deactivateOffsetBottom)) {
        this.isFollowing = false;
        this.$toolbar.css({
          position: 'relative',
          top: 0,
          width: '100%',
          zIndex: 'auto'
        });
        this.$editable.css({
          marginTop: ''
        });
      }
    }
  }, {
    key: "changeContainer",
    value: function changeContainer(isFullscreen) {
      if (isFullscreen) {
        this.$toolbar.prependTo(this.$editor);
      } else {
        if (this.options.toolbarContainer) {
          this.$toolbar.appendTo(this.options.toolbarContainer);
        }
      }

      if (this.options.followingToolbar) {
        this.followScroll();
      }
    }
  }, {
    key: "updateFullscreen",
    value: function updateFullscreen(isFullscreen) {
      this.ui.toggleBtnActive(this.$toolbar.find('.btn-fullscreen'), isFullscreen);
      this.changeContainer(isFullscreen);
    }
  }, {
    key: "updateCodeview",
    value: function updateCodeview(isCodeview) {
      this.ui.toggleBtnActive(this.$toolbar.find('.btn-codeview'), isCodeview);

      if (isCodeview) {
        this.deactivate();
      } else {
        this.activate();
      }
    }
  }, {
    key: "activate",
    value: function activate(isIncludeCodeview) {
      var $btn = this.$toolbar.find('button');

      if (!isIncludeCodeview) {
        $btn = $btn.not('.note-codeview-keep');
      }

      this.ui.toggleBtn($btn, true);
    }
  }, {
    key: "deactivate",
    value: function deactivate(isIncludeCodeview) {
      var $btn = this.$toolbar.find('button');

      if (!isIncludeCodeview) {
        $btn = $btn.not('.note-codeview-keep');
      }

      this.ui.toggleBtn($btn, false);
    }
  }]);

  return Toolbar;
}();


// CONCATENATED MODULE: ./src/js/base/module/LinkDialog.js
function LinkDialog_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function LinkDialog_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function LinkDialog_createClass(Constructor, protoProps, staticProps) { if (protoProps) LinkDialog_defineProperties(Constructor.prototype, protoProps); if (staticProps) LinkDialog_defineProperties(Constructor, staticProps); return Constructor; }






var LinkDialog_LinkDialog = /*#__PURE__*/function () {
  function LinkDialog(context) {
    LinkDialog_classCallCheck(this, LinkDialog);

    this.context = context;
    this.ui = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.ui;
    this.$body = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(document.body);
    this.$editor = context.layoutInfo.editor;
    this.options = context.options;
    this.lang = this.options.langInfo;
    context.memo('help.linkDialog.show', this.options.langInfo.help['linkDialog.show']);
  }

  LinkDialog_createClass(LinkDialog, [{
    key: "initialize",
    value: function initialize() {
      var $container = this.options.dialogsInBody ? this.$body : this.options.container;
      var body = ['<div class="form-group note-form-group">', "<label for=\"note-dialog-link-txt-".concat(this.options.id, "\" class=\"note-form-label\">").concat(this.lang.link.textToDisplay, "</label>"), "<input id=\"note-dialog-link-txt-".concat(this.options.id, "\" class=\"note-link-text form-control note-form-control note-input\" type=\"text\"/>"), '</div>', '<div class="form-group note-form-group">', "<label for=\"note-dialog-link-url-".concat(this.options.id, "\" class=\"note-form-label\">").concat(this.lang.link.url, "</label>"), "<input id=\"note-dialog-link-url-".concat(this.options.id, "\" class=\"note-link-url form-control note-form-control note-input\" type=\"text\" value=\"http://\"/>"), '</div>', !this.options.disableLinkTarget ? external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<div/>').append(this.ui.checkbox({
        className: 'sn-checkbox-open-in-new-window',
        text: this.lang.link.openInNewWindow,
        checked: true
      }).render()).html() : '', external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<div/>').append(this.ui.checkbox({
        className: 'sn-checkbox-use-protocol',
        text: this.lang.link.useProtocol,
        checked: true
      }).render()).html()].join('');
      var buttonClass = 'btn btn-primary note-btn note-btn-primary note-link-btn';
      var footer = "<input type=\"button\" href=\"#\" class=\"".concat(buttonClass, "\" value=\"").concat(this.lang.link.insert, "\" disabled>");
      this.$dialog = this.ui.dialog({
        className: 'link-dialog',
        title: this.lang.link.insert,
        fade: this.options.dialogsFade,
        body: body,
        footer: footer
      }).render().appendTo($container);
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.ui.hideDialog(this.$dialog);
      this.$dialog.remove();
    }
  }, {
    key: "bindEnterKey",
    value: function bindEnterKey($input, $btn) {
      $input.on('keypress', function (event) {
        if (event.keyCode === core_key.code.ENTER) {
          event.preventDefault();
          $btn.trigger('click');
        }
      });
    }
    /**
     * toggle update button
     */

  }, {
    key: "toggleLinkBtn",
    value: function toggleLinkBtn($linkBtn, $linkText, $linkUrl) {
      this.ui.toggleBtn($linkBtn, $linkText.val() && $linkUrl.val());
    }
    /**
     * Show link dialog and set event handlers on dialog controls.
     *
     * @param {Object} linkInfo
     * @return {Promise}
     */

  }, {
    key: "showLinkDialog",
    value: function showLinkDialog(linkInfo) {
      var _this = this;

      return external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.Deferred(function (deferred) {
        var $linkText = _this.$dialog.find('.note-link-text');

        var $linkUrl = _this.$dialog.find('.note-link-url');

        var $linkBtn = _this.$dialog.find('.note-link-btn');

        var $openInNewWindow = _this.$dialog.find('.sn-checkbox-open-in-new-window input[type=checkbox]');

        var $useProtocol = _this.$dialog.find('.sn-checkbox-use-protocol input[type=checkbox]');

        _this.ui.onDialogShown(_this.$dialog, function () {
          _this.context.triggerEvent('dialog.shown'); // If no url was given and given text is valid URL then copy that into URL Field


          if (!linkInfo.url && func.isValidUrl(linkInfo.text)) {
            linkInfo.url = linkInfo.text;
          }

          $linkText.on('input paste propertychange', function () {
            // If linktext was modified by input events,
            // cloning text from linkUrl will be stopped.
            linkInfo.text = $linkText.val();

            _this.toggleLinkBtn($linkBtn, $linkText, $linkUrl);
          }).val(linkInfo.text);
          $linkUrl.on('input paste propertychange', function () {
            // Display same text on `Text to display` as default
            // when linktext has no text
            if (!linkInfo.text) {
              $linkText.val($linkUrl.val());
            }

            _this.toggleLinkBtn($linkBtn, $linkText, $linkUrl);
          }).val(linkInfo.url);

          if (!env.isSupportTouch) {
            $linkUrl.trigger('focus');
          }

          _this.toggleLinkBtn($linkBtn, $linkText, $linkUrl);

          _this.bindEnterKey($linkUrl, $linkBtn);

          _this.bindEnterKey($linkText, $linkBtn);

          var isNewWindowChecked = linkInfo.isNewWindow !== undefined ? linkInfo.isNewWindow : _this.context.options.linkTargetBlank;
          $openInNewWindow.prop('checked', isNewWindowChecked);
          var useProtocolChecked = linkInfo.url ? false : _this.context.options.useProtocol;
          $useProtocol.prop('checked', useProtocolChecked);
          $linkBtn.one('click', function (event) {
            event.preventDefault();
            deferred.resolve({
              range: linkInfo.range,
              url: $linkUrl.val(),
              text: $linkText.val(),
              isNewWindow: $openInNewWindow.is(':checked'),
              checkProtocol: $useProtocol.is(':checked')
            });

            _this.ui.hideDialog(_this.$dialog);
          });
        });

        _this.ui.onDialogHidden(_this.$dialog, function () {
          // detach events
          $linkText.off();
          $linkUrl.off();
          $linkBtn.off();

          if (deferred.state() === 'pending') {
            deferred.reject();
          }
        });

        _this.ui.showDialog(_this.$dialog);
      }).promise();
    }
    /**
     * @param {Object} layoutInfo
     */

  }, {
    key: "show",
    value: function show() {
      var _this2 = this;

      var linkInfo = this.context.invoke('editor.getLinkInfo');
      this.context.invoke('editor.saveRange');
      this.showLinkDialog(linkInfo).then(function (linkInfo) {
        _this2.context.invoke('editor.restoreRange');

        _this2.context.invoke('editor.createLink', linkInfo);
      }).fail(function () {
        _this2.context.invoke('editor.restoreRange');
      });
    }
  }]);

  return LinkDialog;
}();


// CONCATENATED MODULE: ./src/js/base/module/LinkPopover.js
function LinkPopover_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function LinkPopover_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function LinkPopover_createClass(Constructor, protoProps, staticProps) { if (protoProps) LinkPopover_defineProperties(Constructor.prototype, protoProps); if (staticProps) LinkPopover_defineProperties(Constructor, staticProps); return Constructor; }





var LinkPopover_LinkPopover = /*#__PURE__*/function () {
  function LinkPopover(context) {
    var _this = this;

    LinkPopover_classCallCheck(this, LinkPopover);

    this.context = context;
    this.ui = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.ui;
    this.options = context.options;
    this.events = {
      'summernote.keyup summernote.mouseup summernote.change summernote.scroll': function summernoteKeyupSummernoteMouseupSummernoteChangeSummernoteScroll() {
        _this.update();
      },
      'summernote.disable summernote.dialog.shown summernote.blur': function summernoteDisableSummernoteDialogShownSummernoteBlur() {
        _this.hide();
      }
    };
  }

  LinkPopover_createClass(LinkPopover, [{
    key: "shouldInitialize",
    value: function shouldInitialize() {
      return !lists.isEmpty(this.options.popover.link);
    }
  }, {
    key: "initialize",
    value: function initialize() {
      this.$popover = this.ui.popover({
        className: 'note-link-popover',
        callback: function callback($node) {
          var $content = $node.find('.popover-content,.note-popover-content');
          $content.prepend('<span><a target="_blank"></a>&nbsp;</span>');
        }
      }).render().appendTo(this.options.container);
      var $content = this.$popover.find('.popover-content,.note-popover-content');
      this.context.invoke('buttons.build', $content, this.options.popover.link);
      this.$popover.on('mousedown', function (e) {
        e.preventDefault();
      });
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.$popover.remove();
    }
  }, {
    key: "update",
    value: function update() {
      // Prevent focusing on editable when invoke('code') is executed
      if (!this.context.invoke('editor.hasFocus')) {
        this.hide();
        return;
      }

      var rng = this.context.invoke('editor.getLastRange');

      if (rng.isCollapsed() && rng.isOnAnchor()) {
        var anchor = dom.ancestor(rng.sc, dom.isAnchor);
        var href = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(anchor).attr('href');
        this.$popover.find('a').attr('href', href).text(href);
        var pos = dom.posFromPlaceholder(anchor);
        var containerOffset = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this.options.container).offset();
        pos.top -= containerOffset.top;
        pos.left -= containerOffset.left;
        this.$popover.css({
          display: 'block',
          left: pos.left,
          top: pos.top
        });
      } else {
        this.hide();
      }
    }
  }, {
    key: "hide",
    value: function hide() {
      this.$popover.hide();
    }
  }]);

  return LinkPopover;
}();


// CONCATENATED MODULE: ./src/js/base/module/ImageDialog.js
function ImageDialog_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function ImageDialog_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function ImageDialog_createClass(Constructor, protoProps, staticProps) { if (protoProps) ImageDialog_defineProperties(Constructor.prototype, protoProps); if (staticProps) ImageDialog_defineProperties(Constructor, staticProps); return Constructor; }





var ImageDialog_ImageDialog = /*#__PURE__*/function () {
  function ImageDialog(context) {
    ImageDialog_classCallCheck(this, ImageDialog);

    this.context = context;
    this.ui = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.ui;
    this.$body = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(document.body);
    this.$editor = context.layoutInfo.editor;
    this.options = context.options;
    this.lang = this.options.langInfo;
  }

  ImageDialog_createClass(ImageDialog, [{
    key: "initialize",
    value: function initialize() {
      var imageLimitation = '';

      if (this.options.maximumImageFileSize) {
        var unit = Math.floor(Math.log(this.options.maximumImageFileSize) / Math.log(1024));
        var readableSize = (this.options.maximumImageFileSize / Math.pow(1024, unit)).toFixed(2) * 1 + ' ' + ' KMGTP'[unit] + 'B';
        imageLimitation = "<small>".concat(this.lang.image.maximumFileSize + ' : ' + readableSize, "</small>");
      }

      var $container = this.options.dialogsInBody ? this.$body : this.options.container;
      var body = ['<div class="form-group note-form-group note-group-select-from-files">', '<label for="note-dialog-image-file-' + this.options.id + '" class="note-form-label">' + this.lang.image.selectFromFiles + '</label>', '<input id="note-dialog-image-file-' + this.options.id + '" class="note-image-input form-control-file note-form-control note-input" ', ' type="file" name="files" accept="image/*" multiple="multiple"/>', imageLimitation, '</div>', '<div class="form-group note-group-image-url">', '<label for="note-dialog-image-url-' + this.options.id + '" class="note-form-label">' + this.lang.image.url + '</label>', '<input id="note-dialog-image-url-' + this.options.id + '" class="note-image-url form-control note-form-control note-input" type="text"/>', '</div>'].join('');
      var buttonClass = 'btn btn-primary note-btn note-btn-primary note-image-btn';
      var footer = "<input type=\"button\" href=\"#\" class=\"".concat(buttonClass, "\" value=\"").concat(this.lang.image.insert, "\" disabled>");
      this.$dialog = this.ui.dialog({
        title: this.lang.image.insert,
        fade: this.options.dialogsFade,
        body: body,
        footer: footer
      }).render().appendTo($container);
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.ui.hideDialog(this.$dialog);
      this.$dialog.remove();
    }
  }, {
    key: "bindEnterKey",
    value: function bindEnterKey($input, $btn) {
      $input.on('keypress', function (event) {
        if (event.keyCode === core_key.code.ENTER) {
          event.preventDefault();
          $btn.trigger('click');
        }
      });
    }
  }, {
    key: "show",
    value: function show() {
      var _this = this;

      this.context.invoke('editor.saveRange');
      this.showImageDialog().then(function (data) {
        // [workaround] hide dialog before restore range for IE range focus
        _this.ui.hideDialog(_this.$dialog);

        _this.context.invoke('editor.restoreRange');

        if (typeof data === 'string') {
          // image url
          // If onImageLinkInsert set,
          if (_this.options.callbacks.onImageLinkInsert) {
            _this.context.triggerEvent('image.link.insert', data);
          } else {
            _this.context.invoke('editor.insertImage', data);
          }
        } else {
          // array of files
          _this.context.invoke('editor.insertImagesOrCallback', data);
        }
      }).fail(function () {
        _this.context.invoke('editor.restoreRange');
      });
    }
    /**
     * show image dialog
     *
     * @param {jQuery} $dialog
     * @return {Promise}
     */

  }, {
    key: "showImageDialog",
    value: function showImageDialog() {
      var _this2 = this;

      return external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.Deferred(function (deferred) {
        var $imageInput = _this2.$dialog.find('.note-image-input');

        var $imageUrl = _this2.$dialog.find('.note-image-url');

        var $imageBtn = _this2.$dialog.find('.note-image-btn');

        _this2.ui.onDialogShown(_this2.$dialog, function () {
          _this2.context.triggerEvent('dialog.shown'); // Cloning imageInput to clear element.


          $imageInput.replaceWith($imageInput.clone().on('change', function (event) {
            deferred.resolve(event.target.files || event.target.value);
          }).val(''));
          $imageUrl.on('input paste propertychange', function () {
            _this2.ui.toggleBtn($imageBtn, $imageUrl.val());
          }).val('');

          if (!env.isSupportTouch) {
            $imageUrl.trigger('focus');
          }

          $imageBtn.click(function (event) {
            event.preventDefault();
            deferred.resolve($imageUrl.val());
          });

          _this2.bindEnterKey($imageUrl, $imageBtn);
        });

        _this2.ui.onDialogHidden(_this2.$dialog, function () {
          $imageInput.off();
          $imageUrl.off();
          $imageBtn.off();

          if (deferred.state() === 'pending') {
            deferred.reject();
          }
        });

        _this2.ui.showDialog(_this2.$dialog);
      });
    }
  }]);

  return ImageDialog;
}();


// CONCATENATED MODULE: ./src/js/base/module/ImagePopover.js
function ImagePopover_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function ImagePopover_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function ImagePopover_createClass(Constructor, protoProps, staticProps) { if (protoProps) ImagePopover_defineProperties(Constructor.prototype, protoProps); if (staticProps) ImagePopover_defineProperties(Constructor, staticProps); return Constructor; }




/**
 * Image popover module
 *  mouse events that show/hide popover will be handled by Handle.js.
 *  Handle.js will receive the events and invoke 'imagePopover.update'.
 */

var ImagePopover_ImagePopover = /*#__PURE__*/function () {
  function ImagePopover(context) {
    var _this = this;

    ImagePopover_classCallCheck(this, ImagePopover);

    this.context = context;
    this.ui = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.ui;
    this.editable = context.layoutInfo.editable[0];
    this.options = context.options;
    this.events = {
      'summernote.disable summernote.blur': function summernoteDisableSummernoteBlur() {
        _this.hide();
      }
    };
  }

  ImagePopover_createClass(ImagePopover, [{
    key: "shouldInitialize",
    value: function shouldInitialize() {
      return !lists.isEmpty(this.options.popover.image);
    }
  }, {
    key: "initialize",
    value: function initialize() {
      this.$popover = this.ui.popover({
        className: 'note-image-popover'
      }).render().appendTo(this.options.container);
      var $content = this.$popover.find('.popover-content,.note-popover-content');
      this.context.invoke('buttons.build', $content, this.options.popover.image);
      this.$popover.on('mousedown', function (e) {
        e.preventDefault();
      });
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.$popover.remove();
    }
  }, {
    key: "update",
    value: function update(target, event) {
      if (dom.isImg(target)) {
        var position = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(target).offset();
        var containerOffset = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this.options.container).offset();
        var pos = {};

        if (this.options.popatmouse) {
          pos.left = event.pageX - 20;
          pos.top = event.pageY;
        } else {
          pos = position;
        }

        pos.top -= containerOffset.top;
        pos.left -= containerOffset.left;
        this.$popover.css({
          display: 'block',
          left: pos.left,
          top: pos.top
        });
      } else {
        this.hide();
      }
    }
  }, {
    key: "hide",
    value: function hide() {
      this.$popover.hide();
    }
  }]);

  return ImagePopover;
}();


// CONCATENATED MODULE: ./src/js/base/module/TablePopover.js
function TablePopover_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function TablePopover_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function TablePopover_createClass(Constructor, protoProps, staticProps) { if (protoProps) TablePopover_defineProperties(Constructor.prototype, protoProps); if (staticProps) TablePopover_defineProperties(Constructor, staticProps); return Constructor; }






var TablePopover_TablePopover = /*#__PURE__*/function () {
  function TablePopover(context) {
    var _this = this;

    TablePopover_classCallCheck(this, TablePopover);

    this.context = context;
    this.ui = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.ui;
    this.options = context.options;
    this.events = {
      'summernote.mousedown': function summernoteMousedown(we, e) {
        _this.update(e.target);
      },
      'summernote.keyup summernote.scroll summernote.change': function summernoteKeyupSummernoteScrollSummernoteChange() {
        _this.update();
      },
      'summernote.disable summernote.blur': function summernoteDisableSummernoteBlur() {
        _this.hide();
      }
    };
  }

  TablePopover_createClass(TablePopover, [{
    key: "shouldInitialize",
    value: function shouldInitialize() {
      return !lists.isEmpty(this.options.popover.table);
    }
  }, {
    key: "initialize",
    value: function initialize() {
      this.$popover = this.ui.popover({
        className: 'note-table-popover'
      }).render().appendTo(this.options.container);
      var $content = this.$popover.find('.popover-content,.note-popover-content');
      this.context.invoke('buttons.build', $content, this.options.popover.table); // [workaround] Disable Firefox's default table editor

      if (env.isFF) {
        document.execCommand('enableInlineTableEditing', false, false);
      }

      this.$popover.on('mousedown', function (e) {
        e.preventDefault();
      });
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.$popover.remove();
    }
  }, {
    key: "update",
    value: function update(target) {
      if (this.context.isDisabled()) {
        return false;
      }

      var isCell = dom.isCell(target);

      if (isCell) {
        var pos = dom.posFromPlaceholder(target);
        var containerOffset = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this.options.container).offset();
        pos.top -= containerOffset.top;
        pos.left -= containerOffset.left;
        this.$popover.css({
          display: 'block',
          left: pos.left,
          top: pos.top
        });
      } else {
        this.hide();
      }

      return isCell;
    }
  }, {
    key: "hide",
    value: function hide() {
      this.$popover.hide();
    }
  }]);

  return TablePopover;
}();


// CONCATENATED MODULE: ./src/js/base/module/VideoDialog.js
function VideoDialog_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function VideoDialog_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function VideoDialog_createClass(Constructor, protoProps, staticProps) { if (protoProps) VideoDialog_defineProperties(Constructor.prototype, protoProps); if (staticProps) VideoDialog_defineProperties(Constructor, staticProps); return Constructor; }





var VideoDialog_VideoDialog = /*#__PURE__*/function () {
  function VideoDialog(context) {
    VideoDialog_classCallCheck(this, VideoDialog);

    this.context = context;
    this.ui = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.ui;
    this.$body = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(document.body);
    this.$editor = context.layoutInfo.editor;
    this.options = context.options;
    this.lang = this.options.langInfo;
  }

  VideoDialog_createClass(VideoDialog, [{
    key: "initialize",
    value: function initialize() {
      var $container = this.options.dialogsInBody ? this.$body : this.options.container;
      var body = ['<div class="form-group note-form-group row-fluid">', "<label for=\"note-dialog-video-url-".concat(this.options.id, "\" class=\"note-form-label\">").concat(this.lang.video.url, " <small class=\"text-muted\">").concat(this.lang.video.providers, "</small></label>"), "<input id=\"note-dialog-video-url-".concat(this.options.id, "\" class=\"note-video-url form-control note-form-control note-input\" type=\"text\"/>"), '</div>'].join('');
      var buttonClass = 'btn btn-primary note-btn note-btn-primary note-video-btn';
      var footer = "<input type=\"button\" href=\"#\" class=\"".concat(buttonClass, "\" value=\"").concat(this.lang.video.insert, "\" disabled>");
      this.$dialog = this.ui.dialog({
        title: this.lang.video.insert,
        fade: this.options.dialogsFade,
        body: body,
        footer: footer
      }).render().appendTo($container);
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.ui.hideDialog(this.$dialog);
      this.$dialog.remove();
    }
  }, {
    key: "bindEnterKey",
    value: function bindEnterKey($input, $btn) {
      $input.on('keypress', function (event) {
        if (event.keyCode === core_key.code.ENTER) {
          event.preventDefault();
          $btn.trigger('click');
        }
      });
    }
  }, {
    key: "createVideoNode",
    value: function createVideoNode(url) {
      // video url patterns(youtube, instagram, vimeo, dailymotion, youku, mp4, ogg, webm)
      var ytRegExp = /\/\/(?:(?:www|m)\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))([\w|-]{11})(?:(?:[\?&]t=)(\S+))?$/;
      var ytRegExpForStart = /^(?:(\d+)h)?(?:(\d+)m)?(?:(\d+)s)?$/;
      var ytMatch = url.match(ytRegExp);
      var igRegExp = /(?:www\.|\/\/)instagram\.com\/p\/(.[a-zA-Z0-9_-]*)/;
      var igMatch = url.match(igRegExp);
      var vRegExp = /\/\/vine\.co\/v\/([a-zA-Z0-9]+)/;
      var vMatch = url.match(vRegExp);
      var vimRegExp = /\/\/(player\.)?vimeo\.com\/([a-z]*\/)*(\d+)[?]?.*/;
      var vimMatch = url.match(vimRegExp);
      var dmRegExp = /.+dailymotion.com\/(video|hub)\/([^_]+)[^#]*(#video=([^_&]+))?/;
      var dmMatch = url.match(dmRegExp);
      var youkuRegExp = /\/\/v\.youku\.com\/v_show\/id_(\w+)=*\.html/;
      var youkuMatch = url.match(youkuRegExp);
      var qqRegExp = /\/\/v\.qq\.com.*?vid=(.+)/;
      var qqMatch = url.match(qqRegExp);
      var qqRegExp2 = /\/\/v\.qq\.com\/x?\/?(page|cover).*?\/([^\/]+)\.html\??.*/;
      var qqMatch2 = url.match(qqRegExp2);
      var mp4RegExp = /^.+.(mp4|m4v)$/;
      var mp4Match = url.match(mp4RegExp);
      var oggRegExp = /^.+.(ogg|ogv)$/;
      var oggMatch = url.match(oggRegExp);
      var webmRegExp = /^.+.(webm)$/;
      var webmMatch = url.match(webmRegExp);
      var fbRegExp = /(?:www\.|\/\/)facebook\.com\/([^\/]+)\/videos\/([0-9]+)/;
      var fbMatch = url.match(fbRegExp);
      var $video;

      if (ytMatch && ytMatch[1].length === 11) {
        var youtubeId = ytMatch[1];
        var start = 0;

        if (typeof ytMatch[2] !== 'undefined') {
          var ytMatchForStart = ytMatch[2].match(ytRegExpForStart);

          if (ytMatchForStart) {
            for (var n = [3600, 60, 1], i = 0, r = n.length; i < r; i++) {
              start += typeof ytMatchForStart[i + 1] !== 'undefined' ? n[i] * parseInt(ytMatchForStart[i + 1], 10) : 0;
            }
          }
        }

        $video = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<iframe>').attr('frameborder', 0).attr('src', '//www.youtube.com/embed/' + youtubeId + (start > 0 ? '?start=' + start : '')).attr('width', '640').attr('height', '360');
      } else if (igMatch && igMatch[0].length) {
        $video = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<iframe>').attr('frameborder', 0).attr('src', 'https://instagram.com/p/' + igMatch[1] + '/embed/').attr('width', '612').attr('height', '710').attr('scrolling', 'no').attr('allowtransparency', 'true');
      } else if (vMatch && vMatch[0].length) {
        $video = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<iframe>').attr('frameborder', 0).attr('src', vMatch[0] + '/embed/simple').attr('width', '600').attr('height', '600').attr('class', 'vine-embed');
      } else if (vimMatch && vimMatch[3].length) {
        $video = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<iframe webkitallowfullscreen mozallowfullscreen allowfullscreen>').attr('frameborder', 0).attr('src', '//player.vimeo.com/video/' + vimMatch[3]).attr('width', '640').attr('height', '360');
      } else if (dmMatch && dmMatch[2].length) {
        $video = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<iframe>').attr('frameborder', 0).attr('src', '//www.dailymotion.com/embed/video/' + dmMatch[2]).attr('width', '640').attr('height', '360');
      } else if (youkuMatch && youkuMatch[1].length) {
        $video = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<iframe webkitallowfullscreen mozallowfullscreen allowfullscreen>').attr('frameborder', 0).attr('height', '498').attr('width', '510').attr('src', '//player.youku.com/embed/' + youkuMatch[1]);
      } else if (qqMatch && qqMatch[1].length || qqMatch2 && qqMatch2[2].length) {
        var vid = qqMatch && qqMatch[1].length ? qqMatch[1] : qqMatch2[2];
        $video = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<iframe webkitallowfullscreen mozallowfullscreen allowfullscreen>').attr('frameborder', 0).attr('height', '310').attr('width', '500').attr('src', 'https://v.qq.com/txp/iframe/player.html?vid=' + vid + '&amp;auto=0');
      } else if (mp4Match || oggMatch || webmMatch) {
        $video = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<video controls>').attr('src', url).attr('width', '640').attr('height', '360');
      } else if (fbMatch && fbMatch[0].length) {
        $video = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<iframe>').attr('frameborder', 0).attr('src', 'https://www.facebook.com/plugins/video.php?href=' + encodeURIComponent(fbMatch[0]) + '&show_text=0&width=560').attr('width', '560').attr('height', '301').attr('scrolling', 'no').attr('allowtransparency', 'true');
      } else {
        // this is not a known video link. Now what, Cat? Now what?
        return false;
      }

      $video.addClass('note-video-clip');
      return $video[0];
    }
  }, {
    key: "show",
    value: function show() {
      var _this = this;

      var text = this.context.invoke('editor.getSelectedText');
      this.context.invoke('editor.saveRange');
      this.showVideoDialog(text).then(function (url) {
        // [workaround] hide dialog before restore range for IE range focus
        _this.ui.hideDialog(_this.$dialog);

        _this.context.invoke('editor.restoreRange'); // build node


        var $node = _this.createVideoNode(url);

        if ($node) {
          // insert video node
          _this.context.invoke('editor.insertNode', $node);
        }
      }).fail(function () {
        _this.context.invoke('editor.restoreRange');
      });
    }
    /**
     * show video dialog
     *
     * @param {jQuery} $dialog
     * @return {Promise}
     */

  }, {
    key: "showVideoDialog",
    value: function showVideoDialog()
    /* text */
    {
      var _this2 = this;

      return external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.Deferred(function (deferred) {
        var $videoUrl = _this2.$dialog.find('.note-video-url');

        var $videoBtn = _this2.$dialog.find('.note-video-btn');

        _this2.ui.onDialogShown(_this2.$dialog, function () {
          _this2.context.triggerEvent('dialog.shown');

          $videoUrl.on('input paste propertychange', function () {
            _this2.ui.toggleBtn($videoBtn, $videoUrl.val());
          });

          if (!env.isSupportTouch) {
            $videoUrl.trigger('focus');
          }

          $videoBtn.click(function (event) {
            event.preventDefault();
            deferred.resolve($videoUrl.val());
          });

          _this2.bindEnterKey($videoUrl, $videoBtn);
        });

        _this2.ui.onDialogHidden(_this2.$dialog, function () {
          $videoUrl.off();
          $videoBtn.off();

          if (deferred.state() === 'pending') {
            deferred.reject();
          }
        });

        _this2.ui.showDialog(_this2.$dialog);
      });
    }
  }]);

  return VideoDialog;
}();


// CONCATENATED MODULE: ./src/js/base/module/HelpDialog.js
function HelpDialog_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function HelpDialog_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function HelpDialog_createClass(Constructor, protoProps, staticProps) { if (protoProps) HelpDialog_defineProperties(Constructor.prototype, protoProps); if (staticProps) HelpDialog_defineProperties(Constructor, staticProps); return Constructor; }




var HelpDialog_HelpDialog = /*#__PURE__*/function () {
  function HelpDialog(context) {
    HelpDialog_classCallCheck(this, HelpDialog);

    this.context = context;
    this.ui = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.ui;
    this.$body = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(document.body);
    this.$editor = context.layoutInfo.editor;
    this.options = context.options;
    this.lang = this.options.langInfo;
  }

  HelpDialog_createClass(HelpDialog, [{
    key: "initialize",
    value: function initialize() {
      var $container = this.options.dialogsInBody ? this.$body : this.options.container;
      var body = ['<p class="text-center">', '<a href="http://summernote.org/" target="_blank">Summernote 0.8.18</a> · ', '<a href="https://github.com/summernote/summernote" target="_blank">Project</a> · ', '<a href="https://github.com/summernote/summernote/issues" target="_blank">Issues</a>', '</p>'].join('');
      this.$dialog = this.ui.dialog({
        title: this.lang.options.help,
        fade: this.options.dialogsFade,
        body: this.createShortcutList(),
        footer: body,
        callback: function callback($node) {
          $node.find('.modal-body,.note-modal-body').css({
            'max-height': 300,
            'overflow': 'scroll'
          });
        }
      }).render().appendTo($container);
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.ui.hideDialog(this.$dialog);
      this.$dialog.remove();
    }
  }, {
    key: "createShortcutList",
    value: function createShortcutList() {
      var _this = this;

      var keyMap = this.options.keyMap[env.isMac ? 'mac' : 'pc'];
      return Object.keys(keyMap).map(function (key) {
        var command = keyMap[key];
        var $row = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<div><div class="help-list-item"></div></div>');
        $row.append(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<label><kbd>' + key + '</kdb></label>').css({
          'width': 180,
          'margin-right': 10
        })).append(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<span/>').html(_this.context.memo('help.' + command) || command));
        return $row.html();
      }).join('');
    }
    /**
     * show help dialog
     *
     * @return {Promise}
     */

  }, {
    key: "showHelpDialog",
    value: function showHelpDialog() {
      var _this2 = this;

      return external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.Deferred(function (deferred) {
        _this2.ui.onDialogShown(_this2.$dialog, function () {
          _this2.context.triggerEvent('dialog.shown');

          deferred.resolve();
        });

        _this2.ui.showDialog(_this2.$dialog);
      }).promise();
    }
  }, {
    key: "show",
    value: function show() {
      var _this3 = this;

      this.context.invoke('editor.saveRange');
      this.showHelpDialog().then(function () {
        _this3.context.invoke('editor.restoreRange');
      });
    }
  }]);

  return HelpDialog;
}();


// CONCATENATED MODULE: ./src/js/base/module/AirPopover.js
function AirPopover_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function AirPopover_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function AirPopover_createClass(Constructor, protoProps, staticProps) { if (protoProps) AirPopover_defineProperties(Constructor.prototype, protoProps); if (staticProps) AirPopover_defineProperties(Constructor, staticProps); return Constructor; }



var AIRMODE_POPOVER_X_OFFSET = -5;
var AIRMODE_POPOVER_Y_OFFSET = 5;

var AirPopover_AirPopover = /*#__PURE__*/function () {
  function AirPopover(context) {
    var _this = this;

    AirPopover_classCallCheck(this, AirPopover);

    this.context = context;
    this.ui = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.ui;
    this.options = context.options;
    this.hidable = true;
    this.onContextmenu = false;
    this.pageX = null;
    this.pageY = null;
    this.events = {
      'summernote.contextmenu': function summernoteContextmenu(e) {
        if (_this.options.editing) {
          e.preventDefault();
          e.stopPropagation();
          _this.onContextmenu = true;

          _this.update(true);
        }
      },
      'summernote.mousedown': function summernoteMousedown(we, e) {
        _this.pageX = e.pageX;
        _this.pageY = e.pageY;
      },
      'summernote.keyup summernote.mouseup summernote.scroll': function summernoteKeyupSummernoteMouseupSummernoteScroll(we, e) {
        if (_this.options.editing && !_this.onContextmenu) {
          _this.pageX = e.pageX;
          _this.pageY = e.pageY;

          _this.update();
        }

        _this.onContextmenu = false;
      },
      'summernote.disable summernote.change summernote.dialog.shown summernote.blur': function summernoteDisableSummernoteChangeSummernoteDialogShownSummernoteBlur() {
        _this.hide();
      },
      'summernote.focusout': function summernoteFocusout() {
        if (!_this.$popover.is(':active,:focus')) {
          _this.hide();
        }
      }
    };
  }

  AirPopover_createClass(AirPopover, [{
    key: "shouldInitialize",
    value: function shouldInitialize() {
      return this.options.airMode && !lists.isEmpty(this.options.popover.air);
    }
  }, {
    key: "initialize",
    value: function initialize() {
      var _this2 = this;

      this.$popover = this.ui.popover({
        className: 'note-air-popover'
      }).render().appendTo(this.options.container);
      var $content = this.$popover.find('.popover-content');
      this.context.invoke('buttons.build', $content, this.options.popover.air); // disable hiding this popover preemptively by 'summernote.blur' event.

      this.$popover.on('mousedown', function () {
        _this2.hidable = false;
      }); // (re-)enable hiding after 'summernote.blur' has been handled (aka. ignored).

      this.$popover.on('mouseup', function () {
        _this2.hidable = true;
      });
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.$popover.remove();
    }
  }, {
    key: "update",
    value: function update(forcelyOpen) {
      var styleInfo = this.context.invoke('editor.currentStyle');

      if (styleInfo.range && (!styleInfo.range.isCollapsed() || forcelyOpen)) {
        var rect = {
          left: this.pageX,
          top: this.pageY
        };
        var containerOffset = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this.options.container).offset();
        rect.top -= containerOffset.top;
        rect.left -= containerOffset.left;
        this.$popover.css({
          display: 'block',
          left: Math.max(rect.left, 0) + AIRMODE_POPOVER_X_OFFSET,
          top: rect.top + AIRMODE_POPOVER_Y_OFFSET
        });
        this.context.invoke('buttons.updateCurrentStyle', this.$popover);
      } else {
        this.hide();
      }
    }
  }, {
    key: "updateCodeview",
    value: function updateCodeview(isCodeview) {
      this.ui.toggleBtnActive(this.$popover.find('.btn-codeview'), isCodeview);

      if (isCodeview) {
        this.hide();
      }
    }
  }, {
    key: "hide",
    value: function hide() {
      if (this.hidable) {
        this.$popover.hide();
      }
    }
  }]);

  return AirPopover;
}();


// CONCATENATED MODULE: ./src/js/base/module/HintPopover.js
function HintPopover_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function HintPopover_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function HintPopover_createClass(Constructor, protoProps, staticProps) { if (protoProps) HintPopover_defineProperties(Constructor.prototype, protoProps); if (staticProps) HintPopover_defineProperties(Constructor, staticProps); return Constructor; }







var POPOVER_DIST = 5;

var HintPopover_HintPopover = /*#__PURE__*/function () {
  function HintPopover(context) {
    var _this = this;

    HintPopover_classCallCheck(this, HintPopover);

    this.context = context;
    this.ui = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.ui;
    this.$editable = context.layoutInfo.editable;
    this.options = context.options;
    this.hint = this.options.hint || [];
    this.direction = this.options.hintDirection || 'bottom';
    this.hints = Array.isArray(this.hint) ? this.hint : [this.hint];
    this.events = {
      'summernote.keyup': function summernoteKeyup(we, e) {
        if (!e.isDefaultPrevented()) {
          _this.handleKeyup(e);
        }
      },
      'summernote.keydown': function summernoteKeydown(we, e) {
        _this.handleKeydown(e);
      },
      'summernote.disable summernote.dialog.shown summernote.blur': function summernoteDisableSummernoteDialogShownSummernoteBlur() {
        _this.hide();
      }
    };
  }

  HintPopover_createClass(HintPopover, [{
    key: "shouldInitialize",
    value: function shouldInitialize() {
      return this.hints.length > 0;
    }
  }, {
    key: "initialize",
    value: function initialize() {
      var _this2 = this;

      this.lastWordRange = null;
      this.matchingWord = null;
      this.$popover = this.ui.popover({
        className: 'note-hint-popover',
        hideArrow: true,
        direction: ''
      }).render().appendTo(this.options.container);
      this.$popover.hide();
      this.$content = this.$popover.find('.popover-content,.note-popover-content');
      this.$content.on('click', '.note-hint-item', function (e) {
        _this2.$content.find('.active').removeClass('active');

        external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(e.currentTarget).addClass('active');

        _this2.replace();
      });
      this.$popover.on('mousedown', function (e) {
        e.preventDefault();
      });
    }
  }, {
    key: "destroy",
    value: function destroy() {
      this.$popover.remove();
    }
  }, {
    key: "selectItem",
    value: function selectItem($item) {
      this.$content.find('.active').removeClass('active');
      $item.addClass('active');
      this.$content[0].scrollTop = $item[0].offsetTop - this.$content.innerHeight() / 2;
    }
  }, {
    key: "moveDown",
    value: function moveDown() {
      var $current = this.$content.find('.note-hint-item.active');
      var $next = $current.next();

      if ($next.length) {
        this.selectItem($next);
      } else {
        var $nextGroup = $current.parent().next();

        if (!$nextGroup.length) {
          $nextGroup = this.$content.find('.note-hint-group').first();
        }

        this.selectItem($nextGroup.find('.note-hint-item').first());
      }
    }
  }, {
    key: "moveUp",
    value: function moveUp() {
      var $current = this.$content.find('.note-hint-item.active');
      var $prev = $current.prev();

      if ($prev.length) {
        this.selectItem($prev);
      } else {
        var $prevGroup = $current.parent().prev();

        if (!$prevGroup.length) {
          $prevGroup = this.$content.find('.note-hint-group').last();
        }

        this.selectItem($prevGroup.find('.note-hint-item').last());
      }
    }
  }, {
    key: "replace",
    value: function replace() {
      var $item = this.$content.find('.note-hint-item.active');

      if ($item.length) {
        var node = this.nodeFromItem($item); // If matchingWord length = 0 -> capture OK / open hint / but as mention capture "" (\w*)

        if (this.matchingWord !== null && this.matchingWord.length === 0) {
          this.lastWordRange.so = this.lastWordRange.eo; // Else si > 0 and normal case -> adjust range "before" for correct position of insertion
        } else if (this.matchingWord !== null && this.matchingWord.length > 0 && !this.lastWordRange.isCollapsed()) {
          var rangeCompute = this.lastWordRange.eo - this.lastWordRange.so - this.matchingWord.length;

          if (rangeCompute > 0) {
            this.lastWordRange.so += rangeCompute;
          }
        }

        this.lastWordRange.insertNode(node);

        if (this.options.hintSelect === 'next') {
          var blank = document.createTextNode('');
          external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(node).after(blank);
          range.createFromNodeBefore(blank).select();
        } else {
          range.createFromNodeAfter(node).select();
        }

        this.lastWordRange = null;
        this.hide();
        this.context.invoke('editor.focus');
      }
    }
  }, {
    key: "nodeFromItem",
    value: function nodeFromItem($item) {
      var hint = this.hints[$item.data('index')];
      var item = $item.data('item');
      var node = hint.content ? hint.content(item) : item;

      if (typeof node === 'string') {
        node = dom.createText(node);
      }

      return node;
    }
  }, {
    key: "createItemTemplates",
    value: function createItemTemplates(hintIdx, items) {
      var hint = this.hints[hintIdx];
      return items.map(function (item
      /*, idx */
      ) {
        var $item = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<div class="note-hint-item"/>');
        $item.append(hint.template ? hint.template(item) : item + '');
        $item.data({
          'index': hintIdx,
          'item': item
        });
        return $item;
      });
    }
  }, {
    key: "handleKeydown",
    value: function handleKeydown(e) {
      if (!this.$popover.is(':visible')) {
        return;
      }

      if (e.keyCode === core_key.code.ENTER) {
        e.preventDefault();
        this.replace();
      } else if (e.keyCode === core_key.code.UP) {
        e.preventDefault();
        this.moveUp();
      } else if (e.keyCode === core_key.code.DOWN) {
        e.preventDefault();
        this.moveDown();
      }
    }
  }, {
    key: "searchKeyword",
    value: function searchKeyword(index, keyword, callback) {
      var hint = this.hints[index];

      if (hint && hint.match.test(keyword) && hint.search) {
        var matches = hint.match.exec(keyword);
        this.matchingWord = matches[0];
        hint.search(matches[1], callback);
      } else {
        callback();
      }
    }
  }, {
    key: "createGroup",
    value: function createGroup(idx, keyword) {
      var _this3 = this;

      var $group = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<div class="note-hint-group note-hint-group-' + idx + '"></div>');
      this.searchKeyword(idx, keyword, function (items) {
        items = items || [];

        if (items.length) {
          $group.html(_this3.createItemTemplates(idx, items));

          _this3.show();
        }
      });
      return $group;
    }
  }, {
    key: "handleKeyup",
    value: function handleKeyup(e) {
      var _this4 = this;

      if (!lists.contains([core_key.code.ENTER, core_key.code.UP, core_key.code.DOWN], e.keyCode)) {
        var _range = this.context.invoke('editor.getLastRange');

        var wordRange, keyword;

        if (this.options.hintMode === 'words') {
          wordRange = _range.getWordsRange(_range);
          keyword = wordRange.toString();
          this.hints.forEach(function (hint) {
            if (hint.match.test(keyword)) {
              wordRange = _range.getWordsMatchRange(hint.match);
              return false;
            }
          });

          if (!wordRange) {
            this.hide();
            return;
          }

          keyword = wordRange.toString();
        } else {
          wordRange = _range.getWordRange();
          keyword = wordRange.toString();
        }

        if (this.hints.length && keyword) {
          this.$content.empty();
          var bnd = func.rect2bnd(lists.last(wordRange.getClientRects()));
          var containerOffset = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this.options.container).offset();

          if (bnd) {
            bnd.top -= containerOffset.top;
            bnd.left -= containerOffset.left;
            this.$popover.hide();
            this.lastWordRange = wordRange;
            this.hints.forEach(function (hint, idx) {
              if (hint.match.test(keyword)) {
                _this4.createGroup(idx, keyword).appendTo(_this4.$content);
              }
            }); // select first .note-hint-item

            this.$content.find('.note-hint-item:first').addClass('active'); // set position for popover after group is created

            if (this.direction === 'top') {
              this.$popover.css({
                left: bnd.left,
                top: bnd.top - this.$popover.outerHeight() - POPOVER_DIST
              });
            } else {
              this.$popover.css({
                left: bnd.left,
                top: bnd.top + bnd.height + POPOVER_DIST
              });
            }
          }
        } else {
          this.hide();
        }
      }
    }
  }, {
    key: "show",
    value: function show() {
      this.$popover.show();
    }
  }, {
    key: "hide",
    value: function hide() {
      this.$popover.hide();
    }
  }]);

  return HintPopover;
}();


// CONCATENATED MODULE: ./src/js/base/settings.js




























external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.extend(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote, {
  version: '0.8.18',
  plugins: {},
  dom: dom,
  range: range,
  lists: lists,
  options: {
    langInfo: external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote.lang['en-US'],
    editing: true,
    modules: {
      'editor': Editor_Editor,
      'clipboard': Clipboard_Clipboard,
      'dropzone': Dropzone_Dropzone,
      'codeview': Codeview_CodeView,
      'statusbar': Statusbar_Statusbar,
      'fullscreen': Fullscreen_Fullscreen,
      'handle': Handle_Handle,
      // FIXME: HintPopover must be front of autolink
      //  - Script error about range when Enter key is pressed on hint popover
      'hintPopover': HintPopover_HintPopover,
      'autoLink': AutoLink_AutoLink,
      'autoSync': AutoSync_AutoSync,
      'autoReplace': AutoReplace_AutoReplace,
      'placeholder': Placeholder_Placeholder,
      'buttons': Buttons_Buttons,
      'toolbar': Toolbar_Toolbar,
      'linkDialog': LinkDialog_LinkDialog,
      'linkPopover': LinkPopover_LinkPopover,
      'imageDialog': ImageDialog_ImageDialog,
      'imagePopover': ImagePopover_ImagePopover,
      'tablePopover': TablePopover_TablePopover,
      'videoDialog': VideoDialog_VideoDialog,
      'helpDialog': HelpDialog_HelpDialog,
      'airPopover': AirPopover_AirPopover
    },
    buttons: {},
    lang: 'en-US',
    followingToolbar: false,
    toolbarPosition: 'top',
    otherStaticBar: '',
    // toolbar
    codeviewKeepButton: false,
    toolbar: [['style', ['style']], ['font', ['bold', 'underline', 'clear']], ['fontname', ['fontname']], ['color', ['color']], ['para', ['ul', 'ol', 'paragraph']], ['table', ['table']], ['insert', ['link', 'picture', 'video']], ['view', ['fullscreen', 'codeview', 'help']]],
    // popover
    popatmouse: true,
    popover: {
      image: [['resize', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']], ['float', ['floatLeft', 'floatRight', 'floatNone']], ['remove', ['removeMedia']]],
      link: [['link', ['linkDialogShow', 'unlink']]],
      table: [['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']], ['delete', ['deleteRow', 'deleteCol', 'deleteTable']]],
      air: [['color', ['color']], ['font', ['bold', 'underline', 'clear']], ['para', ['ul', 'paragraph']], ['table', ['table']], ['insert', ['link', 'picture']], ['view', ['fullscreen', 'codeview']]]
    },
    // air mode: inline editor
    airMode: false,
    overrideContextMenu: false,
    // TBD
    width: null,
    height: null,
    linkTargetBlank: true,
    useProtocol: true,
    defaultProtocol: 'http://',
    focus: false,
    tabDisabled: false,
    tabSize: 4,
    styleWithCSS: false,
    shortcuts: true,
    textareaAutoSync: true,
    tooltip: 'auto',
    container: null,
    maxTextLength: 0,
    blockquoteBreakingLevel: 2,
    spellCheck: true,
    disableGrammar: false,
    placeholder: null,
    inheritPlaceholder: false,
    // TODO: need to be documented
    recordEveryKeystroke: false,
    historyLimit: 200,
    // TODO: need to be documented
    showDomainOnlyForAutolink: false,
    // TODO: need to be documented
    hintMode: 'word',
    hintSelect: 'after',
    hintDirection: 'bottom',
    styleTags: ['p', 'blockquote', 'pre', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6'],
    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica Neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana'],
    fontNamesIgnoreCheck: [],
    addDefaultFonts: true,
    fontSizes: ['8', '9', '10', '11', '12', '14', '18', '24', '36'],
    fontSizeUnits: ['px', 'pt'],
    // pallete colors(n x n)
    colors: [['#000000', '#424242', '#636363', '#9C9C94', '#CEC6CE', '#EFEFEF', '#F7F7F7', '#FFFFFF'], ['#FF0000', '#FF9C00', '#FFFF00', '#00FF00', '#00FFFF', '#0000FF', '#9C00FF', '#FF00FF'], ['#F7C6CE', '#FFE7CE', '#FFEFC6', '#D6EFD6', '#CEDEE7', '#CEE7F7', '#D6D6E7', '#E7D6DE'], ['#E79C9C', '#FFC69C', '#FFE79C', '#B5D6A5', '#A5C6CE', '#9CC6EF', '#B5A5D6', '#D6A5BD'], ['#E76363', '#F7AD6B', '#FFD663', '#94BD7B', '#73A5AD', '#6BADDE', '#8C7BC6', '#C67BA5'], ['#CE0000', '#E79439', '#EFC631', '#6BA54A', '#4A7B8C', '#3984C6', '#634AA5', '#A54A7B'], ['#9C0000', '#B56308', '#BD9400', '#397B21', '#104A5A', '#085294', '#311873', '#731842'], ['#630000', '#7B3900', '#846300', '#295218', '#083139', '#003163', '#21104A', '#4A1031']],
    // http://chir.ag/projects/name-that-color/
    colorsName: [['Black', 'Tundora', 'Dove Gray', 'Star Dust', 'Pale Slate', 'Gallery', 'Alabaster', 'White'], ['Red', 'Orange Peel', 'Yellow', 'Green', 'Cyan', 'Blue', 'Electric Violet', 'Magenta'], ['Azalea', 'Karry', 'Egg White', 'Zanah', 'Botticelli', 'Tropical Blue', 'Mischka', 'Twilight'], ['Tonys Pink', 'Peach Orange', 'Cream Brulee', 'Sprout', 'Casper', 'Perano', 'Cold Purple', 'Careys Pink'], ['Mandy', 'Rajah', 'Dandelion', 'Olivine', 'Gulf Stream', 'Viking', 'Blue Marguerite', 'Puce'], ['Guardsman Red', 'Fire Bush', 'Golden Dream', 'Chelsea Cucumber', 'Smalt Blue', 'Boston Blue', 'Butterfly Bush', 'Cadillac'], ['Sangria', 'Mai Tai', 'Buddha Gold', 'Forest Green', 'Eden', 'Venice Blue', 'Meteorite', 'Claret'], ['Rosewood', 'Cinnamon', 'Olive', 'Parsley', 'Tiber', 'Midnight Blue', 'Valentino', 'Loulou']],
    colorButton: {
      foreColor: '#000000',
      backColor: '#FFFF00'
    },
    lineHeights: ['1.0', '1.2', '1.4', '1.5', '1.6', '1.8', '2.0', '3.0'],
    tableClassName: 'table table-bordered',
    insertTableMaxSize: {
      col: 10,
      row: 10
    },
    // By default, dialogs are attached in container.
    dialogsInBody: false,
    dialogsFade: false,
    maximumImageFileSize: null,
    callbacks: {
      onBeforeCommand: null,
      onBlur: null,
      onBlurCodeview: null,
      onChange: null,
      onChangeCodeview: null,
      onDialogShown: null,
      onEnter: null,
      onFocus: null,
      onImageLinkInsert: null,
      onImageUpload: null,
      onImageUploadError: null,
      onInit: null,
      onKeydown: null,
      onKeyup: null,
      onMousedown: null,
      onMouseup: null,
      onPaste: null,
      onScroll: null
    },
    codemirror: {
      mode: 'text/html',
      htmlMode: true,
      lineNumbers: true
    },
    codeviewFilter: false,
    codeviewFilterRegex: /<\/*(?:applet|b(?:ase|gsound|link)|embed|frame(?:set)?|ilayer|l(?:ayer|ink)|meta|object|s(?:cript|tyle)|t(?:itle|extarea)|xml)[^>]*?>/gi,
    codeviewIframeFilter: true,
    codeviewIframeWhitelistSrc: [],
    codeviewIframeWhitelistSrcBase: ['www.youtube.com', 'www.youtube-nocookie.com', 'www.facebook.com', 'vine.co', 'instagram.com', 'player.vimeo.com', 'www.dailymotion.com', 'player.youku.com', 'v.qq.com'],
    keyMap: {
      pc: {
        'ESC': 'escape',
        'ENTER': 'insertParagraph',
        'CTRL+Z': 'undo',
        'CTRL+Y': 'redo',
        'TAB': 'tab',
        'SHIFT+TAB': 'untab',
        'CTRL+B': 'bold',
        'CTRL+I': 'italic',
        'CTRL+U': 'underline',
        'CTRL+SHIFT+S': 'strikethrough',
        'CTRL+BACKSLASH': 'removeFormat',
        'CTRL+SHIFT+L': 'justifyLeft',
        'CTRL+SHIFT+E': 'justifyCenter',
        'CTRL+SHIFT+R': 'justifyRight',
        'CTRL+SHIFT+J': 'justifyFull',
        'CTRL+SHIFT+NUM7': 'insertUnorderedList',
        'CTRL+SHIFT+NUM8': 'insertOrderedList',
        'CTRL+LEFTBRACKET': 'outdent',
        'CTRL+RIGHTBRACKET': 'indent',
        'CTRL+NUM0': 'formatPara',
        'CTRL+NUM1': 'formatH1',
        'CTRL+NUM2': 'formatH2',
        'CTRL+NUM3': 'formatH3',
        'CTRL+NUM4': 'formatH4',
        'CTRL+NUM5': 'formatH5',
        'CTRL+NUM6': 'formatH6',
        'CTRL+ENTER': 'insertHorizontalRule',
        'CTRL+K': 'linkDialog.show'
      },
      mac: {
        'ESC': 'escape',
        'ENTER': 'insertParagraph',
        'CMD+Z': 'undo',
        'CMD+SHIFT+Z': 'redo',
        'TAB': 'tab',
        'SHIFT+TAB': 'untab',
        'CMD+B': 'bold',
        'CMD+I': 'italic',
        'CMD+U': 'underline',
        'CMD+SHIFT+S': 'strikethrough',
        'CMD+BACKSLASH': 'removeFormat',
        'CMD+SHIFT+L': 'justifyLeft',
        'CMD+SHIFT+E': 'justifyCenter',
        'CMD+SHIFT+R': 'justifyRight',
        'CMD+SHIFT+J': 'justifyFull',
        'CMD+SHIFT+NUM7': 'insertUnorderedList',
        'CMD+SHIFT+NUM8': 'insertOrderedList',
        'CMD+LEFTBRACKET': 'outdent',
        'CMD+RIGHTBRACKET': 'indent',
        'CMD+NUM0': 'formatPara',
        'CMD+NUM1': 'formatH1',
        'CMD+NUM2': 'formatH2',
        'CMD+NUM3': 'formatH3',
        'CMD+NUM4': 'formatH4',
        'CMD+NUM5': 'formatH5',
        'CMD+NUM6': 'formatH6',
        'CMD+ENTER': 'insertHorizontalRule',
        'CMD+K': 'linkDialog.show'
      }
    },
    icons: {
      'align': 'note-icon-align',
      'alignCenter': 'note-icon-align-center',
      'alignJustify': 'note-icon-align-justify',
      'alignLeft': 'note-icon-align-left',
      'alignRight': 'note-icon-align-right',
      'rowBelow': 'note-icon-row-below',
      'colBefore': 'note-icon-col-before',
      'colAfter': 'note-icon-col-after',
      'rowAbove': 'note-icon-row-above',
      'rowRemove': 'note-icon-row-remove',
      'colRemove': 'note-icon-col-remove',
      'indent': 'note-icon-align-indent',
      'outdent': 'note-icon-align-outdent',
      'arrowsAlt': 'note-icon-arrows-alt',
      'bold': 'note-icon-bold',
      'caret': 'note-icon-caret',
      'circle': 'note-icon-circle',
      'close': 'note-icon-close',
      'code': 'note-icon-code',
      'eraser': 'note-icon-eraser',
      'floatLeft': 'note-icon-float-left',
      'floatRight': 'note-icon-float-right',
      'font': 'note-icon-font',
      'frame': 'note-icon-frame',
      'italic': 'note-icon-italic',
      'link': 'note-icon-link',
      'unlink': 'note-icon-chain-broken',
      'magic': 'note-icon-magic',
      'menuCheck': 'note-icon-menu-check',
      'minus': 'note-icon-minus',
      'orderedlist': 'note-icon-orderedlist',
      'pencil': 'note-icon-pencil',
      'picture': 'note-icon-picture',
      'question': 'note-icon-question',
      'redo': 'note-icon-redo',
      'rollback': 'note-icon-rollback',
      'square': 'note-icon-square',
      'strikethrough': 'note-icon-strikethrough',
      'subscript': 'note-icon-subscript',
      'superscript': 'note-icon-superscript',
      'table': 'note-icon-table',
      'textHeight': 'note-icon-text-height',
      'trash': 'note-icon-trash',
      'underline': 'note-icon-underline',
      'undo': 'note-icon-undo',
      'unorderedlist': 'note-icon-unorderedlist',
      'video': 'note-icon-video'
    }
  }
});

/***/ }),

/***/ 51:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
// ESM COMPAT FLAG
__webpack_require__.r(__webpack_exports__);

// EXTERNAL MODULE: external {"root":"jQuery","commonjs2":"jquery","commonjs":"jquery","amd":"jquery"}
var external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_ = __webpack_require__(0);
var external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default = /*#__PURE__*/__webpack_require__.n(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_);

// EXTERNAL MODULE: ./src/js/base/renderer.js
var renderer = __webpack_require__(1);

// CONCATENATED MODULE: ./src/js/lite/ui/TooltipUI.js
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }



var TooltipUI_TooltipUI = /*#__PURE__*/function () {
  function TooltipUI($node, options) {
    _classCallCheck(this, TooltipUI);

    this.$node = $node;
    this.options = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.extend({}, {
      title: '',
      target: options.container,
      trigger: 'hover focus',
      placement: 'bottom'
    }, options); // create tooltip node

    this.$tooltip = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(['<div class="note-tooltip">', '<div class="note-tooltip-arrow"></div>', '<div class="note-tooltip-content"></div>', '</div>'].join('')); // define event

    if (this.options.trigger !== 'manual') {
      var showCallback = this.show.bind(this);
      var hideCallback = this.hide.bind(this);
      var toggleCallback = this.toggle.bind(this);
      this.options.trigger.split(' ').forEach(function (eventName) {
        if (eventName === 'hover') {
          $node.off('mouseenter mouseleave');
          $node.on('mouseenter', showCallback).on('mouseleave', hideCallback);
        } else if (eventName === 'click') {
          $node.on('click', toggleCallback);
        } else if (eventName === 'focus') {
          $node.on('focus', showCallback).on('blur', hideCallback);
        }
      });
    }
  }

  _createClass(TooltipUI, [{
    key: "show",
    value: function show() {
      var $node = this.$node;
      var offset = $node.offset();
      var targetOffset = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this.options.target).offset();
      offset.top -= targetOffset.top;
      offset.left -= targetOffset.left;
      var $tooltip = this.$tooltip;
      var title = this.options.title || $node.attr('title') || $node.data('title');
      var placement = this.options.placement || $node.data('placement');
      $tooltip.addClass(placement);
      $tooltip.find('.note-tooltip-content').text(title);
      $tooltip.appendTo(this.options.target);
      var nodeWidth = $node.outerWidth();
      var nodeHeight = $node.outerHeight();
      var tooltipWidth = $tooltip.outerWidth();
      var tooltipHeight = $tooltip.outerHeight();

      if (placement === 'bottom') {
        $tooltip.css({
          top: offset.top + nodeHeight,
          left: offset.left + (nodeWidth / 2 - tooltipWidth / 2)
        });
      } else if (placement === 'top') {
        $tooltip.css({
          top: offset.top - tooltipHeight,
          left: offset.left + (nodeWidth / 2 - tooltipWidth / 2)
        });
      } else if (placement === 'left') {
        $tooltip.css({
          top: offset.top + (nodeHeight / 2 - tooltipHeight / 2),
          left: offset.left - tooltipWidth
        });
      } else if (placement === 'right') {
        $tooltip.css({
          top: offset.top + (nodeHeight / 2 - tooltipHeight / 2),
          left: offset.left + nodeWidth
        });
      }

      $tooltip.addClass('in');
    }
  }, {
    key: "hide",
    value: function hide() {
      var _this = this;

      this.$tooltip.removeClass('in');
      setTimeout(function () {
        _this.$tooltip.remove();
      }, 200);
    }
  }, {
    key: "toggle",
    value: function toggle() {
      if (this.$tooltip.hasClass('in')) {
        this.hide();
      } else {
        this.show();
      }
    }
  }]);

  return TooltipUI;
}();

/* harmony default export */ var ui_TooltipUI = (TooltipUI_TooltipUI);
// CONCATENATED MODULE: ./src/js/lite/ui/DropdownUI.js
function DropdownUI_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function DropdownUI_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function DropdownUI_createClass(Constructor, protoProps, staticProps) { if (protoProps) DropdownUI_defineProperties(Constructor.prototype, protoProps); if (staticProps) DropdownUI_defineProperties(Constructor, staticProps); return Constructor; }



var DropdownUI_DropdownUI = /*#__PURE__*/function () {
  function DropdownUI($node, options) {
    DropdownUI_classCallCheck(this, DropdownUI);

    this.$button = $node;
    this.options = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.extend({}, {
      target: options.container
    }, options);
    this.setEvent();
  }

  DropdownUI_createClass(DropdownUI, [{
    key: "setEvent",
    value: function setEvent() {
      var _this = this;

      this.$button.on('click', function (e) {
        _this.toggle();

        e.stopImmediatePropagation();
      });
    }
  }, {
    key: "clear",
    value: function clear() {
      var $parent = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('.note-btn-group.open');
      $parent.find('.note-btn.active').removeClass('active');
      $parent.removeClass('open');
    }
  }, {
    key: "show",
    value: function show() {
      this.$button.addClass('active');
      this.$button.parent().addClass('open');
      var $dropdown = this.$button.next();
      var offset = $dropdown.offset();
      var width = $dropdown.outerWidth();
      var windowWidth = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(window).width();
      var targetMarginRight = parseFloat(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this.options.target).css('margin-right'));

      if (offset.left + width > windowWidth - targetMarginRight) {
        $dropdown.css('margin-left', windowWidth - targetMarginRight - (offset.left + width));
      } else {
        $dropdown.css('margin-left', '');
      }
    }
  }, {
    key: "hide",
    value: function hide() {
      this.$button.removeClass('active');
      this.$button.parent().removeClass('open');
    }
  }, {
    key: "toggle",
    value: function toggle() {
      var isOpened = this.$button.parent().hasClass('open');
      this.clear();

      if (isOpened) {
        this.hide();
      } else {
        this.show();
      }
    }
  }]);

  return DropdownUI;
}();

external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(document).on('click', function (e) {
  if (!external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(e.target).closest('.note-btn-group').length) {
    external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('.note-btn-group.open').removeClass('open');
    external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('.note-btn-group .note-btn.active').removeClass('active');
  }
});
external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(document).on('click.note-dropdown-menu', function (e) {
  external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(e.target).closest('.note-dropdown-menu').parent().removeClass('open');
  external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(e.target).closest('.note-dropdown-menu').parent().find('.note-btn.active').removeClass('active');
});
/* harmony default export */ var ui_DropdownUI = (DropdownUI_DropdownUI);
// CONCATENATED MODULE: ./src/js/lite/ui/ModalUI.js
function ModalUI_classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function ModalUI_defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function ModalUI_createClass(Constructor, protoProps, staticProps) { if (protoProps) ModalUI_defineProperties(Constructor.prototype, protoProps); if (staticProps) ModalUI_defineProperties(Constructor, staticProps); return Constructor; }



var ModalUI_ModalUI = /*#__PURE__*/function () {
  function ModalUI($node
  /*, options */
  ) {
    ModalUI_classCallCheck(this, ModalUI);

    this.$modal = $node;
    this.$backdrop = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<div class="note-modal-backdrop"/>');
  }

  ModalUI_createClass(ModalUI, [{
    key: "show",
    value: function show() {
      var _this = this;

      this.$backdrop.appendTo(document.body).show();
      this.$modal.addClass('open').show();
      this.$modal.trigger('note.modal.show');
      this.$modal.off('click', '.close').on('click', '.close', this.hide.bind(this));
      this.$modal.on('keydown', function (event) {
        if (event.which === 27) {
          event.preventDefault();

          _this.hide();
        }
      });
    }
  }, {
    key: "hide",
    value: function hide() {
      this.$modal.removeClass('open').hide();
      this.$backdrop.hide();
      this.$modal.trigger('note.modal.hide');
      this.$modal.off('keydown');
    }
  }]);

  return ModalUI;
}();

/* harmony default export */ var ui_ModalUI = (ModalUI_ModalUI);
// CONCATENATED MODULE: ./src/js/lite/ui.js





var editor = renderer["a" /* default */].create('<div class="note-editor note-frame"/>');
var toolbar = renderer["a" /* default */].create('<div class="note-toolbar" role="toolbar"/>');
var editingArea = renderer["a" /* default */].create('<div class="note-editing-area"/>');
var codable = renderer["a" /* default */].create('<textarea class="note-codable" aria-multiline="true"/>');
var editable = renderer["a" /* default */].create('<div class="note-editable" contentEditable="true" role="textbox" aria-multiline="true"/>');
var statusbar = renderer["a" /* default */].create(['<output class="note-status-output" role="status" aria-live="polite"></output>', '<div class="note-statusbar" role="status">', '<div class="note-resizebar" aria-label="resize">', '<div class="note-icon-bar"></div>', '<div class="note-icon-bar"></div>', '<div class="note-icon-bar"></div>', '</div>', '</div>'].join(''));
var airEditor = renderer["a" /* default */].create('<div class="note-editor note-airframe"/>');
var airEditable = renderer["a" /* default */].create(['<div class="note-editable" contentEditable="true" role="textbox" aria-multiline="true"></div>', '<output class="note-status-output" role="status" aria-live="polite"></output>'].join(''));
var buttonGroup = renderer["a" /* default */].create('<div class="note-btn-group">');
var ui_button = renderer["a" /* default */].create('<button type="button" class="note-btn" tabindex="-1">', function ($node, options) {
  // set button type
  if (options && options.tooltip) {
    $node.attr({
      'aria-label': options.tooltip
    });
    $node.data('_lite_tooltip', new ui_TooltipUI($node, {
      title: options.tooltip,
      container: options.container
    })).on('click', function (e) {
      external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(e.currentTarget).data('_lite_tooltip').hide();
    });
  }

  if (options.contents) {
    $node.html(options.contents);
  }

  if (options && options.data && options.data.toggle === 'dropdown') {
    $node.data('_lite_dropdown', new ui_DropdownUI($node, {
      container: options.container
    }));
  }

  if (options && options.codeviewKeepButton) {
    $node.addClass('note-codeview-keep');
  }
});
var dropdown = renderer["a" /* default */].create('<div class="note-dropdown-menu" role="list">', function ($node, options) {
  var markup = Array.isArray(options.items) ? options.items.map(function (item) {
    var value = typeof item === 'string' ? item : item.value || '';
    var content = options.template ? options.template(item) : item;
    var $temp = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<a class="note-dropdown-item" href="#" data-value="' + value + '" role="listitem" aria-label="' + value + '"></a>');
    $temp.html(content).data('item', item);
    return $temp;
  }) : options.items;
  $node.html(markup).attr({
    'aria-label': options.title
  });
  $node.on('click', '> .note-dropdown-item', function (e) {
    var $a = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this);
    var item = $a.data('item');
    var value = $a.data('value');

    if (item.click) {
      item.click($a);
    } else if (options.itemClick) {
      options.itemClick(e, item, value);
    }
  });

  if (options && options.codeviewKeepButton) {
    $node.addClass('note-codeview-keep');
  }
});
var dropdownCheck = renderer["a" /* default */].create('<div class="note-dropdown-menu note-check" role="list">', function ($node, options) {
  var markup = Array.isArray(options.items) ? options.items.map(function (item) {
    var value = typeof item === 'string' ? item : item.value || '';
    var content = options.template ? options.template(item) : item;
    var $temp = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()('<a class="note-dropdown-item" href="#" data-value="' + value + '" role="listitem" aria-label="' + item + '"></a>');
    $temp.html([icon(options.checkClassName), ' ', content]).data('item', item);
    return $temp;
  }) : options.items;
  $node.html(markup).attr({
    'aria-label': options.title
  });
  $node.on('click', '> .note-dropdown-item', function (e) {
    var $a = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this);
    var item = $a.data('item');
    var value = $a.data('value');

    if (item.click) {
      item.click($a);
    } else if (options.itemClick) {
      options.itemClick(e, item, value);
    }
  });

  if (options && options.codeviewKeepButton) {
    $node.addClass('note-codeview-keep');
  }
});

var dropdownButtonContents = function dropdownButtonContents(contents, options) {
  return contents + ' ' + icon(options.icons.caret, 'span');
};

var dropdownButton = function dropdownButton(opt, callback) {
  return buttonGroup([ui_button({
    className: 'dropdown-toggle',
    contents: opt.title + ' ' + icon('note-icon-caret'),
    tooltip: opt.tooltip,
    data: {
      toggle: 'dropdown'
    }
  }), dropdown({
    className: opt.className,
    items: opt.items,
    template: opt.template,
    itemClick: opt.itemClick
  })], {
    callback: callback
  }).render();
};

var dropdownCheckButton = function dropdownCheckButton(opt, callback) {
  return buttonGroup([ui_button({
    className: 'dropdown-toggle',
    contents: opt.title + ' ' + icon('note-icon-caret'),
    tooltip: opt.tooltip,
    data: {
      toggle: 'dropdown'
    }
  }), dropdownCheck({
    className: opt.className,
    checkClassName: opt.checkClassName,
    items: opt.items,
    template: opt.template,
    itemClick: opt.itemClick
  })], {
    callback: callback
  }).render();
};

var paragraphDropdownButton = function paragraphDropdownButton(opt) {
  return buttonGroup([ui_button({
    className: 'dropdown-toggle',
    contents: opt.title + ' ' + icon('note-icon-caret'),
    tooltip: opt.tooltip,
    data: {
      toggle: 'dropdown'
    }
  }), dropdown([buttonGroup({
    className: 'note-align',
    children: opt.items[0]
  }), buttonGroup({
    className: 'note-list',
    children: opt.items[1]
  })])]).render();
};

var ui_tableMoveHandler = function tableMoveHandler(event, col, row) {
  var PX_PER_EM = 18;
  var $picker = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(event.target.parentNode); // target is mousecatcher

  var $dimensionDisplay = $picker.next();
  var $catcher = $picker.find('.note-dimension-picker-mousecatcher');
  var $highlighted = $picker.find('.note-dimension-picker-highlighted');
  var $unhighlighted = $picker.find('.note-dimension-picker-unhighlighted');
  var posOffset; // HTML5 with jQuery - e.offsetX is undefined in Firefox

  if (event.offsetX === undefined) {
    var posCatcher = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(event.target).offset();
    posOffset = {
      x: event.pageX - posCatcher.left,
      y: event.pageY - posCatcher.top
    };
  } else {
    posOffset = {
      x: event.offsetX,
      y: event.offsetY
    };
  }

  var dim = {
    c: Math.ceil(posOffset.x / PX_PER_EM) || 1,
    r: Math.ceil(posOffset.y / PX_PER_EM) || 1
  };
  $highlighted.css({
    width: dim.c + 'em',
    height: dim.r + 'em'
  });
  $catcher.data('value', dim.c + 'x' + dim.r);

  if (dim.c > 3 && dim.c < col) {
    $unhighlighted.css({
      width: dim.c + 1 + 'em'
    });
  }

  if (dim.r > 3 && dim.r < row) {
    $unhighlighted.css({
      height: dim.r + 1 + 'em'
    });
  }

  $dimensionDisplay.html(dim.c + ' x ' + dim.r);
};

var tableDropdownButton = function tableDropdownButton(opt) {
  return buttonGroup([ui_button({
    className: 'dropdown-toggle',
    contents: opt.title + ' ' + icon('note-icon-caret'),
    tooltip: opt.tooltip,
    data: {
      toggle: 'dropdown'
    }
  }), dropdown({
    className: 'note-table',
    items: ['<div class="note-dimension-picker">', '<div class="note-dimension-picker-mousecatcher" data-event="insertTable" data-value="1x1"></div>', '<div class="note-dimension-picker-highlighted"></div>', '<div class="note-dimension-picker-unhighlighted"></div>', '</div>', '<div class="note-dimension-display">1 x 1</div>'].join('')
  })], {
    callback: function callback($node) {
      var $catcher = $node.find('.note-dimension-picker-mousecatcher');
      $catcher.css({
        width: opt.col + 'em',
        height: opt.row + 'em'
      }).mousedown(opt.itemClick).mousemove(function (e) {
        ui_tableMoveHandler(e, opt.col, opt.row);
      });
    }
  }).render();
};

var palette = renderer["a" /* default */].create('<div class="note-color-palette"/>', function ($node, options) {
  var contents = [];

  for (var row = 0, rowSize = options.colors.length; row < rowSize; row++) {
    var eventName = options.eventName;
    var colors = options.colors[row];
    var colorsName = options.colorsName[row];
    var buttons = [];

    for (var col = 0, colSize = colors.length; col < colSize; col++) {
      var color = colors[col];
      var colorName = colorsName[col];
      buttons.push(['<button type="button" class="note-btn note-color-btn"', 'style="background-color:', color, '" ', 'data-event="', eventName, '" ', 'data-value="', color, '" ', 'data-title="', colorName, '" ', 'aria-label="', colorName, '" ', 'data-toggle="button" tabindex="-1"></button>'].join(''));
    }

    contents.push('<div class="note-color-row">' + buttons.join('') + '</div>');
  }

  $node.html(contents.join(''));
  $node.find('.note-color-btn').each(function () {
    external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this).data('_lite_tooltip', new ui_TooltipUI(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this), {
      container: options.container
    }));
  });
});

var ui_colorDropdownButton = function colorDropdownButton(opt, type) {
  return buttonGroup({
    className: 'note-color',
    children: [ui_button({
      className: 'note-current-color-button',
      contents: opt.title,
      tooltip: opt.lang.color.recent,
      click: opt.currentClick,
      callback: function callback($button) {
        var $recentColor = $button.find('.note-recent-color');

        if (type !== 'foreColor') {
          $recentColor.css('background-color', '#FFFF00');
          $button.attr('data-backColor', '#FFFF00');
        }
      }
    }), ui_button({
      className: 'dropdown-toggle',
      contents: icon('note-icon-caret'),
      tooltip: opt.lang.color.more,
      data: {
        toggle: 'dropdown'
      }
    }), dropdown({
      items: ['<div>', '<div class="note-btn-group btn-background-color">', '<div class="note-palette-title">' + opt.lang.color.background + '</div>', '<div>', '<button type="button" class="note-color-reset note-btn note-btn-block" data-event="backColor" data-value="transparent">', opt.lang.color.transparent, '</button>', '</div>', '<div class="note-holder" data-event="backColor"></div>', '<div class="btn-sm">', '<input type="color" id="html5bcp" class="note-btn btn-default" value="#21104A" style="width:100%;" data-value="cp">', '<button type="button" class="note-color-reset btn" data-event="backColor" data-value="cpbackColor">', opt.lang.color.cpSelect, '</button>', '</div>', '</div>', '<div class="note-btn-group btn-foreground-color">', '<div class="note-palette-title">' + opt.lang.color.foreground + '</div>', '<div>', '<button type="button" class="note-color-reset note-btn note-btn-block" data-event="removeFormat" data-value="foreColor">', opt.lang.color.resetToDefault, '</button>', '</div>', '<div class="note-holder" data-event="foreColor"></div>', '<div class="btn-sm">', '<input type="color" id="html5fcp" class="note-btn btn-default" value="#21104A" style="width:100%;" data-value="cp">', '<button type="button" class="note-color-reset btn" data-event="foreColor" data-value="cpforeColor">', opt.lang.color.cpSelect, '</button>', '</div>', '</div>', '</div>'].join(''),
      callback: function callback($dropdown) {
        $dropdown.find('.note-holder').each(function () {
          var $holder = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(this);
          $holder.append(palette({
            colors: opt.colors,
            eventName: $holder.data('event')
          }).render());
        });

        if (type === 'fore') {
          $dropdown.find('.btn-background-color').hide();
          $dropdown.css({
            'min-width': '210px'
          });
        } else if (type === 'back') {
          $dropdown.find('.btn-foreground-color').hide();
          $dropdown.css({
            'min-width': '210px'
          });
        }
      },
      click: function click(event) {
        var $button = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default()(event.target);
        var eventName = $button.data('event');
        var value = $button.data('value');
        var foreinput = document.getElementById('html5fcp').value;
        var backinput = document.getElementById('html5bcp').value;

        if (value === 'cp') {
          event.stopPropagation();
        } else if (value === 'cpbackColor') {
          value = backinput;
        } else if (value === 'cpforeColor') {
          value = foreinput;
        }

        if (eventName && value) {
          var key = eventName === 'backColor' ? 'background-color' : 'color';
          var $color = $button.closest('.note-color').find('.note-recent-color');
          var $currentButton = $button.closest('.note-color').find('.note-current-color-button');
          $color.css(key, value);
          $currentButton.attr('data-' + eventName, value);

          if (type === 'fore') {
            opt.itemClick('foreColor', value);
          } else if (type === 'back') {
            opt.itemClick('backColor', value);
          } else {
            opt.itemClick(eventName, value);
          }
        }
      }
    })]
  }).render();
};

var dialog = renderer["a" /* default */].create('<div class="note-modal" aria-hidden="false" tabindex="-1" role="dialog"/>', function ($node, options) {
  if (options.fade) {
    $node.addClass('fade');
  }

  $node.attr({
    'aria-label': options.title
  });
  $node.html(['<div class="note-modal-content">', options.title ? '<div class="note-modal-header"><button type="button" class="close" aria-label="Close" aria-hidden="true"><i class="note-icon-close"></i></button><h4 class="note-modal-title">' + options.title + '</h4></div>' : '', '<div class="note-modal-body">' + options.body + '</div>', options.footer ? '<div class="note-modal-footer">' + options.footer + '</div>' : '', '</div>'].join(''));
  $node.data('modal', new ui_ModalUI($node, options));
});

var videoDialog = function videoDialog(opt) {
  var body = '<div class="note-form-group">' + '<label for="note-dialog-video-url-' + opt.id + '" class="note-form-label">' + opt.lang.video.url + ' <small class="text-muted">' + opt.lang.video.providers + '</small></label>' + '<input id="note-dialog-video-url-' + opt.id + '" class="note-video-url note-input" type="text"/>' + '</div>';
  var footer = ['<button type="button" href="#" class="note-btn note-btn-primary note-video-btn disabled" disabled>', opt.lang.video.insert, '</button>'].join('');
  return dialog({
    title: opt.lang.video.insert,
    fade: opt.fade,
    body: body,
    footer: footer
  }).render();
};

var imageDialog = function imageDialog(opt) {
  var body = '<div class="note-form-group note-group-select-from-files">' + '<label for="note-dialog-image-file-' + opt.id + '" class="note-form-label">' + opt.lang.image.selectFromFiles + '</label>' + '<input id="note-dialog-image-file-' + opt.id + '" class="note-note-image-input note-input" type="file" name="files" accept="image/*" multiple="multiple"/>' + opt.imageLimitation + '</div>' + '<div class="note-form-group">' + '<label for="note-dialog-image-url-' + opt.id + '" class="note-form-label">' + opt.lang.image.url + '</label>' + '<input id="note-dialog-image-url-' + opt.id + '" class="note-image-url note-input" type="text"/>' + '</div>';
  var footer = ['<button href="#" type="button" class="note-btn note-btn-primary note-btn-large note-image-btn disabled" disabled>', opt.lang.image.insert, '</button>'].join('');
  return dialog({
    title: opt.lang.image.insert,
    fade: opt.fade,
    body: body,
    footer: footer
  }).render();
};

var linkDialog = function linkDialog(opt) {
  var body = '<div class="note-form-group">' + '<label for="note-dialog-link-txt-' + opt.id + '" class="note-form-label">' + opt.lang.link.textToDisplay + '</label>' + '<input id="note-dialog-link-txt-' + opt.id + '" class="note-link-text note-input" type="text"/>' + '</div>' + '<div class="note-form-group">' + '<label for="note-dialog-link-url-' + opt.id + '" class="note-form-label">' + opt.lang.link.url + '</label>' + '<input id="note-dialog-link-url-' + opt.id + '" class="note-link-url note-input" type="text" value="http://"/>' + '</div>' + (!opt.disableLinkTarget ? '<div class="checkbox"><label for="note-dialog-link-nw-' + opt.id + '"><input id="note-dialog-link-nw-' + opt.id + '" type="checkbox" checked> ' + opt.lang.link.openInNewWindow + '</label></div>' : '') + '<div class="checkbox"><label for="note-dialog-link-up-' + opt.id + '"><input id="note-dialog-link-up-' + opt.id + '" type="checkbox" checked> ' + opt.lang.link.useProtocol + '</label></div>';
  var footer = ['<button href="#" type="button" class="note-btn note-btn-primary note-link-btn disabled" disabled>', opt.lang.link.insert, '</button>'].join('');
  return dialog({
    className: 'link-dialog',
    title: opt.lang.link.insert,
    fade: opt.fade,
    body: body,
    footer: footer
  }).render();
};

var popover = renderer["a" /* default */].create(['<div class="note-popover bottom">', '<div class="note-popover-arrow"></div>', '<div class="popover-content note-children-container"></div>', '</div>'].join(''), function ($node, options) {
  var direction = typeof options.direction !== 'undefined' ? options.direction : 'bottom';
  $node.addClass(direction).hide();

  if (options.hideArrow) {
    $node.find('.note-popover-arrow').hide();
  }
});
var ui_checkbox = renderer["a" /* default */].create('<div class="checkbox"></div>', function ($node, options) {
  $node.html(['<label' + (options.id ? ' for="note-' + options.id + '"' : '') + '>', '<input role="checkbox" type="checkbox"' + (options.id ? ' id="note-' + options.id + '"' : ''), options.checked ? ' checked' : '', ' aria-checked="' + (options.checked ? 'true' : 'false') + '"/>', options.text ? options.text : '', '</label>'].join(''));
});

var icon = function icon(iconClassName, tagName) {
  tagName = tagName || 'i';
  return '<' + tagName + ' class="' + iconClassName + '"/>';
};

var ui = function ui(editorOptions) {
  return {
    editor: editor,
    toolbar: toolbar,
    editingArea: editingArea,
    codable: codable,
    editable: editable,
    statusbar: statusbar,
    airEditor: airEditor,
    airEditable: airEditable,
    buttonGroup: buttonGroup,
    button: ui_button,
    dropdown: dropdown,
    dropdownCheck: dropdownCheck,
    dropdownButton: dropdownButton,
    dropdownButtonContents: dropdownButtonContents,
    dropdownCheckButton: dropdownCheckButton,
    paragraphDropdownButton: paragraphDropdownButton,
    tableDropdownButton: tableDropdownButton,
    colorDropdownButton: ui_colorDropdownButton,
    palette: palette,
    dialog: dialog,
    videoDialog: videoDialog,
    imageDialog: imageDialog,
    linkDialog: linkDialog,
    popover: popover,
    checkbox: ui_checkbox,
    icon: icon,
    options: editorOptions,
    toggleBtn: function toggleBtn($btn, isEnable) {
      $btn.toggleClass('disabled', !isEnable);
      $btn.attr('disabled', !isEnable);
    },
    toggleBtnActive: function toggleBtnActive($btn, isActive) {
      $btn.toggleClass('active', isActive);
    },
    check: function check($dom, value) {
      $dom.find('.checked').removeClass('checked');
      $dom.find('[data-value="' + value + '"]').addClass('checked');
    },
    onDialogShown: function onDialogShown($dialog, handler) {
      $dialog.one('note.modal.show', handler);
    },
    onDialogHidden: function onDialogHidden($dialog, handler) {
      $dialog.one('note.modal.hide', handler);
    },
    showDialog: function showDialog($dialog) {
      $dialog.data('modal').show();
    },
    hideDialog: function hideDialog($dialog) {
      $dialog.data('modal').hide();
    },

    /**
     * get popover content area
     *
     * @param $popover
     * @returns {*}
     */
    getPopoverContent: function getPopoverContent($popover) {
      return $popover.find('.note-popover-content');
    },

    /**
     * get dialog's body area
     *
     * @param $dialog
     * @returns {*}
     */
    getDialogBody: function getDialogBody($dialog) {
      return $dialog.find('.note-modal-body');
    },
    createLayout: function createLayout($note) {
      var $editor = (editorOptions.airMode ? airEditor([editingArea([codable(), airEditable()])]) : editorOptions.toolbarPosition === 'bottom' ? editor([editingArea([codable(), editable()]), toolbar(), statusbar()]) : editor([toolbar(), editingArea([codable(), editable()]), statusbar()])).render();
      $editor.insertAfter($note);
      return {
        note: $note,
        editor: $editor,
        toolbar: $editor.find('.note-toolbar'),
        editingArea: $editor.find('.note-editing-area'),
        editable: $editor.find('.note-editable'),
        codable: $editor.find('.note-codable'),
        statusbar: $editor.find('.note-statusbar')
      };
    },
    removeLayout: function removeLayout($note, layoutInfo) {
      $note.html(layoutInfo.editable.html());
      layoutInfo.editor.remove();
      $note.off('summernote'); // remove summernote custom event

      $note.show();
    }
  };
};

/* harmony default export */ var lite_ui = (ui);
// EXTERNAL MODULE: ./src/js/base/settings.js + 37 modules
var settings = __webpack_require__(3);

// EXTERNAL MODULE: ./src/styles/summernote-lite.scss
var summernote_lite = __webpack_require__(6);

// CONCATENATED MODULE: ./src/js/lite/settings.js




external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote = external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.extend(external_root_jQuery_commonjs2_jquery_commonjs_jquery_amd_jquery_default.a.summernote, {
  ui_template: lite_ui,
  "interface": 'lite'
});

/***/ }),

/***/ 6:
/***/ (function(module, exports, __webpack_require__) {

// extracted by mini-css-extract-plugin

/***/ })

/******/ });
});
//# sourceMappingURL=summernote-lite.js.map

// CodeMirror, copyright (c) by Marijn Haverbeke and others
// Distributed under an MIT license: https://codemirror.net/LICENSE

// This is CodeMirror (https://codemirror.net), a code editor
// implemented in JavaScript on top of the browser's DOM.
//
// You can find some technical background for some of the code below
// at http://marijnhaverbeke.nl/blog/#cm-internals .

(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? module.exports = factory() :
  typeof define === 'function' && define.amd ? define(factory) :
  (global.CodeMirror = factory());
}(this, (function () { 'use strict';

  // Kludges for bugs and behavior differences that can't be feature
  // detected are enabled based on userAgent etc sniffing.
  var userAgent = navigator.userAgent;
  var platform = navigator.platform;

  var gecko = /gecko\/\d/i.test(userAgent);
  var ie_upto10 = /MSIE \d/.test(userAgent);
  var ie_11up = /Trident\/(?:[7-9]|\d{2,})\..*rv:(\d+)/.exec(userAgent);
  var edge = /Edge\/(\d+)/.exec(userAgent);
  var ie = ie_upto10 || ie_11up || edge;
  var ie_version = ie && (ie_upto10 ? document.documentMode || 6 : +(edge || ie_11up)[1]);
  var webkit = !edge && /WebKit\//.test(userAgent);
  var qtwebkit = webkit && /Qt\/\d+\.\d+/.test(userAgent);
  var chrome = !edge && /Chrome\//.test(userAgent);
  var presto = /Opera\//.test(userAgent);
  var safari = /Apple Computer/.test(navigator.vendor);
  var mac_geMountainLion = /Mac OS X 1\d\D([8-9]|\d\d)\D/.test(userAgent);
  var phantom = /PhantomJS/.test(userAgent);

  var ios = !edge && /AppleWebKit/.test(userAgent) && /Mobile\/\w+/.test(userAgent);
  var android = /Android/.test(userAgent);
  // This is woefully incomplete. Suggestions for alternative methods welcome.
  var mobile = ios || android || /webOS|BlackBerry|Opera Mini|Opera Mobi|IEMobile/i.test(userAgent);
  var mac = ios || /Mac/.test(platform);
  var chromeOS = /\bCrOS\b/.test(userAgent);
  var windows = /win/i.test(platform);

  var presto_version = presto && userAgent.match(/Version\/(\d*\.\d*)/);
  if (presto_version) { presto_version = Number(presto_version[1]); }
  if (presto_version && presto_version >= 15) { presto = false; webkit = true; }
  // Some browsers use the wrong event properties to signal cmd/ctrl on OS X
  var flipCtrlCmd = mac && (qtwebkit || presto && (presto_version == null || presto_version < 12.11));
  var captureRightClick = gecko || (ie && ie_version >= 9);

  function classTest(cls) { return new RegExp("(^|\\s)" + cls + "(?:$|\\s)\\s*") }

  var rmClass = function(node, cls) {
    var current = node.className;
    var match = classTest(cls).exec(current);
    if (match) {
      var after = current.slice(match.index + match[0].length);
      node.className = current.slice(0, match.index) + (after ? match[1] + after : "");
    }
  };

  function removeChildren(e) {
    for (var count = e.childNodes.length; count > 0; --count)
      { e.removeChild(e.firstChild); }
    return e
  }

  function removeChildrenAndAdd(parent, e) {
    return removeChildren(parent).appendChild(e)
  }

  function elt(tag, content, className, style) {
    var e = document.createElement(tag);
    if (className) { e.className = className; }
    if (style) { e.style.cssText = style; }
    if (typeof content == "string") { e.appendChild(document.createTextNode(content)); }
    else if (content) { for (var i = 0; i < content.length; ++i) { e.appendChild(content[i]); } }
    return e
  }
  // wrapper for elt, which removes the elt from the accessibility tree
  function eltP(tag, content, className, style) {
    var e = elt(tag, content, className, style);
    e.setAttribute("role", "presentation");
    return e
  }

  var range;
  if (document.createRange) { range = function(node, start, end, endNode) {
    var r = document.createRange();
    r.setEnd(endNode || node, end);
    r.setStart(node, start);
    return r
  }; }
  else { range = function(node, start, end) {
    var r = document.body.createTextRange();
    try { r.moveToElementText(node.parentNode); }
    catch(e) { return r }
    r.collapse(true);
    r.moveEnd("character", end);
    r.moveStart("character", start);
    return r
  }; }

  function contains(parent, child) {
    if (child.nodeType == 3) // Android browser always returns false when child is a textnode
      { child = child.parentNode; }
    if (parent.contains)
      { return parent.contains(child) }
    do {
      if (child.nodeType == 11) { child = child.host; }
      if (child == parent) { return true }
    } while (child = child.parentNode)
  }

  function activeElt() {
    // IE and Edge may throw an "Unspecified Error" when accessing document.activeElement.
    // IE < 10 will throw when accessed while the page is loading or in an iframe.
    // IE > 9 and Edge will throw when accessed in an iframe if document.body is unavailable.
    var activeElement;
    try {
      activeElement = document.activeElement;
    } catch(e) {
      activeElement = document.body || null;
    }
    while (activeElement && activeElement.shadowRoot && activeElement.shadowRoot.activeElement)
      { activeElement = activeElement.shadowRoot.activeElement; }
    return activeElement
  }

  function addClass(node, cls) {
    var current = node.className;
    if (!classTest(cls).test(current)) { node.className += (current ? " " : "") + cls; }
  }
  function joinClasses(a, b) {
    var as = a.split(" ");
    for (var i = 0; i < as.length; i++)
      { if (as[i] && !classTest(as[i]).test(b)) { b += " " + as[i]; } }
    return b
  }

  var selectInput = function(node) { node.select(); };
  if (ios) // Mobile Safari apparently has a bug where select() is broken.
    { selectInput = function(node) { node.selectionStart = 0; node.selectionEnd = node.value.length; }; }
  else if (ie) // Suppress mysterious IE10 errors
    { selectInput = function(node) { try { node.select(); } catch(_e) {} }; }

  function bind(f) {
    var args = Array.prototype.slice.call(arguments, 1);
    return function(){return f.apply(null, args)}
  }

  function copyObj(obj, target, overwrite) {
    if (!target) { target = {}; }
    for (var prop in obj)
      { if (obj.hasOwnProperty(prop) && (overwrite !== false || !target.hasOwnProperty(prop)))
        { target[prop] = obj[prop]; } }
    return target
  }

  // Counts the column offset in a string, taking tabs into account.
  // Used mostly to find indentation.
  function countColumn(string, end, tabSize, startIndex, startValue) {
    if (end == null) {
      end = string.search(/[^\s\u00a0]/);
      if (end == -1) { end = string.length; }
    }
    for (var i = startIndex || 0, n = startValue || 0;;) {
      var nextTab = string.indexOf("\t", i);
      if (nextTab < 0 || nextTab >= end)
        { return n + (end - i) }
      n += nextTab - i;
      n += tabSize - (n % tabSize);
      i = nextTab + 1;
    }
  }

  var Delayed = function() {this.id = null;};
  Delayed.prototype.set = function (ms, f) {
    clearTimeout(this.id);
    this.id = setTimeout(f, ms);
  };

  function indexOf(array, elt) {
    for (var i = 0; i < array.length; ++i)
      { if (array[i] == elt) { return i } }
    return -1
  }

  // Number of pixels added to scroller and sizer to hide scrollbar
  var scrollerGap = 30;

  // Returned or thrown by various protocols to signal 'I'm not
  // handling this'.
  var Pass = {toString: function(){return "CodeMirror.Pass"}};

  // Reused option objects for setSelection & friends
  var sel_dontScroll = {scroll: false}, sel_mouse = {origin: "*mouse"}, sel_move = {origin: "+move"};

  // The inverse of countColumn -- find the offset that corresponds to
  // a particular column.
  function findColumn(string, goal, tabSize) {
    for (var pos = 0, col = 0;;) {
      var nextTab = string.indexOf("\t", pos);
      if (nextTab == -1) { nextTab = string.length; }
      var skipped = nextTab - pos;
      if (nextTab == string.length || col + skipped >= goal)
        { return pos + Math.min(skipped, goal - col) }
      col += nextTab - pos;
      col += tabSize - (col % tabSize);
      pos = nextTab + 1;
      if (col >= goal) { return pos }
    }
  }

  var spaceStrs = [""];
  function spaceStr(n) {
    while (spaceStrs.length <= n)
      { spaceStrs.push(lst(spaceStrs) + " "); }
    return spaceStrs[n]
  }

  function lst(arr) { return arr[arr.length-1] }

  function map(array, f) {
    var out = [];
    for (var i = 0; i < array.length; i++) { out[i] = f(array[i], i); }
    return out
  }

  function insertSorted(array, value, score) {
    var pos = 0, priority = score(value);
    while (pos < array.length && score(array[pos]) <= priority) { pos++; }
    array.splice(pos, 0, value);
  }

  function nothing() {}

  function createObj(base, props) {
    var inst;
    if (Object.create) {
      inst = Object.create(base);
    } else {
      nothing.prototype = base;
      inst = new nothing();
    }
    if (props) { copyObj(props, inst); }
    return inst
  }

  var nonASCIISingleCaseWordChar = /[\u00df\u0587\u0590-\u05f4\u0600-\u06ff\u3040-\u309f\u30a0-\u30ff\u3400-\u4db5\u4e00-\u9fcc\uac00-\ud7af]/;
  function isWordCharBasic(ch) {
    return /\w/.test(ch) || ch > "\x80" &&
      (ch.toUpperCase() != ch.toLowerCase() || nonASCIISingleCaseWordChar.test(ch))
  }
  function isWordChar(ch, helper) {
    if (!helper) { return isWordCharBasic(ch) }
    if (helper.source.indexOf("\\w") > -1 && isWordCharBasic(ch)) { return true }
    return helper.test(ch)
  }

  function isEmpty(obj) {
    for (var n in obj) { if (obj.hasOwnProperty(n) && obj[n]) { return false } }
    return true
  }

  // Extending unicode characters. A series of a non-extending char +
  // any number of extending chars is treated as a single unit as far
  // as editing and measuring is concerned. This is not fully correct,
  // since some scripts/fonts/browsers also treat other configurations
  // of code points as a group.
  var extendingChars = /[\u0300-\u036f\u0483-\u0489\u0591-\u05bd\u05bf\u05c1\u05c2\u05c4\u05c5\u05c7\u0610-\u061a\u064b-\u065e\u0670\u06d6-\u06dc\u06de-\u06e4\u06e7\u06e8\u06ea-\u06ed\u0711\u0730-\u074a\u07a6-\u07b0\u07eb-\u07f3\u0816-\u0819\u081b-\u0823\u0825-\u0827\u0829-\u082d\u0900-\u0902\u093c\u0941-\u0948\u094d\u0951-\u0955\u0962\u0963\u0981\u09bc\u09be\u09c1-\u09c4\u09cd\u09d7\u09e2\u09e3\u0a01\u0a02\u0a3c\u0a41\u0a42\u0a47\u0a48\u0a4b-\u0a4d\u0a51\u0a70\u0a71\u0a75\u0a81\u0a82\u0abc\u0ac1-\u0ac5\u0ac7\u0ac8\u0acd\u0ae2\u0ae3\u0b01\u0b3c\u0b3e\u0b3f\u0b41-\u0b44\u0b4d\u0b56\u0b57\u0b62\u0b63\u0b82\u0bbe\u0bc0\u0bcd\u0bd7\u0c3e-\u0c40\u0c46-\u0c48\u0c4a-\u0c4d\u0c55\u0c56\u0c62\u0c63\u0cbc\u0cbf\u0cc2\u0cc6\u0ccc\u0ccd\u0cd5\u0cd6\u0ce2\u0ce3\u0d3e\u0d41-\u0d44\u0d4d\u0d57\u0d62\u0d63\u0dca\u0dcf\u0dd2-\u0dd4\u0dd6\u0ddf\u0e31\u0e34-\u0e3a\u0e47-\u0e4e\u0eb1\u0eb4-\u0eb9\u0ebb\u0ebc\u0ec8-\u0ecd\u0f18\u0f19\u0f35\u0f37\u0f39\u0f71-\u0f7e\u0f80-\u0f84\u0f86\u0f87\u0f90-\u0f97\u0f99-\u0fbc\u0fc6\u102d-\u1030\u1032-\u1037\u1039\u103a\u103d\u103e\u1058\u1059\u105e-\u1060\u1071-\u1074\u1082\u1085\u1086\u108d\u109d\u135f\u1712-\u1714\u1732-\u1734\u1752\u1753\u1772\u1773\u17b7-\u17bd\u17c6\u17c9-\u17d3\u17dd\u180b-\u180d\u18a9\u1920-\u1922\u1927\u1928\u1932\u1939-\u193b\u1a17\u1a18\u1a56\u1a58-\u1a5e\u1a60\u1a62\u1a65-\u1a6c\u1a73-\u1a7c\u1a7f\u1b00-\u1b03\u1b34\u1b36-\u1b3a\u1b3c\u1b42\u1b6b-\u1b73\u1b80\u1b81\u1ba2-\u1ba5\u1ba8\u1ba9\u1c2c-\u1c33\u1c36\u1c37\u1cd0-\u1cd2\u1cd4-\u1ce0\u1ce2-\u1ce8\u1ced\u1dc0-\u1de6\u1dfd-\u1dff\u200c\u200d\u20d0-\u20f0\u2cef-\u2cf1\u2de0-\u2dff\u302a-\u302f\u3099\u309a\ua66f-\ua672\ua67c\ua67d\ua6f0\ua6f1\ua802\ua806\ua80b\ua825\ua826\ua8c4\ua8e0-\ua8f1\ua926-\ua92d\ua947-\ua951\ua980-\ua982\ua9b3\ua9b6-\ua9b9\ua9bc\uaa29-\uaa2e\uaa31\uaa32\uaa35\uaa36\uaa43\uaa4c\uaab0\uaab2-\uaab4\uaab7\uaab8\uaabe\uaabf\uaac1\uabe5\uabe8\uabed\udc00-\udfff\ufb1e\ufe00-\ufe0f\ufe20-\ufe26\uff9e\uff9f]/;
  function isExtendingChar(ch) { return ch.charCodeAt(0) >= 768 && extendingChars.test(ch) }

  // Returns a number from the range [`0`; `str.length`] unless `pos` is outside that range.
  function skipExtendingChars(str, pos, dir) {
    while ((dir < 0 ? pos > 0 : pos < str.length) && isExtendingChar(str.charAt(pos))) { pos += dir; }
    return pos
  }

  // Returns the value from the range [`from`; `to`] that satisfies
  // `pred` and is closest to `from`. Assumes that at least `to`
  // satisfies `pred`. Supports `from` being greater than `to`.
  function findFirst(pred, from, to) {
    // At any point we are certain `to` satisfies `pred`, don't know
    // whether `from` does.
    var dir = from > to ? -1 : 1;
    for (;;) {
      if (from == to) { return from }
      var midF = (from + to) / 2, mid = dir < 0 ? Math.ceil(midF) : Math.floor(midF);
      if (mid == from) { return pred(mid) ? from : to }
      if (pred(mid)) { to = mid; }
      else { from = mid + dir; }
    }
  }

  // The display handles the DOM integration, both for input reading
  // and content drawing. It holds references to DOM nodes and
  // display-related state.

  function Display(place, doc, input) {
    var d = this;
    this.input = input;

    // Covers bottom-right square when both scrollbars are present.
    d.scrollbarFiller = elt("div", null, "CodeMirror-scrollbar-filler");
    d.scrollbarFiller.setAttribute("cm-not-content", "true");
    // Covers bottom of gutter when coverGutterNextToScrollbar is on
    // and h scrollbar is present.
    d.gutterFiller = elt("div", null, "CodeMirror-gutter-filler");
    d.gutterFiller.setAttribute("cm-not-content", "true");
    // Will contain the actual code, positioned to cover the viewport.
    d.lineDiv = eltP("div", null, "CodeMirror-code");
    // Elements are added to these to represent selection and cursors.
    d.selectionDiv = elt("div", null, null, "position: relative; z-index: 1");
    d.cursorDiv = elt("div", null, "CodeMirror-cursors");
    // A visibility: hidden element used to find the size of things.
    d.measure = elt("div", null, "CodeMirror-measure");
    // When lines outside of the viewport are measured, they are drawn in this.
    d.lineMeasure = elt("div", null, "CodeMirror-measure");
    // Wraps everything that needs to exist inside the vertically-padded coordinate system
    d.lineSpace = eltP("div", [d.measure, d.lineMeasure, d.selectionDiv, d.cursorDiv, d.lineDiv],
                      null, "position: relative; outline: none");
    var lines = eltP("div", [d.lineSpace], "CodeMirror-lines");
    // Moved around its parent to cover visible view.
    d.mover = elt("div", [lines], null, "position: relative");
    // Set to the height of the document, allowing scrolling.
    d.sizer = elt("div", [d.mover], "CodeMirror-sizer");
    d.sizerWidth = null;
    // Behavior of elts with overflow: auto and padding is
    // inconsistent across browsers. This is used to ensure the
    // scrollable area is big enough.
    d.heightForcer = elt("div", null, null, "position: absolute; height: " + scrollerGap + "px; width: 1px;");
    // Will contain the gutters, if any.
    d.gutters = elt("div", null, "CodeMirror-gutters");
    d.lineGutter = null;
    // Actual scrollable element.
    d.scroller = elt("div", [d.sizer, d.heightForcer, d.gutters], "CodeMirror-scroll");
    d.scroller.setAttribute("tabIndex", "-1");
    // The element in which the editor lives.
    d.wrapper = elt("div", [d.scrollbarFiller, d.gutterFiller, d.scroller], "CodeMirror");

    // Work around IE7 z-index bug (not perfect, hence IE7 not really being supported)
    if (ie && ie_version < 8) { d.gutters.style.zIndex = -1; d.scroller.style.paddingRight = 0; }
    if (!webkit && !(gecko && mobile)) { d.scroller.draggable = true; }

    if (place) {
      if (place.appendChild) { place.appendChild(d.wrapper); }
      else { place(d.wrapper); }
    }

    // Current rendered range (may be bigger than the view window).
    d.viewFrom = d.viewTo = doc.first;
    d.reportedViewFrom = d.reportedViewTo = doc.first;
    // Information about the rendered lines.
    d.view = [];
    d.renderedView = null;
    // Holds info about a single rendered line when it was rendered
    // for measurement, while not in view.
    d.externalMeasured = null;
    // Empty space (in pixels) above the view
    d.viewOffset = 0;
    d.lastWrapHeight = d.lastWrapWidth = 0;
    d.updateLineNumbers = null;

    d.nativeBarWidth = d.barHeight = d.barWidth = 0;
    d.scrollbarsClipped = false;

    // Used to only resize the line number gutter when necessary (when
    // the amount of lines crosses a boundary that makes its width change)
    d.lineNumWidth = d.lineNumInnerWidth = d.lineNumChars = null;
    // Set to true when a non-horizontal-scrolling line widget is
    // added. As an optimization, line widget aligning is skipped when
    // this is false.
    d.alignWidgets = false;

    d.cachedCharWidth = d.cachedTextHeight = d.cachedPaddingH = null;

    // Tracks the maximum line length so that the horizontal scrollbar
    // can be kept static when scrolling.
    d.maxLine = null;
    d.maxLineLength = 0;
    d.maxLineChanged = false;

    // Used for measuring wheel scrolling granularity
    d.wheelDX = d.wheelDY = d.wheelStartX = d.wheelStartY = null;

    // True when shift is held down.
    d.shift = false;

    // Used to track whether anything happened since the context menu
    // was opened.
    d.selForContextMenu = null;

    d.activeTouch = null;

    input.init(d);
  }

  // Find the line object corresponding to the given line number.
  function getLine(doc, n) {
    n -= doc.first;
    if (n < 0 || n >= doc.size) { throw new Error("There is no line " + (n + doc.first) + " in the document.") }
    var chunk = doc;
    while (!chunk.lines) {
      for (var i = 0;; ++i) {
        var child = chunk.children[i], sz = child.chunkSize();
        if (n < sz) { chunk = child; break }
        n -= sz;
      }
    }
    return chunk.lines[n]
  }

  // Get the part of a document between two positions, as an array of
  // strings.
  function getBetween(doc, start, end) {
    var out = [], n = start.line;
    doc.iter(start.line, end.line + 1, function (line) {
      var text = line.text;
      if (n == end.line) { text = text.slice(0, end.ch); }
      if (n == start.line) { text = text.slice(start.ch); }
      out.push(text);
      ++n;
    });
    return out
  }
  // Get the lines between from and to, as array of strings.
  function getLines(doc, from, to) {
    var out = [];
    doc.iter(from, to, function (line) { out.push(line.text); }); // iter aborts when callback returns truthy value
    return out
  }

  // Update the height of a line, propagating the height change
  // upwards to parent nodes.
  function updateLineHeight(line, height) {
    var diff = height - line.height;
    if (diff) { for (var n = line; n; n = n.parent) { n.height += diff; } }
  }

  // Given a line object, find its line number by walking up through
  // its parent links.
  function lineNo(line) {
    if (line.parent == null) { return null }
    var cur = line.parent, no = indexOf(cur.lines, line);
    for (var chunk = cur.parent; chunk; cur = chunk, chunk = chunk.parent) {
      for (var i = 0;; ++i) {
        if (chunk.children[i] == cur) { break }
        no += chunk.children[i].chunkSize();
      }
    }
    return no + cur.first
  }

  // Find the line at the given vertical position, using the height
  // information in the document tree.
  function lineAtHeight(chunk, h) {
    var n = chunk.first;
    outer: do {
      for (var i$1 = 0; i$1 < chunk.children.length; ++i$1) {
        var child = chunk.children[i$1], ch = child.height;
        if (h < ch) { chunk = child; continue outer }
        h -= ch;
        n += child.chunkSize();
      }
      return n
    } while (!chunk.lines)
    var i = 0;
    for (; i < chunk.lines.length; ++i) {
      var line = chunk.lines[i], lh = line.height;
      if (h < lh) { break }
      h -= lh;
    }
    return n + i
  }

  function isLine(doc, l) {return l >= doc.first && l < doc.first + doc.size}

  function lineNumberFor(options, i) {
    return String(options.lineNumberFormatter(i + options.firstLineNumber))
  }

  // A Pos instance represents a position within the text.
  function Pos(line, ch, sticky) {
    if ( sticky === void 0 ) sticky = null;

    if (!(this instanceof Pos)) { return new Pos(line, ch, sticky) }
    this.line = line;
    this.ch = ch;
    this.sticky = sticky;
  }

  // Compare two positions, return 0 if they are the same, a negative
  // number when a is less, and a positive number otherwise.
  function cmp(a, b) { return a.line - b.line || a.ch - b.ch }

  function equalCursorPos(a, b) { return a.sticky == b.sticky && cmp(a, b) == 0 }

  function copyPos(x) {return Pos(x.line, x.ch)}
  function maxPos(a, b) { return cmp(a, b) < 0 ? b : a }
  function minPos(a, b) { return cmp(a, b) < 0 ? a : b }

  // Most of the external API clips given positions to make sure they
  // actually exist within the document.
  function clipLine(doc, n) {return Math.max(doc.first, Math.min(n, doc.first + doc.size - 1))}
  function clipPos(doc, pos) {
    if (pos.line < doc.first) { return Pos(doc.first, 0) }
    var last = doc.first + doc.size - 1;
    if (pos.line > last) { return Pos(last, getLine(doc, last).text.length) }
    return clipToLen(pos, getLine(doc, pos.line).text.length)
  }
  function clipToLen(pos, linelen) {
    var ch = pos.ch;
    if (ch == null || ch > linelen) { return Pos(pos.line, linelen) }
    else if (ch < 0) { return Pos(pos.line, 0) }
    else { return pos }
  }
  function clipPosArray(doc, array) {
    var out = [];
    for (var i = 0; i < array.length; i++) { out[i] = clipPos(doc, array[i]); }
    return out
  }

  // Optimize some code when these features are not used.
  var sawReadOnlySpans = false, sawCollapsedSpans = false;

  function seeReadOnlySpans() {
    sawReadOnlySpans = true;
  }

  function seeCollapsedSpans() {
    sawCollapsedSpans = true;
  }

  // TEXTMARKER SPANS

  function MarkedSpan(marker, from, to) {
    this.marker = marker;
    this.from = from; this.to = to;
  }

  // Search an array of spans for a span matching the given marker.
  function getMarkedSpanFor(spans, marker) {
    if (spans) { for (var i = 0; i < spans.length; ++i) {
      var span = spans[i];
      if (span.marker == marker) { return span }
    } }
  }
  // Remove a span from an array, returning undefined if no spans are
  // left (we don't store arrays for lines without spans).
  function removeMarkedSpan(spans, span) {
    var r;
    for (var i = 0; i < spans.length; ++i)
      { if (spans[i] != span) { (r || (r = [])).push(spans[i]); } }
    return r
  }
  // Add a span to a line.
  function addMarkedSpan(line, span) {
    line.markedSpans = line.markedSpans ? line.markedSpans.concat([span]) : [span];
    span.marker.attachLine(line);
  }

  // Used for the algorithm that adjusts markers for a change in the
  // document. These functions cut an array of spans at a given
  // character position, returning an array of remaining chunks (or
  // undefined if nothing remains).
  function markedSpansBefore(old, startCh, isInsert) {
    var nw;
    if (old) { for (var i = 0; i < old.length; ++i) {
      var span = old[i], marker = span.marker;
      var startsBefore = span.from == null || (marker.inclusiveLeft ? span.from <= startCh : span.from < startCh);
      if (startsBefore || span.from == startCh && marker.type == "bookmark" && (!isInsert || !span.marker.insertLeft)) {
        var endsAfter = span.to == null || (marker.inclusiveRight ? span.to >= startCh : span.to > startCh)
        ;(nw || (nw = [])).push(new MarkedSpan(marker, span.from, endsAfter ? null : span.to));
      }
    } }
    return nw
  }
  function markedSpansAfter(old, endCh, isInsert) {
    var nw;
    if (old) { for (var i = 0; i < old.length; ++i) {
      var span = old[i], marker = span.marker;
      var endsAfter = span.to == null || (marker.inclusiveRight ? span.to >= endCh : span.to > endCh);
      if (endsAfter || span.from == endCh && marker.type == "bookmark" && (!isInsert || span.marker.insertLeft)) {
        var startsBefore = span.from == null || (marker.inclusiveLeft ? span.from <= endCh : span.from < endCh)
        ;(nw || (nw = [])).push(new MarkedSpan(marker, startsBefore ? null : span.from - endCh,
                                              span.to == null ? null : span.to - endCh));
      }
    } }
    return nw
  }

  // Given a change object, compute the new set of marker spans that
  // cover the line in which the change took place. Removes spans
  // entirely within the change, reconnects spans belonging to the
  // same marker that appear on both sides of the change, and cuts off
  // spans partially within the change. Returns an array of span
  // arrays with one element for each line in (after) the change.
  function stretchSpansOverChange(doc, change) {
    if (change.full) { return null }
    var oldFirst = isLine(doc, change.from.line) && getLine(doc, change.from.line).markedSpans;
    var oldLast = isLine(doc, change.to.line) && getLine(doc, change.to.line).markedSpans;
    if (!oldFirst && !oldLast) { return null }

    var startCh = change.from.ch, endCh = change.to.ch, isInsert = cmp(change.from, change.to) == 0;
    // Get the spans that 'stick out' on both sides
    var first = markedSpansBefore(oldFirst, startCh, isInsert);
    var last = markedSpansAfter(oldLast, endCh, isInsert);

    // Next, merge those two ends
    var sameLine = change.text.length == 1, offset = lst(change.text).length + (sameLine ? startCh : 0);
    if (first) {
      // Fix up .to properties of first
      for (var i = 0; i < first.length; ++i) {
        var span = first[i];
        if (span.to == null) {
          var found = getMarkedSpanFor(last, span.marker);
          if (!found) { span.to = startCh; }
          else if (sameLine) { span.to = found.to == null ? null : found.to + offset; }
        }
      }
    }
    if (last) {
      // Fix up .from in last (or move them into first in case of sameLine)
      for (var i$1 = 0; i$1 < last.length; ++i$1) {
        var span$1 = last[i$1];
        if (span$1.to != null) { span$1.to += offset; }
        if (span$1.from == null) {
          var found$1 = getMarkedSpanFor(first, span$1.marker);
          if (!found$1) {
            span$1.from = offset;
            if (sameLine) { (first || (first = [])).push(span$1); }
          }
        } else {
          span$1.from += offset;
          if (sameLine) { (first || (first = [])).push(span$1); }
        }
      }
    }
    // Make sure we didn't create any zero-length spans
    if (first) { first = clearEmptySpans(first); }
    if (last && last != first) { last = clearEmptySpans(last); }

    var newMarkers = [first];
    if (!sameLine) {
      // Fill gap with whole-line-spans
      var gap = change.text.length - 2, gapMarkers;
      if (gap > 0 && first)
        { for (var i$2 = 0; i$2 < first.length; ++i$2)
          { if (first[i$2].to == null)
            { (gapMarkers || (gapMarkers = [])).push(new MarkedSpan(first[i$2].marker, null, null)); } } }
      for (var i$3 = 0; i$3 < gap; ++i$3)
        { newMarkers.push(gapMarkers); }
      newMarkers.push(last);
    }
    return newMarkers
  }

  // Remove spans that are empty and don't have a clearWhenEmpty
  // option of false.
  function clearEmptySpans(spans) {
    for (var i = 0; i < spans.length; ++i) {
      var span = spans[i];
      if (span.from != null && span.from == span.to && span.marker.clearWhenEmpty !== false)
        { spans.splice(i--, 1); }
    }
    if (!spans.length) { return null }
    return spans
  }

  // Used to 'clip' out readOnly ranges when making a change.
  function removeReadOnlyRanges(doc, from, to) {
    var markers = null;
    doc.iter(from.line, to.line + 1, function (line) {
      if (line.markedSpans) { for (var i = 0; i < line.markedSpans.length; ++i) {
        var mark = line.markedSpans[i].marker;
        if (mark.readOnly && (!markers || indexOf(markers, mark) == -1))
          { (markers || (markers = [])).push(mark); }
      } }
    });
    if (!markers) { return null }
    var parts = [{from: from, to: to}];
    for (var i = 0; i < markers.length; ++i) {
      var mk = markers[i], m = mk.find(0);
      for (var j = 0; j < parts.length; ++j) {
        var p = parts[j];
        if (cmp(p.to, m.from) < 0 || cmp(p.from, m.to) > 0) { continue }
        var newParts = [j, 1], dfrom = cmp(p.from, m.from), dto = cmp(p.to, m.to);
        if (dfrom < 0 || !mk.inclusiveLeft && !dfrom)
          { newParts.push({from: p.from, to: m.from}); }
        if (dto > 0 || !mk.inclusiveRight && !dto)
          { newParts.push({from: m.to, to: p.to}); }
        parts.splice.apply(parts, newParts);
        j += newParts.length - 3;
      }
    }
    return parts
  }

  // Connect or disconnect spans from a line.
  function detachMarkedSpans(line) {
    var spans = line.markedSpans;
    if (!spans) { return }
    for (var i = 0; i < spans.length; ++i)
      { spans[i].marker.detachLine(line); }
    line.markedSpans = null;
  }
  function attachMarkedSpans(line, spans) {
    if (!spans) { return }
    for (var i = 0; i < spans.length; ++i)
      { spans[i].marker.attachLine(line); }
    line.markedSpans = spans;
  }

  // Helpers used when computing which overlapping collapsed span
  // counts as the larger one.
  function extraLeft(marker) { return marker.inclusiveLeft ? -1 : 0 }
  function extraRight(marker) { return marker.inclusiveRight ? 1 : 0 }

  // Returns a number indicating which of two overlapping collapsed
  // spans is larger (and thus includes the other). Falls back to
  // comparing ids when the spans cover exactly the same range.
  function compareCollapsedMarkers(a, b) {
    var lenDiff = a.lines.length - b.lines.length;
    if (lenDiff != 0) { return lenDiff }
    var aPos = a.find(), bPos = b.find();
    var fromCmp = cmp(aPos.from, bPos.from) || extraLeft(a) - extraLeft(b);
    if (fromCmp) { return -fromCmp }
    var toCmp = cmp(aPos.to, bPos.to) || extraRight(a) - extraRight(b);
    if (toCmp) { return toCmp }
    return b.id - a.id
  }

  // Find out whether a line ends or starts in a collapsed span. If
  // so, return the marker for that span.
  function collapsedSpanAtSide(line, start) {
    var sps = sawCollapsedSpans && line.markedSpans, found;
    if (sps) { for (var sp = (void 0), i = 0; i < sps.length; ++i) {
      sp = sps[i];
      if (sp.marker.collapsed && (start ? sp.from : sp.to) == null &&
          (!found || compareCollapsedMarkers(found, sp.marker) < 0))
        { found = sp.marker; }
    } }
    return found
  }
  function collapsedSpanAtStart(line) { return collapsedSpanAtSide(line, true) }
  function collapsedSpanAtEnd(line) { return collapsedSpanAtSide(line, false) }

  function collapsedSpanAround(line, ch) {
    var sps = sawCollapsedSpans && line.markedSpans, found;
    if (sps) { for (var i = 0; i < sps.length; ++i) {
      var sp = sps[i];
      if (sp.marker.collapsed && (sp.from == null || sp.from < ch) && (sp.to == null || sp.to > ch) &&
          (!found || compareCollapsedMarkers(found, sp.marker) < 0)) { found = sp.marker; }
    } }
    return found
  }

  // Test whether there exists a collapsed span that partially
  // overlaps (covers the start or end, but not both) of a new span.
  // Such overlap is not allowed.
  function conflictingCollapsedRange(doc, lineNo$$1, from, to, marker) {
    var line = getLine(doc, lineNo$$1);
    var sps = sawCollapsedSpans && line.markedSpans;
    if (sps) { for (var i = 0; i < sps.length; ++i) {
      var sp = sps[i];
      if (!sp.marker.collapsed) { continue }
      var found = sp.marker.find(0);
      var fromCmp = cmp(found.from, from) || extraLeft(sp.marker) - extraLeft(marker);
      var toCmp = cmp(found.to, to) || extraRight(sp.marker) - extraRight(marker);
      if (fromCmp >= 0 && toCmp <= 0 || fromCmp <= 0 && toCmp >= 0) { continue }
      if (fromCmp <= 0 && (sp.marker.inclusiveRight && marker.inclusiveLeft ? cmp(found.to, from) >= 0 : cmp(found.to, from) > 0) ||
          fromCmp >= 0 && (sp.marker.inclusiveRight && marker.inclusiveLeft ? cmp(found.from, to) <= 0 : cmp(found.from, to) < 0))
        { return true }
    } }
  }

  // A visual line is a line as drawn on the screen. Folding, for
  // example, can cause multiple logical lines to appear on the same
  // visual line. This finds the start of the visual line that the
  // given line is part of (usually that is the line itself).
  function visualLine(line) {
    var merged;
    while (merged = collapsedSpanAtStart(line))
      { line = merged.find(-1, true).line; }
    return line
  }

  function visualLineEnd(line) {
    var merged;
    while (merged = collapsedSpanAtEnd(line))
      { line = merged.find(1, true).line; }
    return line
  }

  // Returns an array of logical lines that continue the visual line
  // started by the argument, or undefined if there are no such lines.
  function visualLineContinued(line) {
    var merged, lines;
    while (merged = collapsedSpanAtEnd(line)) {
      line = merged.find(1, true).line
      ;(lines || (lines = [])).push(line);
    }
    return lines
  }

  // Get the line number of the start of the visual line that the
  // given line number is part of.
  function visualLineNo(doc, lineN) {
    var line = getLine(doc, lineN), vis = visualLine(line);
    if (line == vis) { return lineN }
    return lineNo(vis)
  }

  // Get the line number of the start of the next visual line after
  // the given line.
  function visualLineEndNo(doc, lineN) {
    if (lineN > doc.lastLine()) { return lineN }
    var line = getLine(doc, lineN), merged;
    if (!lineIsHidden(doc, line)) { return lineN }
    while (merged = collapsedSpanAtEnd(line))
      { line = merged.find(1, true).line; }
    return lineNo(line) + 1
  }

  // Compute whether a line is hidden. Lines count as hidden when they
  // are part of a visual line that starts with another line, or when
  // they are entirely covered by collapsed, non-widget span.
  function lineIsHidden(doc, line) {
    var sps = sawCollapsedSpans && line.markedSpans;
    if (sps) { for (var sp = (void 0), i = 0; i < sps.length; ++i) {
      sp = sps[i];
      if (!sp.marker.collapsed) { continue }
      if (sp.from == null) { return true }
      if (sp.marker.widgetNode) { continue }
      if (sp.from == 0 && sp.marker.inclusiveLeft && lineIsHiddenInner(doc, line, sp))
        { return true }
    } }
  }
  function lineIsHiddenInner(doc, line, span) {
    if (span.to == null) {
      var end = span.marker.find(1, true);
      return lineIsHiddenInner(doc, end.line, getMarkedSpanFor(end.line.markedSpans, span.marker))
    }
    if (span.marker.inclusiveRight && span.to == line.text.length)
      { return true }
    for (var sp = (void 0), i = 0; i < line.markedSpans.length; ++i) {
      sp = line.markedSpans[i];
      if (sp.marker.collapsed && !sp.marker.widgetNode && sp.from == span.to &&
          (sp.to == null || sp.to != span.from) &&
          (sp.marker.inclusiveLeft || span.marker.inclusiveRight) &&
          lineIsHiddenInner(doc, line, sp)) { return true }
    }
  }

  // Find the height above the given line.
  function heightAtLine(lineObj) {
    lineObj = visualLine(lineObj);

    var h = 0, chunk = lineObj.parent;
    for (var i = 0; i < chunk.lines.length; ++i) {
      var line = chunk.lines[i];
      if (line == lineObj) { break }
      else { h += line.height; }
    }
    for (var p = chunk.parent; p; chunk = p, p = chunk.parent) {
      for (var i$1 = 0; i$1 < p.children.length; ++i$1) {
        var cur = p.children[i$1];
        if (cur == chunk) { break }
        else { h += cur.height; }
      }
    }
    return h
  }

  // Compute the character length of a line, taking into account
  // collapsed ranges (see markText) that might hide parts, and join
  // other lines onto it.
  function lineLength(line) {
    if (line.height == 0) { return 0 }
    var len = line.text.length, merged, cur = line;
    while (merged = collapsedSpanAtStart(cur)) {
      var found = merged.find(0, true);
      cur = found.from.line;
      len += found.from.ch - found.to.ch;
    }
    cur = line;
    while (merged = collapsedSpanAtEnd(cur)) {
      var found$1 = merged.find(0, true);
      len -= cur.text.length - found$1.from.ch;
      cur = found$1.to.line;
      len += cur.text.length - found$1.to.ch;
    }
    return len
  }

  // Find the longest line in the document.
  function findMaxLine(cm) {
    var d = cm.display, doc = cm.doc;
    d.maxLine = getLine(doc, doc.first);
    d.maxLineLength = lineLength(d.maxLine);
    d.maxLineChanged = true;
    doc.iter(function (line) {
      var len = lineLength(line);
      if (len > d.maxLineLength) {
        d.maxLineLength = len;
        d.maxLine = line;
      }
    });
  }

  // BIDI HELPERS

  function iterateBidiSections(order, from, to, f) {
    if (!order) { return f(from, to, "ltr", 0) }
    var found = false;
    for (var i = 0; i < order.length; ++i) {
      var part = order[i];
      if (part.from < to && part.to > from || from == to && part.to == from) {
        f(Math.max(part.from, from), Math.min(part.to, to), part.level == 1 ? "rtl" : "ltr", i);
        found = true;
      }
    }
    if (!found) { f(from, to, "ltr"); }
  }

  var bidiOther = null;
  function getBidiPartAt(order, ch, sticky) {
    var found;
    bidiOther = null;
    for (var i = 0; i < order.length; ++i) {
      var cur = order[i];
      if (cur.from < ch && cur.to > ch) { return i }
      if (cur.to == ch) {
        if (cur.from != cur.to && sticky == "before") { found = i; }
        else { bidiOther = i; }
      }
      if (cur.from == ch) {
        if (cur.from != cur.to && sticky != "before") { found = i; }
        else { bidiOther = i; }
      }
    }
    return found != null ? found : bidiOther
  }

  // Bidirectional ordering algorithm
  // See http://unicode.org/reports/tr9/tr9-13.html for the algorithm
  // that this (partially) implements.

  // One-char codes used for character types:
  // L (L):   Left-to-Right
  // R (R):   Right-to-Left
  // r (AL):  Right-to-Left Arabic
  // 1 (EN):  European Number
  // + (ES):  European Number Separator
  // % (ET):  European Number Terminator
  // n (AN):  Arabic Number
  // , (CS):  Common Number Separator
  // m (NSM): Non-Spacing Mark
  // b (BN):  Boundary Neutral
  // s (B):   Paragraph Separator
  // t (S):   Segment Separator
  // w (WS):  Whitespace
  // N (ON):  Other Neutrals

  // Returns null if characters are ordered as they appear
  // (left-to-right), or an array of sections ({from, to, level}
  // objects) in the order in which they occur visually.
  var bidiOrdering = (function() {
    // Character types for codepoints 0 to 0xff
    var lowTypes = "bbbbbbbbbtstwsbbbbbbbbbbbbbbssstwNN%%%NNNNNN,N,N1111111111NNNNNNNLLLLLLLLLLLLLLLLLLLLLLLLLLNNNNNNLLLLLLLLLLLLLLLLLLLLLLLLLLNNNNbbbbbbsbbbbbbbbbbbbbbbbbbbbbbbbbb,N%%%%NNNNLNNNNN%%11NLNNN1LNNNNNLLLLLLLLLLLLLLLLLLLLLLLNLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLN";
    // Character types for codepoints 0x600 to 0x6f9
    var arabicTypes = "nnnnnnNNr%%r,rNNmmmmmmmmmmmrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrmmmmmmmmmmmmmmmmmmmmmnnnnnnnnnn%nnrrrmrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrmmmmmmmnNmmmmmmrrmmNmmmmrr1111111111";
    function charType(code) {
      if (code <= 0xf7) { return lowTypes.charAt(code) }
      else if (0x590 <= code && code <= 0x5f4) { return "R" }
      else if (0x600 <= code && code <= 0x6f9) { return arabicTypes.charAt(code - 0x600) }
      else if (0x6ee <= code && code <= 0x8ac) { return "r" }
      else if (0x2000 <= code && code <= 0x200b) { return "w" }
      else if (code == 0x200c) { return "b" }
      else { return "L" }
    }

    var bidiRE = /[\u0590-\u05f4\u0600-\u06ff\u0700-\u08ac]/;
    var isNeutral = /[stwN]/, isStrong = /[LRr]/, countsAsLeft = /[Lb1n]/, countsAsNum = /[1n]/;

    function BidiSpan(level, from, to) {
      this.level = level;
      this.from = from; this.to = to;
    }

    return function(str, direction) {
      var outerType = direction == "ltr" ? "L" : "R";

      if (str.length == 0 || direction == "ltr" && !bidiRE.test(str)) { return false }
      var len = str.length, types = [];
      for (var i = 0; i < len; ++i)
        { types.push(charType(str.charCodeAt(i))); }

      // W1. Examine each non-spacing mark (NSM) in the level run, and
      // change the type of the NSM to the type of the previous
      // character. If the NSM is at the start of the level run, it will
      // get the type of sor.
      for (var i$1 = 0, prev = outerType; i$1 < len; ++i$1) {
        var type = types[i$1];
        if (type == "m") { types[i$1] = prev; }
        else { prev = type; }
      }

      // W2. Search backwards from each instance of a European number
      // until the first strong type (R, L, AL, or sor) is found. If an
      // AL is found, change the type of the European number to Arabic
      // number.
      // W3. Change all ALs to R.
      for (var i$2 = 0, cur = outerType; i$2 < len; ++i$2) {
        var type$1 = types[i$2];
        if (type$1 == "1" && cur == "r") { types[i$2] = "n"; }
        else if (isStrong.test(type$1)) { cur = type$1; if (type$1 == "r") { types[i$2] = "R"; } }
      }

      // W4. A single European separator between two European numbers
      // changes to a European number. A single common separator between
      // two numbers of the same type changes to that type.
      for (var i$3 = 1, prev$1 = types[0]; i$3 < len - 1; ++i$3) {
        var type$2 = types[i$3];
        if (type$2 == "+" && prev$1 == "1" && types[i$3+1] == "1") { types[i$3] = "1"; }
        else if (type$2 == "," && prev$1 == types[i$3+1] &&
                 (prev$1 == "1" || prev$1 == "n")) { types[i$3] = prev$1; }
        prev$1 = type$2;
      }

      // W5. A sequence of European terminators adjacent to European
      // numbers changes to all European numbers.
      // W6. Otherwise, separators and terminators change to Other
      // Neutral.
      for (var i$4 = 0; i$4 < len; ++i$4) {
        var type$3 = types[i$4];
        if (type$3 == ",") { types[i$4] = "N"; }
        else if (type$3 == "%") {
          var end = (void 0);
          for (end = i$4 + 1; end < len && types[end] == "%"; ++end) {}
          var replace = (i$4 && types[i$4-1] == "!") || (end < len && types[end] == "1") ? "1" : "N";
          for (var j = i$4; j < end; ++j) { types[j] = replace; }
          i$4 = end - 1;
        }
      }

      // W7. Search backwards from each instance of a European number
      // until the first strong type (R, L, or sor) is found. If an L is
      // found, then change the type of the European number to L.
      for (var i$5 = 0, cur$1 = outerType; i$5 < len; ++i$5) {
        var type$4 = types[i$5];
        if (cur$1 == "L" && type$4 == "1") { types[i$5] = "L"; }
        else if (isStrong.test(type$4)) { cur$1 = type$4; }
      }

      // N1. A sequence of neutrals takes the direction of the
      // surrounding strong text if the text on both sides has the same
      // direction. European and Arabic numbers act as if they were R in
      // terms of their influence on neutrals. Start-of-level-run (sor)
      // and end-of-level-run (eor) are used at level run boundaries.
      // N2. Any remaining neutrals take the embedding direction.
      for (var i$6 = 0; i$6 < len; ++i$6) {
        if (isNeutral.test(types[i$6])) {
          var end$1 = (void 0);
          for (end$1 = i$6 + 1; end$1 < len && isNeutral.test(types[end$1]); ++end$1) {}
          var before = (i$6 ? types[i$6-1] : outerType) == "L";
          var after = (end$1 < len ? types[end$1] : outerType) == "L";
          var replace$1 = before == after ? (before ? "L" : "R") : outerType;
          for (var j$1 = i$6; j$1 < end$1; ++j$1) { types[j$1] = replace$1; }
          i$6 = end$1 - 1;
        }
      }

      // Here we depart from the documented algorithm, in order to avoid
      // building up an actual levels array. Since there are only three
      // levels (0, 1, 2) in an implementation that doesn't take
      // explicit embedding into account, we can build up the order on
      // the fly, without following the level-based algorithm.
      var order = [], m;
      for (var i$7 = 0; i$7 < len;) {
        if (countsAsLeft.test(types[i$7])) {
          var start = i$7;
          for (++i$7; i$7 < len && countsAsLeft.test(types[i$7]); ++i$7) {}
          order.push(new BidiSpan(0, start, i$7));
        } else {
          var pos = i$7, at = order.length;
          for (++i$7; i$7 < len && types[i$7] != "L"; ++i$7) {}
          for (var j$2 = pos; j$2 < i$7;) {
            if (countsAsNum.test(types[j$2])) {
              if (pos < j$2) { order.splice(at, 0, new BidiSpan(1, pos, j$2)); }
              var nstart = j$2;
              for (++j$2; j$2 < i$7 && countsAsNum.test(types[j$2]); ++j$2) {}
              order.splice(at, 0, new BidiSpan(2, nstart, j$2));
              pos = j$2;
            } else { ++j$2; }
          }
          if (pos < i$7) { order.splice(at, 0, new BidiSpan(1, pos, i$7)); }
        }
      }
      if (direction == "ltr") {
        if (order[0].level == 1 && (m = str.match(/^\s+/))) {
          order[0].from = m[0].length;
          order.unshift(new BidiSpan(0, 0, m[0].length));
        }
        if (lst(order).level == 1 && (m = str.match(/\s+$/))) {
          lst(order).to -= m[0].length;
          order.push(new BidiSpan(0, len - m[0].length, len));
        }
      }

      return direction == "rtl" ? order.reverse() : order
    }
  })();

  // Get the bidi ordering for the given line (and cache it). Returns
  // false for lines that are fully left-to-right, and an array of
  // BidiSpan objects otherwise.
  function getOrder(line, direction) {
    var order = line.order;
    if (order == null) { order = line.order = bidiOrdering(line.text, direction); }
    return order
  }

  // EVENT HANDLING

  // Lightweight event framework. on/off also work on DOM nodes,
  // registering native DOM handlers.

  var noHandlers = [];

  var on = function(emitter, type, f) {
    if (emitter.addEventListener) {
      emitter.addEventListener(type, f, false);
    } else if (emitter.attachEvent) {
      emitter.attachEvent("on" + type, f);
    } else {
      var map$$1 = emitter._handlers || (emitter._handlers = {});
      map$$1[type] = (map$$1[type] || noHandlers).concat(f);
    }
  };

  function getHandlers(emitter, type) {
    return emitter._handlers && emitter._handlers[type] || noHandlers
  }

  function off(emitter, type, f) {
    if (emitter.removeEventListener) {
      emitter.removeEventListener(type, f, false);
    } else if (emitter.detachEvent) {
      emitter.detachEvent("on" + type, f);
    } else {
      var map$$1 = emitter._handlers, arr = map$$1 && map$$1[type];
      if (arr) {
        var index = indexOf(arr, f);
        if (index > -1)
          { map$$1[type] = arr.slice(0, index).concat(arr.slice(index + 1)); }
      }
    }
  }

  function signal(emitter, type /*, values...*/) {
    var handlers = getHandlers(emitter, type);
    if (!handlers.length) { return }
    var args = Array.prototype.slice.call(arguments, 2);
    for (var i = 0; i < handlers.length; ++i) { handlers[i].apply(null, args); }
  }

  // The DOM events that CodeMirror handles can be overridden by
  // registering a (non-DOM) handler on the editor for the event name,
  // and preventDefault-ing the event in that handler.
  function signalDOMEvent(cm, e, override) {
    if (typeof e == "string")
      { e = {type: e, preventDefault: function() { this.defaultPrevented = true; }}; }
    signal(cm, override || e.type, cm, e);
    return e_defaultPrevented(e) || e.codemirrorIgnore
  }

  function signalCursorActivity(cm) {
    var arr = cm._handlers && cm._handlers.cursorActivity;
    if (!arr) { return }
    var set = cm.curOp.cursorActivityHandlers || (cm.curOp.cursorActivityHandlers = []);
    for (var i = 0; i < arr.length; ++i) { if (indexOf(set, arr[i]) == -1)
      { set.push(arr[i]); } }
  }

  function hasHandler(emitter, type) {
    return getHandlers(emitter, type).length > 0
  }

  // Add on and off methods to a constructor's prototype, to make
  // registering events on such objects more convenient.
  function eventMixin(ctor) {
    ctor.prototype.on = function(type, f) {on(this, type, f);};
    ctor.prototype.off = function(type, f) {off(this, type, f);};
  }

  // Due to the fact that we still support jurassic IE versions, some
  // compatibility wrappers are needed.

  function e_preventDefault(e) {
    if (e.preventDefault) { e.preventDefault(); }
    else { e.returnValue = false; }
  }
  function e_stopPropagation(e) {
    if (e.stopPropagation) { e.stopPropagation(); }
    else { e.cancelBubble = true; }
  }
  function e_defaultPrevented(e) {
    return e.defaultPrevented != null ? e.defaultPrevented : e.returnValue == false
  }
  function e_stop(e) {e_preventDefault(e); e_stopPropagation(e);}

  function e_target(e) {return e.target || e.srcElement}
  function e_button(e) {
    var b = e.which;
    if (b == null) {
      if (e.button & 1) { b = 1; }
      else if (e.button & 2) { b = 3; }
      else if (e.button & 4) { b = 2; }
    }
    if (mac && e.ctrlKey && b == 1) { b = 3; }
    return b
  }

  // Detect drag-and-drop
  var dragAndDrop = function() {
    // There is *some* kind of drag-and-drop support in IE6-8, but I
    // couldn't get it to work yet.
    if (ie && ie_version < 9) { return false }
    var div = elt('div');
    return "draggable" in div || "dragDrop" in div
  }();

  var zwspSupported;
  function zeroWidthElement(measure) {
    if (zwspSupported == null) {
      var test = elt("span", "\u200b");
      removeChildrenAndAdd(measure, elt("span", [test, document.createTextNode("x")]));
      if (measure.firstChild.offsetHeight != 0)
        { zwspSupported = test.offsetWidth <= 1 && test.offsetHeight > 2 && !(ie && ie_version < 8); }
    }
    var node = zwspSupported ? elt("span", "\u200b") :
      elt("span", "\u00a0", null, "display: inline-block; width: 1px; margin-right: -1px");
    node.setAttribute("cm-text", "");
    return node
  }

  // Feature-detect IE's crummy client rect reporting for bidi text
  var badBidiRects;
  function hasBadBidiRects(measure) {
    if (badBidiRects != null) { return badBidiRects }
    var txt = removeChildrenAndAdd(measure, document.createTextNode("A\u062eA"));
    var r0 = range(txt, 0, 1).getBoundingClientRect();
    var r1 = range(txt, 1, 2).getBoundingClientRect();
    removeChildren(measure);
    if (!r0 || r0.left == r0.right) { return false } // Safari returns null in some cases (#2780)
    return badBidiRects = (r1.right - r0.right < 3)
  }

  // See if "".split is the broken IE version, if so, provide an
  // alternative way to split lines.
  var splitLinesAuto = "\n\nb".split(/\n/).length != 3 ? function (string) {
    var pos = 0, result = [], l = string.length;
    while (pos <= l) {
      var nl = string.indexOf("\n", pos);
      if (nl == -1) { nl = string.length; }
      var line = string.slice(pos, string.charAt(nl - 1) == "\r" ? nl - 1 : nl);
      var rt = line.indexOf("\r");
      if (rt != -1) {
        result.push(line.slice(0, rt));
        pos += rt + 1;
      } else {
        result.push(line);
        pos = nl + 1;
      }
    }
    return result
  } : function (string) { return string.split(/\r\n?|\n/); };

  var hasSelection = window.getSelection ? function (te) {
    try { return te.selectionStart != te.selectionEnd }
    catch(e) { return false }
  } : function (te) {
    var range$$1;
    try {range$$1 = te.ownerDocument.selection.createRange();}
    catch(e) {}
    if (!range$$1 || range$$1.parentElement() != te) { return false }
    return range$$1.compareEndPoints("StartToEnd", range$$1) != 0
  };

  var hasCopyEvent = (function () {
    var e = elt("div");
    if ("oncopy" in e) { return true }
    e.setAttribute("oncopy", "return;");
    return typeof e.oncopy == "function"
  })();

  var badZoomedRects = null;
  function hasBadZoomedRects(measure) {
    if (badZoomedRects != null) { return badZoomedRects }
    var node = removeChildrenAndAdd(measure, elt("span", "x"));
    var normal = node.getBoundingClientRect();
    var fromRange = range(node, 0, 1).getBoundingClientRect();
    return badZoomedRects = Math.abs(normal.left - fromRange.left) > 1
  }

  // Known modes, by name and by MIME
  var modes = {}, mimeModes = {};

  // Extra arguments are stored as the mode's dependencies, which is
  // used by (legacy) mechanisms like loadmode.js to automatically
  // load a mode. (Preferred mechanism is the require/define calls.)
  function defineMode(name, mode) {
    if (arguments.length > 2)
      { mode.dependencies = Array.prototype.slice.call(arguments, 2); }
    modes[name] = mode;
  }

  function defineMIME(mime, spec) {
    mimeModes[mime] = spec;
  }

  // Given a MIME type, a {name, ...options} config object, or a name
  // string, return a mode config object.
  function resolveMode(spec) {
    if (typeof spec == "string" && mimeModes.hasOwnProperty(spec)) {
      spec = mimeModes[spec];
    } else if (spec && typeof spec.name == "string" && mimeModes.hasOwnProperty(spec.name)) {
      var found = mimeModes[spec.name];
      if (typeof found == "string") { found = {name: found}; }
      spec = createObj(found, spec);
      spec.name = found.name;
    } else if (typeof spec == "string" && /^[\w\-]+\/[\w\-]+\+xml$/.test(spec)) {
      return resolveMode("application/xml")
    } else if (typeof spec == "string" && /^[\w\-]+\/[\w\-]+\+json$/.test(spec)) {
      return resolveMode("application/json")
    }
    if (typeof spec == "string") { return {name: spec} }
    else { return spec || {name: "null"} }
  }

  // Given a mode spec (anything that resolveMode accepts), find and
  // initialize an actual mode object.
  function getMode(options, spec) {
    spec = resolveMode(spec);
    var mfactory = modes[spec.name];
    if (!mfactory) { return getMode(options, "text/plain") }
    var modeObj = mfactory(options, spec);
    if (modeExtensions.hasOwnProperty(spec.name)) {
      var exts = modeExtensions[spec.name];
      for (var prop in exts) {
        if (!exts.hasOwnProperty(prop)) { continue }
        if (modeObj.hasOwnProperty(prop)) { modeObj["_" + prop] = modeObj[prop]; }
        modeObj[prop] = exts[prop];
      }
    }
    modeObj.name = spec.name;
    if (spec.helperType) { modeObj.helperType = spec.helperType; }
    if (spec.modeProps) { for (var prop$1 in spec.modeProps)
      { modeObj[prop$1] = spec.modeProps[prop$1]; } }

    return modeObj
  }

  // This can be used to attach properties to mode objects from
  // outside the actual mode definition.
  var modeExtensions = {};
  function extendMode(mode, properties) {
    var exts = modeExtensions.hasOwnProperty(mode) ? modeExtensions[mode] : (modeExtensions[mode] = {});
    copyObj(properties, exts);
  }

  function copyState(mode, state) {
    if (state === true) { return state }
    if (mode.copyState) { return mode.copyState(state) }
    var nstate = {};
    for (var n in state) {
      var val = state[n];
      if (val instanceof Array) { val = val.concat([]); }
      nstate[n] = val;
    }
    return nstate
  }

  // Given a mode and a state (for that mode), find the inner mode and
  // state at the position that the state refers to.
  function innerMode(mode, state) {
    var info;
    while (mode.innerMode) {
      info = mode.innerMode(state);
      if (!info || info.mode == mode) { break }
      state = info.state;
      mode = info.mode;
    }
    return info || {mode: mode, state: state}
  }

  function startState(mode, a1, a2) {
    return mode.startState ? mode.startState(a1, a2) : true
  }

  // STRING STREAM

  // Fed to the mode parsers, provides helper functions to make
  // parsers more succinct.

  var StringStream = function(string, tabSize, lineOracle) {
    this.pos = this.start = 0;
    this.string = string;
    this.tabSize = tabSize || 8;
    this.lastColumnPos = this.lastColumnValue = 0;
    this.lineStart = 0;
    this.lineOracle = lineOracle;
  };

  StringStream.prototype.eol = function () {return this.pos >= this.string.length};
  StringStream.prototype.sol = function () {return this.pos == this.lineStart};
  StringStream.prototype.peek = function () {return this.string.charAt(this.pos) || undefined};
  StringStream.prototype.next = function () {
    if (this.pos < this.string.length)
      { return this.string.charAt(this.pos++) }
  };
  StringStream.prototype.eat = function (match) {
    var ch = this.string.charAt(this.pos);
    var ok;
    if (typeof match == "string") { ok = ch == match; }
    else { ok = ch && (match.test ? match.test(ch) : match(ch)); }
    if (ok) {++this.pos; return ch}
  };
  StringStream.prototype.eatWhile = function (match) {
    var start = this.pos;
    while (this.eat(match)){}
    return this.pos > start
  };
  StringStream.prototype.eatSpace = function () {
      var this$1 = this;

    var start = this.pos;
    while (/[\s\u00a0]/.test(this.string.charAt(this.pos))) { ++this$1.pos; }
    return this.pos > start
  };
  StringStream.prototype.skipToEnd = function () {this.pos = this.string.length;};
  StringStream.prototype.skipTo = function (ch) {
    var found = this.string.indexOf(ch, this.pos);
    if (found > -1) {this.pos = found; return true}
  };
  StringStream.prototype.backUp = function (n) {this.pos -= n;};
  StringStream.prototype.column = function () {
    if (this.lastColumnPos < this.start) {
      this.lastColumnValue = countColumn(this.string, this.start, this.tabSize, this.lastColumnPos, this.lastColumnValue);
      this.lastColumnPos = this.start;
    }
    return this.lastColumnValue - (this.lineStart ? countColumn(this.string, this.lineStart, this.tabSize) : 0)
  };
  StringStream.prototype.indentation = function () {
    return countColumn(this.string, null, this.tabSize) -
      (this.lineStart ? countColumn(this.string, this.lineStart, this.tabSize) : 0)
  };
  StringStream.prototype.match = function (pattern, consume, caseInsensitive) {
    if (typeof pattern == "string") {
      var cased = function (str) { return caseInsensitive ? str.toLowerCase() : str; };
      var substr = this.string.substr(this.pos, pattern.length);
      if (cased(substr) == cased(pattern)) {
        if (consume !== false) { this.pos += pattern.length; }
        return true
      }
    } else {
      var match = this.string.slice(this.pos).match(pattern);
      if (match && match.index > 0) { return null }
      if (match && consume !== false) { this.pos += match[0].length; }
      return match
    }
  };
  StringStream.prototype.current = function (){return this.string.slice(this.start, this.pos)};
  StringStream.prototype.hideFirstChars = function (n, inner) {
    this.lineStart += n;
    try { return inner() }
    finally { this.lineStart -= n; }
  };
  StringStream.prototype.lookAhead = function (n) {
    var oracle = this.lineOracle;
    return oracle && oracle.lookAhead(n)
  };
  StringStream.prototype.baseToken = function () {
    var oracle = this.lineOracle;
    return oracle && oracle.baseToken(this.pos)
  };

  var SavedContext = function(state, lookAhead) {
    this.state = state;
    this.lookAhead = lookAhead;
  };

  var Context = function(doc, state, line, lookAhead) {
    this.state = state;
    this.doc = doc;
    this.line = line;
    this.maxLookAhead = lookAhead || 0;
    this.baseTokens = null;
    this.baseTokenPos = 1;
  };

  Context.prototype.lookAhead = function (n) {
    var line = this.doc.getLine(this.line + n);
    if (line != null && n > this.maxLookAhead) { this.maxLookAhead = n; }
    return line
  };

  Context.prototype.baseToken = function (n) {
      var this$1 = this;

    if (!this.baseTokens) { return null }
    while (this.baseTokens[this.baseTokenPos] <= n)
      { this$1.baseTokenPos += 2; }
    var type = this.baseTokens[this.baseTokenPos + 1];
    return {type: type && type.replace(/( |^)overlay .*/, ""),
            size: this.baseTokens[this.baseTokenPos] - n}
  };

  Context.prototype.nextLine = function () {
    this.line++;
    if (this.maxLookAhead > 0) { this.maxLookAhead--; }
  };

  Context.fromSaved = function (doc, saved, line) {
    if (saved instanceof SavedContext)
      { return new Context(doc, copyState(doc.mode, saved.state), line, saved.lookAhead) }
    else
      { return new Context(doc, copyState(doc.mode, saved), line) }
  };

  Context.prototype.save = function (copy) {
    var state = copy !== false ? copyState(this.doc.mode, this.state) : this.state;
    return this.maxLookAhead > 0 ? new SavedContext(state, this.maxLookAhead) : state
  };


  // Compute a style array (an array starting with a mode generation
  // -- for invalidation -- followed by pairs of end positions and
  // style strings), which is used to highlight the tokens on the
  // line.
  function highlightLine(cm, line, context, forceToEnd) {
    // A styles array always starts with a number identifying the
    // mode/overlays that it is based on (for easy invalidation).
    var st = [cm.state.modeGen], lineClasses = {};
    // Compute the base array of styles
    runMode(cm, line.text, cm.doc.mode, context, function (end, style) { return st.push(end, style); },
            lineClasses, forceToEnd);
    var state = context.state;

    // Run overlays, adjust style array.
    var loop = function ( o ) {
      context.baseTokens = st;
      var overlay = cm.state.overlays[o], i = 1, at = 0;
      context.state = true;
      runMode(cm, line.text, overlay.mode, context, function (end, style) {
        var start = i;
        // Ensure there's a token end at the current position, and that i points at it
        while (at < end) {
          var i_end = st[i];
          if (i_end > end)
            { st.splice(i, 1, end, st[i+1], i_end); }
          i += 2;
          at = Math.min(end, i_end);
        }
        if (!style) { return }
        if (overlay.opaque) {
          st.splice(start, i - start, end, "overlay " + style);
          i = start + 2;
        } else {
          for (; start < i; start += 2) {
            var cur = st[start+1];
            st[start+1] = (cur ? cur + " " : "") + "overlay " + style;
          }
        }
      }, lineClasses);
      context.state = state;
      context.baseTokens = null;
      context.baseTokenPos = 1;
    };

    for (var o = 0; o < cm.state.overlays.length; ++o) loop( o );

    return {styles: st, classes: lineClasses.bgClass || lineClasses.textClass ? lineClasses : null}
  }

  function getLineStyles(cm, line, updateFrontier) {
    if (!line.styles || line.styles[0] != cm.state.modeGen) {
      var context = getContextBefore(cm, lineNo(line));
      var resetState = line.text.length > cm.options.maxHighlightLength && copyState(cm.doc.mode, context.state);
      var result = highlightLine(cm, line, context);
      if (resetState) { context.state = resetState; }
      line.stateAfter = context.save(!resetState);
      line.styles = result.styles;
      if (result.classes) { line.styleClasses = result.classes; }
      else if (line.styleClasses) { line.styleClasses = null; }
      if (updateFrontier === cm.doc.highlightFrontier)
        { cm.doc.modeFrontier = Math.max(cm.doc.modeFrontier, ++cm.doc.highlightFrontier); }
    }
    return line.styles
  }

  function getContextBefore(cm, n, precise) {
    var doc = cm.doc, display = cm.display;
    if (!doc.mode.startState) { return new Context(doc, true, n) }
    var start = findStartLine(cm, n, precise);
    var saved = start > doc.first && getLine(doc, start - 1).stateAfter;
    var context = saved ? Context.fromSaved(doc, saved, start) : new Context(doc, startState(doc.mode), start);

    doc.iter(start, n, function (line) {
      processLine(cm, line.text, context);
      var pos = context.line;
      line.stateAfter = pos == n - 1 || pos % 5 == 0 || pos >= display.viewFrom && pos < display.viewTo ? context.save() : null;
      context.nextLine();
    });
    if (precise) { doc.modeFrontier = context.line; }
    return context
  }

  // Lightweight form of highlight -- proceed over this line and
  // update state, but don't save a style array. Used for lines that
  // aren't currently visible.
  function processLine(cm, text, context, startAt) {
    var mode = cm.doc.mode;
    var stream = new StringStream(text, cm.options.tabSize, context);
    stream.start = stream.pos = startAt || 0;
    if (text == "") { callBlankLine(mode, context.state); }
    while (!stream.eol()) {
      readToken(mode, stream, context.state);
      stream.start = stream.pos;
    }
  }

  function callBlankLine(mode, state) {
    if (mode.blankLine) { return mode.blankLine(state) }
    if (!mode.innerMode) { return }
    var inner = innerMode(mode, state);
    if (inner.mode.blankLine) { return inner.mode.blankLine(inner.state) }
  }

  function readToken(mode, stream, state, inner) {
    for (var i = 0; i < 10; i++) {
      if (inner) { inner[0] = innerMode(mode, state).mode; }
      var style = mode.token(stream, state);
      if (stream.pos > stream.start) { return style }
    }
    throw new Error("Mode " + mode.name + " failed to advance stream.")
  }

  var Token = function(stream, type, state) {
    this.start = stream.start; this.end = stream.pos;
    this.string = stream.current();
    this.type = type || null;
    this.state = state;
  };

  // Utility for getTokenAt and getLineTokens
  function takeToken(cm, pos, precise, asArray) {
    var doc = cm.doc, mode = doc.mode, style;
    pos = clipPos(doc, pos);
    var line = getLine(doc, pos.line), context = getContextBefore(cm, pos.line, precise);
    var stream = new StringStream(line.text, cm.options.tabSize, context), tokens;
    if (asArray) { tokens = []; }
    while ((asArray || stream.pos < pos.ch) && !stream.eol()) {
      stream.start = stream.pos;
      style = readToken(mode, stream, context.state);
      if (asArray) { tokens.push(new Token(stream, style, copyState(doc.mode, context.state))); }
    }
    return asArray ? tokens : new Token(stream, style, context.state)
  }

  function extractLineClasses(type, output) {
    if (type) { for (;;) {
      var lineClass = type.match(/(?:^|\s+)line-(background-)?(\S+)/);
      if (!lineClass) { break }
      type = type.slice(0, lineClass.index) + type.slice(lineClass.index + lineClass[0].length);
      var prop = lineClass[1] ? "bgClass" : "textClass";
      if (output[prop] == null)
        { output[prop] = lineClass[2]; }
      else if (!(new RegExp("(?:^|\s)" + lineClass[2] + "(?:$|\s)")).test(output[prop]))
        { output[prop] += " " + lineClass[2]; }
    } }
    return type
  }

  // Run the given mode's parser over a line, calling f for each token.
  function runMode(cm, text, mode, context, f, lineClasses, forceToEnd) {
    var flattenSpans = mode.flattenSpans;
    if (flattenSpans == null) { flattenSpans = cm.options.flattenSpans; }
    var curStart = 0, curStyle = null;
    var stream = new StringStream(text, cm.options.tabSize, context), style;
    var inner = cm.options.addModeClass && [null];
    if (text == "") { extractLineClasses(callBlankLine(mode, context.state), lineClasses); }
    while (!stream.eol()) {
      if (stream.pos > cm.options.maxHighlightLength) {
        flattenSpans = false;
        if (forceToEnd) { processLine(cm, text, context, stream.pos); }
        stream.pos = text.length;
        style = null;
      } else {
        style = extractLineClasses(readToken(mode, stream, context.state, inner), lineClasses);
      }
      if (inner) {
        var mName = inner[0].name;
        if (mName) { style = "m-" + (style ? mName + " " + style : mName); }
      }
      if (!flattenSpans || curStyle != style) {
        while (curStart < stream.start) {
          curStart = Math.min(stream.start, curStart + 5000);
          f(curStart, curStyle);
        }
        curStyle = style;
      }
      stream.start = stream.pos;
    }
    while (curStart < stream.pos) {
      // Webkit seems to refuse to render text nodes longer than 57444
      // characters, and returns inaccurate measurements in nodes
      // starting around 5000 chars.
      var pos = Math.min(stream.pos, curStart + 5000);
      f(pos, curStyle);
      curStart = pos;
    }
  }

  // Finds the line to start with when starting a parse. Tries to
  // find a line with a stateAfter, so that it can start with a
  // valid state. If that fails, it returns the line with the
  // smallest indentation, which tends to need the least context to
  // parse correctly.
  function findStartLine(cm, n, precise) {
    var minindent, minline, doc = cm.doc;
    var lim = precise ? -1 : n - (cm.doc.mode.innerMode ? 1000 : 100);
    for (var search = n; search > lim; --search) {
      if (search <= doc.first) { return doc.first }
      var line = getLine(doc, search - 1), after = line.stateAfter;
      if (after && (!precise || search + (after instanceof SavedContext ? after.lookAhead : 0) <= doc.modeFrontier))
        { return search }
      var indented = countColumn(line.text, null, cm.options.tabSize);
      if (minline == null || minindent > indented) {
        minline = search - 1;
        minindent = indented;
      }
    }
    return minline
  }

  function retreatFrontier(doc, n) {
    doc.modeFrontier = Math.min(doc.modeFrontier, n);
    if (doc.highlightFrontier < n - 10) { return }
    var start = doc.first;
    for (var line = n - 1; line > start; line--) {
      var saved = getLine(doc, line).stateAfter;
      // change is on 3
      // state on line 1 looked ahead 2 -- so saw 3
      // test 1 + 2 < 3 should cover this
      if (saved && (!(saved instanceof SavedContext) || line + saved.lookAhead < n)) {
        start = line + 1;
        break
      }
    }
    doc.highlightFrontier = Math.min(doc.highlightFrontier, start);
  }

  // LINE DATA STRUCTURE

  // Line objects. These hold state related to a line, including
  // highlighting info (the styles array).
  var Line = function(text, markedSpans, estimateHeight) {
    this.text = text;
    attachMarkedSpans(this, markedSpans);
    this.height = estimateHeight ? estimateHeight(this) : 1;
  };

  Line.prototype.lineNo = function () { return lineNo(this) };
  eventMixin(Line);

  // Change the content (text, markers) of a line. Automatically
  // invalidates cached information and tries to re-estimate the
  // line's height.
  function updateLine(line, text, markedSpans, estimateHeight) {
    line.text = text;
    if (line.stateAfter) { line.stateAfter = null; }
    if (line.styles) { line.styles = null; }
    if (line.order != null) { line.order = null; }
    detachMarkedSpans(line);
    attachMarkedSpans(line, markedSpans);
    var estHeight = estimateHeight ? estimateHeight(line) : 1;
    if (estHeight != line.height) { updateLineHeight(line, estHeight); }
  }

  // Detach a line from the document tree and its markers.
  function cleanUpLine(line) {
    line.parent = null;
    detachMarkedSpans(line);
  }

  // Convert a style as returned by a mode (either null, or a string
  // containing one or more styles) to a CSS style. This is cached,
  // and also looks for line-wide styles.
  var styleToClassCache = {}, styleToClassCacheWithMode = {};
  function interpretTokenStyle(style, options) {
    if (!style || /^\s*$/.test(style)) { return null }
    var cache = options.addModeClass ? styleToClassCacheWithMode : styleToClassCache;
    return cache[style] ||
      (cache[style] = style.replace(/\S+/g, "cm-$&"))
  }

  // Render the DOM representation of the text of a line. Also builds
  // up a 'line map', which points at the DOM nodes that represent
  // specific stretches of text, and is used by the measuring code.
  // The returned object contains the DOM node, this map, and
  // information about line-wide styles that were set by the mode.
  function buildLineContent(cm, lineView) {
    // The padding-right forces the element to have a 'border', which
    // is needed on Webkit to be able to get line-level bounding
    // rectangles for it (in measureChar).
    var content = eltP("span", null, null, webkit ? "padding-right: .1px" : null);
    var builder = {pre: eltP("pre", [content], "CodeMirror-line"), content: content,
                   col: 0, pos: 0, cm: cm,
                   trailingSpace: false,
                   splitSpaces: cm.getOption("lineWrapping")};
    lineView.measure = {};

    // Iterate over the logical lines that make up this visual line.
    for (var i = 0; i <= (lineView.rest ? lineView.rest.length : 0); i++) {
      var line = i ? lineView.rest[i - 1] : lineView.line, order = (void 0);
      builder.pos = 0;
      builder.addToken = buildToken;
      // Optionally wire in some hacks into the token-rendering
      // algorithm, to deal with browser quirks.
      if (hasBadBidiRects(cm.display.measure) && (order = getOrder(line, cm.doc.direction)))
        { builder.addToken = buildTokenBadBidi(builder.addToken, order); }
      builder.map = [];
      var allowFrontierUpdate = lineView != cm.display.externalMeasured && lineNo(line);
      insertLineContent(line, builder, getLineStyles(cm, line, allowFrontierUpdate));
      if (line.styleClasses) {
        if (line.styleClasses.bgClass)
          { builder.bgClass = joinClasses(line.styleClasses.bgClass, builder.bgClass || ""); }
        if (line.styleClasses.textClass)
          { builder.textClass = joinClasses(line.styleClasses.textClass, builder.textClass || ""); }
      }

      // Ensure at least a single node is present, for measuring.
      if (builder.map.length == 0)
        { builder.map.push(0, 0, builder.content.appendChild(zeroWidthElement(cm.display.measure))); }

      // Store the map and a cache object for the current logical line
      if (i == 0) {
        lineView.measure.map = builder.map;
        lineView.measure.cache = {};
      } else {
  (lineView.measure.maps || (lineView.measure.maps = [])).push(builder.map)
        ;(lineView.measure.caches || (lineView.measure.caches = [])).push({});
      }
    }

    // See issue #2901
    if (webkit) {
      var last = builder.content.lastChild;
      if (/\bcm-tab\b/.test(last.className) || (last.querySelector && last.querySelector(".cm-tab")))
        { builder.content.className = "cm-tab-wrap-hack"; }
    }

    signal(cm, "renderLine", cm, lineView.line, builder.pre);
    if (builder.pre.className)
      { builder.textClass = joinClasses(builder.pre.className, builder.textClass || ""); }

    return builder
  }

  function defaultSpecialCharPlaceholder(ch) {
    var token = elt("span", "\u2022", "cm-invalidchar");
    token.title = "\\u" + ch.charCodeAt(0).toString(16);
    token.setAttribute("aria-label", token.title);
    return token
  }

  // Build up the DOM representation for a single token, and add it to
  // the line map. Takes care to render special characters separately.
  function buildToken(builder, text, style, startStyle, endStyle, title, css) {
    if (!text) { return }
    var displayText = builder.splitSpaces ? splitSpaces(text, builder.trailingSpace) : text;
    var special = builder.cm.state.specialChars, mustWrap = false;
    var content;
    if (!special.test(text)) {
      builder.col += text.length;
      content = document.createTextNode(displayText);
      builder.map.push(builder.pos, builder.pos + text.length, content);
      if (ie && ie_version < 9) { mustWrap = true; }
      builder.pos += text.length;
    } else {
      content = document.createDocumentFragment();
      var pos = 0;
      while (true) {
        special.lastIndex = pos;
        var m = special.exec(text);
        var skipped = m ? m.index - pos : text.length - pos;
        if (skipped) {
          var txt = document.createTextNode(displayText.slice(pos, pos + skipped));
          if (ie && ie_version < 9) { content.appendChild(elt("span", [txt])); }
          else { content.appendChild(txt); }
          builder.map.push(builder.pos, builder.pos + skipped, txt);
          builder.col += skipped;
          builder.pos += skipped;
        }
        if (!m) { break }
        pos += skipped + 1;
        var txt$1 = (void 0);
        if (m[0] == "\t") {
          var tabSize = builder.cm.options.tabSize, tabWidth = tabSize - builder.col % tabSize;
          txt$1 = content.appendChild(elt("span", spaceStr(tabWidth), "cm-tab"));
          txt$1.setAttribute("role", "presentation");
          txt$1.setAttribute("cm-text", "\t");
          builder.col += tabWidth;
        } else if (m[0] == "\r" || m[0] == "\n") {
          txt$1 = content.appendChild(elt("span", m[0] == "\r" ? "\u240d" : "\u2424", "cm-invalidchar"));
          txt$1.setAttribute("cm-text", m[0]);
          builder.col += 1;
        } else {
          txt$1 = builder.cm.options.specialCharPlaceholder(m[0]);
          txt$1.setAttribute("cm-text", m[0]);
          if (ie && ie_version < 9) { content.appendChild(elt("span", [txt$1])); }
          else { content.appendChild(txt$1); }
          builder.col += 1;
        }
        builder.map.push(builder.pos, builder.pos + 1, txt$1);
        builder.pos++;
      }
    }
    builder.trailingSpace = displayText.charCodeAt(text.length - 1) == 32;
    if (style || startStyle || endStyle || mustWrap || css) {
      var fullStyle = style || "";
      if (startStyle) { fullStyle += startStyle; }
      if (endStyle) { fullStyle += endStyle; }
      var token = elt("span", [content], fullStyle, css);
      if (title) { token.title = title; }
      return builder.content.appendChild(token)
    }
    builder.content.appendChild(content);
  }

  // Change some spaces to NBSP to prevent the browser from collapsing
  // trailing spaces at the end of a line when rendering text (issue #1362).
  function splitSpaces(text, trailingBefore) {
    if (text.length > 1 && !/  /.test(text)) { return text }
    var spaceBefore = trailingBefore, result = "";
    for (var i = 0; i < text.length; i++) {
      var ch = text.charAt(i);
      if (ch == " " && spaceBefore && (i == text.length - 1 || text.charCodeAt(i + 1) == 32))
        { ch = "\u00a0"; }
      result += ch;
      spaceBefore = ch == " ";
    }
    return result
  }

  // Work around nonsense dimensions being reported for stretches of
  // right-to-left text.
  function buildTokenBadBidi(inner, order) {
    return function (builder, text, style, startStyle, endStyle, title, css) {
      style = style ? style + " cm-force-border" : "cm-force-border";
      var start = builder.pos, end = start + text.length;
      for (;;) {
        // Find the part that overlaps with the start of this text
        var part = (void 0);
        for (var i = 0; i < order.length; i++) {
          part = order[i];
          if (part.to > start && part.from <= start) { break }
        }
        if (part.to >= end) { return inner(builder, text, style, startStyle, endStyle, title, css) }
        inner(builder, text.slice(0, part.to - start), style, startStyle, null, title, css);
        startStyle = null;
        text = text.slice(part.to - start);
        start = part.to;
      }
    }
  }

  function buildCollapsedSpan(builder, size, marker, ignoreWidget) {
    var widget = !ignoreWidget && marker.widgetNode;
    if (widget) { builder.map.push(builder.pos, builder.pos + size, widget); }
    if (!ignoreWidget && builder.cm.display.input.needsContentAttribute) {
      if (!widget)
        { widget = builder.content.appendChild(document.createElement("span")); }
      widget.setAttribute("cm-marker", marker.id);
    }
    if (widget) {
      builder.cm.display.input.setUneditable(widget);
      builder.content.appendChild(widget);
    }
    builder.pos += size;
    builder.trailingSpace = false;
  }

  // Outputs a number of spans to make up a line, taking highlighting
  // and marked text into account.
  function insertLineContent(line, builder, styles) {
    var spans = line.markedSpans, allText = line.text, at = 0;
    if (!spans) {
      for (var i$1 = 1; i$1 < styles.length; i$1+=2)
        { builder.addToken(builder, allText.slice(at, at = styles[i$1]), interpretTokenStyle(styles[i$1+1], builder.cm.options)); }
      return
    }

    var len = allText.length, pos = 0, i = 1, text = "", style, css;
    var nextChange = 0, spanStyle, spanEndStyle, spanStartStyle, title, collapsed;
    for (;;) {
      if (nextChange == pos) { // Update current marker set
        spanStyle = spanEndStyle = spanStartStyle = title = css = "";
        collapsed = null; nextChange = Infinity;
        var foundBookmarks = [], endStyles = (void 0);
        for (var j = 0; j < spans.length; ++j) {
          var sp = spans[j], m = sp.marker;
          if (m.type == "bookmark" && sp.from == pos && m.widgetNode) {
            foundBookmarks.push(m);
          } else if (sp.from <= pos && (sp.to == null || sp.to > pos || m.collapsed && sp.to == pos && sp.from == pos)) {
            if (sp.to != null && sp.to != pos && nextChange > sp.to) {
              nextChange = sp.to;
              spanEndStyle = "";
            }
            if (m.className) { spanStyle += " " + m.className; }
            if (m.css) { css = (css ? css + ";" : "") + m.css; }
            if (m.startStyle && sp.from == pos) { spanStartStyle += " " + m.startStyle; }
            if (m.endStyle && sp.to == nextChange) { (endStyles || (endStyles = [])).push(m.endStyle, sp.to); }
            if (m.title && !title) { title = m.title; }
            if (m.collapsed && (!collapsed || compareCollapsedMarkers(collapsed.marker, m) < 0))
              { collapsed = sp; }
          } else if (sp.from > pos && nextChange > sp.from) {
            nextChange = sp.from;
          }
        }
        if (endStyles) { for (var j$1 = 0; j$1 < endStyles.length; j$1 += 2)
          { if (endStyles[j$1 + 1] == nextChange) { spanEndStyle += " " + endStyles[j$1]; } } }

        if (!collapsed || collapsed.from == pos) { for (var j$2 = 0; j$2 < foundBookmarks.length; ++j$2)
          { buildCollapsedSpan(builder, 0, foundBookmarks[j$2]); } }
        if (collapsed && (collapsed.from || 0) == pos) {
          buildCollapsedSpan(builder, (collapsed.to == null ? len + 1 : collapsed.to) - pos,
                             collapsed.marker, collapsed.from == null);
          if (collapsed.to == null) { return }
          if (collapsed.to == pos) { collapsed = false; }
        }
      }
      if (pos >= len) { break }

      var upto = Math.min(len, nextChange);
      while (true) {
        if (text) {
          var end = pos + text.length;
          if (!collapsed) {
            var tokenText = end > upto ? text.slice(0, upto - pos) : text;
            builder.addToken(builder, tokenText, style ? style + spanStyle : spanStyle,
                             spanStartStyle, pos + tokenText.length == nextChange ? spanEndStyle : "", title, css);
          }
          if (end >= upto) {text = text.slice(upto - pos); pos = upto; break}
          pos = end;
          spanStartStyle = "";
        }
        text = allText.slice(at, at = styles[i++]);
        style = interpretTokenStyle(styles[i++], builder.cm.options);
      }
    }
  }


  // These objects are used to represent the visible (currently drawn)
  // part of the document. A LineView may correspond to multiple
  // logical lines, if those are connected by collapsed ranges.
  function LineView(doc, line, lineN) {
    // The starting line
    this.line = line;
    // Continuing lines, if any
    this.rest = visualLineContinued(line);
    // Number of logical lines in this visual line
    this.size = this.rest ? lineNo(lst(this.rest)) - lineN + 1 : 1;
    this.node = this.text = null;
    this.hidden = lineIsHidden(doc, line);
  }

  // Create a range of LineView objects for the given lines.
  function buildViewArray(cm, from, to) {
    var array = [], nextPos;
    for (var pos = from; pos < to; pos = nextPos) {
      var view = new LineView(cm.doc, getLine(cm.doc, pos), pos);
      nextPos = pos + view.size;
      array.push(view);
    }
    return array
  }

  var operationGroup = null;

  function pushOperation(op) {
    if (operationGroup) {
      operationGroup.ops.push(op);
    } else {
      op.ownsGroup = operationGroup = {
        ops: [op],
        delayedCallbacks: []
      };
    }
  }

  function fireCallbacksForOps(group) {
    // Calls delayed callbacks and cursorActivity handlers until no
    // new ones appear
    var callbacks = group.delayedCallbacks, i = 0;
    do {
      for (; i < callbacks.length; i++)
        { callbacks[i].call(null); }
      for (var j = 0; j < group.ops.length; j++) {
        var op = group.ops[j];
        if (op.cursorActivityHandlers)
          { while (op.cursorActivityCalled < op.cursorActivityHandlers.length)
            { op.cursorActivityHandlers[op.cursorActivityCalled++].call(null, op.cm); } }
      }
    } while (i < callbacks.length)
  }

  function finishOperation(op, endCb) {
    var group = op.ownsGroup;
    if (!group) { return }

    try { fireCallbacksForOps(group); }
    finally {
      operationGroup = null;
      endCb(group);
    }
  }

  var orphanDelayedCallbacks = null;

  // Often, we want to signal events at a point where we are in the
  // middle of some work, but don't want the handler to start calling
  // other methods on the editor, which might be in an inconsistent
  // state or simply not expect any other events to happen.
  // signalLater looks whether there are any handlers, and schedules
  // them to be executed when the last operation ends, or, if no
  // operation is active, when a timeout fires.
  function signalLater(emitter, type /*, values...*/) {
    var arr = getHandlers(emitter, type);
    if (!arr.length) { return }
    var args = Array.prototype.slice.call(arguments, 2), list;
    if (operationGroup) {
      list = operationGroup.delayedCallbacks;
    } else if (orphanDelayedCallbacks) {
      list = orphanDelayedCallbacks;
    } else {
      list = orphanDelayedCallbacks = [];
      setTimeout(fireOrphanDelayed, 0);
    }
    var loop = function ( i ) {
      list.push(function () { return arr[i].apply(null, args); });
    };

    for (var i = 0; i < arr.length; ++i)
      loop( i );
  }

  function fireOrphanDelayed() {
    var delayed = orphanDelayedCallbacks;
    orphanDelayedCallbacks = null;
    for (var i = 0; i < delayed.length; ++i) { delayed[i](); }
  }

  // When an aspect of a line changes, a string is added to
  // lineView.changes. This updates the relevant part of the line's
  // DOM structure.
  function updateLineForChanges(cm, lineView, lineN, dims) {
    for (var j = 0; j < lineView.changes.length; j++) {
      var type = lineView.changes[j];
      if (type == "text") { updateLineText(cm, lineView); }
      else if (type == "gutter") { updateLineGutter(cm, lineView, lineN, dims); }
      else if (type == "class") { updateLineClasses(cm, lineView); }
      else if (type == "widget") { updateLineWidgets(cm, lineView, dims); }
    }
    lineView.changes = null;
  }

  // Lines with gutter elements, widgets or a background class need to
  // be wrapped, and have the extra elements added to the wrapper div
  function ensureLineWrapped(lineView) {
    if (lineView.node == lineView.text) {
      lineView.node = elt("div", null, null, "position: relative");
      if (lineView.text.parentNode)
        { lineView.text.parentNode.replaceChild(lineView.node, lineView.text); }
      lineView.node.appendChild(lineView.text);
      if (ie && ie_version < 8) { lineView.node.style.zIndex = 2; }
    }
    return lineView.node
  }

  function updateLineBackground(cm, lineView) {
    var cls = lineView.bgClass ? lineView.bgClass + " " + (lineView.line.bgClass || "") : lineView.line.bgClass;
    if (cls) { cls += " CodeMirror-linebackground"; }
    if (lineView.background) {
      if (cls) { lineView.background.className = cls; }
      else { lineView.background.parentNode.removeChild(lineView.background); lineView.background = null; }
    } else if (cls) {
      var wrap = ensureLineWrapped(lineView);
      lineView.background = wrap.insertBefore(elt("div", null, cls), wrap.firstChild);
      cm.display.input.setUneditable(lineView.background);
    }
  }

  // Wrapper around buildLineContent which will reuse the structure
  // in display.externalMeasured when possible.
  function getLineContent(cm, lineView) {
    var ext = cm.display.externalMeasured;
    if (ext && ext.line == lineView.line) {
      cm.display.externalMeasured = null;
      lineView.measure = ext.measure;
      return ext.built
    }
    return buildLineContent(cm, lineView)
  }

  // Redraw the line's text. Interacts with the background and text
  // classes because the mode may output tokens that influence these
  // classes.
  function updateLineText(cm, lineView) {
    var cls = lineView.text.className;
    var built = getLineContent(cm, lineView);
    if (lineView.text == lineView.node) { lineView.node = built.pre; }
    lineView.text.parentNode.replaceChild(built.pre, lineView.text);
    lineView.text = built.pre;
    if (built.bgClass != lineView.bgClass || built.textClass != lineView.textClass) {
      lineView.bgClass = built.bgClass;
      lineView.textClass = built.textClass;
      updateLineClasses(cm, lineView);
    } else if (cls) {
      lineView.text.className = cls;
    }
  }

  function updateLineClasses(cm, lineView) {
    updateLineBackground(cm, lineView);
    if (lineView.line.wrapClass)
      { ensureLineWrapped(lineView).className = lineView.line.wrapClass; }
    else if (lineView.node != lineView.text)
      { lineView.node.className = ""; }
    var textClass = lineView.textClass ? lineView.textClass + " " + (lineView.line.textClass || "") : lineView.line.textClass;
    lineView.text.className = textClass || "";
  }

  function updateLineGutter(cm, lineView, lineN, dims) {
    if (lineView.gutter) {
      lineView.node.removeChild(lineView.gutter);
      lineView.gutter = null;
    }
    if (lineView.gutterBackground) {
      lineView.node.removeChild(lineView.gutterBackground);
      lineView.gutterBackground = null;
    }
    if (lineView.line.gutterClass) {
      var wrap = ensureLineWrapped(lineView);
      lineView.gutterBackground = elt("div", null, "CodeMirror-gutter-background " + lineView.line.gutterClass,
                                      ("left: " + (cm.options.fixedGutter ? dims.fixedPos : -dims.gutterTotalWidth) + "px; width: " + (dims.gutterTotalWidth) + "px"));
      cm.display.input.setUneditable(lineView.gutterBackground);
      wrap.insertBefore(lineView.gutterBackground, lineView.text);
    }
    var markers = lineView.line.gutterMarkers;
    if (cm.options.lineNumbers || markers) {
      var wrap$1 = ensureLineWrapped(lineView);
      var gutterWrap = lineView.gutter = elt("div", null, "CodeMirror-gutter-wrapper", ("left: " + (cm.options.fixedGutter ? dims.fixedPos : -dims.gutterTotalWidth) + "px"));
      cm.display.input.setUneditable(gutterWrap);
      wrap$1.insertBefore(gutterWrap, lineView.text);
      if (lineView.line.gutterClass)
        { gutterWrap.className += " " + lineView.line.gutterClass; }
      if (cm.options.lineNumbers && (!markers || !markers["CodeMirror-linenumbers"]))
        { lineView.lineNumber = gutterWrap.appendChild(
          elt("div", lineNumberFor(cm.options, lineN),
              "CodeMirror-linenumber CodeMirror-gutter-elt",
              ("left: " + (dims.gutterLeft["CodeMirror-linenumbers"]) + "px; width: " + (cm.display.lineNumInnerWidth) + "px"))); }
      if (markers) { for (var k = 0; k < cm.options.gutters.length; ++k) {
        var id = cm.options.gutters[k], found = markers.hasOwnProperty(id) && markers[id];
        if (found)
          { gutterWrap.appendChild(elt("div", [found], "CodeMirror-gutter-elt",
                                     ("left: " + (dims.gutterLeft[id]) + "px; width: " + (dims.gutterWidth[id]) + "px"))); }
      } }
    }
  }

  function updateLineWidgets(cm, lineView, dims) {
    if (lineView.alignable) { lineView.alignable = null; }
    for (var node = lineView.node.firstChild, next = (void 0); node; node = next) {
      next = node.nextSibling;
      if (node.className == "CodeMirror-linewidget")
        { lineView.node.removeChild(node); }
    }
    insertLineWidgets(cm, lineView, dims);
  }

  // Build a line's DOM representation from scratch
  function buildLineElement(cm, lineView, lineN, dims) {
    var built = getLineContent(cm, lineView);
    lineView.text = lineView.node = built.pre;
    if (built.bgClass) { lineView.bgClass = built.bgClass; }
    if (built.textClass) { lineView.textClass = built.textClass; }

    updateLineClasses(cm, lineView);
    updateLineGutter(cm, lineView, lineN, dims);
    insertLineWidgets(cm, lineView, dims);
    return lineView.node
  }

  // A lineView may contain multiple logical lines (when merged by
  // collapsed spans). The widgets for all of them need to be drawn.
  function insertLineWidgets(cm, lineView, dims) {
    insertLineWidgetsFor(cm, lineView.line, lineView, dims, true);
    if (lineView.rest) { for (var i = 0; i < lineView.rest.length; i++)
      { insertLineWidgetsFor(cm, lineView.rest[i], lineView, dims, false); } }
  }

  function insertLineWidgetsFor(cm, line, lineView, dims, allowAbove) {
    if (!line.widgets) { return }
    var wrap = ensureLineWrapped(lineView);
    for (var i = 0, ws = line.widgets; i < ws.length; ++i) {
      var widget = ws[i], node = elt("div", [widget.node], "CodeMirror-linewidget");
      if (!widget.handleMouseEvents) { node.setAttribute("cm-ignore-events", "true"); }
      positionLineWidget(widget, node, lineView, dims);
      cm.display.input.setUneditable(node);
      if (allowAbove && widget.above)
        { wrap.insertBefore(node, lineView.gutter || lineView.text); }
      else
        { wrap.appendChild(node); }
      signalLater(widget, "redraw");
    }
  }

  function positionLineWidget(widget, node, lineView, dims) {
    if (widget.noHScroll) {
  (lineView.alignable || (lineView.alignable = [])).push(node);
      var width = dims.wrapperWidth;
      node.style.left = dims.fixedPos + "px";
      if (!widget.coverGutter) {
        width -= dims.gutterTotalWidth;
        node.style.paddingLeft = dims.gutterTotalWidth + "px";
      }
      node.style.width = width + "px";
    }
    if (widget.coverGutter) {
      node.style.zIndex = 5;
      node.style.position = "relative";
      if (!widget.noHScroll) { node.style.marginLeft = -dims.gutterTotalWidth + "px"; }
    }
  }

  function widgetHeight(widget) {
    if (widget.height != null) { return widget.height }
    var cm = widget.doc.cm;
    if (!cm) { return 0 }
    if (!contains(document.body, widget.node)) {
      var parentStyle = "position: relative;";
      if (widget.coverGutter)
        { parentStyle += "margin-left: -" + cm.display.gutters.offsetWidth + "px;"; }
      if (widget.noHScroll)
        { parentStyle += "width: " + cm.display.wrapper.clientWidth + "px;"; }
      removeChildrenAndAdd(cm.display.measure, elt("div", [widget.node], null, parentStyle));
    }
    return widget.height = widget.node.parentNode.offsetHeight
  }

  // Return true when the given mouse event happened in a widget
  function eventInWidget(display, e) {
    for (var n = e_target(e); n != display.wrapper; n = n.parentNode) {
      if (!n || (n.nodeType == 1 && n.getAttribute("cm-ignore-events") == "true") ||
          (n.parentNode == display.sizer && n != display.mover))
        { return true }
    }
  }

  // POSITION MEASUREMENT

  function paddingTop(display) {return display.lineSpace.offsetTop}
  function paddingVert(display) {return display.mover.offsetHeight - display.lineSpace.offsetHeight}
  function paddingH(display) {
    if (display.cachedPaddingH) { return display.cachedPaddingH }
    var e = removeChildrenAndAdd(display.measure, elt("pre", "x"));
    var style = window.getComputedStyle ? window.getComputedStyle(e) : e.currentStyle;
    var data = {left: parseInt(style.paddingLeft), right: parseInt(style.paddingRight)};
    if (!isNaN(data.left) && !isNaN(data.right)) { display.cachedPaddingH = data; }
    return data
  }

  function scrollGap(cm) { return scrollerGap - cm.display.nativeBarWidth }
  function displayWidth(cm) {
    return cm.display.scroller.clientWidth - scrollGap(cm) - cm.display.barWidth
  }
  function displayHeight(cm) {
    return cm.display.scroller.clientHeight - scrollGap(cm) - cm.display.barHeight
  }

  // Ensure the lineView.wrapping.heights array is populated. This is
  // an array of bottom offsets for the lines that make up a drawn
  // line. When lineWrapping is on, there might be more than one
  // height.
  function ensureLineHeights(cm, lineView, rect) {
    var wrapping = cm.options.lineWrapping;
    var curWidth = wrapping && displayWidth(cm);
    if (!lineView.measure.heights || wrapping && lineView.measure.width != curWidth) {
      var heights = lineView.measure.heights = [];
      if (wrapping) {
        lineView.measure.width = curWidth;
        var rects = lineView.text.firstChild.getClientRects();
        for (var i = 0; i < rects.length - 1; i++) {
          var cur = rects[i], next = rects[i + 1];
          if (Math.abs(cur.bottom - next.bottom) > 2)
            { heights.push((cur.bottom + next.top) / 2 - rect.top); }
        }
      }
      heights.push(rect.bottom - rect.top);
    }
  }

  // Find a line map (mapping character offsets to text nodes) and a
  // measurement cache for the given line number. (A line view might
  // contain multiple lines when collapsed ranges are present.)
  function mapFromLineView(lineView, line, lineN) {
    if (lineView.line == line)
      { return {map: lineView.measure.map, cache: lineView.measure.cache} }
    for (var i = 0; i < lineView.rest.length; i++)
      { if (lineView.rest[i] == line)
        { return {map: lineView.measure.maps[i], cache: lineView.measure.caches[i]} } }
    for (var i$1 = 0; i$1 < lineView.rest.length; i$1++)
      { if (lineNo(lineView.rest[i$1]) > lineN)
        { return {map: lineView.measure.maps[i$1], cache: lineView.measure.caches[i$1], before: true} } }
  }

  // Render a line into the hidden node display.externalMeasured. Used
  // when measurement is needed for a line that's not in the viewport.
  function updateExternalMeasurement(cm, line) {
    line = visualLine(line);
    var lineN = lineNo(line);
    var view = cm.display.externalMeasured = new LineView(cm.doc, line, lineN);
    view.lineN = lineN;
    var built = view.built = buildLineContent(cm, view);
    view.text = built.pre;
    removeChildrenAndAdd(cm.display.lineMeasure, built.pre);
    return view
  }

  // Get a {top, bottom, left, right} box (in line-local coordinates)
  // for a given character.
  function measureChar(cm, line, ch, bias) {
    return measureCharPrepared(cm, prepareMeasureForLine(cm, line), ch, bias)
  }

  // Find a line view that corresponds to the given line number.
  function findViewForLine(cm, lineN) {
    if (lineN >= cm.display.viewFrom && lineN < cm.display.viewTo)
      { return cm.display.view[findViewIndex(cm, lineN)] }
    var ext = cm.display.externalMeasured;
    if (ext && lineN >= ext.lineN && lineN < ext.lineN + ext.size)
      { return ext }
  }

  // Measurement can be split in two steps, the set-up work that
  // applies to the whole line, and the measurement of the actual
  // character. Functions like coordsChar, that need to do a lot of
  // measurements in a row, can thus ensure that the set-up work is
  // only done once.
  function prepareMeasureForLine(cm, line) {
    var lineN = lineNo(line);
    var view = findViewForLine(cm, lineN);
    if (view && !view.text) {
      view = null;
    } else if (view && view.changes) {
      updateLineForChanges(cm, view, lineN, getDimensions(cm));
      cm.curOp.forceUpdate = true;
    }
    if (!view)
      { view = updateExternalMeasurement(cm, line); }

    var info = mapFromLineView(view, line, lineN);
    return {
      line: line, view: view, rect: null,
      map: info.map, cache: info.cache, before: info.before,
      hasHeights: false
    }
  }

  // Given a prepared measurement object, measures the position of an
  // actual character (or fetches it from the cache).
  function measureCharPrepared(cm, prepared, ch, bias, varHeight) {
    if (prepared.before) { ch = -1; }
    var key = ch + (bias || ""), found;
    if (prepared.cache.hasOwnProperty(key)) {
      found = prepared.cache[key];
    } else {
      if (!prepared.rect)
        { prepared.rect = prepared.view.text.getBoundingClientRect(); }
      if (!prepared.hasHeights) {
        ensureLineHeights(cm, prepared.view, prepared.rect);
        prepared.hasHeights = true;
      }
      found = measureCharInner(cm, prepared, ch, bias);
      if (!found.bogus) { prepared.cache[key] = found; }
    }
    return {left: found.left, right: found.right,
            top: varHeight ? found.rtop : found.top,
            bottom: varHeight ? found.rbottom : found.bottom}
  }

  var nullRect = {left: 0, right: 0, top: 0, bottom: 0};

  function nodeAndOffsetInLineMap(map$$1, ch, bias) {
    var node, start, end, collapse, mStart, mEnd;
    // First, search the line map for the text node corresponding to,
    // or closest to, the target character.
    for (var i = 0; i < map$$1.length; i += 3) {
      mStart = map$$1[i];
      mEnd = map$$1[i + 1];
      if (ch < mStart) {
        start = 0; end = 1;
        collapse = "left";
      } else if (ch < mEnd) {
        start = ch - mStart;
        end = start + 1;
      } else if (i == map$$1.length - 3 || ch == mEnd && map$$1[i + 3] > ch) {
        end = mEnd - mStart;
        start = end - 1;
        if (ch >= mEnd) { collapse = "right"; }
      }
      if (start != null) {
        node = map$$1[i + 2];
        if (mStart == mEnd && bias == (node.insertLeft ? "left" : "right"))
          { collapse = bias; }
        if (bias == "left" && start == 0)
          { while (i && map$$1[i - 2] == map$$1[i - 3] && map$$1[i - 1].insertLeft) {
            node = map$$1[(i -= 3) + 2];
            collapse = "left";
          } }
        if (bias == "right" && start == mEnd - mStart)
          { while (i < map$$1.length - 3 && map$$1[i + 3] == map$$1[i + 4] && !map$$1[i + 5].insertLeft) {
            node = map$$1[(i += 3) + 2];
            collapse = "right";
          } }
        break
      }
    }
    return {node: node, start: start, end: end, collapse: collapse, coverStart: mStart, coverEnd: mEnd}
  }

  function getUsefulRect(rects, bias) {
    var rect = nullRect;
    if (bias == "left") { for (var i = 0; i < rects.length; i++) {
      if ((rect = rects[i]).left != rect.right) { break }
    } } else { for (var i$1 = rects.length - 1; i$1 >= 0; i$1--) {
      if ((rect = rects[i$1]).left != rect.right) { break }
    } }
    return rect
  }

  function measureCharInner(cm, prepared, ch, bias) {
    var place = nodeAndOffsetInLineMap(prepared.map, ch, bias);
    var node = place.node, start = place.start, end = place.end, collapse = place.collapse;

    var rect;
    if (node.nodeType == 3) { // If it is a text node, use a range to retrieve the coordinates.
      for (var i$1 = 0; i$1 < 4; i$1++) { // Retry a maximum of 4 times when nonsense rectangles are returned
        while (start && isExtendingChar(prepared.line.text.charAt(place.coverStart + start))) { --start; }
        while (place.coverStart + end < place.coverEnd && isExtendingChar(prepared.line.text.charAt(place.coverStart + end))) { ++end; }
        if (ie && ie_version < 9 && start == 0 && end == place.coverEnd - place.coverStart)
          { rect = node.parentNode.getBoundingClientRect(); }
        else
          { rect = getUsefulRect(range(node, start, end).getClientRects(), bias); }
        if (rect.left || rect.right || start == 0) { break }
        end = start;
        start = start - 1;
        collapse = "right";
      }
      if (ie && ie_version < 11) { rect = maybeUpdateRectForZooming(cm.display.measure, rect); }
    } else { // If it is a widget, simply get the box for the whole widget.
      if (start > 0) { collapse = bias = "right"; }
      var rects;
      if (cm.options.lineWrapping && (rects = node.getClientRects()).length > 1)
        { rect = rects[bias == "right" ? rects.length - 1 : 0]; }
      else
        { rect = node.getBoundingClientRect(); }
    }
    if (ie && ie_version < 9 && !start && (!rect || !rect.left && !rect.right)) {
      var rSpan = node.parentNode.getClientRects()[0];
      if (rSpan)
        { rect = {left: rSpan.left, right: rSpan.left + charWidth(cm.display), top: rSpan.top, bottom: rSpan.bottom}; }
      else
        { rect = nullRect; }
    }

    var rtop = rect.top - prepared.rect.top, rbot = rect.bottom - prepared.rect.top;
    var mid = (rtop + rbot) / 2;
    var heights = prepared.view.measure.heights;
    var i = 0;
    for (; i < heights.length - 1; i++)
      { if (mid < heights[i]) { break } }
    var top = i ? heights[i - 1] : 0, bot = heights[i];
    var result = {left: (collapse == "right" ? rect.right : rect.left) - prepared.rect.left,
                  right: (collapse == "left" ? rect.left : rect.right) - prepared.rect.left,
                  top: top, bottom: bot};
    if (!rect.left && !rect.right) { result.bogus = true; }
    if (!cm.options.singleCursorHeightPerLine) { result.rtop = rtop; result.rbottom = rbot; }

    return result
  }

  // Work around problem with bounding client rects on ranges being
  // returned incorrectly when zoomed on IE10 and below.
  function maybeUpdateRectForZooming(measure, rect) {
    if (!window.screen || screen.logicalXDPI == null ||
        screen.logicalXDPI == screen.deviceXDPI || !hasBadZoomedRects(measure))
      { return rect }
    var scaleX = screen.logicalXDPI / screen.deviceXDPI;
    var scaleY = screen.logicalYDPI / screen.deviceYDPI;
    return {left: rect.left * scaleX, right: rect.right * scaleX,
            top: rect.top * scaleY, bottom: rect.bottom * scaleY}
  }

  function clearLineMeasurementCacheFor(lineView) {
    if (lineView.measure) {
      lineView.measure.cache = {};
      lineView.measure.heights = null;
      if (lineView.rest) { for (var i = 0; i < lineView.rest.length; i++)
        { lineView.measure.caches[i] = {}; } }
    }
  }

  function clearLineMeasurementCache(cm) {
    cm.display.externalMeasure = null;
    removeChildren(cm.display.lineMeasure);
    for (var i = 0; i < cm.display.view.length; i++)
      { clearLineMeasurementCacheFor(cm.display.view[i]); }
  }

  function clearCaches(cm) {
    clearLineMeasurementCache(cm);
    cm.display.cachedCharWidth = cm.display.cachedTextHeight = cm.display.cachedPaddingH = null;
    if (!cm.options.lineWrapping) { cm.display.maxLineChanged = true; }
    cm.display.lineNumChars = null;
  }

  function pageScrollX() {
    // Work around https://bugs.chromium.org/p/chromium/issues/detail?id=489206
    // which causes page_Offset and bounding client rects to use
    // different reference viewports and invalidate our calculations.
    if (chrome && android) { return -(document.body.getBoundingClientRect().left - parseInt(getComputedStyle(document.body).marginLeft)) }
    return window.pageXOffset || (document.documentElement || document.body).scrollLeft
  }
  function pageScrollY() {
    if (chrome && android) { return -(document.body.getBoundingClientRect().top - parseInt(getComputedStyle(document.body).marginTop)) }
    return window.pageYOffset || (document.documentElement || document.body).scrollTop
  }

  function widgetTopHeight(lineObj) {
    var height = 0;
    if (lineObj.widgets) { for (var i = 0; i < lineObj.widgets.length; ++i) { if (lineObj.widgets[i].above)
      { height += widgetHeight(lineObj.widgets[i]); } } }
    return height
  }

  // Converts a {top, bottom, left, right} box from line-local
  // coordinates into another coordinate system. Context may be one of
  // "line", "div" (display.lineDiv), "local"./null (editor), "window",
  // or "page".
  function intoCoordSystem(cm, lineObj, rect, context, includeWidgets) {
    if (!includeWidgets) {
      var height = widgetTopHeight(lineObj);
      rect.top += height; rect.bottom += height;
    }
    if (context == "line") { return rect }
    if (!context) { context = "local"; }
    var yOff = heightAtLine(lineObj);
    if (context == "local") { yOff += paddingTop(cm.display); }
    else { yOff -= cm.display.viewOffset; }
    if (context == "page" || context == "window") {
      var lOff = cm.display.lineSpace.getBoundingClientRect();
      yOff += lOff.top + (context == "window" ? 0 : pageScrollY());
      var xOff = lOff.left + (context == "window" ? 0 : pageScrollX());
      rect.left += xOff; rect.right += xOff;
    }
    rect.top += yOff; rect.bottom += yOff;
    return rect
  }

  // Coverts a box from "div" coords to another coordinate system.
  // Context may be "window", "page", "div", or "local"./null.
  function fromCoordSystem(cm, coords, context) {
    if (context == "div") { return coords }
    var left = coords.left, top = coords.top;
    // First move into "page" coordinate system
    if (context == "page") {
      left -= pageScrollX();
      top -= pageScrollY();
    } else if (context == "local" || !context) {
      var localBox = cm.display.sizer.getBoundingClientRect();
      left += localBox.left;
      top += localBox.top;
    }

    var lineSpaceBox = cm.display.lineSpace.getBoundingClientRect();
    return {left: left - lineSpaceBox.left, top: top - lineSpaceBox.top}
  }

  function charCoords(cm, pos, context, lineObj, bias) {
    if (!lineObj) { lineObj = getLine(cm.doc, pos.line); }
    return intoCoordSystem(cm, lineObj, measureChar(cm, lineObj, pos.ch, bias), context)
  }

  // Returns a box for a given cursor position, which may have an
  // 'other' property containing the position of the secondary cursor
  // on a bidi boundary.
  // A cursor Pos(line, char, "before") is on the same visual line as `char - 1`
  // and after `char - 1` in writing order of `char - 1`
  // A cursor Pos(line, char, "after") is on the same visual line as `char`
  // and before `char` in writing order of `char`
  // Examples (upper-case letters are RTL, lower-case are LTR):
  //     Pos(0, 1, ...)
  //     before   after
  // ab     a|b     a|b
  // aB     a|B     aB|
  // Ab     |Ab     A|b
  // AB     B|A     B|A
  // Every position after the last character on a line is considered to stick
  // to the last character on the line.
  function cursorCoords(cm, pos, context, lineObj, preparedMeasure, varHeight) {
    lineObj = lineObj || getLine(cm.doc, pos.line);
    if (!preparedMeasure) { preparedMeasure = prepareMeasureForLine(cm, lineObj); }
    function get(ch, right) {
      var m = measureCharPrepared(cm, preparedMeasure, ch, right ? "right" : "left", varHeight);
      if (right) { m.left = m.right; } else { m.right = m.left; }
      return intoCoordSystem(cm, lineObj, m, context)
    }
    var order = getOrder(lineObj, cm.doc.direction), ch = pos.ch, sticky = pos.sticky;
    if (ch >= lineObj.text.length) {
      ch = lineObj.text.length;
      sticky = "before";
    } else if (ch <= 0) {
      ch = 0;
      sticky = "after";
    }
    if (!order) { return get(sticky == "before" ? ch - 1 : ch, sticky == "before") }

    function getBidi(ch, partPos, invert) {
      var part = order[partPos], right = part.level == 1;
      return get(invert ? ch - 1 : ch, right != invert)
    }
    var partPos = getBidiPartAt(order, ch, sticky);
    var other = bidiOther;
    var val = getBidi(ch, partPos, sticky == "before");
    if (other != null) { val.other = getBidi(ch, other, sticky != "before"); }
    return val
  }

  // Used to cheaply estimate the coordinates for a position. Used for
  // intermediate scroll updates.
  function estimateCoords(cm, pos) {
    var left = 0;
    pos = clipPos(cm.doc, pos);
    if (!cm.options.lineWrapping) { left = charWidth(cm.display) * pos.ch; }
    var lineObj = getLine(cm.doc, pos.line);
    var top = heightAtLine(lineObj) + paddingTop(cm.display);
    return {left: left, right: left, top: top, bottom: top + lineObj.height}
  }

  // Positions returned by coordsChar contain some extra information.
  // xRel is the relative x position of the input coordinates compared
  // to the found position (so xRel > 0 means the coordinates are to
  // the right of the character position, for example). When outside
  // is true, that means the coordinates lie outside the line's
  // vertical range.
  function PosWithInfo(line, ch, sticky, outside, xRel) {
    var pos = Pos(line, ch, sticky);
    pos.xRel = xRel;
    if (outside) { pos.outside = true; }
    return pos
  }

  // Compute the character position closest to the given coordinates.
  // Input must be lineSpace-local ("div" coordinate system).
  function coordsChar(cm, x, y) {
    var doc = cm.doc;
    y += cm.display.viewOffset;
    if (y < 0) { return PosWithInfo(doc.first, 0, null, true, -1) }
    var lineN = lineAtHeight(doc, y), last = doc.first + doc.size - 1;
    if (lineN > last)
      { return PosWithInfo(doc.first + doc.size - 1, getLine(doc, last).text.length, null, true, 1) }
    if (x < 0) { x = 0; }

    var lineObj = getLine(doc, lineN);
    for (;;) {
      var found = coordsCharInner(cm, lineObj, lineN, x, y);
      var collapsed = collapsedSpanAround(lineObj, found.ch + (found.xRel > 0 ? 1 : 0));
      if (!collapsed) { return found }
      var rangeEnd = collapsed.find(1);
      if (rangeEnd.line == lineN) { return rangeEnd }
      lineObj = getLine(doc, lineN = rangeEnd.line);
    }
  }

  function wrappedLineExtent(cm, lineObj, preparedMeasure, y) {
    y -= widgetTopHeight(lineObj);
    var end = lineObj.text.length;
    var begin = findFirst(function (ch) { return measureCharPrepared(cm, preparedMeasure, ch - 1).bottom <= y; }, end, 0);
    end = findFirst(function (ch) { return measureCharPrepared(cm, preparedMeasure, ch).top > y; }, begin, end);
    return {begin: begin, end: end}
  }

  function wrappedLineExtentChar(cm, lineObj, preparedMeasure, target) {
    if (!preparedMeasure) { preparedMeasure = prepareMeasureForLine(cm, lineObj); }
    var targetTop = intoCoordSystem(cm, lineObj, measureCharPrepared(cm, preparedMeasure, target), "line").top;
    return wrappedLineExtent(cm, lineObj, preparedMeasure, targetTop)
  }

  // Returns true if the given side of a box is after the given
  // coordinates, in top-to-bottom, left-to-right order.
  function boxIsAfter(box, x, y, left) {
    return box.bottom <= y ? false : box.top > y ? true : (left ? box.left : box.right) > x
  }

  function coordsCharInner(cm, lineObj, lineNo$$1, x, y) {
    // Move y into line-local coordinate space
    y -= heightAtLine(lineObj);
    var preparedMeasure = prepareMeasureForLine(cm, lineObj);
    // When directly calling `measureCharPrepared`, we have to adjust
    // for the widgets at this line.
    var widgetHeight$$1 = widgetTopHeight(lineObj);
    var begin = 0, end = lineObj.text.length, ltr = true;

    var order = getOrder(lineObj, cm.doc.direction);
    // If the line isn't plain left-to-right text, first figure out
    // which bidi section the coordinates fall into.
    if (order) {
      var part = (cm.options.lineWrapping ? coordsBidiPartWrapped : coordsBidiPart)
                   (cm, lineObj, lineNo$$1, preparedMeasure, order, x, y);
      ltr = part.level != 1;
      // The awkward -1 offsets are needed because findFirst (called
      // on these below) will treat its first bound as inclusive,
      // second as exclusive, but we want to actually address the
      // characters in the part's range
      begin = ltr ? part.from : part.to - 1;
      end = ltr ? part.to : part.from - 1;
    }

    // A binary search to find the first character whose bounding box
    // starts after the coordinates. If we run across any whose box wrap
    // the coordinates, store that.
    var chAround = null, boxAround = null;
    var ch = findFirst(function (ch) {
      var box = measureCharPrepared(cm, preparedMeasure, ch);
      box.top += widgetHeight$$1; box.bottom += widgetHeight$$1;
      if (!boxIsAfter(box, x, y, false)) { return false }
      if (box.top <= y && box.left <= x) {
        chAround = ch;
        boxAround = box;
      }
      return true
    }, begin, end);

    var baseX, sticky, outside = false;
    // If a box around the coordinates was found, use that
    if (boxAround) {
      // Distinguish coordinates nearer to the left or right side of the box
      var atLeft = x - boxAround.left < boxAround.right - x, atStart = atLeft == ltr;
      ch = chAround + (atStart ? 0 : 1);
      sticky = atStart ? "after" : "before";
      baseX = atLeft ? boxAround.left : boxAround.right;
    } else {
      // (Adjust for extended bound, if necessary.)
      if (!ltr && (ch == end || ch == begin)) { ch++; }
      // To determine which side to associate with, get the box to the
      // left of the character and compare it's vertical position to the
      // coordinates
      sticky = ch == 0 ? "after" : ch == lineObj.text.length ? "before" :
        (measureCharPrepared(cm, preparedMeasure, ch - (ltr ? 1 : 0)).bottom + widgetHeight$$1 <= y) == ltr ?
        "after" : "before";
      // Now get accurate coordinates for this place, in order to get a
      // base X position
      var coords = cursorCoords(cm, Pos(lineNo$$1, ch, sticky), "line", lineObj, preparedMeasure);
      baseX = coords.left;
      outside = y < coords.top || y >= coords.bottom;
    }

    ch = skipExtendingChars(lineObj.text, ch, 1);
    return PosWithInfo(lineNo$$1, ch, sticky, outside, x - baseX)
  }

  function coordsBidiPart(cm, lineObj, lineNo$$1, preparedMeasure, order, x, y) {
    // Bidi parts are sorted left-to-right, and in a non-line-wrapping
    // situation, we can take this ordering to correspond to the visual
    // ordering. This finds the first part whose end is after the given
    // coordinates.
    var index = findFirst(function (i) {
      var part = order[i], ltr = part.level != 1;
      return boxIsAfter(cursorCoords(cm, Pos(lineNo$$1, ltr ? part.to : part.from, ltr ? "before" : "after"),
                                     "line", lineObj, preparedMeasure), x, y, true)
    }, 0, order.length - 1);
    var part = order[index];
    // If this isn't the first part, the part's start is also after
    // the coordinates, and the coordinates aren't on the same line as
    // that start, move one part back.
    if (index > 0) {
      var ltr = part.level != 1;
      var start = cursorCoords(cm, Pos(lineNo$$1, ltr ? part.from : part.to, ltr ? "after" : "before"),
                               "line", lineObj, preparedMeasure);
      if (boxIsAfter(start, x, y, true) && start.top > y)
        { part = order[index - 1]; }
    }
    return part
  }

  function coordsBidiPartWrapped(cm, lineObj, _lineNo, preparedMeasure, order, x, y) {
    // In a wrapped line, rtl text on wrapping boundaries can do things
    // that don't correspond to the ordering in our `order` array at
    // all, so a binary search doesn't work, and we want to return a
    // part that only spans one line so that the binary search in
    // coordsCharInner is safe. As such, we first find the extent of the
    // wrapped line, and then do a flat search in which we discard any
    // spans that aren't on the line.
    var ref = wrappedLineExtent(cm, lineObj, preparedMeasure, y);
    var begin = ref.begin;
    var end = ref.end;
    if (/\s/.test(lineObj.text.charAt(end - 1))) { end--; }
    var part = null, closestDist = null;
    for (var i = 0; i < order.length; i++) {
      var p = order[i];
      if (p.from >= end || p.to <= begin) { continue }
      var ltr = p.level != 1;
      var endX = measureCharPrepared(cm, preparedMeasure, ltr ? Math.min(end, p.to) - 1 : Math.max(begin, p.from)).right;
      // Weigh against spans ending before this, so that they are only
      // picked if nothing ends after
      var dist = endX < x ? x - endX + 1e9 : endX - x;
      if (!part || closestDist > dist) {
        part = p;
        closestDist = dist;
      }
    }
    if (!part) { part = order[order.length - 1]; }
    // Clip the part to the wrapped line.
    if (part.from < begin) { part = {from: begin, to: part.to, level: part.level}; }
    if (part.to > end) { part = {from: part.from, to: end, level: part.level}; }
    return part
  }

  var measureText;
  // Compute the default text height.
  function textHeight(display) {
    if (display.cachedTextHeight != null) { return display.cachedTextHeight }
    if (measureText == null) {
      measureText = elt("pre");
      // Measure a bunch of lines, for browsers that compute
      // fractional heights.
      for (var i = 0; i < 49; ++i) {
        measureText.appendChild(document.createTextNode("x"));
        measureText.appendChild(elt("br"));
      }
      measureText.appendChild(document.createTextNode("x"));
    }
    removeChildrenAndAdd(display.measure, measureText);
    var height = measureText.offsetHeight / 50;
    if (height > 3) { display.cachedTextHeight = height; }
    removeChildren(display.measure);
    return height || 1
  }

  // Compute the default character width.
  function charWidth(display) {
    if (display.cachedCharWidth != null) { return display.cachedCharWidth }
    var anchor = elt("span", "xxxxxxxxxx");
    var pre = elt("pre", [anchor]);
    removeChildrenAndAdd(display.measure, pre);
    var rect = anchor.getBoundingClientRect(), width = (rect.right - rect.left) / 10;
    if (width > 2) { display.cachedCharWidth = width; }
    return width || 10
  }

  // Do a bulk-read of the DOM positions and sizes needed to draw the
  // view, so that we don't interleave reading and writing to the DOM.
  function getDimensions(cm) {
    var d = cm.display, left = {}, width = {};
    var gutterLeft = d.gutters.clientLeft;
    for (var n = d.gutters.firstChild, i = 0; n; n = n.nextSibling, ++i) {
      left[cm.options.gutters[i]] = n.offsetLeft + n.clientLeft + gutterLeft;
      width[cm.options.gutters[i]] = n.clientWidth;
    }
    return {fixedPos: compensateForHScroll(d),
            gutterTotalWidth: d.gutters.offsetWidth,
            gutterLeft: left,
            gutterWidth: width,
            wrapperWidth: d.wrapper.clientWidth}
  }

  // Computes display.scroller.scrollLeft + display.gutters.offsetWidth,
  // but using getBoundingClientRect to get a sub-pixel-accurate
  // result.
  function compensateForHScroll(display) {
    return display.scroller.getBoundingClientRect().left - display.sizer.getBoundingClientRect().left
  }

  // Returns a function that estimates the height of a line, to use as
  // first approximation until the line becomes visible (and is thus
  // properly measurable).
  function estimateHeight(cm) {
    var th = textHeight(cm.display), wrapping = cm.options.lineWrapping;
    var perLine = wrapping && Math.max(5, cm.display.scroller.clientWidth / charWidth(cm.display) - 3);
    return function (line) {
      if (lineIsHidden(cm.doc, line)) { return 0 }

      var widgetsHeight = 0;
      if (line.widgets) { for (var i = 0; i < line.widgets.length; i++) {
        if (line.widgets[i].height) { widgetsHeight += line.widgets[i].height; }
      } }

      if (wrapping)
        { return widgetsHeight + (Math.ceil(line.text.length / perLine) || 1) * th }
      else
        { return widgetsHeight + th }
    }
  }

  function estimateLineHeights(cm) {
    var doc = cm.doc, est = estimateHeight(cm);
    doc.iter(function (line) {
      var estHeight = est(line);
      if (estHeight != line.height) { updateLineHeight(line, estHeight); }
    });
  }

  // Given a mouse event, find the corresponding position. If liberal
  // is false, it checks whether a gutter or scrollbar was clicked,
  // and returns null if it was. forRect is used by rectangular
  // selections, and tries to estimate a character position even for
  // coordinates beyond the right of the text.
  function posFromMouse(cm, e, liberal, forRect) {
    var display = cm.display;
    if (!liberal && e_target(e).getAttribute("cm-not-content") == "true") { return null }

    var x, y, space = display.lineSpace.getBoundingClientRect();
    // Fails unpredictably on IE[67] when mouse is dragged around quickly.
    try { x = e.clientX - space.left; y = e.clientY - space.top; }
    catch (e) { return null }
    var coords = coordsChar(cm, x, y), line;
    if (forRect && coords.xRel == 1 && (line = getLine(cm.doc, coords.line).text).length == coords.ch) {
      var colDiff = countColumn(line, line.length, cm.options.tabSize) - line.length;
      coords = Pos(coords.line, Math.max(0, Math.round((x - paddingH(cm.display).left) / charWidth(cm.display)) - colDiff));
    }
    return coords
  }

  // Find the view element corresponding to a given line. Return null
  // when the line isn't visible.
  function findViewIndex(cm, n) {
    if (n >= cm.display.viewTo) { return null }
    n -= cm.display.viewFrom;
    if (n < 0) { return null }
    var view = cm.display.view;
    for (var i = 0; i < view.length; i++) {
      n -= view[i].size;
      if (n < 0) { return i }
    }
  }

  function updateSelection(cm) {
    cm.display.input.showSelection(cm.display.input.prepareSelection());
  }

  function prepareSelection(cm, primary) {
    if ( primary === void 0 ) primary = true;

    var doc = cm.doc, result = {};
    var curFragment = result.cursors = document.createDocumentFragment();
    var selFragment = result.selection = document.createDocumentFragment();

    for (var i = 0; i < doc.sel.ranges.length; i++) {
      if (!primary && i == doc.sel.primIndex) { continue }
      var range$$1 = doc.sel.ranges[i];
      if (range$$1.from().line >= cm.display.viewTo || range$$1.to().line < cm.display.viewFrom) { continue }
      var collapsed = range$$1.empty();
      if (collapsed || cm.options.showCursorWhenSelecting)
        { drawSelectionCursor(cm, range$$1.head, curFragment); }
      if (!collapsed)
        { drawSelectionRange(cm, range$$1, selFragment); }
    }
    return result
  }

  // Draws a cursor for the given range
  function drawSelectionCursor(cm, head, output) {
    var pos = cursorCoords(cm, head, "div", null, null, !cm.options.singleCursorHeightPerLine);

    var cursor = output.appendChild(elt("div", "\u00a0", "CodeMirror-cursor"));
    cursor.style.left = pos.left + "px";
    cursor.style.top = pos.top + "px";
    cursor.style.height = Math.max(0, pos.bottom - pos.top) * cm.options.cursorHeight + "px";

    if (pos.other) {
      // Secondary cursor, shown when on a 'jump' in bi-directional text
      var otherCursor = output.appendChild(elt("div", "\u00a0", "CodeMirror-cursor CodeMirror-secondarycursor"));
      otherCursor.style.display = "";
      otherCursor.style.left = pos.other.left + "px";
      otherCursor.style.top = pos.other.top + "px";
      otherCursor.style.height = (pos.other.bottom - pos.other.top) * .85 + "px";
    }
  }

  function cmpCoords(a, b) { return a.top - b.top || a.left - b.left }

  // Draws the given range as a highlighted selection
  function drawSelectionRange(cm, range$$1, output) {
    var display = cm.display, doc = cm.doc;
    var fragment = document.createDocumentFragment();
    var padding = paddingH(cm.display), leftSide = padding.left;
    var rightSide = Math.max(display.sizerWidth, displayWidth(cm) - display.sizer.offsetLeft) - padding.right;
    var docLTR = doc.direction == "ltr";

    function add(left, top, width, bottom) {
      if (top < 0) { top = 0; }
      top = Math.round(top);
      bottom = Math.round(bottom);
      fragment.appendChild(elt("div", null, "CodeMirror-selected", ("position: absolute; left: " + left + "px;\n                             top: " + top + "px; width: " + (width == null ? rightSide - left : width) + "px;\n                             height: " + (bottom - top) + "px")));
    }

    function drawForLine(line, fromArg, toArg) {
      var lineObj = getLine(doc, line);
      var lineLen = lineObj.text.length;
      var start, end;
      function coords(ch, bias) {
        return charCoords(cm, Pos(line, ch), "div", lineObj, bias)
      }

      function wrapX(pos, dir, side) {
        var extent = wrappedLineExtentChar(cm, lineObj, null, pos);
        var prop = (dir == "ltr") == (side == "after") ? "left" : "right";
        var ch = side == "after" ? extent.begin : extent.end - (/\s/.test(lineObj.text.charAt(extent.end - 1)) ? 2 : 1);
        return coords(ch, prop)[prop]
      }

      var order = getOrder(lineObj, doc.direction);
      iterateBidiSections(order, fromArg || 0, toArg == null ? lineLen : toArg, function (from, to, dir, i) {
        var ltr = dir == "ltr";
        var fromPos = coords(from, ltr ? "left" : "right");
        var toPos = coords(to - 1, ltr ? "right" : "left");

        var openStart = fromArg == null && from == 0, openEnd = toArg == null && to == lineLen;
        var first = i == 0, last = !order || i == order.length - 1;
        if (toPos.top - fromPos.top <= 3) { // Single line
          var openLeft = (docLTR ? openStart : openEnd) && first;
          var openRight = (docLTR ? openEnd : openStart) && last;
          var left = openLeft ? leftSide : (ltr ? fromPos : toPos).left;
          var right = openRight ? rightSide : (ltr ? toPos : fromPos).right;
          add(left, fromPos.top, right - left, fromPos.bottom);
        } else { // Multiple lines
          var topLeft, topRight, botLeft, botRight;
          if (ltr) {
            topLeft = docLTR && openStart && first ? leftSide : fromPos.left;
            topRight = docLTR ? rightSide : wrapX(from, dir, "before");
            botLeft = docLTR ? leftSide : wrapX(to, dir, "after");
            botRight = docLTR && openEnd && last ? rightSide : toPos.right;
          } else {
            topLeft = !docLTR ? leftSide : wrapX(from, dir, "before");
            topRight = !docLTR && openStart && first ? rightSide : fromPos.right;
            botLeft = !docLTR && openEnd && last ? leftSide : toPos.left;
            botRight = !docLTR ? rightSide : wrapX(to, dir, "after");
          }
          add(topLeft, fromPos.top, topRight - topLeft, fromPos.bottom);
          if (fromPos.bottom < toPos.top) { add(leftSide, fromPos.bottom, null, toPos.top); }
          add(botLeft, toPos.top, botRight - botLeft, toPos.bottom);
        }

        if (!start || cmpCoords(fromPos, start) < 0) { start = fromPos; }
        if (cmpCoords(toPos, start) < 0) { start = toPos; }
        if (!end || cmpCoords(fromPos, end) < 0) { end = fromPos; }
        if (cmpCoords(toPos, end) < 0) { end = toPos; }
      });
      return {start: start, end: end}
    }

    var sFrom = range$$1.from(), sTo = range$$1.to();
    if (sFrom.line == sTo.line) {
      drawForLine(sFrom.line, sFrom.ch, sTo.ch);
    } else {
      var fromLine = getLine(doc, sFrom.line), toLine = getLine(doc, sTo.line);
      var singleVLine = visualLine(fromLine) == visualLine(toLine);
      var leftEnd = drawForLine(sFrom.line, sFrom.ch, singleVLine ? fromLine.text.length + 1 : null).end;
      var rightStart = drawForLine(sTo.line, singleVLine ? 0 : null, sTo.ch).start;
      if (singleVLine) {
        if (leftEnd.top < rightStart.top - 2) {
          add(leftEnd.right, leftEnd.top, null, leftEnd.bottom);
          add(leftSide, rightStart.top, rightStart.left, rightStart.bottom);
        } else {
          add(leftEnd.right, leftEnd.top, rightStart.left - leftEnd.right, leftEnd.bottom);
        }
      }
      if (leftEnd.bottom < rightStart.top)
        { add(leftSide, leftEnd.bottom, null, rightStart.top); }
    }

    output.appendChild(fragment);
  }

  // Cursor-blinking
  function restartBlink(cm) {
    if (!cm.state.focused) { return }
    var display = cm.display;
    clearInterval(display.blinker);
    var on = true;
    display.cursorDiv.style.visibility = "";
    if (cm.options.cursorBlinkRate > 0)
      { display.blinker = setInterval(function () { return display.cursorDiv.style.visibility = (on = !on) ? "" : "hidden"; },
        cm.options.cursorBlinkRate); }
    else if (cm.options.cursorBlinkRate < 0)
      { display.cursorDiv.style.visibility = "hidden"; }
  }

  function ensureFocus(cm) {
    if (!cm.state.focused) { cm.display.input.focus(); onFocus(cm); }
  }

  function delayBlurEvent(cm) {
    cm.state.delayingBlurEvent = true;
    setTimeout(function () { if (cm.state.delayingBlurEvent) {
      cm.state.delayingBlurEvent = false;
      onBlur(cm);
    } }, 100);
  }

  function onFocus(cm, e) {
    if (cm.state.delayingBlurEvent) { cm.state.delayingBlurEvent = false; }

    if (cm.options.readOnly == "nocursor") { return }
    if (!cm.state.focused) {
      signal(cm, "focus", cm, e);
      cm.state.focused = true;
      addClass(cm.display.wrapper, "CodeMirror-focused");
      // This test prevents this from firing when a context
      // menu is closed (since the input reset would kill the
      // select-all detection hack)
      if (!cm.curOp && cm.display.selForContextMenu != cm.doc.sel) {
        cm.display.input.reset();
        if (webkit) { setTimeout(function () { return cm.display.input.reset(true); }, 20); } // Issue #1730
      }
      cm.display.input.receivedFocus();
    }
    restartBlink(cm);
  }
  function onBlur(cm, e) {
    if (cm.state.delayingBlurEvent) { return }

    if (cm.state.focused) {
      signal(cm, "blur", cm, e);
      cm.state.focused = false;
      rmClass(cm.display.wrapper, "CodeMirror-focused");
    }
    clearInterval(cm.display.blinker);
    setTimeout(function () { if (!cm.state.focused) { cm.display.shift = false; } }, 150);
  }

  // Read the actual heights of the rendered lines, and update their
  // stored heights to match.
  function updateHeightsInViewport(cm) {
    var display = cm.display;
    var prevBottom = display.lineDiv.offsetTop;
    for (var i = 0; i < display.view.length; i++) {
      var cur = display.view[i], height = (void 0);
      if (cur.hidden) { continue }
      if (ie && ie_version < 8) {
        var bot = cur.node.offsetTop + cur.node.offsetHeight;
        height = bot - prevBottom;
        prevBottom = bot;
      } else {
        var box = cur.node.getBoundingClientRect();
        height = box.bottom - box.top;
      }
      var diff = cur.line.height - height;
      if (height < 2) { height = textHeight(display); }
      if (diff > .005 || diff < -.005) {
        updateLineHeight(cur.line, height);
        updateWidgetHeight(cur.line);
        if (cur.rest) { for (var j = 0; j < cur.rest.length; j++)
          { updateWidgetHeight(cur.rest[j]); } }
      }
    }
  }

  // Read and store the height of line widgets associated with the
  // given line.
  function updateWidgetHeight(line) {
    if (line.widgets) { for (var i = 0; i < line.widgets.length; ++i) {
      var w = line.widgets[i], parent = w.node.parentNode;
      if (parent) { w.height = parent.offsetHeight; }
    } }
  }

  // Compute the lines that are visible in a given viewport (defaults
  // the the current scroll position). viewport may contain top,
  // height, and ensure (see op.scrollToPos) properties.
  function visibleLines(display, doc, viewport) {
    var top = viewport && viewport.top != null ? Math.max(0, viewport.top) : display.scroller.scrollTop;
    top = Math.floor(top - paddingTop(display));
    var bottom = viewport && viewport.bottom != null ? viewport.bottom : top + display.wrapper.clientHeight;

    var from = lineAtHeight(doc, top), to = lineAtHeight(doc, bottom);
    // Ensure is a {from: {line, ch}, to: {line, ch}} object, and
    // forces those lines into the viewport (if possible).
    if (viewport && viewport.ensure) {
      var ensureFrom = viewport.ensure.from.line, ensureTo = viewport.ensure.to.line;
      if (ensureFrom < from) {
        from = ensureFrom;
        to = lineAtHeight(doc, heightAtLine(getLine(doc, ensureFrom)) + display.wrapper.clientHeight);
      } else if (Math.min(ensureTo, doc.lastLine()) >= to) {
        from = lineAtHeight(doc, heightAtLine(getLine(doc, ensureTo)) - display.wrapper.clientHeight);
        to = ensureTo;
      }
    }
    return {from: from, to: Math.max(to, from + 1)}
  }

  // Re-align line numbers and gutter marks to compensate for
  // horizontal scrolling.
  function alignHorizontally(cm) {
    var display = cm.display, view = display.view;
    if (!display.alignWidgets && (!display.gutters.firstChild || !cm.options.fixedGutter)) { return }
    var comp = compensateForHScroll(display) - display.scroller.scrollLeft + cm.doc.scrollLeft;
    var gutterW = display.gutters.offsetWidth, left = comp + "px";
    for (var i = 0; i < view.length; i++) { if (!view[i].hidden) {
      if (cm.options.fixedGutter) {
        if (view[i].gutter)
          { view[i].gutter.style.left = left; }
        if (view[i].gutterBackground)
          { view[i].gutterBackground.style.left = left; }
      }
      var align = view[i].alignable;
      if (align) { for (var j = 0; j < align.length; j++)
        { align[j].style.left = left; } }
    } }
    if (cm.options.fixedGutter)
      { display.gutters.style.left = (comp + gutterW) + "px"; }
  }

  // Used to ensure that the line number gutter is still the right
  // size for the current document size. Returns true when an update
  // is needed.
  function maybeUpdateLineNumberWidth(cm) {
    if (!cm.options.lineNumbers) { return false }
    var doc = cm.doc, last = lineNumberFor(cm.options, doc.first + doc.size - 1), display = cm.display;
    if (last.length != display.lineNumChars) {
      var test = display.measure.appendChild(elt("div", [elt("div", last)],
                                                 "CodeMirror-linenumber CodeMirror-gutter-elt"));
      var innerW = test.firstChild.offsetWidth, padding = test.offsetWidth - innerW;
      display.lineGutter.style.width = "";
      display.lineNumInnerWidth = Math.max(innerW, display.lineGutter.offsetWidth - padding) + 1;
      display.lineNumWidth = display.lineNumInnerWidth + padding;
      display.lineNumChars = display.lineNumInnerWidth ? last.length : -1;
      display.lineGutter.style.width = display.lineNumWidth + "px";
      updateGutterSpace(cm);
      return true
    }
    return false
  }

  // SCROLLING THINGS INTO VIEW

  // If an editor sits on the top or bottom of the window, partially
  // scrolled out of view, this ensures that the cursor is visible.
  function maybeScrollWindow(cm, rect) {
    if (signalDOMEvent(cm, "scrollCursorIntoView")) { return }

    var display = cm.display, box = display.sizer.getBoundingClientRect(), doScroll = null;
    if (rect.top + box.top < 0) { doScroll = true; }
    else if (rect.bottom + box.top > (window.innerHeight || document.documentElement.clientHeight)) { doScroll = false; }
    if (doScroll != null && !phantom) {
      var scrollNode = elt("div", "\u200b", null, ("position: absolute;\n                         top: " + (rect.top - display.viewOffset - paddingTop(cm.display)) + "px;\n                         height: " + (rect.bottom - rect.top + scrollGap(cm) + display.barHeight) + "px;\n                         left: " + (rect.left) + "px; width: " + (Math.max(2, rect.right - rect.left)) + "px;"));
      cm.display.lineSpace.appendChild(scrollNode);
      scrollNode.scrollIntoView(doScroll);
      cm.display.lineSpace.removeChild(scrollNode);
    }
  }

  // Scroll a given position into view (immediately), verifying that
  // it actually became visible (as line heights are accurately
  // measured, the position of something may 'drift' during drawing).
  function scrollPosIntoView(cm, pos, end, margin) {
    if (margin == null) { margin = 0; }
    var rect;
    if (!cm.options.lineWrapping && pos == end) {
      // Set pos and end to the cursor positions around the character pos sticks to
      // If pos.sticky == "before", that is around pos.ch - 1, otherwise around pos.ch
      // If pos == Pos(_, 0, "before"), pos and end are unchanged
      pos = pos.ch ? Pos(pos.line, pos.sticky == "before" ? pos.ch - 1 : pos.ch, "after") : pos;
      end = pos.sticky == "before" ? Pos(pos.line, pos.ch + 1, "before") : pos;
    }
    for (var limit = 0; limit < 5; limit++) {
      var changed = false;
      var coords = cursorCoords(cm, pos);
      var endCoords = !end || end == pos ? coords : cursorCoords(cm, end);
      rect = {left: Math.min(coords.left, endCoords.left),
              top: Math.min(coords.top, endCoords.top) - margin,
              right: Math.max(coords.left, endCoords.left),
              bottom: Math.max(coords.bottom, endCoords.bottom) + margin};
      var scrollPos = calculateScrollPos(cm, rect);
      var startTop = cm.doc.scrollTop, startLeft = cm.doc.scrollLeft;
      if (scrollPos.scrollTop != null) {
        updateScrollTop(cm, scrollPos.scrollTop);
        if (Math.abs(cm.doc.scrollTop - startTop) > 1) { changed = true; }
      }
      if (scrollPos.scrollLeft != null) {
        setScrollLeft(cm, scrollPos.scrollLeft);
        if (Math.abs(cm.doc.scrollLeft - startLeft) > 1) { changed = true; }
      }
      if (!changed) { break }
    }
    return rect
  }

  // Scroll a given set of coordinates into view (immediately).
  function scrollIntoView(cm, rect) {
    var scrollPos = calculateScrollPos(cm, rect);
    if (scrollPos.scrollTop != null) { updateScrollTop(cm, scrollPos.scrollTop); }
    if (scrollPos.scrollLeft != null) { setScrollLeft(cm, scrollPos.scrollLeft); }
  }

  // Calculate a new scroll position needed to scroll the given
  // rectangle into view. Returns an object with scrollTop and
  // scrollLeft properties. When these are undefined, the
  // vertical/horizontal position does not need to be adjusted.
  function calculateScrollPos(cm, rect) {
    var display = cm.display, snapMargin = textHeight(cm.display);
    if (rect.top < 0) { rect.top = 0; }
    var screentop = cm.curOp && cm.curOp.scrollTop != null ? cm.curOp.scrollTop : display.scroller.scrollTop;
    var screen = displayHeight(cm), result = {};
    if (rect.bottom - rect.top > screen) { rect.bottom = rect.top + screen; }
    var docBottom = cm.doc.height + paddingVert(display);
    var atTop = rect.top < snapMargin, atBottom = rect.bottom > docBottom - snapMargin;
    if (rect.top < screentop) {
      result.scrollTop = atTop ? 0 : rect.top;
    } else if (rect.bottom > screentop + screen) {
      var newTop = Math.min(rect.top, (atBottom ? docBottom : rect.bottom) - screen);
      if (newTop != screentop) { result.scrollTop = newTop; }
    }

    var screenleft = cm.curOp && cm.curOp.scrollLeft != null ? cm.curOp.scrollLeft : display.scroller.scrollLeft;
    var screenw = displayWidth(cm) - (cm.options.fixedGutter ? display.gutters.offsetWidth : 0);
    var tooWide = rect.right - rect.left > screenw;
    if (tooWide) { rect.right = rect.left + screenw; }
    if (rect.left < 10)
      { result.scrollLeft = 0; }
    else if (rect.left < screenleft)
      { result.scrollLeft = Math.max(0, rect.left - (tooWide ? 0 : 10)); }
    else if (rect.right > screenw + screenleft - 3)
      { result.scrollLeft = rect.right + (tooWide ? 0 : 10) - screenw; }
    return result
  }

  // Store a relative adjustment to the scroll position in the current
  // operation (to be applied when the operation finishes).
  function addToScrollTop(cm, top) {
    if (top == null) { return }
    resolveScrollToPos(cm);
    cm.curOp.scrollTop = (cm.curOp.scrollTop == null ? cm.doc.scrollTop : cm.curOp.scrollTop) + top;
  }

  // Make sure that at the end of the operation the current cursor is
  // shown.
  function ensureCursorVisible(cm) {
    resolveScrollToPos(cm);
    var cur = cm.getCursor();
    cm.curOp.scrollToPos = {from: cur, to: cur, margin: cm.options.cursorScrollMargin};
  }

  function scrollToCoords(cm, x, y) {
    if (x != null || y != null) { resolveScrollToPos(cm); }
    if (x != null) { cm.curOp.scrollLeft = x; }
    if (y != null) { cm.curOp.scrollTop = y; }
  }

  function scrollToRange(cm, range$$1) {
    resolveScrollToPos(cm);
    cm.curOp.scrollToPos = range$$1;
  }

  // When an operation has its scrollToPos property set, and another
  // scroll action is applied before the end of the operation, this
  // 'simulates' scrolling that position into view in a cheap way, so
  // that the effect of intermediate scroll commands is not ignored.
  function resolveScrollToPos(cm) {
    var range$$1 = cm.curOp.scrollToPos;
    if (range$$1) {
      cm.curOp.scrollToPos = null;
      var from = estimateCoords(cm, range$$1.from), to = estimateCoords(cm, range$$1.to);
      scrollToCoordsRange(cm, from, to, range$$1.margin);
    }
  }

  function scrollToCoordsRange(cm, from, to, margin) {
    var sPos = calculateScrollPos(cm, {
      left: Math.min(from.left, to.left),
      top: Math.min(from.top, to.top) - margin,
      right: Math.max(from.right, to.right),
      bottom: Math.max(from.bottom, to.bottom) + margin
    });
    scrollToCoords(cm, sPos.scrollLeft, sPos.scrollTop);
  }

  // Sync the scrollable area and scrollbars, ensure the viewport
  // covers the visible area.
  function updateScrollTop(cm, val) {
    if (Math.abs(cm.doc.scrollTop - val) < 2) { return }
    if (!gecko) { updateDisplaySimple(cm, {top: val}); }
    setScrollTop(cm, val, true);
    if (gecko) { updateDisplaySimple(cm); }
    startWorker(cm, 100);
  }

  function setScrollTop(cm, val, forceScroll) {
    val = Math.min(cm.display.scroller.scrollHeight - cm.display.scroller.clientHeight, val);
    if (cm.display.scroller.scrollTop == val && !forceScroll) { return }
    cm.doc.scrollTop = val;
    cm.display.scrollbars.setScrollTop(val);
    if (cm.display.scroller.scrollTop != val) { cm.display.scroller.scrollTop = val; }
  }

  // Sync scroller and scrollbar, ensure the gutter elements are
  // aligned.
  function setScrollLeft(cm, val, isScroller, forceScroll) {
    val = Math.min(val, cm.display.scroller.scrollWidth - cm.display.scroller.clientWidth);
    if ((isScroller ? val == cm.doc.scrollLeft : Math.abs(cm.doc.scrollLeft - val) < 2) && !forceScroll) { return }
    cm.doc.scrollLeft = val;
    alignHorizontally(cm);
    if (cm.display.scroller.scrollLeft != val) { cm.display.scroller.scrollLeft = val; }
    cm.display.scrollbars.setScrollLeft(val);
  }

  // SCROLLBARS

  // Prepare DOM reads needed to update the scrollbars. Done in one
  // shot to minimize update/measure roundtrips.
  function measureForScrollbars(cm) {
    var d = cm.display, gutterW = d.gutters.offsetWidth;
    var docH = Math.round(cm.doc.height + paddingVert(cm.display));
    return {
      clientHeight: d.scroller.clientHeight,
      viewHeight: d.wrapper.clientHeight,
      scrollWidth: d.scroller.scrollWidth, clientWidth: d.scroller.clientWidth,
      viewWidth: d.wrapper.clientWidth,
      barLeft: cm.options.fixedGutter ? gutterW : 0,
      docHeight: docH,
      scrollHeight: docH + scrollGap(cm) + d.barHeight,
      nativeBarWidth: d.nativeBarWidth,
      gutterWidth: gutterW
    }
  }

  var NativeScrollbars = function(place, scroll, cm) {
    this.cm = cm;
    var vert = this.vert = elt("div", [elt("div", null, null, "min-width: 1px")], "CodeMirror-vscrollbar");
    var horiz = this.horiz = elt("div", [elt("div", null, null, "height: 100%; min-height: 1px")], "CodeMirror-hscrollbar");
    vert.tabIndex = horiz.tabIndex = -1;
    place(vert); place(horiz);

    on(vert, "scroll", function () {
      if (vert.clientHeight) { scroll(vert.scrollTop, "vertical"); }
    });
    on(horiz, "scroll", function () {
      if (horiz.clientWidth) { scroll(horiz.scrollLeft, "horizontal"); }
    });

    this.checkedZeroWidth = false;
    // Need to set a minimum width to see the scrollbar on IE7 (but must not set it on IE8).
    if (ie && ie_version < 8) { this.horiz.style.minHeight = this.vert.style.minWidth = "18px"; }
  };

  NativeScrollbars.prototype.update = function (measure) {
    var needsH = measure.scrollWidth > measure.clientWidth + 1;
    var needsV = measure.scrollHeight > measure.clientHeight + 1;
    var sWidth = measure.nativeBarWidth;

    if (needsV) {
      this.vert.style.display = "block";
      this.vert.style.bottom = needsH ? sWidth + "px" : "0";
      var totalHeight = measure.viewHeight - (needsH ? sWidth : 0);
      // A bug in IE8 can cause this value to be negative, so guard it.
      this.vert.firstChild.style.height =
        Math.max(0, measure.scrollHeight - measure.clientHeight + totalHeight) + "px";
    } else {
      this.vert.style.display = "";
      this.vert.firstChild.style.height = "0";
    }

    if (needsH) {
      this.horiz.style.display = "block";
      this.horiz.style.right = needsV ? sWidth + "px" : "0";
      this.horiz.style.left = measure.barLeft + "px";
      var totalWidth = measure.viewWidth - measure.barLeft - (needsV ? sWidth : 0);
      this.horiz.firstChild.style.width =
        Math.max(0, measure.scrollWidth - measure.clientWidth + totalWidth) + "px";
    } else {
      this.horiz.style.display = "";
      this.horiz.firstChild.style.width = "0";
    }

    if (!this.checkedZeroWidth && measure.clientHeight > 0) {
      if (sWidth == 0) { this.zeroWidthHack(); }
      this.checkedZeroWidth = true;
    }

    return {right: needsV ? sWidth : 0, bottom: needsH ? sWidth : 0}
  };

  NativeScrollbars.prototype.setScrollLeft = function (pos) {
    if (this.horiz.scrollLeft != pos) { this.horiz.scrollLeft = pos; }
    if (this.disableHoriz) { this.enableZeroWidthBar(this.horiz, this.disableHoriz, "horiz"); }
  };

  NativeScrollbars.prototype.setScrollTop = function (pos) {
    if (this.vert.scrollTop != pos) { this.vert.scrollTop = pos; }
    if (this.disableVert) { this.enableZeroWidthBar(this.vert, this.disableVert, "vert"); }
  };

  NativeScrollbars.prototype.zeroWidthHack = function () {
    var w = mac && !mac_geMountainLion ? "12px" : "18px";
    this.horiz.style.height = this.vert.style.width = w;
    this.horiz.style.pointerEvents = this.vert.style.pointerEvents = "none";
    this.disableHoriz = new Delayed;
    this.disableVert = new Delayed;
  };

  NativeScrollbars.prototype.enableZeroWidthBar = function (bar, delay, type) {
    bar.style.pointerEvents = "auto";
    function maybeDisable() {
      // To find out whether the scrollbar is still visible, we
      // check whether the element under the pixel in the bottom
      // right corner of the scrollbar box is the scrollbar box
      // itself (when the bar is still visible) or its filler child
      // (when the bar is hidden). If it is still visible, we keep
      // it enabled, if it's hidden, we disable pointer events.
      var box = bar.getBoundingClientRect();
      var elt$$1 = type == "vert" ? document.elementFromPoint(box.right - 1, (box.top + box.bottom) / 2)
          : document.elementFromPoint((box.right + box.left) / 2, box.bottom - 1);
      if (elt$$1 != bar) { bar.style.pointerEvents = "none"; }
      else { delay.set(1000, maybeDisable); }
    }
    delay.set(1000, maybeDisable);
  };

  NativeScrollbars.prototype.clear = function () {
    var parent = this.horiz.parentNode;
    parent.removeChild(this.horiz);
    parent.removeChild(this.vert);
  };

  var NullScrollbars = function () {};

  NullScrollbars.prototype.update = function () { return {bottom: 0, right: 0} };
  NullScrollbars.prototype.setScrollLeft = function () {};
  NullScrollbars.prototype.setScrollTop = function () {};
  NullScrollbars.prototype.clear = function () {};

  function updateScrollbars(cm, measure) {
    if (!measure) { measure = measureForScrollbars(cm); }
    var startWidth = cm.display.barWidth, startHeight = cm.display.barHeight;
    updateScrollbarsInner(cm, measure);
    for (var i = 0; i < 4 && startWidth != cm.display.barWidth || startHeight != cm.display.barHeight; i++) {
      if (startWidth != cm.display.barWidth && cm.options.lineWrapping)
        { updateHeightsInViewport(cm); }
      updateScrollbarsInner(cm, measureForScrollbars(cm));
      startWidth = cm.display.barWidth; startHeight = cm.display.barHeight;
    }
  }

  // Re-synchronize the fake scrollbars with the actual size of the
  // content.
  function updateScrollbarsInner(cm, measure) {
    var d = cm.display;
    var sizes = d.scrollbars.update(measure);

    d.sizer.style.paddingRight = (d.barWidth = sizes.right) + "px";
    d.sizer.style.paddingBottom = (d.barHeight = sizes.bottom) + "px";
    d.heightForcer.style.borderBottom = sizes.bottom + "px solid transparent";

    if (sizes.right && sizes.bottom) {
      d.scrollbarFiller.style.display = "block";
      d.scrollbarFiller.style.height = sizes.bottom + "px";
      d.scrollbarFiller.style.width = sizes.right + "px";
    } else { d.scrollbarFiller.style.display = ""; }
    if (sizes.bottom && cm.options.coverGutterNextToScrollbar && cm.options.fixedGutter) {
      d.gutterFiller.style.display = "block";
      d.gutterFiller.style.height = sizes.bottom + "px";
      d.gutterFiller.style.width = measure.gutterWidth + "px";
    } else { d.gutterFiller.style.display = ""; }
  }

  var scrollbarModel = {"native": NativeScrollbars, "null": NullScrollbars};

  function initScrollbars(cm) {
    if (cm.display.scrollbars) {
      cm.display.scrollbars.clear();
      if (cm.display.scrollbars.addClass)
        { rmClass(cm.display.wrapper, cm.display.scrollbars.addClass); }
    }

    cm.display.scrollbars = new scrollbarModel[cm.options.scrollbarStyle](function (node) {
      cm.display.wrapper.insertBefore(node, cm.display.scrollbarFiller);
      // Prevent clicks in the scrollbars from killing focus
      on(node, "mousedown", function () {
        if (cm.state.focused) { setTimeout(function () { return cm.display.input.focus(); }, 0); }
      });
      node.setAttribute("cm-not-content", "true");
    }, function (pos, axis) {
      if (axis == "horizontal") { setScrollLeft(cm, pos); }
      else { updateScrollTop(cm, pos); }
    }, cm);
    if (cm.display.scrollbars.addClass)
      { addClass(cm.display.wrapper, cm.display.scrollbars.addClass); }
  }

  // Operations are used to wrap a series of changes to the editor
  // state in such a way that each change won't have to update the
  // cursor and display (which would be awkward, slow, and
  // error-prone). Instead, display updates are batched and then all
  // combined and executed at once.

  var nextOpId = 0;
  // Start a new operation.
  function startOperation(cm) {
    cm.curOp = {
      cm: cm,
      viewChanged: false,      // Flag that indicates that lines might need to be redrawn
      startHeight: cm.doc.height, // Used to detect need to update scrollbar
      forceUpdate: false,      // Used to force a redraw
      updateInput: null,       // Whether to reset the input textarea
      typing: false,           // Whether this reset should be careful to leave existing text (for compositing)
      changeObjs: null,        // Accumulated changes, for firing change events
      cursorActivityHandlers: null, // Set of handlers to fire cursorActivity on
      cursorActivityCalled: 0, // Tracks which cursorActivity handlers have been called already
      selectionChanged: false, // Whether the selection needs to be redrawn
      updateMaxLine: false,    // Set when the widest line needs to be determined anew
      scrollLeft: null, scrollTop: null, // Intermediate scroll position, not pushed to DOM yet
      scrollToPos: null,       // Used to scroll to a specific position
      focus: false,
      id: ++nextOpId           // Unique ID
    };
    pushOperation(cm.curOp);
  }

  // Finish an operation, updating the display and signalling delayed events
  function endOperation(cm) {
    var op = cm.curOp;
    if (op) { finishOperation(op, function (group) {
      for (var i = 0; i < group.ops.length; i++)
        { group.ops[i].cm.curOp = null; }
      endOperations(group);
    }); }
  }

  // The DOM updates done when an operation finishes are batched so
  // that the minimum number of relayouts are required.
  function endOperations(group) {
    var ops = group.ops;
    for (var i = 0; i < ops.length; i++) // Read DOM
      { endOperation_R1(ops[i]); }
    for (var i$1 = 0; i$1 < ops.length; i$1++) // Write DOM (maybe)
      { endOperation_W1(ops[i$1]); }
    for (var i$2 = 0; i$2 < ops.length; i$2++) // Read DOM
      { endOperation_R2(ops[i$2]); }
    for (var i$3 = 0; i$3 < ops.length; i$3++) // Write DOM (maybe)
      { endOperation_W2(ops[i$3]); }
    for (var i$4 = 0; i$4 < ops.length; i$4++) // Read DOM
      { endOperation_finish(ops[i$4]); }
  }

  function endOperation_R1(op) {
    var cm = op.cm, display = cm.display;
    maybeClipScrollbars(cm);
    if (op.updateMaxLine) { findMaxLine(cm); }

    op.mustUpdate = op.viewChanged || op.forceUpdate || op.scrollTop != null ||
      op.scrollToPos && (op.scrollToPos.from.line < display.viewFrom ||
                         op.scrollToPos.to.line >= display.viewTo) ||
      display.maxLineChanged && cm.options.lineWrapping;
    op.update = op.mustUpdate &&
      new DisplayUpdate(cm, op.mustUpdate && {top: op.scrollTop, ensure: op.scrollToPos}, op.forceUpdate);
  }

  function endOperation_W1(op) {
    op.updatedDisplay = op.mustUpdate && updateDisplayIfNeeded(op.cm, op.update);
  }

  function endOperation_R2(op) {
    var cm = op.cm, display = cm.display;
    if (op.updatedDisplay) { updateHeightsInViewport(cm); }

    op.barMeasure = measureForScrollbars(cm);

    // If the max line changed since it was last measured, measure it,
    // and ensure the document's width matches it.
    // updateDisplay_W2 will use these properties to do the actual resizing
    if (display.maxLineChanged && !cm.options.lineWrapping) {
      op.adjustWidthTo = measureChar(cm, display.maxLine, display.maxLine.text.length).left + 3;
      cm.display.sizerWidth = op.adjustWidthTo;
      op.barMeasure.scrollWidth =
        Math.max(display.scroller.clientWidth, display.sizer.offsetLeft + op.adjustWidthTo + scrollGap(cm) + cm.display.barWidth);
      op.maxScrollLeft = Math.max(0, display.sizer.offsetLeft + op.adjustWidthTo - displayWidth(cm));
    }

    if (op.updatedDisplay || op.selectionChanged)
      { op.preparedSelection = display.input.prepareSelection(); }
  }

  function endOperation_W2(op) {
    var cm = op.cm;

    if (op.adjustWidthTo != null) {
      cm.display.sizer.style.minWidth = op.adjustWidthTo + "px";
      if (op.maxScrollLeft < cm.doc.scrollLeft)
        { setScrollLeft(cm, Math.min(cm.display.scroller.scrollLeft, op.maxScrollLeft), true); }
      cm.display.maxLineChanged = false;
    }

    var takeFocus = op.focus && op.focus == activeElt();
    if (op.preparedSelection)
      { cm.display.input.showSelection(op.preparedSelection, takeFocus); }
    if (op.updatedDisplay || op.startHeight != cm.doc.height)
      { updateScrollbars(cm, op.barMeasure); }
    if (op.updatedDisplay)
      { setDocumentHeight(cm, op.barMeasure); }

    if (op.selectionChanged) { restartBlink(cm); }

    if (cm.state.focused && op.updateInput)
      { cm.display.input.reset(op.typing); }
    if (takeFocus) { ensureFocus(op.cm); }
  }

  function endOperation_finish(op) {
    var cm = op.cm, display = cm.display, doc = cm.doc;

    if (op.updatedDisplay) { postUpdateDisplay(cm, op.update); }

    // Abort mouse wheel delta measurement, when scrolling explicitly
    if (display.wheelStartX != null && (op.scrollTop != null || op.scrollLeft != null || op.scrollToPos))
      { display.wheelStartX = display.wheelStartY = null; }

    // Propagate the scroll position to the actual DOM scroller
    if (op.scrollTop != null) { setScrollTop(cm, op.scrollTop, op.forceScroll); }

    if (op.scrollLeft != null) { setScrollLeft(cm, op.scrollLeft, true, true); }
    // If we need to scroll a specific position into view, do so.
    if (op.scrollToPos) {
      var rect = scrollPosIntoView(cm, clipPos(doc, op.scrollToPos.from),
                                   clipPos(doc, op.scrollToPos.to), op.scrollToPos.margin);
      maybeScrollWindow(cm, rect);
    }

    // Fire events for markers that are hidden/unidden by editing or
    // undoing
    var hidden = op.maybeHiddenMarkers, unhidden = op.maybeUnhiddenMarkers;
    if (hidden) { for (var i = 0; i < hidden.length; ++i)
      { if (!hidden[i].lines.length) { signal(hidden[i], "hide"); } } }
    if (unhidden) { for (var i$1 = 0; i$1 < unhidden.length; ++i$1)
      { if (unhidden[i$1].lines.length) { signal(unhidden[i$1], "unhide"); } } }

    if (display.wrapper.offsetHeight)
      { doc.scrollTop = cm.display.scroller.scrollTop; }

    // Fire change events, and delayed event handlers
    if (op.changeObjs)
      { signal(cm, "changes", cm, op.changeObjs); }
    if (op.update)
      { op.update.finish(); }
  }

  // Run the given function in an operation
  function runInOp(cm, f) {
    if (cm.curOp) { return f() }
    startOperation(cm);
    try { return f() }
    finally { endOperation(cm); }
  }
  // Wraps a function in an operation. Returns the wrapped function.
  function operation(cm, f) {
    return function() {
      if (cm.curOp) { return f.apply(cm, arguments) }
      startOperation(cm);
      try { return f.apply(cm, arguments) }
      finally { endOperation(cm); }
    }
  }
  // Used to add methods to editor and doc instances, wrapping them in
  // operations.
  function methodOp(f) {
    return function() {
      if (this.curOp) { return f.apply(this, arguments) }
      startOperation(this);
      try { return f.apply(this, arguments) }
      finally { endOperation(this); }
    }
  }
  function docMethodOp(f) {
    return function() {
      var cm = this.cm;
      if (!cm || cm.curOp) { return f.apply(this, arguments) }
      startOperation(cm);
      try { return f.apply(this, arguments) }
      finally { endOperation(cm); }
    }
  }

  // Updates the display.view data structure for a given change to the
  // document. From and to are in pre-change coordinates. Lendiff is
  // the amount of lines added or subtracted by the change. This is
  // used for changes that span multiple lines, or change the way
  // lines are divided into visual lines. regLineChange (below)
  // registers single-line changes.
  function regChange(cm, from, to, lendiff) {
    if (from == null) { from = cm.doc.first; }
    if (to == null) { to = cm.doc.first + cm.doc.size; }
    if (!lendiff) { lendiff = 0; }

    var display = cm.display;
    if (lendiff && to < display.viewTo &&
        (display.updateLineNumbers == null || display.updateLineNumbers > from))
      { display.updateLineNumbers = from; }

    cm.curOp.viewChanged = true;

    if (from >= display.viewTo) { // Change after
      if (sawCollapsedSpans && visualLineNo(cm.doc, from) < display.viewTo)
        { resetView(cm); }
    } else if (to <= display.viewFrom) { // Change before
      if (sawCollapsedSpans && visualLineEndNo(cm.doc, to + lendiff) > display.viewFrom) {
        resetView(cm);
      } else {
        display.viewFrom += lendiff;
        display.viewTo += lendiff;
      }
    } else if (from <= display.viewFrom && to >= display.viewTo) { // Full overlap
      resetView(cm);
    } else if (from <= display.viewFrom) { // Top overlap
      var cut = viewCuttingPoint(cm, to, to + lendiff, 1);
      if (cut) {
        display.view = display.view.slice(cut.index);
        display.viewFrom = cut.lineN;
        display.viewTo += lendiff;
      } else {
        resetView(cm);
      }
    } else if (to >= display.viewTo) { // Bottom overlap
      var cut$1 = viewCuttingPoint(cm, from, from, -1);
      if (cut$1) {
        display.view = display.view.slice(0, cut$1.index);
        display.viewTo = cut$1.lineN;
      } else {
        resetView(cm);
      }
    } else { // Gap in the middle
      var cutTop = viewCuttingPoint(cm, from, from, -1);
      var cutBot = viewCuttingPoint(cm, to, to + lendiff, 1);
      if (cutTop && cutBot) {
        display.view = display.view.slice(0, cutTop.index)
          .concat(buildViewArray(cm, cutTop.lineN, cutBot.lineN))
          .concat(display.view.slice(cutBot.index));
        display.viewTo += lendiff;
      } else {
        resetView(cm);
      }
    }

    var ext = display.externalMeasured;
    if (ext) {
      if (to < ext.lineN)
        { ext.lineN += lendiff; }
      else if (from < ext.lineN + ext.size)
        { display.externalMeasured = null; }
    }
  }

  // Register a change to a single line. Type must be one of "text",
  // "gutter", "class", "widget"
  function regLineChange(cm, line, type) {
    cm.curOp.viewChanged = true;
    var display = cm.display, ext = cm.display.externalMeasured;
    if (ext && line >= ext.lineN && line < ext.lineN + ext.size)
      { display.externalMeasured = null; }

    if (line < display.viewFrom || line >= display.viewTo) { return }
    var lineView = display.view[findViewIndex(cm, line)];
    if (lineView.node == null) { return }
    var arr = lineView.changes || (lineView.changes = []);
    if (indexOf(arr, type) == -1) { arr.push(type); }
  }

  // Clear the view.
  function resetView(cm) {
    cm.display.viewFrom = cm.display.viewTo = cm.doc.first;
    cm.display.view = [];
    cm.display.viewOffset = 0;
  }

  function viewCuttingPoint(cm, oldN, newN, dir) {
    var index = findViewIndex(cm, oldN), diff, view = cm.display.view;
    if (!sawCollapsedSpans || newN == cm.doc.first + cm.doc.size)
      { return {index: index, lineN: newN} }
    var n = cm.display.viewFrom;
    for (var i = 0; i < index; i++)
      { n += view[i].size; }
    if (n != oldN) {
      if (dir > 0) {
        if (index == view.length - 1) { return null }
        diff = (n + view[index].size) - oldN;
        index++;
      } else {
        diff = n - oldN;
      }
      oldN += diff; newN += diff;
    }
    while (visualLineNo(cm.doc, newN) != newN) {
      if (index == (dir < 0 ? 0 : view.length - 1)) { return null }
      newN += dir * view[index - (dir < 0 ? 1 : 0)].size;
      index += dir;
    }
    return {index: index, lineN: newN}
  }

  // Force the view to cover a given range, adding empty view element
  // or clipping off existing ones as needed.
  function adjustView(cm, from, to) {
    var display = cm.display, view = display.view;
    if (view.length == 0 || from >= display.viewTo || to <= display.viewFrom) {
      display.view = buildViewArray(cm, from, to);
      display.viewFrom = from;
    } else {
      if (display.viewFrom > from)
        { display.view = buildViewArray(cm, from, display.viewFrom).concat(display.view); }
      else if (display.viewFrom < from)
        { display.view = display.view.slice(findViewIndex(cm, from)); }
      display.viewFrom = from;
      if (display.viewTo < to)
        { display.view = display.view.concat(buildViewArray(cm, display.viewTo, to)); }
      else if (display.viewTo > to)
        { display.view = display.view.slice(0, findViewIndex(cm, to)); }
    }
    display.viewTo = to;
  }

  // Count the number of lines in the view whose DOM representation is
  // out of date (or nonexistent).
  function countDirtyView(cm) {
    var view = cm.display.view, dirty = 0;
    for (var i = 0; i < view.length; i++) {
      var lineView = view[i];
      if (!lineView.hidden && (!lineView.node || lineView.changes)) { ++dirty; }
    }
    return dirty
  }

  // HIGHLIGHT WORKER

  function startWorker(cm, time) {
    if (cm.doc.highlightFrontier < cm.display.viewTo)
      { cm.state.highlight.set(time, bind(highlightWorker, cm)); }
  }

  function highlightWorker(cm) {
    var doc = cm.doc;
    if (doc.highlightFrontier >= cm.display.viewTo) { return }
    var end = +new Date + cm.options.workTime;
    var context = getContextBefore(cm, doc.highlightFrontier);
    var changedLines = [];

    doc.iter(context.line, Math.min(doc.first + doc.size, cm.display.viewTo + 500), function (line) {
      if (context.line >= cm.display.viewFrom) { // Visible
        var oldStyles = line.styles;
        var resetState = line.text.length > cm.options.maxHighlightLength ? copyState(doc.mode, context.state) : null;
        var highlighted = highlightLine(cm, line, context, true);
        if (resetState) { context.state = resetState; }
        line.styles = highlighted.styles;
        var oldCls = line.styleClasses, newCls = highlighted.classes;
        if (newCls) { line.styleClasses = newCls; }
        else if (oldCls) { line.styleClasses = null; }
        var ischange = !oldStyles || oldStyles.length != line.styles.length ||
          oldCls != newCls && (!oldCls || !newCls || oldCls.bgClass != newCls.bgClass || oldCls.textClass != newCls.textClass);
        for (var i = 0; !ischange && i < oldStyles.length; ++i) { ischange = oldStyles[i] != line.styles[i]; }
        if (ischange) { changedLines.push(context.line); }
        line.stateAfter = context.save();
        context.nextLine();
      } else {
        if (line.text.length <= cm.options.maxHighlightLength)
          { processLine(cm, line.text, context); }
        line.stateAfter = context.line % 5 == 0 ? context.save() : null;
        context.nextLine();
      }
      if (+new Date > end) {
        startWorker(cm, cm.options.workDelay);
        return true
      }
    });
    doc.highlightFrontier = context.line;
    doc.modeFrontier = Math.max(doc.modeFrontier, context.line);
    if (changedLines.length) { runInOp(cm, function () {
      for (var i = 0; i < changedLines.length; i++)
        { regLineChange(cm, changedLines[i], "text"); }
    }); }
  }

  // DISPLAY DRAWING

  var DisplayUpdate = function(cm, viewport, force) {
    var display = cm.display;

    this.viewport = viewport;
    // Store some values that we'll need later (but don't want to force a relayout for)
    this.visible = visibleLines(display, cm.doc, viewport);
    this.editorIsHidden = !display.wrapper.offsetWidth;
    this.wrapperHeight = display.wrapper.clientHeight;
    this.wrapperWidth = display.wrapper.clientWidth;
    this.oldDisplayWidth = displayWidth(cm);
    this.force = force;
    this.dims = getDimensions(cm);
    this.events = [];
  };

  DisplayUpdate.prototype.signal = function (emitter, type) {
    if (hasHandler(emitter, type))
      { this.events.push(arguments); }
  };
  DisplayUpdate.prototype.finish = function () {
      var this$1 = this;

    for (var i = 0; i < this.events.length; i++)
      { signal.apply(null, this$1.events[i]); }
  };

  function maybeClipScrollbars(cm) {
    var display = cm.display;
    if (!display.scrollbarsClipped && display.scroller.offsetWidth) {
      display.nativeBarWidth = display.scroller.offsetWidth - display.scroller.clientWidth;
      display.heightForcer.style.height = scrollGap(cm) + "px";
      display.sizer.style.marginBottom = -display.nativeBarWidth + "px";
      display.sizer.style.borderRightWidth = scrollGap(cm) + "px";
      display.scrollbarsClipped = true;
    }
  }

  function selectionSnapshot(cm) {
    if (cm.hasFocus()) { return null }
    var active = activeElt();
    if (!active || !contains(cm.display.lineDiv, active)) { return null }
    var result = {activeElt: active};
    if (window.getSelection) {
      var sel = window.getSelection();
      if (sel.anchorNode && sel.extend && contains(cm.display.lineDiv, sel.anchorNode)) {
        result.anchorNode = sel.anchorNode;
        result.anchorOffset = sel.anchorOffset;
        result.focusNode = sel.focusNode;
        result.focusOffset = sel.focusOffset;
      }
    }
    return result
  }

  function restoreSelection(snapshot) {
    if (!snapshot || !snapshot.activeElt || snapshot.activeElt == activeElt()) { return }
    snapshot.activeElt.focus();
    if (snapshot.anchorNode && contains(document.body, snapshot.anchorNode) && contains(document.body, snapshot.focusNode)) {
      var sel = window.getSelection(), range$$1 = document.createRange();
      range$$1.setEnd(snapshot.anchorNode, snapshot.anchorOffset);
      range$$1.collapse(false);
      sel.removeAllRanges();
      sel.addRange(range$$1);
      sel.extend(snapshot.focusNode, snapshot.focusOffset);
    }
  }

  // Does the actual updating of the line display. Bails out
  // (returning false) when there is nothing to be done and forced is
  // false.
  function updateDisplayIfNeeded(cm, update) {
    var display = cm.display, doc = cm.doc;

    if (update.editorIsHidden) {
      resetView(cm);
      return false
    }

    // Bail out if the visible area is already rendered and nothing changed.
    if (!update.force &&
        update.visible.from >= display.viewFrom && update.visible.to <= display.viewTo &&
        (display.updateLineNumbers == null || display.updateLineNumbers >= display.viewTo) &&
        display.renderedView == display.view && countDirtyView(cm) == 0)
      { return false }

    if (maybeUpdateLineNumberWidth(cm)) {
      resetView(cm);
      update.dims = getDimensions(cm);
    }

    // Compute a suitable new viewport (from & to)
    var end = doc.first + doc.size;
    var from = Math.max(update.visible.from - cm.options.viewportMargin, doc.first);
    var to = Math.min(end, update.visible.to + cm.options.viewportMargin);
    if (display.viewFrom < from && from - display.viewFrom < 20) { from = Math.max(doc.first, display.viewFrom); }
    if (display.viewTo > to && display.viewTo - to < 20) { to = Math.min(end, display.viewTo); }
    if (sawCollapsedSpans) {
      from = visualLineNo(cm.doc, from);
      to = visualLineEndNo(cm.doc, to);
    }

    var different = from != display.viewFrom || to != display.viewTo ||
      display.lastWrapHeight != update.wrapperHeight || display.lastWrapWidth != update.wrapperWidth;
    adjustView(cm, from, to);

    display.viewOffset = heightAtLine(getLine(cm.doc, display.viewFrom));
    // Position the mover div to align with the current scroll position
    cm.display.mover.style.top = display.viewOffset + "px";

    var toUpdate = countDirtyView(cm);
    if (!different && toUpdate == 0 && !update.force && display.renderedView == display.view &&
        (display.updateLineNumbers == null || display.updateLineNumbers >= display.viewTo))
      { return false }

    // For big changes, we hide the enclosing element during the
    // update, since that speeds up the operations on most browsers.
    var selSnapshot = selectionSnapshot(cm);
    if (toUpdate > 4) { display.lineDiv.style.display = "none"; }
    patchDisplay(cm, display.updateLineNumbers, update.dims);
    if (toUpdate > 4) { display.lineDiv.style.display = ""; }
    display.renderedView = display.view;
    // There might have been a widget with a focused element that got
    // hidden or updated, if so re-focus it.
    restoreSelection(selSnapshot);

    // Prevent selection and cursors from interfering with the scroll
    // width and height.
    removeChildren(display.cursorDiv);
    removeChildren(display.selectionDiv);
    display.gutters.style.height = display.sizer.style.minHeight = 0;

    if (different) {
      display.lastWrapHeight = update.wrapperHeight;
      display.lastWrapWidth = update.wrapperWidth;
      startWorker(cm, 400);
    }

    display.updateLineNumbers = null;

    return true
  }

  function postUpdateDisplay(cm, update) {
    var viewport = update.viewport;

    for (var first = true;; first = false) {
      if (!first || !cm.options.lineWrapping || update.oldDisplayWidth == displayWidth(cm)) {
        // Clip forced viewport to actual scrollable area.
        if (viewport && viewport.top != null)
          { viewport = {top: Math.min(cm.doc.height + paddingVert(cm.display) - displayHeight(cm), viewport.top)}; }
        // Updated line heights might result in the drawn area not
        // actually covering the viewport. Keep looping until it does.
        update.visible = visibleLines(cm.display, cm.doc, viewport);
        if (update.visible.from >= cm.display.viewFrom && update.visible.to <= cm.display.viewTo)
          { break }
      }
      if (!updateDisplayIfNeeded(cm, update)) { break }
      updateHeightsInViewport(cm);
      var barMeasure = measureForScrollbars(cm);
      updateSelection(cm);
      updateScrollbars(cm, barMeasure);
      setDocumentHeight(cm, barMeasure);
      update.force = false;
    }

    update.signal(cm, "update", cm);
    if (cm.display.viewFrom != cm.display.reportedViewFrom || cm.display.viewTo != cm.display.reportedViewTo) {
      update.signal(cm, "viewportChange", cm, cm.display.viewFrom, cm.display.viewTo);
      cm.display.reportedViewFrom = cm.display.viewFrom; cm.display.reportedViewTo = cm.display.viewTo;
    }
  }

  function updateDisplaySimple(cm, viewport) {
    var update = new DisplayUpdate(cm, viewport);
    if (updateDisplayIfNeeded(cm, update)) {
      updateHeightsInViewport(cm);
      postUpdateDisplay(cm, update);
      var barMeasure = measureForScrollbars(cm);
      updateSelection(cm);
      updateScrollbars(cm, barMeasure);
      setDocumentHeight(cm, barMeasure);
      update.finish();
    }
  }

  // Sync the actual display DOM structure with display.view, removing
  // nodes for lines that are no longer in view, and creating the ones
  // that are not there yet, and updating the ones that are out of
  // date.
  function patchDisplay(cm, updateNumbersFrom, dims) {
    var display = cm.display, lineNumbers = cm.options.lineNumbers;
    var container = display.lineDiv, cur = container.firstChild;

    function rm(node) {
      var next = node.nextSibling;
      // Works around a throw-scroll bug in OS X Webkit
      if (webkit && mac && cm.display.currentWheelTarget == node)
        { node.style.display = "none"; }
      else
        { node.parentNode.removeChild(node); }
      return next
    }

    var view = display.view, lineN = display.viewFrom;
    // Loop over the elements in the view, syncing cur (the DOM nodes
    // in display.lineDiv) with the view as we go.
    for (var i = 0; i < view.length; i++) {
      var lineView = view[i];
      if (lineView.hidden) ; else if (!lineView.node || lineView.node.parentNode != container) { // Not drawn yet
        var node = buildLineElement(cm, lineView, lineN, dims);
        container.insertBefore(node, cur);
      } else { // Already drawn
        while (cur != lineView.node) { cur = rm(cur); }
        var updateNumber = lineNumbers && updateNumbersFrom != null &&
          updateNumbersFrom <= lineN && lineView.lineNumber;
        if (lineView.changes) {
          if (indexOf(lineView.changes, "gutter") > -1) { updateNumber = false; }
          updateLineForChanges(cm, lineView, lineN, dims);
        }
        if (updateNumber) {
          removeChildren(lineView.lineNumber);
          lineView.lineNumber.appendChild(document.createTextNode(lineNumberFor(cm.options, lineN)));
        }
        cur = lineView.node.nextSibling;
      }
      lineN += lineView.size;
    }
    while (cur) { cur = rm(cur); }
  }

  function updateGutterSpace(cm) {
    var width = cm.display.gutters.offsetWidth;
    cm.display.sizer.style.marginLeft = width + "px";
  }

  function setDocumentHeight(cm, measure) {
    cm.display.sizer.style.minHeight = measure.docHeight + "px";
    cm.display.heightForcer.style.top = measure.docHeight + "px";
    cm.display.gutters.style.height = (measure.docHeight + cm.display.barHeight + scrollGap(cm)) + "px";
  }

  // Rebuild the gutter elements, ensure the margin to the left of the
  // code matches their width.
  function updateGutters(cm) {
    var gutters = cm.display.gutters, specs = cm.options.gutters;
    removeChildren(gutters);
    var i = 0;
    for (; i < specs.length; ++i) {
      var gutterClass = specs[i];
      var gElt = gutters.appendChild(elt("div", null, "CodeMirror-gutter " + gutterClass));
      if (gutterClass == "CodeMirror-linenumbers") {
        cm.display.lineGutter = gElt;
        gElt.style.width = (cm.display.lineNumWidth || 1) + "px";
      }
    }
    gutters.style.display = i ? "" : "none";
    updateGutterSpace(cm);
  }

  // Make sure the gutters options contains the element
  // "CodeMirror-linenumbers" when the lineNumbers option is true.
  function setGuttersForLineNumbers(options) {
    var found = indexOf(options.gutters, "CodeMirror-linenumbers");
    if (found == -1 && options.lineNumbers) {
      options.gutters = options.gutters.concat(["CodeMirror-linenumbers"]);
    } else if (found > -1 && !options.lineNumbers) {
      options.gutters = options.gutters.slice(0);
      options.gutters.splice(found, 1);
    }
  }

  // Since the delta values reported on mouse wheel events are
  // unstandardized between browsers and even browser versions, and
  // generally horribly unpredictable, this code starts by measuring
  // the scroll effect that the first few mouse wheel events have,
  // and, from that, detects the way it can convert deltas to pixel
  // offsets afterwards.
  //
  // The reason we want to know the amount a wheel event will scroll
  // is that it gives us a chance to update the display before the
  // actual scrolling happens, reducing flickering.

  var wheelSamples = 0, wheelPixelsPerUnit = null;
  // Fill in a browser-detected starting value on browsers where we
  // know one. These don't have to be accurate -- the result of them
  // being wrong would just be a slight flicker on the first wheel
  // scroll (if it is large enough).
  if (ie) { wheelPixelsPerUnit = -.53; }
  else if (gecko) { wheelPixelsPerUnit = 15; }
  else if (chrome) { wheelPixelsPerUnit = -.7; }
  else if (safari) { wheelPixelsPerUnit = -1/3; }

  function wheelEventDelta(e) {
    var dx = e.wheelDeltaX, dy = e.wheelDeltaY;
    if (dx == null && e.detail && e.axis == e.HORIZONTAL_AXIS) { dx = e.detail; }
    if (dy == null && e.detail && e.axis == e.VERTICAL_AXIS) { dy = e.detail; }
    else if (dy == null) { dy = e.wheelDelta; }
    return {x: dx, y: dy}
  }
  function wheelEventPixels(e) {
    var delta = wheelEventDelta(e);
    delta.x *= wheelPixelsPerUnit;
    delta.y *= wheelPixelsPerUnit;
    return delta
  }

  function onScrollWheel(cm, e) {
    var delta = wheelEventDelta(e), dx = delta.x, dy = delta.y;

    var display = cm.display, scroll = display.scroller;
    // Quit if there's nothing to scroll here
    var canScrollX = scroll.scrollWidth > scroll.clientWidth;
    var canScrollY = scroll.scrollHeight > scroll.clientHeight;
    if (!(dx && canScrollX || dy && canScrollY)) { return }

    // Webkit browsers on OS X abort momentum scrolls when the target
    // of the scroll event is removed from the scrollable element.
    // This hack (see related code in patchDisplay) makes sure the
    // element is kept around.
    if (dy && mac && webkit) {
      outer: for (var cur = e.target, view = display.view; cur != scroll; cur = cur.parentNode) {
        for (var i = 0; i < view.length; i++) {
          if (view[i].node == cur) {
            cm.display.currentWheelTarget = cur;
            break outer
          }
        }
      }
    }

    // On some browsers, horizontal scrolling will cause redraws to
    // happen before the gutter has been realigned, causing it to
    // wriggle around in a most unseemly way. When we have an
    // estimated pixels/delta value, we just handle horizontal
    // scrolling entirely here. It'll be slightly off from native, but
    // better than glitching out.
    if (dx && !gecko && !presto && wheelPixelsPerUnit != null) {
      if (dy && canScrollY)
        { updateScrollTop(cm, Math.max(0, scroll.scrollTop + dy * wheelPixelsPerUnit)); }
      setScrollLeft(cm, Math.max(0, scroll.scrollLeft + dx * wheelPixelsPerUnit));
      // Only prevent default scrolling if vertical scrolling is
      // actually possible. Otherwise, it causes vertical scroll
      // jitter on OSX trackpads when deltaX is small and deltaY
      // is large (issue #3579)
      if (!dy || (dy && canScrollY))
        { e_preventDefault(e); }
      display.wheelStartX = null; // Abort measurement, if in progress
      return
    }

    // 'Project' the visible viewport to cover the area that is being
    // scrolled into view (if we know enough to estimate it).
    if (dy && wheelPixelsPerUnit != null) {
      var pixels = dy * wheelPixelsPerUnit;
      var top = cm.doc.scrollTop, bot = top + display.wrapper.clientHeight;
      if (pixels < 0) { top = Math.max(0, top + pixels - 50); }
      else { bot = Math.min(cm.doc.height, bot + pixels + 50); }
      updateDisplaySimple(cm, {top: top, bottom: bot});
    }

    if (wheelSamples < 20) {
      if (display.wheelStartX == null) {
        display.wheelStartX = scroll.scrollLeft; display.wheelStartY = scroll.scrollTop;
        display.wheelDX = dx; display.wheelDY = dy;
        setTimeout(function () {
          if (display.wheelStartX == null) { return }
          var movedX = scroll.scrollLeft - display.wheelStartX;
          var movedY = scroll.scrollTop - display.wheelStartY;
          var sample = (movedY && display.wheelDY && movedY / display.wheelDY) ||
            (movedX && display.wheelDX && movedX / display.wheelDX);
          display.wheelStartX = display.wheelStartY = null;
          if (!sample) { return }
          wheelPixelsPerUnit = (wheelPixelsPerUnit * wheelSamples + sample) / (wheelSamples + 1);
          ++wheelSamples;
        }, 200);
      } else {
        display.wheelDX += dx; display.wheelDY += dy;
      }
    }
  }

  // Selection objects are immutable. A new one is created every time
  // the selection changes. A selection is one or more non-overlapping
  // (and non-touching) ranges, sorted, and an integer that indicates
  // which one is the primary selection (the one that's scrolled into
  // view, that getCursor returns, etc).
  var Selection = function(ranges, primIndex) {
    this.ranges = ranges;
    this.primIndex = primIndex;
  };

  Selection.prototype.primary = function () { return this.ranges[this.primIndex] };

  Selection.prototype.equals = function (other) {
      var this$1 = this;

    if (other == this) { return true }
    if (other.primIndex != this.primIndex || other.ranges.length != this.ranges.length) { return false }
    for (var i = 0; i < this.ranges.length; i++) {
      var here = this$1.ranges[i], there = other.ranges[i];
      if (!equalCursorPos(here.anchor, there.anchor) || !equalCursorPos(here.head, there.head)) { return false }
    }
    return true
  };

  Selection.prototype.deepCopy = function () {
      var this$1 = this;

    var out = [];
    for (var i = 0; i < this.ranges.length; i++)
      { out[i] = new Range(copyPos(this$1.ranges[i].anchor), copyPos(this$1.ranges[i].head)); }
    return new Selection(out, this.primIndex)
  };

  Selection.prototype.somethingSelected = function () {
      var this$1 = this;

    for (var i = 0; i < this.ranges.length; i++)
      { if (!this$1.ranges[i].empty()) { return true } }
    return false
  };

  Selection.prototype.contains = function (pos, end) {
      var this$1 = this;

    if (!end) { end = pos; }
    for (var i = 0; i < this.ranges.length; i++) {
      var range = this$1.ranges[i];
      if (cmp(end, range.from()) >= 0 && cmp(pos, range.to()) <= 0)
        { return i }
    }
    return -1
  };

  var Range = function(anchor, head) {
    this.anchor = anchor; this.head = head;
  };

  Range.prototype.from = function () { return minPos(this.anchor, this.head) };
  Range.prototype.to = function () { return maxPos(this.anchor, this.head) };
  Range.prototype.empty = function () { return this.head.line == this.anchor.line && this.head.ch == this.anchor.ch };

  // Take an unsorted, potentially overlapping set of ranges, and
  // build a selection out of it. 'Consumes' ranges array (modifying
  // it).
  function normalizeSelection(cm, ranges, primIndex) {
    var mayTouch = cm && cm.options.selectionsMayTouch;
    var prim = ranges[primIndex];
    ranges.sort(function (a, b) { return cmp(a.from(), b.from()); });
    primIndex = indexOf(ranges, prim);
    for (var i = 1; i < ranges.length; i++) {
      var cur = ranges[i], prev = ranges[i - 1];
      var diff = cmp(prev.to(), cur.from());
      if (mayTouch && !cur.empty() ? diff > 0 : diff >= 0) {
        var from = minPos(prev.from(), cur.from()), to = maxPos(prev.to(), cur.to());
        var inv = prev.empty() ? cur.from() == cur.head : prev.from() == prev.head;
        if (i <= primIndex) { --primIndex; }
        ranges.splice(--i, 2, new Range(inv ? to : from, inv ? from : to));
      }
    }
    return new Selection(ranges, primIndex)
  }

  function simpleSelection(anchor, head) {
    return new Selection([new Range(anchor, head || anchor)], 0)
  }

  // Compute the position of the end of a change (its 'to' property
  // refers to the pre-change end).
  function changeEnd(change) {
    if (!change.text) { return change.to }
    return Pos(change.from.line + change.text.length - 1,
               lst(change.text).length + (change.text.length == 1 ? change.from.ch : 0))
  }

  // Adjust a position to refer to the post-change position of the
  // same text, or the end of the change if the change covers it.
  function adjustForChange(pos, change) {
    if (cmp(pos, change.from) < 0) { return pos }
    if (cmp(pos, change.to) <= 0) { return changeEnd(change) }

    var line = pos.line + change.text.length - (change.to.line - change.from.line) - 1, ch = pos.ch;
    if (pos.line == change.to.line) { ch += changeEnd(change).ch - change.to.ch; }
    return Pos(line, ch)
  }

  function computeSelAfterChange(doc, change) {
    var out = [];
    for (var i = 0; i < doc.sel.ranges.length; i++) {
      var range = doc.sel.ranges[i];
      out.push(new Range(adjustForChange(range.anchor, change),
                         adjustForChange(range.head, change)));
    }
    return normalizeSelection(doc.cm, out, doc.sel.primIndex)
  }

  function offsetPos(pos, old, nw) {
    if (pos.line == old.line)
      { return Pos(nw.line, pos.ch - old.ch + nw.ch) }
    else
      { return Pos(nw.line + (pos.line - old.line), pos.ch) }
  }

  // Used by replaceSelections to allow moving the selection to the
  // start or around the replaced test. Hint may be "start" or "around".
  function computeReplacedSel(doc, changes, hint) {
    var out = [];
    var oldPrev = Pos(doc.first, 0), newPrev = oldPrev;
    for (var i = 0; i < changes.length; i++) {
      var change = changes[i];
      var from = offsetPos(change.from, oldPrev, newPrev);
      var to = offsetPos(changeEnd(change), oldPrev, newPrev);
      oldPrev = change.to;
      newPrev = to;
      if (hint == "around") {
        var range = doc.sel.ranges[i], inv = cmp(range.head, range.anchor) < 0;
        out[i] = new Range(inv ? to : from, inv ? from : to);
      } else {
        out[i] = new Range(from, from);
      }
    }
    return new Selection(out, doc.sel.primIndex)
  }

  // Used to get the editor into a consistent state again when options change.

  function loadMode(cm) {
    cm.doc.mode = getMode(cm.options, cm.doc.modeOption);
    resetModeState(cm);
  }

  function resetModeState(cm) {
    cm.doc.iter(function (line) {
      if (line.stateAfter) { line.stateAfter = null; }
      if (line.styles) { line.styles = null; }
    });
    cm.doc.modeFrontier = cm.doc.highlightFrontier = cm.doc.first;
    startWorker(cm, 100);
    cm.state.modeGen++;
    if (cm.curOp) { regChange(cm); }
  }

  // DOCUMENT DATA STRUCTURE

  // By default, updates that start and end at the beginning of a line
  // are treated specially, in order to make the association of line
  // widgets and marker elements with the text behave more intuitive.
  function isWholeLineUpdate(doc, change) {
    return change.from.ch == 0 && change.to.ch == 0 && lst(change.text) == "" &&
      (!doc.cm || doc.cm.options.wholeLineUpdateBefore)
  }

  // Perform a change on the document data structure.
  function updateDoc(doc, change, markedSpans, estimateHeight$$1) {
    function spansFor(n) {return markedSpans ? markedSpans[n] : null}
    function update(line, text, spans) {
      updateLine(line, text, spans, estimateHeight$$1);
      signalLater(line, "change", line, change);
    }
    function linesFor(start, end) {
      var result = [];
      for (var i = start; i < end; ++i)
        { result.push(new Line(text[i], spansFor(i), estimateHeight$$1)); }
      return result
    }

    var from = change.from, to = change.to, text = change.text;
    var firstLine = getLine(doc, from.line), lastLine = getLine(doc, to.line);
    var lastText = lst(text), lastSpans = spansFor(text.length - 1), nlines = to.line - from.line;

    // Adjust the line structure
    if (change.full) {
      doc.insert(0, linesFor(0, text.length));
      doc.remove(text.length, doc.size - text.length);
    } else if (isWholeLineUpdate(doc, change)) {
      // This is a whole-line replace. Treated specially to make
      // sure line objects move the way they are supposed to.
      var added = linesFor(0, text.length - 1);
      update(lastLine, lastLine.text, lastSpans);
      if (nlines) { doc.remove(from.line, nlines); }
      if (added.length) { doc.insert(from.line, added); }
    } else if (firstLine == lastLine) {
      if (text.length == 1) {
        update(firstLine, firstLine.text.slice(0, from.ch) + lastText + firstLine.text.slice(to.ch), lastSpans);
      } else {
        var added$1 = linesFor(1, text.length - 1);
        added$1.push(new Line(lastText + firstLine.text.slice(to.ch), lastSpans, estimateHeight$$1));
        update(firstLine, firstLine.text.slice(0, from.ch) + text[0], spansFor(0));
        doc.insert(from.line + 1, added$1);
      }
    } else if (text.length == 1) {
      update(firstLine, firstLine.text.slice(0, from.ch) + text[0] + lastLine.text.slice(to.ch), spansFor(0));
      doc.remove(from.line + 1, nlines);
    } else {
      update(firstLine, firstLine.text.slice(0, from.ch) + text[0], spansFor(0));
      update(lastLine, lastText + lastLine.text.slice(to.ch), lastSpans);
      var added$2 = linesFor(1, text.length - 1);
      if (nlines > 1) { doc.remove(from.line + 1, nlines - 1); }
      doc.insert(from.line + 1, added$2);
    }

    signalLater(doc, "change", doc, change);
  }

  // Call f for all linked documents.
  function linkedDocs(doc, f, sharedHistOnly) {
    function propagate(doc, skip, sharedHist) {
      if (doc.linked) { for (var i = 0; i < doc.linked.length; ++i) {
        var rel = doc.linked[i];
        if (rel.doc == skip) { continue }
        var shared = sharedHist && rel.sharedHist;
        if (sharedHistOnly && !shared) { continue }
        f(rel.doc, shared);
        propagate(rel.doc, doc, shared);
      } }
    }
    propagate(doc, null, true);
  }

  // Attach a document to an editor.
  function attachDoc(cm, doc) {
    if (doc.cm) { throw new Error("This document is already in use.") }
    cm.doc = doc;
    doc.cm = cm;
    estimateLineHeights(cm);
    loadMode(cm);
    setDirectionClass(cm);
    if (!cm.options.lineWrapping) { findMaxLine(cm); }
    cm.options.mode = doc.modeOption;
    regChange(cm);
  }

  function setDirectionClass(cm) {
  (cm.doc.direction == "rtl" ? addClass : rmClass)(cm.display.lineDiv, "CodeMirror-rtl");
  }

  function directionChanged(cm) {
    runInOp(cm, function () {
      setDirectionClass(cm);
      regChange(cm);
    });
  }

  function History(startGen) {
    // Arrays of change events and selections. Doing something adds an
    // event to done and clears undo. Undoing moves events from done
    // to undone, redoing moves them in the other direction.
    this.done = []; this.undone = [];
    this.undoDepth = Infinity;
    // Used to track when changes can be merged into a single undo
    // event
    this.lastModTime = this.lastSelTime = 0;
    this.lastOp = this.lastSelOp = null;
    this.lastOrigin = this.lastSelOrigin = null;
    // Used by the isClean() method
    this.generation = this.maxGeneration = startGen || 1;
  }

  // Create a history change event from an updateDoc-style change
  // object.
  function historyChangeFromChange(doc, change) {
    var histChange = {from: copyPos(change.from), to: changeEnd(change), text: getBetween(doc, change.from, change.to)};
    attachLocalSpans(doc, histChange, change.from.line, change.to.line + 1);
    linkedDocs(doc, function (doc) { return attachLocalSpans(doc, histChange, change.from.line, change.to.line + 1); }, true);
    return histChange
  }

  // Pop all selection events off the end of a history array. Stop at
  // a change event.
  function clearSelectionEvents(array) {
    while (array.length) {
      var last = lst(array);
      if (last.ranges) { array.pop(); }
      else { break }
    }
  }

  // Find the top change event in the history. Pop off selection
  // events that are in the way.
  function lastChangeEvent(hist, force) {
    if (force) {
      clearSelectionEvents(hist.done);
      return lst(hist.done)
    } else if (hist.done.length && !lst(hist.done).ranges) {
      return lst(hist.done)
    } else if (hist.done.length > 1 && !hist.done[hist.done.length - 2].ranges) {
      hist.done.pop();
      return lst(hist.done)
    }
  }

  // Register a change in the history. Merges changes that are within
  // a single operation, or are close together with an origin that
  // allows merging (starting with "+") into a single event.
  function addChangeToHistory(doc, change, selAfter, opId) {
    var hist = doc.history;
    hist.undone.length = 0;
    var time = +new Date, cur;
    var last;

    if ((hist.lastOp == opId ||
         hist.lastOrigin == change.origin && change.origin &&
         ((change.origin.charAt(0) == "+" && hist.lastModTime > time - (doc.cm ? doc.cm.options.historyEventDelay : 500)) ||
          change.origin.charAt(0) == "*")) &&
        (cur = lastChangeEvent(hist, hist.lastOp == opId))) {
      // Merge this change into the last event
      last = lst(cur.changes);
      if (cmp(change.from, change.to) == 0 && cmp(change.from, last.to) == 0) {
        // Optimized case for simple insertion -- don't want to add
        // new changesets for every character typed
        last.to = changeEnd(change);
      } else {
        // Add new sub-event
        cur.changes.push(historyChangeFromChange(doc, change));
      }
    } else {
      // Can not be merged, start a new event.
      var before = lst(hist.done);
      if (!before || !before.ranges)
        { pushSelectionToHistory(doc.sel, hist.done); }
      cur = {changes: [historyChangeFromChange(doc, change)],
             generation: hist.generation};
      hist.done.push(cur);
      while (hist.done.length > hist.undoDepth) {
        hist.done.shift();
        if (!hist.done[0].ranges) { hist.done.shift(); }
      }
    }
    hist.done.push(selAfter);
    hist.generation = ++hist.maxGeneration;
    hist.lastModTime = hist.lastSelTime = time;
    hist.lastOp = hist.lastSelOp = opId;
    hist.lastOrigin = hist.lastSelOrigin = change.origin;

    if (!last) { signal(doc, "historyAdded"); }
  }

  function selectionEventCanBeMerged(doc, origin, prev, sel) {
    var ch = origin.charAt(0);
    return ch == "*" ||
      ch == "+" &&
      prev.ranges.length == sel.ranges.length &&
      prev.somethingSelected() == sel.somethingSelected() &&
      new Date - doc.history.lastSelTime <= (doc.cm ? doc.cm.options.historyEventDelay : 500)
  }

  // Called whenever the selection changes, sets the new selection as
  // the pending selection in the history, and pushes the old pending
  // selection into the 'done' array when it was significantly
  // different (in number of selected ranges, emptiness, or time).
  function addSelectionToHistory(doc, sel, opId, options) {
    var hist = doc.history, origin = options && options.origin;

    // A new event is started when the previous origin does not match
    // the current, or the origins don't allow matching. Origins
    // starting with * are always merged, those starting with + are
    // merged when similar and close together in time.
    if (opId == hist.lastSelOp ||
        (origin && hist.lastSelOrigin == origin &&
         (hist.lastModTime == hist.lastSelTime && hist.lastOrigin == origin ||
          selectionEventCanBeMerged(doc, origin, lst(hist.done), sel))))
      { hist.done[hist.done.length - 1] = sel; }
    else
      { pushSelectionToHistory(sel, hist.done); }

    hist.lastSelTime = +new Date;
    hist.lastSelOrigin = origin;
    hist.lastSelOp = opId;
    if (options && options.clearRedo !== false)
      { clearSelectionEvents(hist.undone); }
  }

  function pushSelectionToHistory(sel, dest) {
    var top = lst(dest);
    if (!(top && top.ranges && top.equals(sel)))
      { dest.push(sel); }
  }

  // Used to store marked span information in the history.
  function attachLocalSpans(doc, change, from, to) {
    var existing = change["spans_" + doc.id], n = 0;
    doc.iter(Math.max(doc.first, from), Math.min(doc.first + doc.size, to), function (line) {
      if (line.markedSpans)
        { (existing || (existing = change["spans_" + doc.id] = {}))[n] = line.markedSpans; }
      ++n;
    });
  }

  // When un/re-doing restores text containing marked spans, those
  // that have been explicitly cleared should not be restored.
  function removeClearedSpans(spans) {
    if (!spans) { return null }
    var out;
    for (var i = 0; i < spans.length; ++i) {
      if (spans[i].marker.explicitlyCleared) { if (!out) { out = spans.slice(0, i); } }
      else if (out) { out.push(spans[i]); }
    }
    return !out ? spans : out.length ? out : null
  }

  // Retrieve and filter the old marked spans stored in a change event.
  function getOldSpans(doc, change) {
    var found = change["spans_" + doc.id];
    if (!found) { return null }
    var nw = [];
    for (var i = 0; i < change.text.length; ++i)
      { nw.push(removeClearedSpans(found[i])); }
    return nw
  }

  // Used for un/re-doing changes from the history. Combines the
  // result of computing the existing spans with the set of spans that
  // existed in the history (so that deleting around a span and then
  // undoing brings back the span).
  function mergeOldSpans(doc, change) {
    var old = getOldSpans(doc, change);
    var stretched = stretchSpansOverChange(doc, change);
    if (!old) { return stretched }
    if (!stretched) { return old }

    for (var i = 0; i < old.length; ++i) {
      var oldCur = old[i], stretchCur = stretched[i];
      if (oldCur && stretchCur) {
        spans: for (var j = 0; j < stretchCur.length; ++j) {
          var span = stretchCur[j];
          for (var k = 0; k < oldCur.length; ++k)
            { if (oldCur[k].marker == span.marker) { continue spans } }
          oldCur.push(span);
        }
      } else if (stretchCur) {
        old[i] = stretchCur;
      }
    }
    return old
  }

  // Used both to provide a JSON-safe object in .getHistory, and, when
  // detaching a document, to split the history in two
  function copyHistoryArray(events, newGroup, instantiateSel) {
    var copy = [];
    for (var i = 0; i < events.length; ++i) {
      var event = events[i];
      if (event.ranges) {
        copy.push(instantiateSel ? Selection.prototype.deepCopy.call(event) : event);
        continue
      }
      var changes = event.changes, newChanges = [];
      copy.push({changes: newChanges});
      for (var j = 0; j < changes.length; ++j) {
        var change = changes[j], m = (void 0);
        newChanges.push({from: change.from, to: change.to, text: change.text});
        if (newGroup) { for (var prop in change) { if (m = prop.match(/^spans_(\d+)$/)) {
          if (indexOf(newGroup, Number(m[1])) > -1) {
            lst(newChanges)[prop] = change[prop];
            delete change[prop];
          }
        } } }
      }
    }
    return copy
  }

  // The 'scroll' parameter given to many of these indicated whether
  // the new cursor position should be scrolled into view after
  // modifying the selection.

  // If shift is held or the extend flag is set, extends a range to
  // include a given position (and optionally a second position).
  // Otherwise, simply returns the range between the given positions.
  // Used for cursor motion and such.
  function extendRange(range, head, other, extend) {
    if (extend) {
      var anchor = range.anchor;
      if (other) {
        var posBefore = cmp(head, anchor) < 0;
        if (posBefore != (cmp(other, anchor) < 0)) {
          anchor = head;
          head = other;
        } else if (posBefore != (cmp(head, other) < 0)) {
          head = other;
        }
      }
      return new Range(anchor, head)
    } else {
      return new Range(other || head, head)
    }
  }

  // Extend the primary selection range, discard the rest.
  function extendSelection(doc, head, other, options, extend) {
    if (extend == null) { extend = doc.cm && (doc.cm.display.shift || doc.extend); }
    setSelection(doc, new Selection([extendRange(doc.sel.primary(), head, other, extend)], 0), options);
  }

  // Extend all selections (pos is an array of selections with length
  // equal the number of selections)
  function extendSelections(doc, heads, options) {
    var out = [];
    var extend = doc.cm && (doc.cm.display.shift || doc.extend);
    for (var i = 0; i < doc.sel.ranges.length; i++)
      { out[i] = extendRange(doc.sel.ranges[i], heads[i], null, extend); }
    var newSel = normalizeSelection(doc.cm, out, doc.sel.primIndex);
    setSelection(doc, newSel, options);
  }

  // Updates a single range in the selection.
  function replaceOneSelection(doc, i, range, options) {
    var ranges = doc.sel.ranges.slice(0);
    ranges[i] = range;
    setSelection(doc, normalizeSelection(doc.cm, ranges, doc.sel.primIndex), options);
  }

  // Reset the selection to a single range.
  function setSimpleSelection(doc, anchor, head, options) {
    setSelection(doc, simpleSelection(anchor, head), options);
  }

  // Give beforeSelectionChange handlers a change to influence a
  // selection update.
  function filterSelectionChange(doc, sel, options) {
    var obj = {
      ranges: sel.ranges,
      update: function(ranges) {
        var this$1 = this;

        this.ranges = [];
        for (var i = 0; i < ranges.length; i++)
          { this$1.ranges[i] = new Range(clipPos(doc, ranges[i].anchor),
                                     clipPos(doc, ranges[i].head)); }
      },
      origin: options && options.origin
    };
    signal(doc, "beforeSelectionChange", doc, obj);
    if (doc.cm) { signal(doc.cm, "beforeSelectionChange", doc.cm, obj); }
    if (obj.ranges != sel.ranges) { return normalizeSelection(doc.cm, obj.ranges, obj.ranges.length - 1) }
    else { return sel }
  }

  function setSelectionReplaceHistory(doc, sel, options) {
    var done = doc.history.done, last = lst(done);
    if (last && last.ranges) {
      done[done.length - 1] = sel;
      setSelectionNoUndo(doc, sel, options);
    } else {
      setSelection(doc, sel, options);
    }
  }

  // Set a new selection.
  function setSelection(doc, sel, options) {
    setSelectionNoUndo(doc, sel, options);
    addSelectionToHistory(doc, doc.sel, doc.cm ? doc.cm.curOp.id : NaN, options);
  }

  function setSelectionNoUndo(doc, sel, options) {
    if (hasHandler(doc, "beforeSelectionChange") || doc.cm && hasHandler(doc.cm, "beforeSelectionChange"))
      { sel = filterSelectionChange(doc, sel, options); }

    var bias = options && options.bias ||
      (cmp(sel.primary().head, doc.sel.primary().head) < 0 ? -1 : 1);
    setSelectionInner(doc, skipAtomicInSelection(doc, sel, bias, true));

    if (!(options && options.scroll === false) && doc.cm)
      { ensureCursorVisible(doc.cm); }
  }

  function setSelectionInner(doc, sel) {
    if (sel.equals(doc.sel)) { return }

    doc.sel = sel;

    if (doc.cm) {
      doc.cm.curOp.updateInput = doc.cm.curOp.selectionChanged = true;
      signalCursorActivity(doc.cm);
    }
    signalLater(doc, "cursorActivity", doc);
  }

  // Verify that the selection does not partially select any atomic
  // marked ranges.
  function reCheckSelection(doc) {
    setSelectionInner(doc, skipAtomicInSelection(doc, doc.sel, null, false));
  }

  // Return a selection that does not partially select any atomic
  // ranges.
  function skipAtomicInSelection(doc, sel, bias, mayClear) {
    var out;
    for (var i = 0; i < sel.ranges.length; i++) {
      var range = sel.ranges[i];
      var old = sel.ranges.length == doc.sel.ranges.length && doc.sel.ranges[i];
      var newAnchor = skipAtomic(doc, range.anchor, old && old.anchor, bias, mayClear);
      var newHead = skipAtomic(doc, range.head, old && old.head, bias, mayClear);
      if (out || newAnchor != range.anchor || newHead != range.head) {
        if (!out) { out = sel.ranges.slice(0, i); }
        out[i] = new Range(newAnchor, newHead);
      }
    }
    return out ? normalizeSelection(doc.cm, out, sel.primIndex) : sel
  }

  function skipAtomicInner(doc, pos, oldPos, dir, mayClear) {
    var line = getLine(doc, pos.line);
    if (line.markedSpans) { for (var i = 0; i < line.markedSpans.length; ++i) {
      var sp = line.markedSpans[i], m = sp.marker;
      if ((sp.from == null || (m.inclusiveLeft ? sp.from <= pos.ch : sp.from < pos.ch)) &&
          (sp.to == null || (m.inclusiveRight ? sp.to >= pos.ch : sp.to > pos.ch))) {
        if (mayClear) {
          signal(m, "beforeCursorEnter");
          if (m.explicitlyCleared) {
            if (!line.markedSpans) { break }
            else {--i; continue}
          }
        }
        if (!m.atomic) { continue }

        if (oldPos) {
          var near = m.find(dir < 0 ? 1 : -1), diff = (void 0);
          if (dir < 0 ? m.inclusiveRight : m.inclusiveLeft)
            { near = movePos(doc, near, -dir, near && near.line == pos.line ? line : null); }
          if (near && near.line == pos.line && (diff = cmp(near, oldPos)) && (dir < 0 ? diff < 0 : diff > 0))
            { return skipAtomicInner(doc, near, pos, dir, mayClear) }
        }

        var far = m.find(dir < 0 ? -1 : 1);
        if (dir < 0 ? m.inclusiveLeft : m.inclusiveRight)
          { far = movePos(doc, far, dir, far.line == pos.line ? line : null); }
        return far ? skipAtomicInner(doc, far, pos, dir, mayClear) : null
      }
    } }
    return pos
  }

  // Ensure a given position is not inside an atomic range.
  function skipAtomic(doc, pos, oldPos, bias, mayClear) {
    var dir = bias || 1;
    var found = skipAtomicInner(doc, pos, oldPos, dir, mayClear) ||
        (!mayClear && skipAtomicInner(doc, pos, oldPos, dir, true)) ||
        skipAtomicInner(doc, pos, oldPos, -dir, mayClear) ||
        (!mayClear && skipAtomicInner(doc, pos, oldPos, -dir, true));
    if (!found) {
      doc.cantEdit = true;
      return Pos(doc.first, 0)
    }
    return found
  }

  function movePos(doc, pos, dir, line) {
    if (dir < 0 && pos.ch == 0) {
      if (pos.line > doc.first) { return clipPos(doc, Pos(pos.line - 1)) }
      else { return null }
    } else if (dir > 0 && pos.ch == (line || getLine(doc, pos.line)).text.length) {
      if (pos.line < doc.first + doc.size - 1) { return Pos(pos.line + 1, 0) }
      else { return null }
    } else {
      return new Pos(pos.line, pos.ch + dir)
    }
  }

  function selectAll(cm) {
    cm.setSelection(Pos(cm.firstLine(), 0), Pos(cm.lastLine()), sel_dontScroll);
  }

  // UPDATING

  // Allow "beforeChange" event handlers to influence a change
  function filterChange(doc, change, update) {
    var obj = {
      canceled: false,
      from: change.from,
      to: change.to,
      text: change.text,
      origin: change.origin,
      cancel: function () { return obj.canceled = true; }
    };
    if (update) { obj.update = function (from, to, text, origin) {
      if (from) { obj.from = clipPos(doc, from); }
      if (to) { obj.to = clipPos(doc, to); }
      if (text) { obj.text = text; }
      if (origin !== undefined) { obj.origin = origin; }
    }; }
    signal(doc, "beforeChange", doc, obj);
    if (doc.cm) { signal(doc.cm, "beforeChange", doc.cm, obj); }

    if (obj.canceled) { return null }
    return {from: obj.from, to: obj.to, text: obj.text, origin: obj.origin}
  }

  // Apply a change to a document, and add it to the document's
  // history, and propagating it to all linked documents.
  function makeChange(doc, change, ignoreReadOnly) {
    if (doc.cm) {
      if (!doc.cm.curOp) { return operation(doc.cm, makeChange)(doc, change, ignoreReadOnly) }
      if (doc.cm.state.suppressEdits) { return }
    }

    if (hasHandler(doc, "beforeChange") || doc.cm && hasHandler(doc.cm, "beforeChange")) {
      change = filterChange(doc, change, true);
      if (!change) { return }
    }

    // Possibly split or suppress the update based on the presence
    // of read-only spans in its range.
    var split = sawReadOnlySpans && !ignoreReadOnly && removeReadOnlyRanges(doc, change.from, change.to);
    if (split) {
      for (var i = split.length - 1; i >= 0; --i)
        { makeChangeInner(doc, {from: split[i].from, to: split[i].to, text: i ? [""] : change.text, origin: change.origin}); }
    } else {
      makeChangeInner(doc, change);
    }
  }

  function makeChangeInner(doc, change) {
    if (change.text.length == 1 && change.text[0] == "" && cmp(change.from, change.to) == 0) { return }
    var selAfter = computeSelAfterChange(doc, change);
    addChangeToHistory(doc, change, selAfter, doc.cm ? doc.cm.curOp.id : NaN);

    makeChangeSingleDoc(doc, change, selAfter, stretchSpansOverChange(doc, change));
    var rebased = [];

    linkedDocs(doc, function (doc, sharedHist) {
      if (!sharedHist && indexOf(rebased, doc.history) == -1) {
        rebaseHist(doc.history, change);
        rebased.push(doc.history);
      }
      makeChangeSingleDoc(doc, change, null, stretchSpansOverChange(doc, change));
    });
  }

  // Revert a change stored in a document's history.
  function makeChangeFromHistory(doc, type, allowSelectionOnly) {
    var suppress = doc.cm && doc.cm.state.suppressEdits;
    if (suppress && !allowSelectionOnly) { return }

    var hist = doc.history, event, selAfter = doc.sel;
    var source = type == "undo" ? hist.done : hist.undone, dest = type == "undo" ? hist.undone : hist.done;

    // Verify that there is a useable event (so that ctrl-z won't
    // needlessly clear selection events)
    var i = 0;
    for (; i < source.length; i++) {
      event = source[i];
      if (allowSelectionOnly ? event.ranges && !event.equals(doc.sel) : !event.ranges)
        { break }
    }
    if (i == source.length) { return }
    hist.lastOrigin = hist.lastSelOrigin = null;

    for (;;) {
      event = source.pop();
      if (event.ranges) {
        pushSelectionToHistory(event, dest);
        if (allowSelectionOnly && !event.equals(doc.sel)) {
          setSelection(doc, event, {clearRedo: false});
          return
        }
        selAfter = event;
      } else if (suppress) {
        source.push(event);
        return
      } else { break }
    }

    // Build up a reverse change object to add to the opposite history
    // stack (redo when undoing, and vice versa).
    var antiChanges = [];
    pushSelectionToHistory(selAfter, dest);
    dest.push({changes: antiChanges, generation: hist.generation});
    hist.generation = event.generation || ++hist.maxGeneration;

    var filter = hasHandler(doc, "beforeChange") || doc.cm && hasHandler(doc.cm, "beforeChange");

    var loop = function ( i ) {
      var change = event.changes[i];
      change.origin = type;
      if (filter && !filterChange(doc, change, false)) {
        source.length = 0;
        return {}
      }

      antiChanges.push(historyChangeFromChange(doc, change));

      var after = i ? computeSelAfterChange(doc, change) : lst(source);
      makeChangeSingleDoc(doc, change, after, mergeOldSpans(doc, change));
      if (!i && doc.cm) { doc.cm.scrollIntoView({from: change.from, to: changeEnd(change)}); }
      var rebased = [];

      // Propagate to the linked documents
      linkedDocs(doc, function (doc, sharedHist) {
        if (!sharedHist && indexOf(rebased, doc.history) == -1) {
          rebaseHist(doc.history, change);
          rebased.push(doc.history);
        }
        makeChangeSingleDoc(doc, change, null, mergeOldSpans(doc, change));
      });
    };

    for (var i$1 = event.changes.length - 1; i$1 >= 0; --i$1) {
      var returned = loop( i$1 );

      if ( returned ) return returned.v;
    }
  }

  // Sub-views need their line numbers shifted when text is added
  // above or below them in the parent document.
  function shiftDoc(doc, distance) {
    if (distance == 0) { return }
    doc.first += distance;
    doc.sel = new Selection(map(doc.sel.ranges, function (range) { return new Range(
      Pos(range.anchor.line + distance, range.anchor.ch),
      Pos(range.head.line + distance, range.head.ch)
    ); }), doc.sel.primIndex);
    if (doc.cm) {
      regChange(doc.cm, doc.first, doc.first - distance, distance);
      for (var d = doc.cm.display, l = d.viewFrom; l < d.viewTo; l++)
        { regLineChange(doc.cm, l, "gutter"); }
    }
  }

  // More lower-level change function, handling only a single document
  // (not linked ones).
  function makeChangeSingleDoc(doc, change, selAfter, spans) {
    if (doc.cm && !doc.cm.curOp)
      { return operation(doc.cm, makeChangeSingleDoc)(doc, change, selAfter, spans) }

    if (change.to.line < doc.first) {
      shiftDoc(doc, change.text.length - 1 - (change.to.line - change.from.line));
      return
    }
    if (change.from.line > doc.lastLine()) { return }

    // Clip the change to the size of this doc
    if (change.from.line < doc.first) {
      var shift = change.text.length - 1 - (doc.first - change.from.line);
      shiftDoc(doc, shift);
      change = {from: Pos(doc.first, 0), to: Pos(change.to.line + shift, change.to.ch),
                text: [lst(change.text)], origin: change.origin};
    }
    var last = doc.lastLine();
    if (change.to.line > last) {
      change = {from: change.from, to: Pos(last, getLine(doc, last).text.length),
                text: [change.text[0]], origin: change.origin};
    }

    change.removed = getBetween(doc, change.from, change.to);

    if (!selAfter) { selAfter = computeSelAfterChange(doc, change); }
    if (doc.cm) { makeChangeSingleDocInEditor(doc.cm, change, spans); }
    else { updateDoc(doc, change, spans); }
    setSelectionNoUndo(doc, selAfter, sel_dontScroll);
  }

  // Handle the interaction of a change to a document with the editor
  // that this document is part of.
  function makeChangeSingleDocInEditor(cm, change, spans) {
    var doc = cm.doc, display = cm.display, from = change.from, to = change.to;

    var recomputeMaxLength = false, checkWidthStart = from.line;
    if (!cm.options.lineWrapping) {
      checkWidthStart = lineNo(visualLine(getLine(doc, from.line)));
      doc.iter(checkWidthStart, to.line + 1, function (line) {
        if (line == display.maxLine) {
          recomputeMaxLength = true;
          return true
        }
      });
    }

    if (doc.sel.contains(change.from, change.to) > -1)
      { signalCursorActivity(cm); }

    updateDoc(doc, change, spans, estimateHeight(cm));

    if (!cm.options.lineWrapping) {
      doc.iter(checkWidthStart, from.line + change.text.length, function (line) {
        var len = lineLength(line);
        if (len > display.maxLineLength) {
          display.maxLine = line;
          display.maxLineLength = len;
          display.maxLineChanged = true;
          recomputeMaxLength = false;
        }
      });
      if (recomputeMaxLength) { cm.curOp.updateMaxLine = true; }
    }

    retreatFrontier(doc, from.line);
    startWorker(cm, 400);

    var lendiff = change.text.length - (to.line - from.line) - 1;
    // Remember that these lines changed, for updating the display
    if (change.full)
      { regChange(cm); }
    else if (from.line == to.line && change.text.length == 1 && !isWholeLineUpdate(cm.doc, change))
      { regLineChange(cm, from.line, "text"); }
    else
      { regChange(cm, from.line, to.line + 1, lendiff); }

    var changesHandler = hasHandler(cm, "changes"), changeHandler = hasHandler(cm, "change");
    if (changeHandler || changesHandler) {
      var obj = {
        from: from, to: to,
        text: change.text,
        removed: change.removed,
        origin: change.origin
      };
      if (changeHandler) { signalLater(cm, "change", cm, obj); }
      if (changesHandler) { (cm.curOp.changeObjs || (cm.curOp.changeObjs = [])).push(obj); }
    }
    cm.display.selForContextMenu = null;
  }

  function replaceRange(doc, code, from, to, origin) {
    var assign;

    if (!to) { to = from; }
    if (cmp(to, from) < 0) { (assign = [to, from], from = assign[0], to = assign[1]); }
    if (typeof code == "string") { code = doc.splitLines(code); }
    makeChange(doc, {from: from, to: to, text: code, origin: origin});
  }

  // Rebasing/resetting history to deal with externally-sourced changes

  function rebaseHistSelSingle(pos, from, to, diff) {
    if (to < pos.line) {
      pos.line += diff;
    } else if (from < pos.line) {
      pos.line = from;
      pos.ch = 0;
    }
  }

  // Tries to rebase an array of history events given a change in the
  // document. If the change touches the same lines as the event, the
  // event, and everything 'behind' it, is discarded. If the change is
  // before the event, the event's positions are updated. Uses a
  // copy-on-write scheme for the positions, to avoid having to
  // reallocate them all on every rebase, but also avoid problems with
  // shared position objects being unsafely updated.
  function rebaseHistArray(array, from, to, diff) {
    for (var i = 0; i < array.length; ++i) {
      var sub = array[i], ok = true;
      if (sub.ranges) {
        if (!sub.copied) { sub = array[i] = sub.deepCopy(); sub.copied = true; }
        for (var j = 0; j < sub.ranges.length; j++) {
          rebaseHistSelSingle(sub.ranges[j].anchor, from, to, diff);
          rebaseHistSelSingle(sub.ranges[j].head, from, to, diff);
        }
        continue
      }
      for (var j$1 = 0; j$1 < sub.changes.length; ++j$1) {
        var cur = sub.changes[j$1];
        if (to < cur.from.line) {
          cur.from = Pos(cur.from.line + diff, cur.from.ch);
          cur.to = Pos(cur.to.line + diff, cur.to.ch);
        } else if (from <= cur.to.line) {
          ok = false;
          break
        }
      }
      if (!ok) {
        array.splice(0, i + 1);
        i = 0;
      }
    }
  }

  function rebaseHist(hist, change) {
    var from = change.from.line, to = change.to.line, diff = change.text.length - (to - from) - 1;
    rebaseHistArray(hist.done, from, to, diff);
    rebaseHistArray(hist.undone, from, to, diff);
  }

  // Utility for applying a change to a line by handle or number,
  // returning the number and optionally registering the line as
  // changed.
  function changeLine(doc, handle, changeType, op) {
    var no = handle, line = handle;
    if (typeof handle == "number") { line = getLine(doc, clipLine(doc, handle)); }
    else { no = lineNo(handle); }
    if (no == null) { return null }
    if (op(line, no) && doc.cm) { regLineChange(doc.cm, no, changeType); }
    return line
  }

  // The document is represented as a BTree consisting of leaves, with
  // chunk of lines in them, and branches, with up to ten leaves or
  // other branch nodes below them. The top node is always a branch
  // node, and is the document object itself (meaning it has
  // additional methods and properties).
  //
  // All nodes have parent links. The tree is used both to go from
  // line numbers to line objects, and to go from objects to numbers.
  // It also indexes by height, and is used to convert between height
  // and line object, and to find the total height of the document.
  //
  // See also http://marijnhaverbeke.nl/blog/codemirror-line-tree.html

  function LeafChunk(lines) {
    var this$1 = this;

    this.lines = lines;
    this.parent = null;
    var height = 0;
    for (var i = 0; i < lines.length; ++i) {
      lines[i].parent = this$1;
      height += lines[i].height;
    }
    this.height = height;
  }

  LeafChunk.prototype = {
    chunkSize: function() { return this.lines.length },

    // Remove the n lines at offset 'at'.
    removeInner: function(at, n) {
      var this$1 = this;

      for (var i = at, e = at + n; i < e; ++i) {
        var line = this$1.lines[i];
        this$1.height -= line.height;
        cleanUpLine(line);
        signalLater(line, "delete");
      }
      this.lines.splice(at, n);
    },

    // Helper used to collapse a small branch into a single leaf.
    collapse: function(lines) {
      lines.push.apply(lines, this.lines);
    },

    // Insert the given array of lines at offset 'at', count them as
    // having the given height.
    insertInner: function(at, lines, height) {
      var this$1 = this;

      this.height += height;
      this.lines = this.lines.slice(0, at).concat(lines).concat(this.lines.slice(at));
      for (var i = 0; i < lines.length; ++i) { lines[i].parent = this$1; }
    },

    // Used to iterate over a part of the tree.
    iterN: function(at, n, op) {
      var this$1 = this;

      for (var e = at + n; at < e; ++at)
        { if (op(this$1.lines[at])) { return true } }
    }
  };

  function BranchChunk(children) {
    var this$1 = this;

    this.children = children;
    var size = 0, height = 0;
    for (var i = 0; i < children.length; ++i) {
      var ch = children[i];
      size += ch.chunkSize(); height += ch.height;
      ch.parent = this$1;
    }
    this.size = size;
    this.height = height;
    this.parent = null;
  }

  BranchChunk.prototype = {
    chunkSize: function() { return this.size },

    removeInner: function(at, n) {
      var this$1 = this;

      this.size -= n;
      for (var i = 0; i < this.children.length; ++i) {
        var child = this$1.children[i], sz = child.chunkSize();
        if (at < sz) {
          var rm = Math.min(n, sz - at), oldHeight = child.height;
          child.removeInner(at, rm);
          this$1.height -= oldHeight - child.height;
          if (sz == rm) { this$1.children.splice(i--, 1); child.parent = null; }
          if ((n -= rm) == 0) { break }
          at = 0;
        } else { at -= sz; }
      }
      // If the result is smaller than 25 lines, ensure that it is a
      // single leaf node.
      if (this.size - n < 25 &&
          (this.children.length > 1 || !(this.children[0] instanceof LeafChunk))) {
        var lines = [];
        this.collapse(lines);
        this.children = [new LeafChunk(lines)];
        this.children[0].parent = this;
      }
    },

    collapse: function(lines) {
      var this$1 = this;

      for (var i = 0; i < this.children.length; ++i) { this$1.children[i].collapse(lines); }
    },

    insertInner: function(at, lines, height) {
      var this$1 = this;

      this.size += lines.length;
      this.height += height;
      for (var i = 0; i < this.children.length; ++i) {
        var child = this$1.children[i], sz = child.chunkSize();
        if (at <= sz) {
          child.insertInner(at, lines, height);
          if (child.lines && child.lines.length > 50) {
            // To avoid memory thrashing when child.lines is huge (e.g. first view of a large file), it's never spliced.
            // Instead, small slices are taken. They're taken in order because sequential memory accesses are fastest.
            var remaining = child.lines.length % 25 + 25;
            for (var pos = remaining; pos < child.lines.length;) {
              var leaf = new LeafChunk(child.lines.slice(pos, pos += 25));
              child.height -= leaf.height;
              this$1.children.splice(++i, 0, leaf);
              leaf.parent = this$1;
            }
            child.lines = child.lines.slice(0, remaining);
            this$1.maybeSpill();
          }
          break
        }
        at -= sz;
      }
    },

    // When a node has grown, check whether it should be split.
    maybeSpill: function() {
      if (this.children.length <= 10) { return }
      var me = this;
      do {
        var spilled = me.children.splice(me.children.length - 5, 5);
        var sibling = new BranchChunk(spilled);
        if (!me.parent) { // Become the parent node
          var copy = new BranchChunk(me.children);
          copy.parent = me;
          me.children = [copy, sibling];
          me = copy;
       } else {
          me.size -= sibling.size;
          me.height -= sibling.height;
          var myIndex = indexOf(me.parent.children, me);
          me.parent.children.splice(myIndex + 1, 0, sibling);
        }
        sibling.parent = me.parent;
      } while (me.children.length > 10)
      me.parent.maybeSpill();
    },

    iterN: function(at, n, op) {
      var this$1 = this;

      for (var i = 0; i < this.children.length; ++i) {
        var child = this$1.children[i], sz = child.chunkSize();
        if (at < sz) {
          var used = Math.min(n, sz - at);
          if (child.iterN(at, used, op)) { return true }
          if ((n -= used) == 0) { break }
          at = 0;
        } else { at -= sz; }
      }
    }
  };

  // Line widgets are block elements displayed above or below a line.

  var LineWidget = function(doc, node, options) {
    var this$1 = this;

    if (options) { for (var opt in options) { if (options.hasOwnProperty(opt))
      { this$1[opt] = options[opt]; } } }
    this.doc = doc;
    this.node = node;
  };

  LineWidget.prototype.clear = function () {
      var this$1 = this;

    var cm = this.doc.cm, ws = this.line.widgets, line = this.line, no = lineNo(line);
    if (no == null || !ws) { return }
    for (var i = 0; i < ws.length; ++i) { if (ws[i] == this$1) { ws.splice(i--, 1); } }
    if (!ws.length) { line.widgets = null; }
    var height = widgetHeight(this);
    updateLineHeight(line, Math.max(0, line.height - height));
    if (cm) {
      runInOp(cm, function () {
        adjustScrollWhenAboveVisible(cm, line, -height);
        regLineChange(cm, no, "widget");
      });
      signalLater(cm, "lineWidgetCleared", cm, this, no);
    }
  };

  LineWidget.prototype.changed = function () {
      var this$1 = this;

    var oldH = this.height, cm = this.doc.cm, line = this.line;
    this.height = null;
    var diff = widgetHeight(this) - oldH;
    if (!diff) { return }
    if (!lineIsHidden(this.doc, line)) { updateLineHeight(line, line.height + diff); }
    if (cm) {
      runInOp(cm, function () {
        cm.curOp.forceUpdate = true;
        adjustScrollWhenAboveVisible(cm, line, diff);
        signalLater(cm, "lineWidgetChanged", cm, this$1, lineNo(line));
      });
    }
  };
  eventMixin(LineWidget);

  function adjustScrollWhenAboveVisible(cm, line, diff) {
    if (heightAtLine(line) < ((cm.curOp && cm.curOp.scrollTop) || cm.doc.scrollTop))
      { addToScrollTop(cm, diff); }
  }

  function addLineWidget(doc, handle, node, options) {
    var widget = new LineWidget(doc, node, options);
    var cm = doc.cm;
    if (cm && widget.noHScroll) { cm.display.alignWidgets = true; }
    changeLine(doc, handle, "widget", function (line) {
      var widgets = line.widgets || (line.widgets = []);
      if (widget.insertAt == null) { widgets.push(widget); }
      else { widgets.splice(Math.min(widgets.length - 1, Math.max(0, widget.insertAt)), 0, widget); }
      widget.line = line;
      if (cm && !lineIsHidden(doc, line)) {
        var aboveVisible = heightAtLine(line) < doc.scrollTop;
        updateLineHeight(line, line.height + widgetHeight(widget));
        if (aboveVisible) { addToScrollTop(cm, widget.height); }
        cm.curOp.forceUpdate = true;
      }
      return true
    });
    if (cm) { signalLater(cm, "lineWidgetAdded", cm, widget, typeof handle == "number" ? handle : lineNo(handle)); }
    return widget
  }

  // TEXTMARKERS

  // Created with markText and setBookmark methods. A TextMarker is a
  // handle that can be used to clear or find a marked position in the
  // document. Line objects hold arrays (markedSpans) containing
  // {from, to, marker} object pointing to such marker objects, and
  // indicating that such a marker is present on that line. Multiple
  // lines may point to the same marker when it spans across lines.
  // The spans will have null for their from/to properties when the
  // marker continues beyond the start/end of the line. Markers have
  // links back to the lines they currently touch.

  // Collapsed markers have unique ids, in order to be able to order
  // them, which is needed for uniquely determining an outer marker
  // when they overlap (they may nest, but not partially overlap).
  var nextMarkerId = 0;

  var TextMarker = function(doc, type) {
    this.lines = [];
    this.type = type;
    this.doc = doc;
    this.id = ++nextMarkerId;
  };

  // Clear the marker.
  TextMarker.prototype.clear = function () {
      var this$1 = this;

    if (this.explicitlyCleared) { return }
    var cm = this.doc.cm, withOp = cm && !cm.curOp;
    if (withOp) { startOperation(cm); }
    if (hasHandler(this, "clear")) {
      var found = this.find();
      if (found) { signalLater(this, "clear", found.from, found.to); }
    }
    var min = null, max = null;
    for (var i = 0; i < this.lines.length; ++i) {
      var line = this$1.lines[i];
      var span = getMarkedSpanFor(line.markedSpans, this$1);
      if (cm && !this$1.collapsed) { regLineChange(cm, lineNo(line), "text"); }
      else if (cm) {
        if (span.to != null) { max = lineNo(line); }
        if (span.from != null) { min = lineNo(line); }
      }
      line.markedSpans = removeMarkedSpan(line.markedSpans, span);
      if (span.from == null && this$1.collapsed && !lineIsHidden(this$1.doc, line) && cm)
        { updateLineHeight(line, textHeight(cm.display)); }
    }
    if (cm && this.collapsed && !cm.options.lineWrapping) { for (var i$1 = 0; i$1 < this.lines.length; ++i$1) {
      var visual = visualLine(this$1.lines[i$1]), len = lineLength(visual);
      if (len > cm.display.maxLineLength) {
        cm.display.maxLine = visual;
        cm.display.maxLineLength = len;
        cm.display.maxLineChanged = true;
      }
    } }

    if (min != null && cm && this.collapsed) { regChange(cm, min, max + 1); }
    this.lines.length = 0;
    this.explicitlyCleared = true;
    if (this.atomic && this.doc.cantEdit) {
      this.doc.cantEdit = false;
      if (cm) { reCheckSelection(cm.doc); }
    }
    if (cm) { signalLater(cm, "markerCleared", cm, this, min, max); }
    if (withOp) { endOperation(cm); }
    if (this.parent) { this.parent.clear(); }
  };

  // Find the position of the marker in the document. Returns a {from,
  // to} object by default. Side can be passed to get a specific side
  // -- 0 (both), -1 (left), or 1 (right). When lineObj is true, the
  // Pos objects returned contain a line object, rather than a line
  // number (used to prevent looking up the same line twice).
  TextMarker.prototype.find = function (side, lineObj) {
      var this$1 = this;

    if (side == null && this.type == "bookmark") { side = 1; }
    var from, to;
    for (var i = 0; i < this.lines.length; ++i) {
      var line = this$1.lines[i];
      var span = getMarkedSpanFor(line.markedSpans, this$1);
      if (span.from != null) {
        from = Pos(lineObj ? line : lineNo(line), span.from);
        if (side == -1) { return from }
      }
      if (span.to != null) {
        to = Pos(lineObj ? line : lineNo(line), span.to);
        if (side == 1) { return to }
      }
    }
    return from && {from: from, to: to}
  };

  // Signals that the marker's widget changed, and surrounding layout
  // should be recomputed.
  TextMarker.prototype.changed = function () {
      var this$1 = this;

    var pos = this.find(-1, true), widget = this, cm = this.doc.cm;
    if (!pos || !cm) { return }
    runInOp(cm, function () {
      var line = pos.line, lineN = lineNo(pos.line);
      var view = findViewForLine(cm, lineN);
      if (view) {
        clearLineMeasurementCacheFor(view);
        cm.curOp.selectionChanged = cm.curOp.forceUpdate = true;
      }
      cm.curOp.updateMaxLine = true;
      if (!lineIsHidden(widget.doc, line) && widget.height != null) {
        var oldHeight = widget.height;
        widget.height = null;
        var dHeight = widgetHeight(widget) - oldHeight;
        if (dHeight)
          { updateLineHeight(line, line.height + dHeight); }
      }
      signalLater(cm, "markerChanged", cm, this$1);
    });
  };

  TextMarker.prototype.attachLine = function (line) {
    if (!this.lines.length && this.doc.cm) {
      var op = this.doc.cm.curOp;
      if (!op.maybeHiddenMarkers || indexOf(op.maybeHiddenMarkers, this) == -1)
        { (op.maybeUnhiddenMarkers || (op.maybeUnhiddenMarkers = [])).push(this); }
    }
    this.lines.push(line);
  };

  TextMarker.prototype.detachLine = function (line) {
    this.lines.splice(indexOf(this.lines, line), 1);
    if (!this.lines.length && this.doc.cm) {
      var op = this.doc.cm.curOp
      ;(op.maybeHiddenMarkers || (op.maybeHiddenMarkers = [])).push(this);
    }
  };
  eventMixin(TextMarker);

  // Create a marker, wire it up to the right lines, and
  function markText(doc, from, to, options, type) {
    // Shared markers (across linked documents) are handled separately
    // (markTextShared will call out to this again, once per
    // document).
    if (options && options.shared) { return markTextShared(doc, from, to, options, type) }
    // Ensure we are in an operation.
    if (doc.cm && !doc.cm.curOp) { return operation(doc.cm, markText)(doc, from, to, options, type) }

    var marker = new TextMarker(doc, type), diff = cmp(from, to);
    if (options) { copyObj(options, marker, false); }
    // Don't connect empty markers unless clearWhenEmpty is false
    if (diff > 0 || diff == 0 && marker.clearWhenEmpty !== false)
      { return marker }
    if (marker.replacedWith) {
      // Showing up as a widget implies collapsed (widget replaces text)
      marker.collapsed = true;
      marker.widgetNode = eltP("span", [marker.replacedWith], "CodeMirror-widget");
      if (!options.handleMouseEvents) { marker.widgetNode.setAttribute("cm-ignore-events", "true"); }
      if (options.insertLeft) { marker.widgetNode.insertLeft = true; }
    }
    if (marker.collapsed) {
      if (conflictingCollapsedRange(doc, from.line, from, to, marker) ||
          from.line != to.line && conflictingCollapsedRange(doc, to.line, from, to, marker))
        { throw new Error("Inserting collapsed marker partially overlapping an existing one") }
      seeCollapsedSpans();
    }

    if (marker.addToHistory)
      { addChangeToHistory(doc, {from: from, to: to, origin: "markText"}, doc.sel, NaN); }

    var curLine = from.line, cm = doc.cm, updateMaxLine;
    doc.iter(curLine, to.line + 1, function (line) {
      if (cm && marker.collapsed && !cm.options.lineWrapping && visualLine(line) == cm.display.maxLine)
        { updateMaxLine = true; }
      if (marker.collapsed && curLine != from.line) { updateLineHeight(line, 0); }
      addMarkedSpan(line, new MarkedSpan(marker,
                                         curLine == from.line ? from.ch : null,
                                         curLine == to.line ? to.ch : null));
      ++curLine;
    });
    // lineIsHidden depends on the presence of the spans, so needs a second pass
    if (marker.collapsed) { doc.iter(from.line, to.line + 1, function (line) {
      if (lineIsHidden(doc, line)) { updateLineHeight(line, 0); }
    }); }

    if (marker.clearOnEnter) { on(marker, "beforeCursorEnter", function () { return marker.clear(); }); }

    if (marker.readOnly) {
      seeReadOnlySpans();
      if (doc.history.done.length || doc.history.undone.length)
        { doc.clearHistory(); }
    }
    if (marker.collapsed) {
      marker.id = ++nextMarkerId;
      marker.atomic = true;
    }
    if (cm) {
      // Sync editor state
      if (updateMaxLine) { cm.curOp.updateMaxLine = true; }
      if (marker.collapsed)
        { regChange(cm, from.line, to.line + 1); }
      else if (marker.className || marker.title || marker.startStyle || marker.endStyle || marker.css)
        { for (var i = from.line; i <= to.line; i++) { regLineChange(cm, i, "text"); } }
      if (marker.atomic) { reCheckSelection(cm.doc); }
      signalLater(cm, "markerAdded", cm, marker);
    }
    return marker
  }

  // SHARED TEXTMARKERS

  // A shared marker spans multiple linked documents. It is
  // implemented as a meta-marker-object controlling multiple normal
  // markers.
  var SharedTextMarker = function(markers, primary) {
    var this$1 = this;

    this.markers = markers;
    this.primary = primary;
    for (var i = 0; i < markers.length; ++i)
      { markers[i].parent = this$1; }
  };

  SharedTextMarker.prototype.clear = function () {
      var this$1 = this;

    if (this.explicitlyCleared) { return }
    this.explicitlyCleared = true;
    for (var i = 0; i < this.markers.length; ++i)
      { this$1.markers[i].clear(); }
    signalLater(this, "clear");
  };

  SharedTextMarker.prototype.find = function (side, lineObj) {
    return this.primary.find(side, lineObj)
  };
  eventMixin(SharedTextMarker);

  function markTextShared(doc, from, to, options, type) {
    options = copyObj(options);
    options.shared = false;
    var markers = [markText(doc, from, to, options, type)], primary = markers[0];
    var widget = options.widgetNode;
    linkedDocs(doc, function (doc) {
      if (widget) { options.widgetNode = widget.cloneNode(true); }
      markers.push(markText(doc, clipPos(doc, from), clipPos(doc, to), options, type));
      for (var i = 0; i < doc.linked.length; ++i)
        { if (doc.linked[i].isParent) { return } }
      primary = lst(markers);
    });
    return new SharedTextMarker(markers, primary)
  }

  function findSharedMarkers(doc) {
    return doc.findMarks(Pos(doc.first, 0), doc.clipPos(Pos(doc.lastLine())), function (m) { return m.parent; })
  }

  function copySharedMarkers(doc, markers) {
    for (var i = 0; i < markers.length; i++) {
      var marker = markers[i], pos = marker.find();
      var mFrom = doc.clipPos(pos.from), mTo = doc.clipPos(pos.to);
      if (cmp(mFrom, mTo)) {
        var subMark = markText(doc, mFrom, mTo, marker.primary, marker.primary.type);
        marker.markers.push(subMark);
        subMark.parent = marker;
      }
    }
  }

  function detachSharedMarkers(markers) {
    var loop = function ( i ) {
      var marker = markers[i], linked = [marker.primary.doc];
      linkedDocs(marker.primary.doc, function (d) { return linked.push(d); });
      for (var j = 0; j < marker.markers.length; j++) {
        var subMarker = marker.markers[j];
        if (indexOf(linked, subMarker.doc) == -1) {
          subMarker.parent = null;
          marker.markers.splice(j--, 1);
        }
      }
    };

    for (var i = 0; i < markers.length; i++) loop( i );
  }

  var nextDocId = 0;
  var Doc = function(text, mode, firstLine, lineSep, direction) {
    if (!(this instanceof Doc)) { return new Doc(text, mode, firstLine, lineSep, direction) }
    if (firstLine == null) { firstLine = 0; }

    BranchChunk.call(this, [new LeafChunk([new Line("", null)])]);
    this.first = firstLine;
    this.scrollTop = this.scrollLeft = 0;
    this.cantEdit = false;
    this.cleanGeneration = 1;
    this.modeFrontier = this.highlightFrontier = firstLine;
    var start = Pos(firstLine, 0);
    this.sel = simpleSelection(start);
    this.history = new History(null);
    this.id = ++nextDocId;
    this.modeOption = mode;
    this.lineSep = lineSep;
    this.direction = (direction == "rtl") ? "rtl" : "ltr";
    this.extend = false;

    if (typeof text == "string") { text = this.splitLines(text); }
    updateDoc(this, {from: start, to: start, text: text});
    setSelection(this, simpleSelection(start), sel_dontScroll);
  };

  Doc.prototype = createObj(BranchChunk.prototype, {
    constructor: Doc,
    // Iterate over the document. Supports two forms -- with only one
    // argument, it calls that for each line in the document. With
    // three, it iterates over the range given by the first two (with
    // the second being non-inclusive).
    iter: function(from, to, op) {
      if (op) { this.iterN(from - this.first, to - from, op); }
      else { this.iterN(this.first, this.first + this.size, from); }
    },

    // Non-public interface for adding and removing lines.
    insert: function(at, lines) {
      var height = 0;
      for (var i = 0; i < lines.length; ++i) { height += lines[i].height; }
      this.insertInner(at - this.first, lines, height);
    },
    remove: function(at, n) { this.removeInner(at - this.first, n); },

    // From here, the methods are part of the public interface. Most
    // are also available from CodeMirror (editor) instances.

    getValue: function(lineSep) {
      var lines = getLines(this, this.first, this.first + this.size);
      if (lineSep === false) { return lines }
      return lines.join(lineSep || this.lineSeparator())
    },
    setValue: docMethodOp(function(code) {
      var top = Pos(this.first, 0), last = this.first + this.size - 1;
      makeChange(this, {from: top, to: Pos(last, getLine(this, last).text.length),
                        text: this.splitLines(code), origin: "setValue", full: true}, true);
      if (this.cm) { scrollToCoords(this.cm, 0, 0); }
      setSelection(this, simpleSelection(top), sel_dontScroll);
    }),
    replaceRange: function(code, from, to, origin) {
      from = clipPos(this, from);
      to = to ? clipPos(this, to) : from;
      replaceRange(this, code, from, to, origin);
    },
    getRange: function(from, to, lineSep) {
      var lines = getBetween(this, clipPos(this, from), clipPos(this, to));
      if (lineSep === false) { return lines }
      return lines.join(lineSep || this.lineSeparator())
    },

    getLine: function(line) {var l = this.getLineHandle(line); return l && l.text},

    getLineHandle: function(line) {if (isLine(this, line)) { return getLine(this, line) }},
    getLineNumber: function(line) {return lineNo(line)},

    getLineHandleVisualStart: function(line) {
      if (typeof line == "number") { line = getLine(this, line); }
      return visualLine(line)
    },

    lineCount: function() {return this.size},
    firstLine: function() {return this.first},
    lastLine: function() {return this.first + this.size - 1},

    clipPos: function(pos) {return clipPos(this, pos)},

    getCursor: function(start) {
      var range$$1 = this.sel.primary(), pos;
      if (start == null || start == "head") { pos = range$$1.head; }
      else if (start == "anchor") { pos = range$$1.anchor; }
      else if (start == "end" || start == "to" || start === false) { pos = range$$1.to(); }
      else { pos = range$$1.from(); }
      return pos
    },
    listSelections: function() { return this.sel.ranges },
    somethingSelected: function() {return this.sel.somethingSelected()},

    setCursor: docMethodOp(function(line, ch, options) {
      setSimpleSelection(this, clipPos(this, typeof line == "number" ? Pos(line, ch || 0) : line), null, options);
    }),
    setSelection: docMethodOp(function(anchor, head, options) {
      setSimpleSelection(this, clipPos(this, anchor), clipPos(this, head || anchor), options);
    }),
    extendSelection: docMethodOp(function(head, other, options) {
      extendSelection(this, clipPos(this, head), other && clipPos(this, other), options);
    }),
    extendSelections: docMethodOp(function(heads, options) {
      extendSelections(this, clipPosArray(this, heads), options);
    }),
    extendSelectionsBy: docMethodOp(function(f, options) {
      var heads = map(this.sel.ranges, f);
      extendSelections(this, clipPosArray(this, heads), options);
    }),
    setSelections: docMethodOp(function(ranges, primary, options) {
      var this$1 = this;

      if (!ranges.length) { return }
      var out = [];
      for (var i = 0; i < ranges.length; i++)
        { out[i] = new Range(clipPos(this$1, ranges[i].anchor),
                           clipPos(this$1, ranges[i].head)); }
      if (primary == null) { primary = Math.min(ranges.length - 1, this.sel.primIndex); }
      setSelection(this, normalizeSelection(this.cm, out, primary), options);
    }),
    addSelection: docMethodOp(function(anchor, head, options) {
      var ranges = this.sel.ranges.slice(0);
      ranges.push(new Range(clipPos(this, anchor), clipPos(this, head || anchor)));
      setSelection(this, normalizeSelection(this.cm, ranges, ranges.length - 1), options);
    }),

    getSelection: function(lineSep) {
      var this$1 = this;

      var ranges = this.sel.ranges, lines;
      for (var i = 0; i < ranges.length; i++) {
        var sel = getBetween(this$1, ranges[i].from(), ranges[i].to());
        lines = lines ? lines.concat(sel) : sel;
      }
      if (lineSep === false) { return lines }
      else { return lines.join(lineSep || this.lineSeparator()) }
    },
    getSelections: function(lineSep) {
      var this$1 = this;

      var parts = [], ranges = this.sel.ranges;
      for (var i = 0; i < ranges.length; i++) {
        var sel = getBetween(this$1, ranges[i].from(), ranges[i].to());
        if (lineSep !== false) { sel = sel.join(lineSep || this$1.lineSeparator()); }
        parts[i] = sel;
      }
      return parts
    },
    replaceSelection: function(code, collapse, origin) {
      var dup = [];
      for (var i = 0; i < this.sel.ranges.length; i++)
        { dup[i] = code; }
      this.replaceSelections(dup, collapse, origin || "+input");
    },
    replaceSelections: docMethodOp(function(code, collapse, origin) {
      var this$1 = this;

      var changes = [], sel = this.sel;
      for (var i = 0; i < sel.ranges.length; i++) {
        var range$$1 = sel.ranges[i];
        changes[i] = {from: range$$1.from(), to: range$$1.to(), text: this$1.splitLines(code[i]), origin: origin};
      }
      var newSel = collapse && collapse != "end" && computeReplacedSel(this, changes, collapse);
      for (var i$1 = changes.length - 1; i$1 >= 0; i$1--)
        { makeChange(this$1, changes[i$1]); }
      if (newSel) { setSelectionReplaceHistory(this, newSel); }
      else if (this.cm) { ensureCursorVisible(this.cm); }
    }),
    undo: docMethodOp(function() {makeChangeFromHistory(this, "undo");}),
    redo: docMethodOp(function() {makeChangeFromHistory(this, "redo");}),
    undoSelection: docMethodOp(function() {makeChangeFromHistory(this, "undo", true);}),
    redoSelection: docMethodOp(function() {makeChangeFromHistory(this, "redo", true);}),

    setExtending: function(val) {this.extend = val;},
    getExtending: function() {return this.extend},

    historySize: function() {
      var hist = this.history, done = 0, undone = 0;
      for (var i = 0; i < hist.done.length; i++) { if (!hist.done[i].ranges) { ++done; } }
      for (var i$1 = 0; i$1 < hist.undone.length; i$1++) { if (!hist.undone[i$1].ranges) { ++undone; } }
      return {undo: done, redo: undone}
    },
    clearHistory: function() {this.history = new History(this.history.maxGeneration);},

    markClean: function() {
      this.cleanGeneration = this.changeGeneration(true);
    },
    changeGeneration: function(forceSplit) {
      if (forceSplit)
        { this.history.lastOp = this.history.lastSelOp = this.history.lastOrigin = null; }
      return this.history.generation
    },
    isClean: function (gen) {
      return this.history.generation == (gen || this.cleanGeneration)
    },

    getHistory: function() {
      return {done: copyHistoryArray(this.history.done),
              undone: copyHistoryArray(this.history.undone)}
    },
    setHistory: function(histData) {
      var hist = this.history = new History(this.history.maxGeneration);
      hist.done = copyHistoryArray(histData.done.slice(0), null, true);
      hist.undone = copyHistoryArray(histData.undone.slice(0), null, true);
    },

    setGutterMarker: docMethodOp(function(line, gutterID, value) {
      return changeLine(this, line, "gutter", function (line) {
        var markers = line.gutterMarkers || (line.gutterMarkers = {});
        markers[gutterID] = value;
        if (!value && isEmpty(markers)) { line.gutterMarkers = null; }
        return true
      })
    }),

    clearGutter: docMethodOp(function(gutterID) {
      var this$1 = this;

      this.iter(function (line) {
        if (line.gutterMarkers && line.gutterMarkers[gutterID]) {
          changeLine(this$1, line, "gutter", function () {
            line.gutterMarkers[gutterID] = null;
            if (isEmpty(line.gutterMarkers)) { line.gutterMarkers = null; }
            return true
          });
        }
      });
    }),

    lineInfo: function(line) {
      var n;
      if (typeof line == "number") {
        if (!isLine(this, line)) { return null }
        n = line;
        line = getLine(this, line);
        if (!line) { return null }
      } else {
        n = lineNo(line);
        if (n == null) { return null }
      }
      return {line: n, handle: line, text: line.text, gutterMarkers: line.gutterMarkers,
              textClass: line.textClass, bgClass: line.bgClass, wrapClass: line.wrapClass,
              widgets: line.widgets}
    },

    addLineClass: docMethodOp(function(handle, where, cls) {
      return changeLine(this, handle, where == "gutter" ? "gutter" : "class", function (line) {
        var prop = where == "text" ? "textClass"
                 : where == "background" ? "bgClass"
                 : where == "gutter" ? "gutterClass" : "wrapClass";
        if (!line[prop]) { line[prop] = cls; }
        else if (classTest(cls).test(line[prop])) { return false }
        else { line[prop] += " " + cls; }
        return true
      })
    }),
    removeLineClass: docMethodOp(function(handle, where, cls) {
      return changeLine(this, handle, where == "gutter" ? "gutter" : "class", function (line) {
        var prop = where == "text" ? "textClass"
                 : where == "background" ? "bgClass"
                 : where == "gutter" ? "gutterClass" : "wrapClass";
        var cur = line[prop];
        if (!cur) { return false }
        else if (cls == null) { line[prop] = null; }
        else {
          var found = cur.match(classTest(cls));
          if (!found) { return false }
          var end = found.index + found[0].length;
          line[prop] = cur.slice(0, found.index) + (!found.index || end == cur.length ? "" : " ") + cur.slice(end) || null;
        }
        return true
      })
    }),

    addLineWidget: docMethodOp(function(handle, node, options) {
      return addLineWidget(this, handle, node, options)
    }),
    removeLineWidget: function(widget) { widget.clear(); },

    markText: function(from, to, options) {
      return markText(this, clipPos(this, from), clipPos(this, to), options, options && options.type || "range")
    },
    setBookmark: function(pos, options) {
      var realOpts = {replacedWith: options && (options.nodeType == null ? options.widget : options),
                      insertLeft: options && options.insertLeft,
                      clearWhenEmpty: false, shared: options && options.shared,
                      handleMouseEvents: options && options.handleMouseEvents};
      pos = clipPos(this, pos);
      return markText(this, pos, pos, realOpts, "bookmark")
    },
    findMarksAt: function(pos) {
      pos = clipPos(this, pos);
      var markers = [], spans = getLine(this, pos.line).markedSpans;
      if (spans) { for (var i = 0; i < spans.length; ++i) {
        var span = spans[i];
        if ((span.from == null || span.from <= pos.ch) &&
            (span.to == null || span.to >= pos.ch))
          { markers.push(span.marker.parent || span.marker); }
      } }
      return markers
    },
    findMarks: function(from, to, filter) {
      from = clipPos(this, from); to = clipPos(this, to);
      var found = [], lineNo$$1 = from.line;
      this.iter(from.line, to.line + 1, function (line) {
        var spans = line.markedSpans;
        if (spans) { for (var i = 0; i < spans.length; i++) {
          var span = spans[i];
          if (!(span.to != null && lineNo$$1 == from.line && from.ch >= span.to ||
                span.from == null && lineNo$$1 != from.line ||
                span.from != null && lineNo$$1 == to.line && span.from >= to.ch) &&
              (!filter || filter(span.marker)))
            { found.push(span.marker.parent || span.marker); }
        } }
        ++lineNo$$1;
      });
      return found
    },
    getAllMarks: function() {
      var markers = [];
      this.iter(function (line) {
        var sps = line.markedSpans;
        if (sps) { for (var i = 0; i < sps.length; ++i)
          { if (sps[i].from != null) { markers.push(sps[i].marker); } } }
      });
      return markers
    },

    posFromIndex: function(off) {
      var ch, lineNo$$1 = this.first, sepSize = this.lineSeparator().length;
      this.iter(function (line) {
        var sz = line.text.length + sepSize;
        if (sz > off) { ch = off; return true }
        off -= sz;
        ++lineNo$$1;
      });
      return clipPos(this, Pos(lineNo$$1, ch))
    },
    indexFromPos: function (coords) {
      coords = clipPos(this, coords);
      var index = coords.ch;
      if (coords.line < this.first || coords.ch < 0) { return 0 }
      var sepSize = this.lineSeparator().length;
      this.iter(this.first, coords.line, function (line) { // iter aborts when callback returns a truthy value
        index += line.text.length + sepSize;
      });
      return index
    },

    copy: function(copyHistory) {
      var doc = new Doc(getLines(this, this.first, this.first + this.size),
                        this.modeOption, this.first, this.lineSep, this.direction);
      doc.scrollTop = this.scrollTop; doc.scrollLeft = this.scrollLeft;
      doc.sel = this.sel;
      doc.extend = false;
      if (copyHistory) {
        doc.history.undoDepth = this.history.undoDepth;
        doc.setHistory(this.getHistory());
      }
      return doc
    },

    linkedDoc: function(options) {
      if (!options) { options = {}; }
      var from = this.first, to = this.first + this.size;
      if (options.from != null && options.from > from) { from = options.from; }
      if (options.to != null && options.to < to) { to = options.to; }
      var copy = new Doc(getLines(this, from, to), options.mode || this.modeOption, from, this.lineSep, this.direction);
      if (options.sharedHist) { copy.history = this.history
      ; }(this.linked || (this.linked = [])).push({doc: copy, sharedHist: options.sharedHist});
      copy.linked = [{doc: this, isParent: true, sharedHist: options.sharedHist}];
      copySharedMarkers(copy, findSharedMarkers(this));
      return copy
    },
    unlinkDoc: function(other) {
      var this$1 = this;

      if (other instanceof CodeMirror) { other = other.doc; }
      if (this.linked) { for (var i = 0; i < this.linked.length; ++i) {
        var link = this$1.linked[i];
        if (link.doc != other) { continue }
        this$1.linked.splice(i, 1);
        other.unlinkDoc(this$1);
        detachSharedMarkers(findSharedMarkers(this$1));
        break
      } }
      // If the histories were shared, split them again
      if (other.history == this.history) {
        var splitIds = [other.id];
        linkedDocs(other, function (doc) { return splitIds.push(doc.id); }, true);
        other.history = new History(null);
        other.history.done = copyHistoryArray(this.history.done, splitIds);
        other.history.undone = copyHistoryArray(this.history.undone, splitIds);
      }
    },
    iterLinkedDocs: function(f) {linkedDocs(this, f);},

    getMode: function() {return this.mode},
    getEditor: function() {return this.cm},

    splitLines: function(str) {
      if (this.lineSep) { return str.split(this.lineSep) }
      return splitLinesAuto(str)
    },
    lineSeparator: function() { return this.lineSep || "\n" },

    setDirection: docMethodOp(function (dir) {
      if (dir != "rtl") { dir = "ltr"; }
      if (dir == this.direction) { return }
      this.direction = dir;
      this.iter(function (line) { return line.order = null; });
      if (this.cm) { directionChanged(this.cm); }
    })
  });

  // Public alias.
  Doc.prototype.eachLine = Doc.prototype.iter;

  // Kludge to work around strange IE behavior where it'll sometimes
  // re-fire a series of drag-related events right after the drop (#1551)
  var lastDrop = 0;

  function onDrop(e) {
    var cm = this;
    clearDragCursor(cm);
    if (signalDOMEvent(cm, e) || eventInWidget(cm.display, e))
      { return }
    e_preventDefault(e);
    if (ie) { lastDrop = +new Date; }
    var pos = posFromMouse(cm, e, true), files = e.dataTransfer.files;
    if (!pos || cm.isReadOnly()) { return }
    // Might be a file drop, in which case we simply extract the text
    // and insert it.
    if (files && files.length && window.FileReader && window.File) {
      var n = files.length, text = Array(n), read = 0;
      var loadFile = function (file, i) {
        if (cm.options.allowDropFileTypes &&
            indexOf(cm.options.allowDropFileTypes, file.type) == -1)
          { return }

        var reader = new FileReader;
        reader.onload = operation(cm, function () {
          var content = reader.result;
          if (/[\x00-\x08\x0e-\x1f]{2}/.test(content)) { content = ""; }
          text[i] = content;
          if (++read == n) {
            pos = clipPos(cm.doc, pos);
            var change = {from: pos, to: pos,
                          text: cm.doc.splitLines(text.join(cm.doc.lineSeparator())),
                          origin: "paste"};
            makeChange(cm.doc, change);
            setSelectionReplaceHistory(cm.doc, simpleSelection(pos, changeEnd(change)));
          }
        });
        reader.readAsText(file);
      };
      for (var i = 0; i < n; ++i) { loadFile(files[i], i); }
    } else { // Normal drop
      // Don't do a replace if the drop happened inside of the selected text.
      if (cm.state.draggingText && cm.doc.sel.contains(pos) > -1) {
        cm.state.draggingText(e);
        // Ensure the editor is re-focused
        setTimeout(function () { return cm.display.input.focus(); }, 20);
        return
      }
      try {
        var text$1 = e.dataTransfer.getData("Text");
        if (text$1) {
          var selected;
          if (cm.state.draggingText && !cm.state.draggingText.copy)
            { selected = cm.listSelections(); }
          setSelectionNoUndo(cm.doc, simpleSelection(pos, pos));
          if (selected) { for (var i$1 = 0; i$1 < selected.length; ++i$1)
            { replaceRange(cm.doc, "", selected[i$1].anchor, selected[i$1].head, "drag"); } }
          cm.replaceSelection(text$1, "around", "paste");
          cm.display.input.focus();
        }
      }
      catch(e){}
    }
  }

  function onDragStart(cm, e) {
    if (ie && (!cm.state.draggingText || +new Date - lastDrop < 100)) { e_stop(e); return }
    if (signalDOMEvent(cm, e) || eventInWidget(cm.display, e)) { return }

    e.dataTransfer.setData("Text", cm.getSelection());
    e.dataTransfer.effectAllowed = "copyMove";

    // Use dummy image instead of default browsers image.
    // Recent Safari (~6.0.2) have a tendency to segfault when this happens, so we don't do it there.
    if (e.dataTransfer.setDragImage && !safari) {
      var img = elt("img", null, null, "position: fixed; left: 0; top: 0;");
      img.src = "data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==";
      if (presto) {
        img.width = img.height = 1;
        cm.display.wrapper.appendChild(img);
        // Force a relayout, or Opera won't use our image for some obscure reason
        img._top = img.offsetTop;
      }
      e.dataTransfer.setDragImage(img, 0, 0);
      if (presto) { img.parentNode.removeChild(img); }
    }
  }

  function onDragOver(cm, e) {
    var pos = posFromMouse(cm, e);
    if (!pos) { return }
    var frag = document.createDocumentFragment();
    drawSelectionCursor(cm, pos, frag);
    if (!cm.display.dragCursor) {
      cm.display.dragCursor = elt("div", null, "CodeMirror-cursors CodeMirror-dragcursors");
      cm.display.lineSpace.insertBefore(cm.display.dragCursor, cm.display.cursorDiv);
    }
    removeChildrenAndAdd(cm.display.dragCursor, frag);
  }

  function clearDragCursor(cm) {
    if (cm.display.dragCursor) {
      cm.display.lineSpace.removeChild(cm.display.dragCursor);
      cm.display.dragCursor = null;
    }
  }

  // These must be handled carefully, because naively registering a
  // handler for each editor will cause the editors to never be
  // garbage collected.

  function forEachCodeMirror(f) {
    if (!document.getElementsByClassName) { return }
    var byClass = document.getElementsByClassName("CodeMirror");
    for (var i = 0; i < byClass.length; i++) {
      var cm = byClass[i].CodeMirror;
      if (cm) { f(cm); }
    }
  }

  var globalsRegistered = false;
  function ensureGlobalHandlers() {
    if (globalsRegistered) { return }
    registerGlobalHandlers();
    globalsRegistered = true;
  }
  function registerGlobalHandlers() {
    // When the window resizes, we need to refresh active editors.
    var resizeTimer;
    on(window, "resize", function () {
      if (resizeTimer == null) { resizeTimer = setTimeout(function () {
        resizeTimer = null;
        forEachCodeMirror(onResize);
      }, 100); }
    });
    // When the window loses focus, we want to show the editor as blurred
    on(window, "blur", function () { return forEachCodeMirror(onBlur); });
  }
  // Called when the window resizes
  function onResize(cm) {
    var d = cm.display;
    // Might be a text scaling operation, clear size caches.
    d.cachedCharWidth = d.cachedTextHeight = d.cachedPaddingH = null;
    d.scrollbarsClipped = false;
    cm.setSize();
  }

  var keyNames = {
    3: "Pause", 8: "Backspace", 9: "Tab", 13: "Enter", 16: "Shift", 17: "Ctrl", 18: "Alt",
    19: "Pause", 20: "CapsLock", 27: "Esc", 32: "Space", 33: "PageUp", 34: "PageDown", 35: "End",
    36: "Home", 37: "Left", 38: "Up", 39: "Right", 40: "Down", 44: "PrintScrn", 45: "Insert",
    46: "Delete", 59: ";", 61: "=", 91: "Mod", 92: "Mod", 93: "Mod",
    106: "*", 107: "=", 109: "-", 110: ".", 111: "/", 127: "Delete", 145: "ScrollLock",
    173: "-", 186: ";", 187: "=", 188: ",", 189: "-", 190: ".", 191: "/", 192: "`", 219: "[", 220: "\\",
    221: "]", 222: "'", 63232: "Up", 63233: "Down", 63234: "Left", 63235: "Right", 63272: "Delete",
    63273: "Home", 63275: "End", 63276: "PageUp", 63277: "PageDown", 63302: "Insert"
  };

  // Number keys
  for (var i = 0; i < 10; i++) { keyNames[i + 48] = keyNames[i + 96] = String(i); }
  // Alphabetic keys
  for (var i$1 = 65; i$1 <= 90; i$1++) { keyNames[i$1] = String.fromCharCode(i$1); }
  // Function keys
  for (var i$2 = 1; i$2 <= 12; i$2++) { keyNames[i$2 + 111] = keyNames[i$2 + 63235] = "F" + i$2; }

  var keyMap = {};

  keyMap.basic = {
    "Left": "goCharLeft", "Right": "goCharRight", "Up": "goLineUp", "Down": "goLineDown",
    "End": "goLineEnd", "Home": "goLineStartSmart", "PageUp": "goPageUp", "PageDown": "goPageDown",
    "Delete": "delCharAfter", "Backspace": "delCharBefore", "Shift-Backspace": "delCharBefore",
    "Tab": "defaultTab", "Shift-Tab": "indentAuto",
    "Enter": "newlineAndIndent", "Insert": "toggleOverwrite",
    "Esc": "singleSelection"
  };
  // Note that the save and find-related commands aren't defined by
  // default. User code or addons can define them. Unknown commands
  // are simply ignored.
  keyMap.pcDefault = {
    "Ctrl-A": "selectAll", "Ctrl-D": "deleteLine", "Ctrl-Z": "undo", "Shift-Ctrl-Z": "redo", "Ctrl-Y": "redo",
    "Ctrl-Home": "goDocStart", "Ctrl-End": "goDocEnd", "Ctrl-Up": "goLineUp", "Ctrl-Down": "goLineDown",
    "Ctrl-Left": "goGroupLeft", "Ctrl-Right": "goGroupRight", "Alt-Left": "goLineStart", "Alt-Right": "goLineEnd",
    "Ctrl-Backspace": "delGroupBefore", "Ctrl-Delete": "delGroupAfter", "Ctrl-S": "save", "Ctrl-F": "find",
    "Ctrl-G": "findNext", "Shift-Ctrl-G": "findPrev", "Shift-Ctrl-F": "replace", "Shift-Ctrl-R": "replaceAll",
    "Ctrl-[": "indentLess", "Ctrl-]": "indentMore",
    "Ctrl-U": "undoSelection", "Shift-Ctrl-U": "redoSelection", "Alt-U": "redoSelection",
    "fallthrough": "basic"
  };
  // Very basic readline/emacs-style bindings, which are standard on Mac.
  keyMap.emacsy = {
    "Ctrl-F": "goCharRight", "Ctrl-B": "goCharLeft", "Ctrl-P": "goLineUp", "Ctrl-N": "goLineDown",
    "Alt-F": "goWordRight", "Alt-B": "goWordLeft", "Ctrl-A": "goLineStart", "Ctrl-E": "goLineEnd",
    "Ctrl-V": "goPageDown", "Shift-Ctrl-V": "goPageUp", "Ctrl-D": "delCharAfter", "Ctrl-H": "delCharBefore",
    "Alt-D": "delWordAfter", "Alt-Backspace": "delWordBefore", "Ctrl-K": "killLine", "Ctrl-T": "transposeChars",
    "Ctrl-O": "openLine"
  };
  keyMap.macDefault = {
    "Cmd-A": "selectAll", "Cmd-D": "deleteLine", "Cmd-Z": "undo", "Shift-Cmd-Z": "redo", "Cmd-Y": "redo",
    "Cmd-Home": "goDocStart", "Cmd-Up": "goDocStart", "Cmd-End": "goDocEnd", "Cmd-Down": "goDocEnd", "Alt-Left": "goGroupLeft",
    "Alt-Right": "goGroupRight", "Cmd-Left": "goLineLeft", "Cmd-Right": "goLineRight", "Alt-Backspace": "delGroupBefore",
    "Ctrl-Alt-Backspace": "delGroupAfter", "Alt-Delete": "delGroupAfter", "Cmd-S": "save", "Cmd-F": "find",
    "Cmd-G": "findNext", "Shift-Cmd-G": "findPrev", "Cmd-Alt-F": "replace", "Shift-Cmd-Alt-F": "replaceAll",
    "Cmd-[": "indentLess", "Cmd-]": "indentMore", "Cmd-Backspace": "delWrappedLineLeft", "Cmd-Delete": "delWrappedLineRight",
    "Cmd-U": "undoSelection", "Shift-Cmd-U": "redoSelection", "Ctrl-Up": "goDocStart", "Ctrl-Down": "goDocEnd",
    "fallthrough": ["basic", "emacsy"]
  };
  keyMap["default"] = mac ? keyMap.macDefault : keyMap.pcDefault;

  // KEYMAP DISPATCH

  function normalizeKeyName(name) {
    var parts = name.split(/-(?!$)/);
    name = parts[parts.length - 1];
    var alt, ctrl, shift, cmd;
    for (var i = 0; i < parts.length - 1; i++) {
      var mod = parts[i];
      if (/^(cmd|meta|m)$/i.test(mod)) { cmd = true; }
      else if (/^a(lt)?$/i.test(mod)) { alt = true; }
      else if (/^(c|ctrl|control)$/i.test(mod)) { ctrl = true; }
      else if (/^s(hift)?$/i.test(mod)) { shift = true; }
      else { throw new Error("Unrecognized modifier name: " + mod) }
    }
    if (alt) { name = "Alt-" + name; }
    if (ctrl) { name = "Ctrl-" + name; }
    if (cmd) { name = "Cmd-" + name; }
    if (shift) { name = "Shift-" + name; }
    return name
  }

  // This is a kludge to keep keymaps mostly working as raw objects
  // (backwards compatibility) while at the same time support features
  // like normalization and multi-stroke key bindings. It compiles a
  // new normalized keymap, and then updates the old object to reflect
  // this.
  function normalizeKeyMap(keymap) {
    var copy = {};
    for (var keyname in keymap) { if (keymap.hasOwnProperty(keyname)) {
      var value = keymap[keyname];
      if (/^(name|fallthrough|(de|at)tach)$/.test(keyname)) { continue }
      if (value == "...") { delete keymap[keyname]; continue }

      var keys = map(keyname.split(" "), normalizeKeyName);
      for (var i = 0; i < keys.length; i++) {
        var val = (void 0), name = (void 0);
        if (i == keys.length - 1) {
          name = keys.join(" ");
          val = value;
        } else {
          name = keys.slice(0, i + 1).join(" ");
          val = "...";
        }
        var prev = copy[name];
        if (!prev) { copy[name] = val; }
        else if (prev != val) { throw new Error("Inconsistent bindings for " + name) }
      }
      delete keymap[keyname];
    } }
    for (var prop in copy) { keymap[prop] = copy[prop]; }
    return keymap
  }

  function lookupKey(key, map$$1, handle, context) {
    map$$1 = getKeyMap(map$$1);
    var found = map$$1.call ? map$$1.call(key, context) : map$$1[key];
    if (found === false) { return "nothing" }
    if (found === "...") { return "multi" }
    if (found != null && handle(found)) { return "handled" }

    if (map$$1.fallthrough) {
      if (Object.prototype.toString.call(map$$1.fallthrough) != "[object Array]")
        { return lookupKey(key, map$$1.fallthrough, handle, context) }
      for (var i = 0; i < map$$1.fallthrough.length; i++) {
        var result = lookupKey(key, map$$1.fallthrough[i], handle, context);
        if (result) { return result }
      }
    }
  }

  // Modifier key presses don't count as 'real' key presses for the
  // purpose of keymap fallthrough.
  function isModifierKey(value) {
    var name = typeof value == "string" ? value : keyNames[value.keyCode];
    return name == "Ctrl" || name == "Alt" || name == "Shift" || name == "Mod"
  }

  function addModifierNames(name, event, noShift) {
    var base = name;
    if (event.altKey && base != "Alt") { name = "Alt-" + name; }
    if ((flipCtrlCmd ? event.metaKey : event.ctrlKey) && base != "Ctrl") { name = "Ctrl-" + name; }
    if ((flipCtrlCmd ? event.ctrlKey : event.metaKey) && base != "Cmd") { name = "Cmd-" + name; }
    if (!noShift && event.shiftKey && base != "Shift") { name = "Shift-" + name; }
    return name
  }

  // Look up the name of a key as indicated by an event object.
  function keyName(event, noShift) {
    if (presto && event.keyCode == 34 && event["char"]) { return false }
    var name = keyNames[event.keyCode];
    if (name == null || event.altGraphKey) { return false }
    // Ctrl-ScrollLock has keyCode 3, same as Ctrl-Pause,
    // so we'll use event.code when available (Chrome 48+, FF 38+, Safari 10.1+)
    if (event.keyCode == 3 && event.code) { name = event.code; }
    return addModifierNames(name, event, noShift)
  }

  function getKeyMap(val) {
    return typeof val == "string" ? keyMap[val] : val
  }

  // Helper for deleting text near the selection(s), used to implement
  // backspace, delete, and similar functionality.
  function deleteNearSelection(cm, compute) {
    var ranges = cm.doc.sel.ranges, kill = [];
    // Build up a set of ranges to kill first, merging overlapping
    // ranges.
    for (var i = 0; i < ranges.length; i++) {
      var toKill = compute(ranges[i]);
      while (kill.length && cmp(toKill.from, lst(kill).to) <= 0) {
        var replaced = kill.pop();
        if (cmp(replaced.from, toKill.from) < 0) {
          toKill.from = replaced.from;
          break
        }
      }
      kill.push(toKill);
    }
    // Next, remove those actual ranges.
    runInOp(cm, function () {
      for (var i = kill.length - 1; i >= 0; i--)
        { replaceRange(cm.doc, "", kill[i].from, kill[i].to, "+delete"); }
      ensureCursorVisible(cm);
    });
  }

  function moveCharLogically(line, ch, dir) {
    var target = skipExtendingChars(line.text, ch + dir, dir);
    return target < 0 || target > line.text.length ? null : target
  }

  function moveLogically(line, start, dir) {
    var ch = moveCharLogically(line, start.ch, dir);
    return ch == null ? null : new Pos(start.line, ch, dir < 0 ? "after" : "before")
  }

  function endOfLine(visually, cm, lineObj, lineNo, dir) {
    if (visually) {
      var order = getOrder(lineObj, cm.doc.direction);
      if (order) {
        var part = dir < 0 ? lst(order) : order[0];
        var moveInStorageOrder = (dir < 0) == (part.level == 1);
        var sticky = moveInStorageOrder ? "after" : "before";
        var ch;
        // With a wrapped rtl chunk (possibly spanning multiple bidi parts),
        // it could be that the last bidi part is not on the last visual line,
        // since visual lines contain content order-consecutive chunks.
        // Thus, in rtl, we are looking for the first (content-order) character
        // in the rtl chunk that is on the last line (that is, the same line
        // as the last (content-order) character).
        if (part.level > 0 || cm.doc.direction == "rtl") {
          var prep = prepareMeasureForLine(cm, lineObj);
          ch = dir < 0 ? lineObj.text.length - 1 : 0;
          var targetTop = measureCharPrepared(cm, prep, ch).top;
          ch = findFirst(function (ch) { return measureCharPrepared(cm, prep, ch).top == targetTop; }, (dir < 0) == (part.level == 1) ? part.from : part.to - 1, ch);
          if (sticky == "before") { ch = moveCharLogically(lineObj, ch, 1); }
        } else { ch = dir < 0 ? part.to : part.from; }
        return new Pos(lineNo, ch, sticky)
      }
    }
    return new Pos(lineNo, dir < 0 ? lineObj.text.length : 0, dir < 0 ? "before" : "after")
  }

  function moveVisually(cm, line, start, dir) {
    var bidi = getOrder(line, cm.doc.direction);
    if (!bidi) { return moveLogically(line, start, dir) }
    if (start.ch >= line.text.length) {
      start.ch = line.text.length;
      start.sticky = "before";
    } else if (start.ch <= 0) {
      start.ch = 0;
      start.sticky = "after";
    }
    var partPos = getBidiPartAt(bidi, start.ch, start.sticky), part = bidi[partPos];
    if (cm.doc.direction == "ltr" && part.level % 2 == 0 && (dir > 0 ? part.to > start.ch : part.from < start.ch)) {
      // Case 1: We move within an ltr part in an ltr editor. Even with wrapped lines,
      // nothing interesting happens.
      return moveLogically(line, start, dir)
    }

    var mv = function (pos, dir) { return moveCharLogically(line, pos instanceof Pos ? pos.ch : pos, dir); };
    var prep;
    var getWrappedLineExtent = function (ch) {
      if (!cm.options.lineWrapping) { return {begin: 0, end: line.text.length} }
      prep = prep || prepareMeasureForLine(cm, line);
      return wrappedLineExtentChar(cm, line, prep, ch)
    };
    var wrappedLineExtent = getWrappedLineExtent(start.sticky == "before" ? mv(start, -1) : start.ch);

    if (cm.doc.direction == "rtl" || part.level == 1) {
      var moveInStorageOrder = (part.level == 1) == (dir < 0);
      var ch = mv(start, moveInStorageOrder ? 1 : -1);
      if (ch != null && (!moveInStorageOrder ? ch >= part.from && ch >= wrappedLineExtent.begin : ch <= part.to && ch <= wrappedLineExtent.end)) {
        // Case 2: We move within an rtl part or in an rtl editor on the same visual line
        var sticky = moveInStorageOrder ? "before" : "after";
        return new Pos(start.line, ch, sticky)
      }
    }

    // Case 3: Could not move within this bidi part in this visual line, so leave
    // the current bidi part

    var searchInVisualLine = function (partPos, dir, wrappedLineExtent) {
      var getRes = function (ch, moveInStorageOrder) { return moveInStorageOrder
        ? new Pos(start.line, mv(ch, 1), "before")
        : new Pos(start.line, ch, "after"); };

      for (; partPos >= 0 && partPos < bidi.length; partPos += dir) {
        var part = bidi[partPos];
        var moveInStorageOrder = (dir > 0) == (part.level != 1);
        var ch = moveInStorageOrder ? wrappedLineExtent.begin : mv(wrappedLineExtent.end, -1);
        if (part.from <= ch && ch < part.to) { return getRes(ch, moveInStorageOrder) }
        ch = moveInStorageOrder ? part.from : mv(part.to, -1);
        if (wrappedLineExtent.begin <= ch && ch < wrappedLineExtent.end) { return getRes(ch, moveInStorageOrder) }
      }
    };

    // Case 3a: Look for other bidi parts on the same visual line
    var res = searchInVisualLine(partPos + dir, dir, wrappedLineExtent);
    if (res) { return res }

    // Case 3b: Look for other bidi parts on the next visual line
    var nextCh = dir > 0 ? wrappedLineExtent.end : mv(wrappedLineExtent.begin, -1);
    if (nextCh != null && !(dir > 0 && nextCh == line.text.length)) {
      res = searchInVisualLine(dir > 0 ? 0 : bidi.length - 1, dir, getWrappedLineExtent(nextCh));
      if (res) { return res }
    }

    // Case 4: Nowhere to move
    return null
  }

  // Commands are parameter-less actions that can be performed on an
  // editor, mostly used for keybindings.
  var commands = {
    selectAll: selectAll,
    singleSelection: function (cm) { return cm.setSelection(cm.getCursor("anchor"), cm.getCursor("head"), sel_dontScroll); },
    killLine: function (cm) { return deleteNearSelection(cm, function (range) {
      if (range.empty()) {
        var len = getLine(cm.doc, range.head.line).text.length;
        if (range.head.ch == len && range.head.line < cm.lastLine())
          { return {from: range.head, to: Pos(range.head.line + 1, 0)} }
        else
          { return {from: range.head, to: Pos(range.head.line, len)} }
      } else {
        return {from: range.from(), to: range.to()}
      }
    }); },
    deleteLine: function (cm) { return deleteNearSelection(cm, function (range) { return ({
      from: Pos(range.from().line, 0),
      to: clipPos(cm.doc, Pos(range.to().line + 1, 0))
    }); }); },
    delLineLeft: function (cm) { return deleteNearSelection(cm, function (range) { return ({
      from: Pos(range.from().line, 0), to: range.from()
    }); }); },
    delWrappedLineLeft: function (cm) { return deleteNearSelection(cm, function (range) {
      var top = cm.charCoords(range.head, "div").top + 5;
      var leftPos = cm.coordsChar({left: 0, top: top}, "div");
      return {from: leftPos, to: range.from()}
    }); },
    delWrappedLineRight: function (cm) { return deleteNearSelection(cm, function (range) {
      var top = cm.charCoords(range.head, "div").top + 5;
      var rightPos = cm.coordsChar({left: cm.display.lineDiv.offsetWidth + 100, top: top}, "div");
      return {from: range.from(), to: rightPos }
    }); },
    undo: function (cm) { return cm.undo(); },
    redo: function (cm) { return cm.redo(); },
    undoSelection: function (cm) { return cm.undoSelection(); },
    redoSelection: function (cm) { return cm.redoSelection(); },
    goDocStart: function (cm) { return cm.extendSelection(Pos(cm.firstLine(), 0)); },
    goDocEnd: function (cm) { return cm.extendSelection(Pos(cm.lastLine())); },
    goLineStart: function (cm) { return cm.extendSelectionsBy(function (range) { return lineStart(cm, range.head.line); },
      {origin: "+move", bias: 1}
    ); },
    goLineStartSmart: function (cm) { return cm.extendSelectionsBy(function (range) { return lineStartSmart(cm, range.head); },
      {origin: "+move", bias: 1}
    ); },
    goLineEnd: function (cm) { return cm.extendSelectionsBy(function (range) { return lineEnd(cm, range.head.line); },
      {origin: "+move", bias: -1}
    ); },
    goLineRight: function (cm) { return cm.extendSelectionsBy(function (range) {
      var top = cm.cursorCoords(range.head, "div").top + 5;
      return cm.coordsChar({left: cm.display.lineDiv.offsetWidth + 100, top: top}, "div")
    }, sel_move); },
    goLineLeft: function (cm) { return cm.extendSelectionsBy(function (range) {
      var top = cm.cursorCoords(range.head, "div").top + 5;
      return cm.coordsChar({left: 0, top: top}, "div")
    }, sel_move); },
    goLineLeftSmart: function (cm) { return cm.extendSelectionsBy(function (range) {
      var top = cm.cursorCoords(range.head, "div").top + 5;
      var pos = cm.coordsChar({left: 0, top: top}, "div");
      if (pos.ch < cm.getLine(pos.line).search(/\S/)) { return lineStartSmart(cm, range.head) }
      return pos
    }, sel_move); },
    goLineUp: function (cm) { return cm.moveV(-1, "line"); },
    goLineDown: function (cm) { return cm.moveV(1, "line"); },
    goPageUp: function (cm) { return cm.moveV(-1, "page"); },
    goPageDown: function (cm) { return cm.moveV(1, "page"); },
    goCharLeft: function (cm) { return cm.moveH(-1, "char"); },
    goCharRight: function (cm) { return cm.moveH(1, "char"); },
    goColumnLeft: function (cm) { return cm.moveH(-1, "column"); },
    goColumnRight: function (cm) { return cm.moveH(1, "column"); },
    goWordLeft: function (cm) { return cm.moveH(-1, "word"); },
    goGroupRight: function (cm) { return cm.moveH(1, "group"); },
    goGroupLeft: function (cm) { return cm.moveH(-1, "group"); },
    goWordRight: function (cm) { return cm.moveH(1, "word"); },
    delCharBefore: function (cm) { return cm.deleteH(-1, "char"); },
    delCharAfter: function (cm) { return cm.deleteH(1, "char"); },
    delWordBefore: function (cm) { return cm.deleteH(-1, "word"); },
    delWordAfter: function (cm) { return cm.deleteH(1, "word"); },
    delGroupBefore: function (cm) { return cm.deleteH(-1, "group"); },
    delGroupAfter: function (cm) { return cm.deleteH(1, "group"); },
    indentAuto: function (cm) { return cm.indentSelection("smart"); },
    indentMore: function (cm) { return cm.indentSelection("add"); },
    indentLess: function (cm) { return cm.indentSelection("subtract"); },
    insertTab: function (cm) { return cm.replaceSelection("\t"); },
    insertSoftTab: function (cm) {
      var spaces = [], ranges = cm.listSelections(), tabSize = cm.options.tabSize;
      for (var i = 0; i < ranges.length; i++) {
        var pos = ranges[i].from();
        var col = countColumn(cm.getLine(pos.line), pos.ch, tabSize);
        spaces.push(spaceStr(tabSize - col % tabSize));
      }
      cm.replaceSelections(spaces);
    },
    defaultTab: function (cm) {
      if (cm.somethingSelected()) { cm.indentSelection("add"); }
      else { cm.execCommand("insertTab"); }
    },
    // Swap the two chars left and right of each selection's head.
    // Move cursor behind the two swapped characters afterwards.
    //
    // Doesn't consider line feeds a character.
    // Doesn't scan more than one line above to find a character.
    // Doesn't do anything on an empty line.
    // Doesn't do anything with non-empty selections.
    transposeChars: function (cm) { return runInOp(cm, function () {
      var ranges = cm.listSelections(), newSel = [];
      for (var i = 0; i < ranges.length; i++) {
        if (!ranges[i].empty()) { continue }
        var cur = ranges[i].head, line = getLine(cm.doc, cur.line).text;
        if (line) {
          if (cur.ch == line.length) { cur = new Pos(cur.line, cur.ch - 1); }
          if (cur.ch > 0) {
            cur = new Pos(cur.line, cur.ch + 1);
            cm.replaceRange(line.charAt(cur.ch - 1) + line.charAt(cur.ch - 2),
                            Pos(cur.line, cur.ch - 2), cur, "+transpose");
          } else if (cur.line > cm.doc.first) {
            var prev = getLine(cm.doc, cur.line - 1).text;
            if (prev) {
              cur = new Pos(cur.line, 1);
              cm.replaceRange(line.charAt(0) + cm.doc.lineSeparator() +
                              prev.charAt(prev.length - 1),
                              Pos(cur.line - 1, prev.length - 1), cur, "+transpose");
            }
          }
        }
        newSel.push(new Range(cur, cur));
      }
      cm.setSelections(newSel);
    }); },
    newlineAndIndent: function (cm) { return runInOp(cm, function () {
      var sels = cm.listSelections();
      for (var i = sels.length - 1; i >= 0; i--)
        { cm.replaceRange(cm.doc.lineSeparator(), sels[i].anchor, sels[i].head, "+input"); }
      sels = cm.listSelections();
      for (var i$1 = 0; i$1 < sels.length; i$1++)
        { cm.indentLine(sels[i$1].from().line, null, true); }
      ensureCursorVisible(cm);
    }); },
    openLine: function (cm) { return cm.replaceSelection("\n", "start"); },
    toggleOverwrite: function (cm) { return cm.toggleOverwrite(); }
  };


  function lineStart(cm, lineN) {
    var line = getLine(cm.doc, lineN);
    var visual = visualLine(line);
    if (visual != line) { lineN = lineNo(visual); }
    return endOfLine(true, cm, visual, lineN, 1)
  }
  function lineEnd(cm, lineN) {
    var line = getLine(cm.doc, lineN);
    var visual = visualLineEnd(line);
    if (visual != line) { lineN = lineNo(visual); }
    return endOfLine(true, cm, line, lineN, -1)
  }
  function lineStartSmart(cm, pos) {
    var start = lineStart(cm, pos.line);
    var line = getLine(cm.doc, start.line);
    var order = getOrder(line, cm.doc.direction);
    if (!order || order[0].level == 0) {
      var firstNonWS = Math.max(0, line.text.search(/\S/));
      var inWS = pos.line == start.line && pos.ch <= firstNonWS && pos.ch;
      return Pos(start.line, inWS ? 0 : firstNonWS, start.sticky)
    }
    return start
  }

  // Run a handler that was bound to a key.
  function doHandleBinding(cm, bound, dropShift) {
    if (typeof bound == "string") {
      bound = commands[bound];
      if (!bound) { return false }
    }
    // Ensure previous input has been read, so that the handler sees a
    // consistent view of the document
    cm.display.input.ensurePolled();
    var prevShift = cm.display.shift, done = false;
    try {
      if (cm.isReadOnly()) { cm.state.suppressEdits = true; }
      if (dropShift) { cm.display.shift = false; }
      done = bound(cm) != Pass;
    } finally {
      cm.display.shift = prevShift;
      cm.state.suppressEdits = false;
    }
    return done
  }

  function lookupKeyForEditor(cm, name, handle) {
    for (var i = 0; i < cm.state.keyMaps.length; i++) {
      var result = lookupKey(name, cm.state.keyMaps[i], handle, cm);
      if (result) { return result }
    }
    return (cm.options.extraKeys && lookupKey(name, cm.options.extraKeys, handle, cm))
      || lookupKey(name, cm.options.keyMap, handle, cm)
  }

  // Note that, despite the name, this function is also used to check
  // for bound mouse clicks.

  var stopSeq = new Delayed;

  function dispatchKey(cm, name, e, handle) {
    var seq = cm.state.keySeq;
    if (seq) {
      if (isModifierKey(name)) { return "handled" }
      if (/\'$/.test(name))
        { cm.state.keySeq = null; }
      else
        { stopSeq.set(50, function () {
          if (cm.state.keySeq == seq) {
            cm.state.keySeq = null;
            cm.display.input.reset();
          }
        }); }
      if (dispatchKeyInner(cm, seq + " " + name, e, handle)) { return true }
    }
    return dispatchKeyInner(cm, name, e, handle)
  }

  function dispatchKeyInner(cm, name, e, handle) {
    var result = lookupKeyForEditor(cm, name, handle);

    if (result == "multi")
      { cm.state.keySeq = name; }
    if (result == "handled")
      { signalLater(cm, "keyHandled", cm, name, e); }

    if (result == "handled" || result == "multi") {
      e_preventDefault(e);
      restartBlink(cm);
    }

    return !!result
  }

  // Handle a key from the keydown event.
  function handleKeyBinding(cm, e) {
    var name = keyName(e, true);
    if (!name) { return false }

    if (e.shiftKey && !cm.state.keySeq) {
      // First try to resolve full name (including 'Shift-'). Failing
      // that, see if there is a cursor-motion command (starting with
      // 'go') bound to the keyname without 'Shift-'.
      return dispatchKey(cm, "Shift-" + name, e, function (b) { return doHandleBinding(cm, b, true); })
          || dispatchKey(cm, name, e, function (b) {
               if (typeof b == "string" ? /^go[A-Z]/.test(b) : b.motion)
                 { return doHandleBinding(cm, b) }
             })
    } else {
      return dispatchKey(cm, name, e, function (b) { return doHandleBinding(cm, b); })
    }
  }

  // Handle a key from the keypress event
  function handleCharBinding(cm, e, ch) {
    return dispatchKey(cm, "'" + ch + "'", e, function (b) { return doHandleBinding(cm, b, true); })
  }

  var lastStoppedKey = null;
  function onKeyDown(e) {
    var cm = this;
    cm.curOp.focus = activeElt();
    if (signalDOMEvent(cm, e)) { return }
    // IE does strange things with escape.
    if (ie && ie_version < 11 && e.keyCode == 27) { e.returnValue = false; }
    var code = e.keyCode;
    cm.display.shift = code == 16 || e.shiftKey;
    var handled = handleKeyBinding(cm, e);
    if (presto) {
      lastStoppedKey = handled ? code : null;
      // Opera has no cut event... we try to at least catch the key combo
      if (!handled && code == 88 && !hasCopyEvent && (mac ? e.metaKey : e.ctrlKey))
        { cm.replaceSelection("", null, "cut"); }
    }

    // Turn mouse into crosshair when Alt is held on Mac.
    if (code == 18 && !/\bCodeMirror-crosshair\b/.test(cm.display.lineDiv.className))
      { showCrossHair(cm); }
  }

  function showCrossHair(cm) {
    var lineDiv = cm.display.lineDiv;
    addClass(lineDiv, "CodeMirror-crosshair");

    function up(e) {
      if (e.keyCode == 18 || !e.altKey) {
        rmClass(lineDiv, "CodeMirror-crosshair");
        off(document, "keyup", up);
        off(document, "mouseover", up);
      }
    }
    on(document, "keyup", up);
    on(document, "mouseover", up);
  }

  function onKeyUp(e) {
    if (e.keyCode == 16) { this.doc.sel.shift = false; }
    signalDOMEvent(this, e);
  }

  function onKeyPress(e) {
    var cm = this;
    if (eventInWidget(cm.display, e) || signalDOMEvent(cm, e) || e.ctrlKey && !e.altKey || mac && e.metaKey) { return }
    var keyCode = e.keyCode, charCode = e.charCode;
    if (presto && keyCode == lastStoppedKey) {lastStoppedKey = null; e_preventDefault(e); return}
    if ((presto && (!e.which || e.which < 10)) && handleKeyBinding(cm, e)) { return }
    var ch = String.fromCharCode(charCode == null ? keyCode : charCode);
    // Some browsers fire keypress events for backspace
    if (ch == "\x08") { return }
    if (handleCharBinding(cm, e, ch)) { return }
    cm.display.input.onKeyPress(e);
  }

  var DOUBLECLICK_DELAY = 400;

  var PastClick = function(time, pos, button) {
    this.time = time;
    this.pos = pos;
    this.button = button;
  };

  PastClick.prototype.compare = function (time, pos, button) {
    return this.time + DOUBLECLICK_DELAY > time &&
      cmp(pos, this.pos) == 0 && button == this.button
  };

  var lastClick, lastDoubleClick;
  function clickRepeat(pos, button) {
    var now = +new Date;
    if (lastDoubleClick && lastDoubleClick.compare(now, pos, button)) {
      lastClick = lastDoubleClick = null;
      return "triple"
    } else if (lastClick && lastClick.compare(now, pos, button)) {
      lastDoubleClick = new PastClick(now, pos, button);
      lastClick = null;
      return "double"
    } else {
      lastClick = new PastClick(now, pos, button);
      lastDoubleClick = null;
      return "single"
    }
  }

  // A mouse down can be a single click, double click, triple click,
  // start of selection drag, start of text drag, new cursor
  // (ctrl-click), rectangle drag (alt-drag), or xwin
  // middle-click-paste. Or it might be a click on something we should
  // not interfere with, such as a scrollbar or widget.
  function onMouseDown(e) {
    var cm = this, display = cm.display;
    if (signalDOMEvent(cm, e) || display.activeTouch && display.input.supportsTouch()) { return }
    display.input.ensurePolled();
    display.shift = e.shiftKey;

    if (eventInWidget(display, e)) {
      if (!webkit) {
        // Briefly turn off draggability, to allow widgets to do
        // normal dragging things.
        display.scroller.draggable = false;
        setTimeout(function () { return display.scroller.draggable = true; }, 100);
      }
      return
    }
    if (clickInGutter(cm, e)) { return }
    var pos = posFromMouse(cm, e), button = e_button(e), repeat = pos ? clickRepeat(pos, button) : "single";
    window.focus();

    // #3261: make sure, that we're not starting a second selection
    if (button == 1 && cm.state.selectingText)
      { cm.state.selectingText(e); }

    if (pos && handleMappedButton(cm, button, pos, repeat, e)) { return }

    if (button == 1) {
      if (pos) { leftButtonDown(cm, pos, repeat, e); }
      else if (e_target(e) == display.scroller) { e_preventDefault(e); }
    } else if (button == 2) {
      if (pos) { extendSelection(cm.doc, pos); }
      setTimeout(function () { return display.input.focus(); }, 20);
    } else if (button == 3) {
      if (captureRightClick) { cm.display.input.onContextMenu(e); }
      else { delayBlurEvent(cm); }
    }
  }

  function handleMappedButton(cm, button, pos, repeat, event) {
    var name = "Click";
    if (repeat == "double") { name = "Double" + name; }
    else if (repeat == "triple") { name = "Triple" + name; }
    name = (button == 1 ? "Left" : button == 2 ? "Middle" : "Right") + name;

    return dispatchKey(cm,  addModifierNames(name, event), event, function (bound) {
      if (typeof bound == "string") { bound = commands[bound]; }
      if (!bound) { return false }
      var done = false;
      try {
        if (cm.isReadOnly()) { cm.state.suppressEdits = true; }
        done = bound(cm, pos) != Pass;
      } finally {
        cm.state.suppressEdits = false;
      }
      return done
    })
  }

  function configureMouse(cm, repeat, event) {
    var option = cm.getOption("configureMouse");
    var value = option ? option(cm, repeat, event) : {};
    if (value.unit == null) {
      var rect = chromeOS ? event.shiftKey && event.metaKey : event.altKey;
      value.unit = rect ? "rectangle" : repeat == "single" ? "char" : repeat == "double" ? "word" : "line";
    }
    if (value.extend == null || cm.doc.extend) { value.extend = cm.doc.extend || event.shiftKey; }
    if (value.addNew == null) { value.addNew = mac ? event.metaKey : event.ctrlKey; }
    if (value.moveOnDrag == null) { value.moveOnDrag = !(mac ? event.altKey : event.ctrlKey); }
    return value
  }

  function leftButtonDown(cm, pos, repeat, event) {
    if (ie) { setTimeout(bind(ensureFocus, cm), 0); }
    else { cm.curOp.focus = activeElt(); }

    var behavior = configureMouse(cm, repeat, event);

    var sel = cm.doc.sel, contained;
    if (cm.options.dragDrop && dragAndDrop && !cm.isReadOnly() &&
        repeat == "single" && (contained = sel.contains(pos)) > -1 &&
        (cmp((contained = sel.ranges[contained]).from(), pos) < 0 || pos.xRel > 0) &&
        (cmp(contained.to(), pos) > 0 || pos.xRel < 0))
      { leftButtonStartDrag(cm, event, pos, behavior); }
    else
      { leftButtonSelect(cm, event, pos, behavior); }
  }

  // Start a text drag. When it ends, see if any dragging actually
  // happen, and treat as a click if it didn't.
  function leftButtonStartDrag(cm, event, pos, behavior) {
    var display = cm.display, moved = false;
    var dragEnd = operation(cm, function (e) {
      if (webkit) { display.scroller.draggable = false; }
      cm.state.draggingText = false;
      off(display.wrapper.ownerDocument, "mouseup", dragEnd);
      off(display.wrapper.ownerDocument, "mousemove", mouseMove);
      off(display.scroller, "dragstart", dragStart);
      off(display.scroller, "drop", dragEnd);
      if (!moved) {
        e_preventDefault(e);
        if (!behavior.addNew)
          { extendSelection(cm.doc, pos, null, null, behavior.extend); }
        // Work around unexplainable focus problem in IE9 (#2127) and Chrome (#3081)
        if (webkit || ie && ie_version == 9)
          { setTimeout(function () {display.wrapper.ownerDocument.body.focus(); display.input.focus();}, 20); }
        else
          { display.input.focus(); }
      }
    });
    var mouseMove = function(e2) {
      moved = moved || Math.abs(event.clientX - e2.clientX) + Math.abs(event.clientY - e2.clientY) >= 10;
    };
    var dragStart = function () { return moved = true; };
    // Let the drag handler handle this.
    if (webkit) { display.scroller.draggable = true; }
    cm.state.draggingText = dragEnd;
    dragEnd.copy = !behavior.moveOnDrag;
    // IE's approach to draggable
    if (display.scroller.dragDrop) { display.scroller.dragDrop(); }
    on(display.wrapper.ownerDocument, "mouseup", dragEnd);
    on(display.wrapper.ownerDocument, "mousemove", mouseMove);
    on(display.scroller, "dragstart", dragStart);
    on(display.scroller, "drop", dragEnd);

    delayBlurEvent(cm);
    setTimeout(function () { return display.input.focus(); }, 20);
  }

  function rangeForUnit(cm, pos, unit) {
    if (unit == "char") { return new Range(pos, pos) }
    if (unit == "word") { return cm.findWordAt(pos) }
    if (unit == "line") { return new Range(Pos(pos.line, 0), clipPos(cm.doc, Pos(pos.line + 1, 0))) }
    var result = unit(cm, pos);
    return new Range(result.from, result.to)
  }

  // Normal selection, as opposed to text dragging.
  function leftButtonSelect(cm, event, start, behavior) {
    var display = cm.display, doc = cm.doc;
    e_preventDefault(event);

    var ourRange, ourIndex, startSel = doc.sel, ranges = startSel.ranges;
    if (behavior.addNew && !behavior.extend) {
      ourIndex = doc.sel.contains(start);
      if (ourIndex > -1)
        { ourRange = ranges[ourIndex]; }
      else
        { ourRange = new Range(start, start); }
    } else {
      ourRange = doc.sel.primary();
      ourIndex = doc.sel.primIndex;
    }

    if (behavior.unit == "rectangle") {
      if (!behavior.addNew) { ourRange = new Range(start, start); }
      start = posFromMouse(cm, event, true, true);
      ourIndex = -1;
    } else {
      var range$$1 = rangeForUnit(cm, start, behavior.unit);
      if (behavior.extend)
        { ourRange = extendRange(ourRange, range$$1.anchor, range$$1.head, behavior.extend); }
      else
        { ourRange = range$$1; }
    }

    if (!behavior.addNew) {
      ourIndex = 0;
      setSelection(doc, new Selection([ourRange], 0), sel_mouse);
      startSel = doc.sel;
    } else if (ourIndex == -1) {
      ourIndex = ranges.length;
      setSelection(doc, normalizeSelection(cm, ranges.concat([ourRange]), ourIndex),
                   {scroll: false, origin: "*mouse"});
    } else if (ranges.length > 1 && ranges[ourIndex].empty() && behavior.unit == "char" && !behavior.extend) {
      setSelection(doc, normalizeSelection(cm, ranges.slice(0, ourIndex).concat(ranges.slice(ourIndex + 1)), 0),
                   {scroll: false, origin: "*mouse"});
      startSel = doc.sel;
    } else {
      replaceOneSelection(doc, ourIndex, ourRange, sel_mouse);
    }

    var lastPos = start;
    function extendTo(pos) {
      if (cmp(lastPos, pos) == 0) { return }
      lastPos = pos;

      if (behavior.unit == "rectangle") {
        var ranges = [], tabSize = cm.options.tabSize;
        var startCol = countColumn(getLine(doc, start.line).text, start.ch, tabSize);
        var posCol = countColumn(getLine(doc, pos.line).text, pos.ch, tabSize);
        var left = Math.min(startCol, posCol), right = Math.max(startCol, posCol);
        for (var line = Math.min(start.line, pos.line), end = Math.min(cm.lastLine(), Math.max(start.line, pos.line));
             line <= end; line++) {
          var text = getLine(doc, line).text, leftPos = findColumn(text, left, tabSize);
          if (left == right)
            { ranges.push(new Range(Pos(line, leftPos), Pos(line, leftPos))); }
          else if (text.length > leftPos)
            { ranges.push(new Range(Pos(line, leftPos), Pos(line, findColumn(text, right, tabSize)))); }
        }
        if (!ranges.length) { ranges.push(new Range(start, start)); }
        setSelection(doc, normalizeSelection(cm, startSel.ranges.slice(0, ourIndex).concat(ranges), ourIndex),
                     {origin: "*mouse", scroll: false});
        cm.scrollIntoView(pos);
      } else {
        var oldRange = ourRange;
        var range$$1 = rangeForUnit(cm, pos, behavior.unit);
        var anchor = oldRange.anchor, head;
        if (cmp(range$$1.anchor, anchor) > 0) {
          head = range$$1.head;
          anchor = minPos(oldRange.from(), range$$1.anchor);
        } else {
          head = range$$1.anchor;
          anchor = maxPos(oldRange.to(), range$$1.head);
        }
        var ranges$1 = startSel.ranges.slice(0);
        ranges$1[ourIndex] = bidiSimplify(cm, new Range(clipPos(doc, anchor), head));
        setSelection(doc, normalizeSelection(cm, ranges$1, ourIndex), sel_mouse);
      }
    }

    var editorSize = display.wrapper.getBoundingClientRect();
    // Used to ensure timeout re-tries don't fire when another extend
    // happened in the meantime (clearTimeout isn't reliable -- at
    // least on Chrome, the timeouts still happen even when cleared,
    // if the clear happens after their scheduled firing time).
    var counter = 0;

    function extend(e) {
      var curCount = ++counter;
      var cur = posFromMouse(cm, e, true, behavior.unit == "rectangle");
      if (!cur) { return }
      if (cmp(cur, lastPos) != 0) {
        cm.curOp.focus = activeElt();
        extendTo(cur);
        var visible = visibleLines(display, doc);
        if (cur.line >= visible.to || cur.line < visible.from)
          { setTimeout(operation(cm, function () {if (counter == curCount) { extend(e); }}), 150); }
      } else {
        var outside = e.clientY < editorSize.top ? -20 : e.clientY > editorSize.bottom ? 20 : 0;
        if (outside) { setTimeout(operation(cm, function () {
          if (counter != curCount) { return }
          display.scroller.scrollTop += outside;
          extend(e);
        }), 50); }
      }
    }

    function done(e) {
      cm.state.selectingText = false;
      counter = Infinity;
      e_preventDefault(e);
      display.input.focus();
      off(display.wrapper.ownerDocument, "mousemove", move);
      off(display.wrapper.ownerDocument, "mouseup", up);
      doc.history.lastSelOrigin = null;
    }

    var move = operation(cm, function (e) {
      if (e.buttons === 0 || !e_button(e)) { done(e); }
      else { extend(e); }
    });
    var up = operation(cm, done);
    cm.state.selectingText = up;
    on(display.wrapper.ownerDocument, "mousemove", move);
    on(display.wrapper.ownerDocument, "mouseup", up);
  }

  // Used when mouse-selecting to adjust the anchor to the proper side
  // of a bidi jump depending on the visual position of the head.
  function bidiSimplify(cm, range$$1) {
    var anchor = range$$1.anchor;
    var head = range$$1.head;
    var anchorLine = getLine(cm.doc, anchor.line);
    if (cmp(anchor, head) == 0 && anchor.sticky == head.sticky) { return range$$1 }
    var order = getOrder(anchorLine);
    if (!order) { return range$$1 }
    var index = getBidiPartAt(order, anchor.ch, anchor.sticky), part = order[index];
    if (part.from != anchor.ch && part.to != anchor.ch) { return range$$1 }
    var boundary = index + ((part.from == anchor.ch) == (part.level != 1) ? 0 : 1);
    if (boundary == 0 || boundary == order.length) { return range$$1 }

    // Compute the relative visual position of the head compared to the
    // anchor (<0 is to the left, >0 to the right)
    var leftSide;
    if (head.line != anchor.line) {
      leftSide = (head.line - anchor.line) * (cm.doc.direction == "ltr" ? 1 : -1) > 0;
    } else {
      var headIndex = getBidiPartAt(order, head.ch, head.sticky);
      var dir = headIndex - index || (head.ch - anchor.ch) * (part.level == 1 ? -1 : 1);
      if (headIndex == boundary - 1 || headIndex == boundary)
        { leftSide = dir < 0; }
      else
        { leftSide = dir > 0; }
    }

    var usePart = order[boundary + (leftSide ? -1 : 0)];
    var from = leftSide == (usePart.level == 1);
    var ch = from ? usePart.from : usePart.to, sticky = from ? "after" : "before";
    return anchor.ch == ch && anchor.sticky == sticky ? range$$1 : new Range(new Pos(anchor.line, ch, sticky), head)
  }


  // Determines whether an event happened in the gutter, and fires the
  // handlers for the corresponding event.
  function gutterEvent(cm, e, type, prevent) {
    var mX, mY;
    if (e.touches) {
      mX = e.touches[0].clientX;
      mY = e.touches[0].clientY;
    } else {
      try { mX = e.clientX; mY = e.clientY; }
      catch(e) { return false }
    }
    if (mX >= Math.floor(cm.display.gutters.getBoundingClientRect().right)) { return false }
    if (prevent) { e_preventDefault(e); }

    var display = cm.display;
    var lineBox = display.lineDiv.getBoundingClientRect();

    if (mY > lineBox.bottom || !hasHandler(cm, type)) { return e_defaultPrevented(e) }
    mY -= lineBox.top - display.viewOffset;

    for (var i = 0; i < cm.options.gutters.length; ++i) {
      var g = display.gutters.childNodes[i];
      if (g && g.getBoundingClientRect().right >= mX) {
        var line = lineAtHeight(cm.doc, mY);
        var gutter = cm.options.gutters[i];
        signal(cm, type, cm, line, gutter, e);
        return e_defaultPrevented(e)
      }
    }
  }

  function clickInGutter(cm, e) {
    return gutterEvent(cm, e, "gutterClick", true)
  }

  // CONTEXT MENU HANDLING

  // To make the context menu work, we need to briefly unhide the
  // textarea (making it as unobtrusive as possible) to let the
  // right-click take effect on it.
  function onContextMenu(cm, e) {
    if (eventInWidget(cm.display, e) || contextMenuInGutter(cm, e)) { return }
    if (signalDOMEvent(cm, e, "contextmenu")) { return }
    if (!captureRightClick) { cm.display.input.onContextMenu(e); }
  }

  function contextMenuInGutter(cm, e) {
    if (!hasHandler(cm, "gutterContextMenu")) { return false }
    return gutterEvent(cm, e, "gutterContextMenu", false)
  }

  function themeChanged(cm) {
    cm.display.wrapper.className = cm.display.wrapper.className.replace(/\s*cm-s-\S+/g, "") +
      cm.options.theme.replace(/(^|\s)\s*/g, " cm-s-");
    clearCaches(cm);
  }

  var Init = {toString: function(){return "CodeMirror.Init"}};

  var defaults = {};
  var optionHandlers = {};

  function defineOptions(CodeMirror) {
    var optionHandlers = CodeMirror.optionHandlers;

    function option(name, deflt, handle, notOnInit) {
      CodeMirror.defaults[name] = deflt;
      if (handle) { optionHandlers[name] =
        notOnInit ? function (cm, val, old) {if (old != Init) { handle(cm, val, old); }} : handle; }
    }

    CodeMirror.defineOption = option;

    // Passed to option handlers when there is no old value.
    CodeMirror.Init = Init;

    // These two are, on init, called from the constructor because they
    // have to be initialized before the editor can start at all.
    option("value", "", function (cm, val) { return cm.setValue(val); }, true);
    option("mode", null, function (cm, val) {
      cm.doc.modeOption = val;
      loadMode(cm);
    }, true);

    option("indentUnit", 2, loadMode, true);
    option("indentWithTabs", false);
    option("smartIndent", true);
    option("tabSize", 4, function (cm) {
      resetModeState(cm);
      clearCaches(cm);
      regChange(cm);
    }, true);

    option("lineSeparator", null, function (cm, val) {
      cm.doc.lineSep = val;
      if (!val) { return }
      var newBreaks = [], lineNo = cm.doc.first;
      cm.doc.iter(function (line) {
        for (var pos = 0;;) {
          var found = line.text.indexOf(val, pos);
          if (found == -1) { break }
          pos = found + val.length;
          newBreaks.push(Pos(lineNo, found));
        }
        lineNo++;
      });
      for (var i = newBreaks.length - 1; i >= 0; i--)
        { replaceRange(cm.doc, val, newBreaks[i], Pos(newBreaks[i].line, newBreaks[i].ch + val.length)); }
    });
    option("specialChars", /[\u0000-\u001f\u007f-\u009f\u00ad\u061c\u200b-\u200f\u2028\u2029\ufeff]/g, function (cm, val, old) {
      cm.state.specialChars = new RegExp(val.source + (val.test("\t") ? "" : "|\t"), "g");
      if (old != Init) { cm.refresh(); }
    });
    option("specialCharPlaceholder", defaultSpecialCharPlaceholder, function (cm) { return cm.refresh(); }, true);
    option("electricChars", true);
    option("inputStyle", mobile ? "contenteditable" : "textarea", function () {
      throw new Error("inputStyle can not (yet) be changed in a running editor") // FIXME
    }, true);
    option("spellcheck", false, function (cm, val) { return cm.getInputField().spellcheck = val; }, true);
    option("rtlMoveVisually", !windows);
    option("wholeLineUpdateBefore", true);

    option("theme", "default", function (cm) {
      themeChanged(cm);
      guttersChanged(cm);
    }, true);
    option("keyMap", "default", function (cm, val, old) {
      var next = getKeyMap(val);
      var prev = old != Init && getKeyMap(old);
      if (prev && prev.detach) { prev.detach(cm, next); }
      if (next.attach) { next.attach(cm, prev || null); }
    });
    option("extraKeys", null);
    option("configureMouse", null);

    option("lineWrapping", false, wrappingChanged, true);
    option("gutters", [], function (cm) {
      setGuttersForLineNumbers(cm.options);
      guttersChanged(cm);
    }, true);
    option("fixedGutter", true, function (cm, val) {
      cm.display.gutters.style.left = val ? compensateForHScroll(cm.display) + "px" : "0";
      cm.refresh();
    }, true);
    option("coverGutterNextToScrollbar", false, function (cm) { return updateScrollbars(cm); }, true);
    option("scrollbarStyle", "native", function (cm) {
      initScrollbars(cm);
      updateScrollbars(cm);
      cm.display.scrollbars.setScrollTop(cm.doc.scrollTop);
      cm.display.scrollbars.setScrollLeft(cm.doc.scrollLeft);
    }, true);
    option("lineNumbers", false, function (cm) {
      setGuttersForLineNumbers(cm.options);
      guttersChanged(cm);
    }, true);
    option("firstLineNumber", 1, guttersChanged, true);
    option("lineNumberFormatter", function (integer) { return integer; }, guttersChanged, true);
    option("showCursorWhenSelecting", false, updateSelection, true);

    option("resetSelectionOnContextMenu", true);
    option("lineWiseCopyCut", true);
    option("pasteLinesPerSelection", true);
    option("selectionsMayTouch", false);

    option("readOnly", false, function (cm, val) {
      if (val == "nocursor") {
        onBlur(cm);
        cm.display.input.blur();
      }
      cm.display.input.readOnlyChanged(val);
    });
    option("disableInput", false, function (cm, val) {if (!val) { cm.display.input.reset(); }}, true);
    option("dragDrop", true, dragDropChanged);
    option("allowDropFileTypes", null);

    option("cursorBlinkRate", 530);
    option("cursorScrollMargin", 0);
    option("cursorHeight", 1, updateSelection, true);
    option("singleCursorHeightPerLine", true, updateSelection, true);
    option("workTime", 100);
    option("workDelay", 100);
    option("flattenSpans", true, resetModeState, true);
    option("addModeClass", false, resetModeState, true);
    option("pollInterval", 100);
    option("undoDepth", 200, function (cm, val) { return cm.doc.history.undoDepth = val; });
    option("historyEventDelay", 1250);
    option("viewportMargin", 10, function (cm) { return cm.refresh(); }, true);
    option("maxHighlightLength", 10000, resetModeState, true);
    option("moveInputWithCursor", true, function (cm, val) {
      if (!val) { cm.display.input.resetPosition(); }
    });

    option("tabindex", null, function (cm, val) { return cm.display.input.getField().tabIndex = val || ""; });
    option("autofocus", null);
    option("direction", "ltr", function (cm, val) { return cm.doc.setDirection(val); }, true);
    option("phrases", null);
  }

  function guttersChanged(cm) {
    updateGutters(cm);
    regChange(cm);
    alignHorizontally(cm);
  }

  function dragDropChanged(cm, value, old) {
    var wasOn = old && old != Init;
    if (!value != !wasOn) {
      var funcs = cm.display.dragFunctions;
      var toggle = value ? on : off;
      toggle(cm.display.scroller, "dragstart", funcs.start);
      toggle(cm.display.scroller, "dragenter", funcs.enter);
      toggle(cm.display.scroller, "dragover", funcs.over);
      toggle(cm.display.scroller, "dragleave", funcs.leave);
      toggle(cm.display.scroller, "drop", funcs.drop);
    }
  }

  function wrappingChanged(cm) {
    if (cm.options.lineWrapping) {
      addClass(cm.display.wrapper, "CodeMirror-wrap");
      cm.display.sizer.style.minWidth = "";
      cm.display.sizerWidth = null;
    } else {
      rmClass(cm.display.wrapper, "CodeMirror-wrap");
      findMaxLine(cm);
    }
    estimateLineHeights(cm);
    regChange(cm);
    clearCaches(cm);
    setTimeout(function () { return updateScrollbars(cm); }, 100);
  }

  // A CodeMirror instance represents an editor. This is the object
  // that user code is usually dealing with.

  function CodeMirror(place, options) {
    var this$1 = this;

    if (!(this instanceof CodeMirror)) { return new CodeMirror(place, options) }

    this.options = options = options ? copyObj(options) : {};
    // Determine effective options based on given values and defaults.
    copyObj(defaults, options, false);
    setGuttersForLineNumbers(options);

    var doc = options.value;
    if (typeof doc == "string") { doc = new Doc(doc, options.mode, null, options.lineSeparator, options.direction); }
    else if (options.mode) { doc.modeOption = options.mode; }
    this.doc = doc;

    var input = new CodeMirror.inputStyles[options.inputStyle](this);
    var display = this.display = new Display(place, doc, input);
    display.wrapper.CodeMirror = this;
    updateGutters(this);
    themeChanged(this);
    if (options.lineWrapping)
      { this.display.wrapper.className += " CodeMirror-wrap"; }
    initScrollbars(this);

    this.state = {
      keyMaps: [],  // stores maps added by addKeyMap
      overlays: [], // highlighting overlays, as added by addOverlay
      modeGen: 0,   // bumped when mode/overlay changes, used to invalidate highlighting info
      overwrite: false,
      delayingBlurEvent: false,
      focused: false,
      suppressEdits: false, // used to disable editing during key handlers when in readOnly mode
      pasteIncoming: false, cutIncoming: false, // help recognize paste/cut edits in input.poll
      selectingText: false,
      draggingText: false,
      highlight: new Delayed(), // stores highlight worker timeout
      keySeq: null,  // Unfinished key sequence
      specialChars: null
    };

    if (options.autofocus && !mobile) { display.input.focus(); }

    // Override magic textarea content restore that IE sometimes does
    // on our hidden textarea on reload
    if (ie && ie_version < 11) { setTimeout(function () { return this$1.display.input.reset(true); }, 20); }

    registerEventHandlers(this);
    ensureGlobalHandlers();

    startOperation(this);
    this.curOp.forceUpdate = true;
    attachDoc(this, doc);

    if ((options.autofocus && !mobile) || this.hasFocus())
      { setTimeout(bind(onFocus, this), 20); }
    else
      { onBlur(this); }

    for (var opt in optionHandlers) { if (optionHandlers.hasOwnProperty(opt))
      { optionHandlers[opt](this$1, options[opt], Init); } }
    maybeUpdateLineNumberWidth(this);
    if (options.finishInit) { options.finishInit(this); }
    for (var i = 0; i < initHooks.length; ++i) { initHooks[i](this$1); }
    endOperation(this);
    // Suppress optimizelegibility in Webkit, since it breaks text
    // measuring on line wrapping boundaries.
    if (webkit && options.lineWrapping &&
        getComputedStyle(display.lineDiv).textRendering == "optimizelegibility")
      { display.lineDiv.style.textRendering = "auto"; }
  }

  // The default configuration options.
  CodeMirror.defaults = defaults;
  // Functions to run when options are changed.
  CodeMirror.optionHandlers = optionHandlers;

  // Attach the necessary event handlers when initializing the editor
  function registerEventHandlers(cm) {
    var d = cm.display;
    on(d.scroller, "mousedown", operation(cm, onMouseDown));
    // Older IE's will not fire a second mousedown for a double click
    if (ie && ie_version < 11)
      { on(d.scroller, "dblclick", operation(cm, function (e) {
        if (signalDOMEvent(cm, e)) { return }
        var pos = posFromMouse(cm, e);
        if (!pos || clickInGutter(cm, e) || eventInWidget(cm.display, e)) { return }
        e_preventDefault(e);
        var word = cm.findWordAt(pos);
        extendSelection(cm.doc, word.anchor, word.head);
      })); }
    else
      { on(d.scroller, "dblclick", function (e) { return signalDOMEvent(cm, e) || e_preventDefault(e); }); }
    // Some browsers fire contextmenu *after* opening the menu, at
    // which point we can't mess with it anymore. Context menu is
    // handled in onMouseDown for these browsers.
    on(d.scroller, "contextmenu", function (e) { return onContextMenu(cm, e); });

    // Used to suppress mouse event handling when a touch happens
    var touchFinished, prevTouch = {end: 0};
    function finishTouch() {
      if (d.activeTouch) {
        touchFinished = setTimeout(function () { return d.activeTouch = null; }, 1000);
        prevTouch = d.activeTouch;
        prevTouch.end = +new Date;
      }
    }
    function isMouseLikeTouchEvent(e) {
      if (e.touches.length != 1) { return false }
      var touch = e.touches[0];
      return touch.radiusX <= 1 && touch.radiusY <= 1
    }
    function farAway(touch, other) {
      if (other.left == null) { return true }
      var dx = other.left - touch.left, dy = other.top - touch.top;
      return dx * dx + dy * dy > 20 * 20
    }
    on(d.scroller, "touchstart", function (e) {
      if (!signalDOMEvent(cm, e) && !isMouseLikeTouchEvent(e) && !clickInGutter(cm, e)) {
        d.input.ensurePolled();
        clearTimeout(touchFinished);
        var now = +new Date;
        d.activeTouch = {start: now, moved: false,
                         prev: now - prevTouch.end <= 300 ? prevTouch : null};
        if (e.touches.length == 1) {
          d.activeTouch.left = e.touches[0].pageX;
          d.activeTouch.top = e.touches[0].pageY;
        }
      }
    });
    on(d.scroller, "touchmove", function () {
      if (d.activeTouch) { d.activeTouch.moved = true; }
    });
    on(d.scroller, "touchend", function (e) {
      var touch = d.activeTouch;
      if (touch && !eventInWidget(d, e) && touch.left != null &&
          !touch.moved && new Date - touch.start < 300) {
        var pos = cm.coordsChar(d.activeTouch, "page"), range;
        if (!touch.prev || farAway(touch, touch.prev)) // Single tap
          { range = new Range(pos, pos); }
        else if (!touch.prev.prev || farAway(touch, touch.prev.prev)) // Double tap
          { range = cm.findWordAt(pos); }
        else // Triple tap
          { range = new Range(Pos(pos.line, 0), clipPos(cm.doc, Pos(pos.line + 1, 0))); }
        cm.setSelection(range.anchor, range.head);
        cm.focus();
        e_preventDefault(e);
      }
      finishTouch();
    });
    on(d.scroller, "touchcancel", finishTouch);

    // Sync scrolling between fake scrollbars and real scrollable
    // area, ensure viewport is updated when scrolling.
    on(d.scroller, "scroll", function () {
      if (d.scroller.clientHeight) {
        updateScrollTop(cm, d.scroller.scrollTop);
        setScrollLeft(cm, d.scroller.scrollLeft, true);
        signal(cm, "scroll", cm);
      }
    });

    // Listen to wheel events in order to try and update the viewport on time.
    on(d.scroller, "mousewheel", function (e) { return onScrollWheel(cm, e); });
    on(d.scroller, "DOMMouseScroll", function (e) { return onScrollWheel(cm, e); });

    // Prevent wrapper from ever scrolling
    on(d.wrapper, "scroll", function () { return d.wrapper.scrollTop = d.wrapper.scrollLeft = 0; });

    d.dragFunctions = {
      enter: function (e) {if (!signalDOMEvent(cm, e)) { e_stop(e); }},
      over: function (e) {if (!signalDOMEvent(cm, e)) { onDragOver(cm, e); e_stop(e); }},
      start: function (e) { return onDragStart(cm, e); },
      drop: operation(cm, onDrop),
      leave: function (e) {if (!signalDOMEvent(cm, e)) { clearDragCursor(cm); }}
    };

    var inp = d.input.getField();
    on(inp, "keyup", function (e) { return onKeyUp.call(cm, e); });
    on(inp, "keydown", operation(cm, onKeyDown));
    on(inp, "keypress", operation(cm, onKeyPress));
    on(inp, "focus", function (e) { return onFocus(cm, e); });
    on(inp, "blur", function (e) { return onBlur(cm, e); });
  }

  var initHooks = [];
  CodeMirror.defineInitHook = function (f) { return initHooks.push(f); };

  // Indent the given line. The how parameter can be "smart",
  // "add"/null, "subtract", or "prev". When aggressive is false
  // (typically set to true for forced single-line indents), empty
  // lines are not indented, and places where the mode returns Pass
  // are left alone.
  function indentLine(cm, n, how, aggressive) {
    var doc = cm.doc, state;
    if (how == null) { how = "add"; }
    if (how == "smart") {
      // Fall back to "prev" when the mode doesn't have an indentation
      // method.
      if (!doc.mode.indent) { how = "prev"; }
      else { state = getContextBefore(cm, n).state; }
    }

    var tabSize = cm.options.tabSize;
    var line = getLine(doc, n), curSpace = countColumn(line.text, null, tabSize);
    if (line.stateAfter) { line.stateAfter = null; }
    var curSpaceString = line.text.match(/^\s*/)[0], indentation;
    if (!aggressive && !/\S/.test(line.text)) {
      indentation = 0;
      how = "not";
    } else if (how == "smart") {
      indentation = doc.mode.indent(state, line.text.slice(curSpaceString.length), line.text);
      if (indentation == Pass || indentation > 150) {
        if (!aggressive) { return }
        how = "prev";
      }
    }
    if (how == "prev") {
      if (n > doc.first) { indentation = countColumn(getLine(doc, n-1).text, null, tabSize); }
      else { indentation = 0; }
    } else if (how == "add") {
      indentation = curSpace + cm.options.indentUnit;
    } else if (how == "subtract") {
      indentation = curSpace - cm.options.indentUnit;
    } else if (typeof how == "number") {
      indentation = curSpace + how;
    }
    indentation = Math.max(0, indentation);

    var indentString = "", pos = 0;
    if (cm.options.indentWithTabs)
      { for (var i = Math.floor(indentation / tabSize); i; --i) {pos += tabSize; indentString += "\t";} }
    if (pos < indentation) { indentString += spaceStr(indentation - pos); }

    if (indentString != curSpaceString) {
      replaceRange(doc, indentString, Pos(n, 0), Pos(n, curSpaceString.length), "+input");
      line.stateAfter = null;
      return true
    } else {
      // Ensure that, if the cursor was in the whitespace at the start
      // of the line, it is moved to the end of that space.
      for (var i$1 = 0; i$1 < doc.sel.ranges.length; i$1++) {
        var range = doc.sel.ranges[i$1];
        if (range.head.line == n && range.head.ch < curSpaceString.length) {
          var pos$1 = Pos(n, curSpaceString.length);
          replaceOneSelection(doc, i$1, new Range(pos$1, pos$1));
          break
        }
      }
    }
  }

  // This will be set to a {lineWise: bool, text: [string]} object, so
  // that, when pasting, we know what kind of selections the copied
  // text was made out of.
  var lastCopied = null;

  function setLastCopied(newLastCopied) {
    lastCopied = newLastCopied;
  }

  function applyTextInput(cm, inserted, deleted, sel, origin) {
    var doc = cm.doc;
    cm.display.shift = false;
    if (!sel) { sel = doc.sel; }

    var paste = cm.state.pasteIncoming || origin == "paste";
    var textLines = splitLinesAuto(inserted), multiPaste = null;
    // When pasting N lines into N selections, insert one line per selection
    if (paste && sel.ranges.length > 1) {
      if (lastCopied && lastCopied.text.join("\n") == inserted) {
        if (sel.ranges.length % lastCopied.text.length == 0) {
          multiPaste = [];
          for (var i = 0; i < lastCopied.text.length; i++)
            { multiPaste.push(doc.splitLines(lastCopied.text[i])); }
        }
      } else if (textLines.length == sel.ranges.length && cm.options.pasteLinesPerSelection) {
        multiPaste = map(textLines, function (l) { return [l]; });
      }
    }

    var updateInput;
    // Normal behavior is to insert the new text into every selection
    for (var i$1 = sel.ranges.length - 1; i$1 >= 0; i$1--) {
      var range$$1 = sel.ranges[i$1];
      var from = range$$1.from(), to = range$$1.to();
      if (range$$1.empty()) {
        if (deleted && deleted > 0) // Handle deletion
          { from = Pos(from.line, from.ch - deleted); }
        else if (cm.state.overwrite && !paste) // Handle overwrite
          { to = Pos(to.line, Math.min(getLine(doc, to.line).text.length, to.ch + lst(textLines).length)); }
        else if (paste && lastCopied && lastCopied.lineWise && lastCopied.text.join("\n") == inserted)
          { from = to = Pos(from.line, 0); }
      }
      updateInput = cm.curOp.updateInput;
      var changeEvent = {from: from, to: to, text: multiPaste ? multiPaste[i$1 % multiPaste.length] : textLines,
                         origin: origin || (paste ? "paste" : cm.state.cutIncoming ? "cut" : "+input")};
      makeChange(cm.doc, changeEvent);
      signalLater(cm, "inputRead", cm, changeEvent);
    }
    if (inserted && !paste)
      { triggerElectric(cm, inserted); }

    ensureCursorVisible(cm);
    cm.curOp.updateInput = updateInput;
    cm.curOp.typing = true;
    cm.state.pasteIncoming = cm.state.cutIncoming = false;
  }

  function handlePaste(e, cm) {
    var pasted = e.clipboardData && e.clipboardData.getData("Text");
    if (pasted) {
      e.preventDefault();
      if (!cm.isReadOnly() && !cm.options.disableInput)
        { runInOp(cm, function () { return applyTextInput(cm, pasted, 0, null, "paste"); }); }
      return true
    }
  }

  function triggerElectric(cm, inserted) {
    // When an 'electric' character is inserted, immediately trigger a reindent
    if (!cm.options.electricChars || !cm.options.smartIndent) { return }
    var sel = cm.doc.sel;

    for (var i = sel.ranges.length - 1; i >= 0; i--) {
      var range$$1 = sel.ranges[i];
      if (range$$1.head.ch > 100 || (i && sel.ranges[i - 1].head.line == range$$1.head.line)) { continue }
      var mode = cm.getModeAt(range$$1.head);
      var indented = false;
      if (mode.electricChars) {
        for (var j = 0; j < mode.electricChars.length; j++)
          { if (inserted.indexOf(mode.electricChars.charAt(j)) > -1) {
            indented = indentLine(cm, range$$1.head.line, "smart");
            break
          } }
      } else if (mode.electricInput) {
        if (mode.electricInput.test(getLine(cm.doc, range$$1.head.line).text.slice(0, range$$1.head.ch)))
          { indented = indentLine(cm, range$$1.head.line, "smart"); }
      }
      if (indented) { signalLater(cm, "electricInput", cm, range$$1.head.line); }
    }
  }

  function copyableRanges(cm) {
    var text = [], ranges = [];
    for (var i = 0; i < cm.doc.sel.ranges.length; i++) {
      var line = cm.doc.sel.ranges[i].head.line;
      var lineRange = {anchor: Pos(line, 0), head: Pos(line + 1, 0)};
      ranges.push(lineRange);
      text.push(cm.getRange(lineRange.anchor, lineRange.head));
    }
    return {text: text, ranges: ranges}
  }

  function disableBrowserMagic(field, spellcheck) {
    field.setAttribute("autocorrect", "off");
    field.setAttribute("autocapitalize", "off");
    field.setAttribute("spellcheck", !!spellcheck);
  }

  function hiddenTextarea() {
    var te = elt("textarea", null, null, "position: absolute; bottom: -1em; padding: 0; width: 1px; height: 1em; outline: none");
    var div = elt("div", [te], null, "overflow: hidden; position: relative; width: 3px; height: 0px;");
    // The textarea is kept positioned near the cursor to prevent the
    // fact that it'll be scrolled into view on input from scrolling
    // our fake cursor out of view. On webkit, when wrap=off, paste is
    // very slow. So make the area wide instead.
    if (webkit) { te.style.width = "1000px"; }
    else { te.setAttribute("wrap", "off"); }
    // If border: 0; -- iOS fails to open keyboard (issue #1287)
    if (ios) { te.style.border = "1px solid black"; }
    disableBrowserMagic(te);
    return div
  }

  // The publicly visible API. Note that methodOp(f) means
  // 'wrap f in an operation, performed on its `this` parameter'.

  // This is not the complete set of editor methods. Most of the
  // methods defined on the Doc type are also injected into
  // CodeMirror.prototype, for backwards compatibility and
  // convenience.

  function addEditorMethods(CodeMirror) {
    var optionHandlers = CodeMirror.optionHandlers;

    var helpers = CodeMirror.helpers = {};

    CodeMirror.prototype = {
      constructor: CodeMirror,
      focus: function(){window.focus(); this.display.input.focus();},

      setOption: function(option, value) {
        var options = this.options, old = options[option];
        if (options[option] == value && option != "mode") { return }
        options[option] = value;
        if (optionHandlers.hasOwnProperty(option))
          { operation(this, optionHandlers[option])(this, value, old); }
        signal(this, "optionChange", this, option);
      },

      getOption: function(option) {return this.options[option]},
      getDoc: function() {return this.doc},

      addKeyMap: function(map$$1, bottom) {
        this.state.keyMaps[bottom ? "push" : "unshift"](getKeyMap(map$$1));
      },
      removeKeyMap: function(map$$1) {
        var maps = this.state.keyMaps;
        for (var i = 0; i < maps.length; ++i)
          { if (maps[i] == map$$1 || maps[i].name == map$$1) {
            maps.splice(i, 1);
            return true
          } }
      },

      addOverlay: methodOp(function(spec, options) {
        var mode = spec.token ? spec : CodeMirror.getMode(this.options, spec);
        if (mode.startState) { throw new Error("Overlays may not be stateful.") }
        insertSorted(this.state.overlays,
                     {mode: mode, modeSpec: spec, opaque: options && options.opaque,
                      priority: (options && options.priority) || 0},
                     function (overlay) { return overlay.priority; });
        this.state.modeGen++;
        regChange(this);
      }),
      removeOverlay: methodOp(function(spec) {
        var this$1 = this;

        var overlays = this.state.overlays;
        for (var i = 0; i < overlays.length; ++i) {
          var cur = overlays[i].modeSpec;
          if (cur == spec || typeof spec == "string" && cur.name == spec) {
            overlays.splice(i, 1);
            this$1.state.modeGen++;
            regChange(this$1);
            return
          }
        }
      }),

      indentLine: methodOp(function(n, dir, aggressive) {
        if (typeof dir != "string" && typeof dir != "number") {
          if (dir == null) { dir = this.options.smartIndent ? "smart" : "prev"; }
          else { dir = dir ? "add" : "subtract"; }
        }
        if (isLine(this.doc, n)) { indentLine(this, n, dir, aggressive); }
      }),
      indentSelection: methodOp(function(how) {
        var this$1 = this;

        var ranges = this.doc.sel.ranges, end = -1;
        for (var i = 0; i < ranges.length; i++) {
          var range$$1 = ranges[i];
          if (!range$$1.empty()) {
            var from = range$$1.from(), to = range$$1.to();
            var start = Math.max(end, from.line);
            end = Math.min(this$1.lastLine(), to.line - (to.ch ? 0 : 1)) + 1;
            for (var j = start; j < end; ++j)
              { indentLine(this$1, j, how); }
            var newRanges = this$1.doc.sel.ranges;
            if (from.ch == 0 && ranges.length == newRanges.length && newRanges[i].from().ch > 0)
              { replaceOneSelection(this$1.doc, i, new Range(from, newRanges[i].to()), sel_dontScroll); }
          } else if (range$$1.head.line > end) {
            indentLine(this$1, range$$1.head.line, how, true);
            end = range$$1.head.line;
            if (i == this$1.doc.sel.primIndex) { ensureCursorVisible(this$1); }
          }
        }
      }),

      // Fetch the parser token for a given character. Useful for hacks
      // that want to inspect the mode state (say, for completion).
      getTokenAt: function(pos, precise) {
        return takeToken(this, pos, precise)
      },

      getLineTokens: function(line, precise) {
        return takeToken(this, Pos(line), precise, true)
      },

      getTokenTypeAt: function(pos) {
        pos = clipPos(this.doc, pos);
        var styles = getLineStyles(this, getLine(this.doc, pos.line));
        var before = 0, after = (styles.length - 1) / 2, ch = pos.ch;
        var type;
        if (ch == 0) { type = styles[2]; }
        else { for (;;) {
          var mid = (before + after) >> 1;
          if ((mid ? styles[mid * 2 - 1] : 0) >= ch) { after = mid; }
          else if (styles[mid * 2 + 1] < ch) { before = mid + 1; }
          else { type = styles[mid * 2 + 2]; break }
        } }
        var cut = type ? type.indexOf("overlay ") : -1;
        return cut < 0 ? type : cut == 0 ? null : type.slice(0, cut - 1)
      },

      getModeAt: function(pos) {
        var mode = this.doc.mode;
        if (!mode.innerMode) { return mode }
        return CodeMirror.innerMode(mode, this.getTokenAt(pos).state).mode
      },

      getHelper: function(pos, type) {
        return this.getHelpers(pos, type)[0]
      },

      getHelpers: function(pos, type) {
        var this$1 = this;

        var found = [];
        if (!helpers.hasOwnProperty(type)) { return found }
        var help = helpers[type], mode = this.getModeAt(pos);
        if (typeof mode[type] == "string") {
          if (help[mode[type]]) { found.push(help[mode[type]]); }
        } else if (mode[type]) {
          for (var i = 0; i < mode[type].length; i++) {
            var val = help[mode[type][i]];
            if (val) { found.push(val); }
          }
        } else if (mode.helperType && help[mode.helperType]) {
          found.push(help[mode.helperType]);
        } else if (help[mode.name]) {
          found.push(help[mode.name]);
        }
        for (var i$1 = 0; i$1 < help._global.length; i$1++) {
          var cur = help._global[i$1];
          if (cur.pred(mode, this$1) && indexOf(found, cur.val) == -1)
            { found.push(cur.val); }
        }
        return found
      },

      getStateAfter: function(line, precise) {
        var doc = this.doc;
        line = clipLine(doc, line == null ? doc.first + doc.size - 1: line);
        return getContextBefore(this, line + 1, precise).state
      },

      cursorCoords: function(start, mode) {
        var pos, range$$1 = this.doc.sel.primary();
        if (start == null) { pos = range$$1.head; }
        else if (typeof start == "object") { pos = clipPos(this.doc, start); }
        else { pos = start ? range$$1.from() : range$$1.to(); }
        return cursorCoords(this, pos, mode || "page")
      },

      charCoords: function(pos, mode) {
        return charCoords(this, clipPos(this.doc, pos), mode || "page")
      },

      coordsChar: function(coords, mode) {
        coords = fromCoordSystem(this, coords, mode || "page");
        return coordsChar(this, coords.left, coords.top)
      },

      lineAtHeight: function(height, mode) {
        height = fromCoordSystem(this, {top: height, left: 0}, mode || "page").top;
        return lineAtHeight(this.doc, height + this.display.viewOffset)
      },
      heightAtLine: function(line, mode, includeWidgets) {
        var end = false, lineObj;
        if (typeof line == "number") {
          var last = this.doc.first + this.doc.size - 1;
          if (line < this.doc.first) { line = this.doc.first; }
          else if (line > last) { line = last; end = true; }
          lineObj = getLine(this.doc, line);
        } else {
          lineObj = line;
        }
        return intoCoordSystem(this, lineObj, {top: 0, left: 0}, mode || "page", includeWidgets || end).top +
          (end ? this.doc.height - heightAtLine(lineObj) : 0)
      },

      defaultTextHeight: function() { return textHeight(this.display) },
      defaultCharWidth: function() { return charWidth(this.display) },

      getViewport: function() { return {from: this.display.viewFrom, to: this.display.viewTo}},

      addWidget: function(pos, node, scroll, vert, horiz) {
        var display = this.display;
        pos = cursorCoords(this, clipPos(this.doc, pos));
        var top = pos.bottom, left = pos.left;
        node.style.position = "absolute";
        node.setAttribute("cm-ignore-events", "true");
        this.display.input.setUneditable(node);
        display.sizer.appendChild(node);
        if (vert == "over") {
          top = pos.top;
        } else if (vert == "above" || vert == "near") {
          var vspace = Math.max(display.wrapper.clientHeight, this.doc.height),
          hspace = Math.max(display.sizer.clientWidth, display.lineSpace.clientWidth);
          // Default to positioning above (if specified and possible); otherwise default to positioning below
          if ((vert == 'above' || pos.bottom + node.offsetHeight > vspace) && pos.top > node.offsetHeight)
            { top = pos.top - node.offsetHeight; }
          else if (pos.bottom + node.offsetHeight <= vspace)
            { top = pos.bottom; }
          if (left + node.offsetWidth > hspace)
            { left = hspace - node.offsetWidth; }
        }
        node.style.top = top + "px";
        node.style.left = node.style.right = "";
        if (horiz == "right") {
          left = display.sizer.clientWidth - node.offsetWidth;
          node.style.right = "0px";
        } else {
          if (horiz == "left") { left = 0; }
          else if (horiz == "middle") { left = (display.sizer.clientWidth - node.offsetWidth) / 2; }
          node.style.left = left + "px";
        }
        if (scroll)
          { scrollIntoView(this, {left: left, top: top, right: left + node.offsetWidth, bottom: top + node.offsetHeight}); }
      },

      triggerOnKeyDown: methodOp(onKeyDown),
      triggerOnKeyPress: methodOp(onKeyPress),
      triggerOnKeyUp: onKeyUp,
      triggerOnMouseDown: methodOp(onMouseDown),

      execCommand: function(cmd) {
        if (commands.hasOwnProperty(cmd))
          { return commands[cmd].call(null, this) }
      },

      triggerElectric: methodOp(function(text) { triggerElectric(this, text); }),

      findPosH: function(from, amount, unit, visually) {
        var this$1 = this;

        var dir = 1;
        if (amount < 0) { dir = -1; amount = -amount; }
        var cur = clipPos(this.doc, from);
        for (var i = 0; i < amount; ++i) {
          cur = findPosH(this$1.doc, cur, dir, unit, visually);
          if (cur.hitSide) { break }
        }
        return cur
      },

      moveH: methodOp(function(dir, unit) {
        var this$1 = this;

        this.extendSelectionsBy(function (range$$1) {
          if (this$1.display.shift || this$1.doc.extend || range$$1.empty())
            { return findPosH(this$1.doc, range$$1.head, dir, unit, this$1.options.rtlMoveVisually) }
          else
            { return dir < 0 ? range$$1.from() : range$$1.to() }
        }, sel_move);
      }),

      deleteH: methodOp(function(dir, unit) {
        var sel = this.doc.sel, doc = this.doc;
        if (sel.somethingSelected())
          { doc.replaceSelection("", null, "+delete"); }
        else
          { deleteNearSelection(this, function (range$$1) {
            var other = findPosH(doc, range$$1.head, dir, unit, false);
            return dir < 0 ? {from: other, to: range$$1.head} : {from: range$$1.head, to: other}
          }); }
      }),

      findPosV: function(from, amount, unit, goalColumn) {
        var this$1 = this;

        var dir = 1, x = goalColumn;
        if (amount < 0) { dir = -1; amount = -amount; }
        var cur = clipPos(this.doc, from);
        for (var i = 0; i < amount; ++i) {
          var coords = cursorCoords(this$1, cur, "div");
          if (x == null) { x = coords.left; }
          else { coords.left = x; }
          cur = findPosV(this$1, coords, dir, unit);
          if (cur.hitSide) { break }
        }
        return cur
      },

      moveV: methodOp(function(dir, unit) {
        var this$1 = this;

        var doc = this.doc, goals = [];
        var collapse = !this.display.shift && !doc.extend && doc.sel.somethingSelected();
        doc.extendSelectionsBy(function (range$$1) {
          if (collapse)
            { return dir < 0 ? range$$1.from() : range$$1.to() }
          var headPos = cursorCoords(this$1, range$$1.head, "div");
          if (range$$1.goalColumn != null) { headPos.left = range$$1.goalColumn; }
          goals.push(headPos.left);
          var pos = findPosV(this$1, headPos, dir, unit);
          if (unit == "page" && range$$1 == doc.sel.primary())
            { addToScrollTop(this$1, charCoords(this$1, pos, "div").top - headPos.top); }
          return pos
        }, sel_move);
        if (goals.length) { for (var i = 0; i < doc.sel.ranges.length; i++)
          { doc.sel.ranges[i].goalColumn = goals[i]; } }
      }),

      // Find the word at the given position (as returned by coordsChar).
      findWordAt: function(pos) {
        var doc = this.doc, line = getLine(doc, pos.line).text;
        var start = pos.ch, end = pos.ch;
        if (line) {
          var helper = this.getHelper(pos, "wordChars");
          if ((pos.sticky == "before" || end == line.length) && start) { --start; } else { ++end; }
          var startChar = line.charAt(start);
          var check = isWordChar(startChar, helper)
            ? function (ch) { return isWordChar(ch, helper); }
            : /\s/.test(startChar) ? function (ch) { return /\s/.test(ch); }
            : function (ch) { return (!/\s/.test(ch) && !isWordChar(ch)); };
          while (start > 0 && check(line.charAt(start - 1))) { --start; }
          while (end < line.length && check(line.charAt(end))) { ++end; }
        }
        return new Range(Pos(pos.line, start), Pos(pos.line, end))
      },

      toggleOverwrite: function(value) {
        if (value != null && value == this.state.overwrite) { return }
        if (this.state.overwrite = !this.state.overwrite)
          { addClass(this.display.cursorDiv, "CodeMirror-overwrite"); }
        else
          { rmClass(this.display.cursorDiv, "CodeMirror-overwrite"); }

        signal(this, "overwriteToggle", this, this.state.overwrite);
      },
      hasFocus: function() { return this.display.input.getField() == activeElt() },
      isReadOnly: function() { return !!(this.options.readOnly || this.doc.cantEdit) },

      scrollTo: methodOp(function (x, y) { scrollToCoords(this, x, y); }),
      getScrollInfo: function() {
        var scroller = this.display.scroller;
        return {left: scroller.scrollLeft, top: scroller.scrollTop,
                height: scroller.scrollHeight - scrollGap(this) - this.display.barHeight,
                width: scroller.scrollWidth - scrollGap(this) - this.display.barWidth,
                clientHeight: displayHeight(this), clientWidth: displayWidth(this)}
      },

      scrollIntoView: methodOp(function(range$$1, margin) {
        if (range$$1 == null) {
          range$$1 = {from: this.doc.sel.primary().head, to: null};
          if (margin == null) { margin = this.options.cursorScrollMargin; }
        } else if (typeof range$$1 == "number") {
          range$$1 = {from: Pos(range$$1, 0), to: null};
        } else if (range$$1.from == null) {
          range$$1 = {from: range$$1, to: null};
        }
        if (!range$$1.to) { range$$1.to = range$$1.from; }
        range$$1.margin = margin || 0;

        if (range$$1.from.line != null) {
          scrollToRange(this, range$$1);
        } else {
          scrollToCoordsRange(this, range$$1.from, range$$1.to, range$$1.margin);
        }
      }),

      setSize: methodOp(function(width, height) {
        var this$1 = this;

        var interpret = function (val) { return typeof val == "number" || /^\d+$/.test(String(val)) ? val + "px" : val; };
        if (width != null) { this.display.wrapper.style.width = interpret(width); }
        if (height != null) { this.display.wrapper.style.height = interpret(height); }
        if (this.options.lineWrapping) { clearLineMeasurementCache(this); }
        var lineNo$$1 = this.display.viewFrom;
        this.doc.iter(lineNo$$1, this.display.viewTo, function (line) {
          if (line.widgets) { for (var i = 0; i < line.widgets.length; i++)
            { if (line.widgets[i].noHScroll) { regLineChange(this$1, lineNo$$1, "widget"); break } } }
          ++lineNo$$1;
        });
        this.curOp.forceUpdate = true;
        signal(this, "refresh", this);
      }),

      operation: function(f){return runInOp(this, f)},
      startOperation: function(){return startOperation(this)},
      endOperation: function(){return endOperation(this)},

      refresh: methodOp(function() {
        var oldHeight = this.display.cachedTextHeight;
        regChange(this);
        this.curOp.forceUpdate = true;
        clearCaches(this);
        scrollToCoords(this, this.doc.scrollLeft, this.doc.scrollTop);
        updateGutterSpace(this);
        if (oldHeight == null || Math.abs(oldHeight - textHeight(this.display)) > .5)
          { estimateLineHeights(this); }
        signal(this, "refresh", this);
      }),

      swapDoc: methodOp(function(doc) {
        var old = this.doc;
        old.cm = null;
        attachDoc(this, doc);
        clearCaches(this);
        this.display.input.reset();
        scrollToCoords(this, doc.scrollLeft, doc.scrollTop);
        this.curOp.forceScroll = true;
        signalLater(this, "swapDoc", this, old);
        return old
      }),

      phrase: function(phraseText) {
        var phrases = this.options.phrases;
        return phrases && Object.prototype.hasOwnProperty.call(phrases, phraseText) ? phrases[phraseText] : phraseText
      },

      getInputField: function(){return this.display.input.getField()},
      getWrapperElement: function(){return this.display.wrapper},
      getScrollerElement: function(){return this.display.scroller},
      getGutterElement: function(){return this.display.gutters}
    };
    eventMixin(CodeMirror);

    CodeMirror.registerHelper = function(type, name, value) {
      if (!helpers.hasOwnProperty(type)) { helpers[type] = CodeMirror[type] = {_global: []}; }
      helpers[type][name] = value;
    };
    CodeMirror.registerGlobalHelper = function(type, name, predicate, value) {
      CodeMirror.registerHelper(type, name, value);
      helpers[type]._global.push({pred: predicate, val: value});
    };
  }

  // Used for horizontal relative motion. Dir is -1 or 1 (left or
  // right), unit can be "char", "column" (like char, but doesn't
  // cross line boundaries), "word" (across next word), or "group" (to
  // the start of next group of word or non-word-non-whitespace
  // chars). The visually param controls whether, in right-to-left
  // text, direction 1 means to move towards the next index in the
  // string, or towards the character to the right of the current
  // position. The resulting position will have a hitSide=true
  // property if it reached the end of the document.
  function findPosH(doc, pos, dir, unit, visually) {
    var oldPos = pos;
    var origDir = dir;
    var lineObj = getLine(doc, pos.line);
    function findNextLine() {
      var l = pos.line + dir;
      if (l < doc.first || l >= doc.first + doc.size) { return false }
      pos = new Pos(l, pos.ch, pos.sticky);
      return lineObj = getLine(doc, l)
    }
    function moveOnce(boundToLine) {
      var next;
      if (visually) {
        next = moveVisually(doc.cm, lineObj, pos, dir);
      } else {
        next = moveLogically(lineObj, pos, dir);
      }
      if (next == null) {
        if (!boundToLine && findNextLine())
          { pos = endOfLine(visually, doc.cm, lineObj, pos.line, dir); }
        else
          { return false }
      } else {
        pos = next;
      }
      return true
    }

    if (unit == "char") {
      moveOnce();
    } else if (unit == "column") {
      moveOnce(true);
    } else if (unit == "word" || unit == "group") {
      var sawType = null, group = unit == "group";
      var helper = doc.cm && doc.cm.getHelper(pos, "wordChars");
      for (var first = true;; first = false) {
        if (dir < 0 && !moveOnce(!first)) { break }
        var cur = lineObj.text.charAt(pos.ch) || "\n";
        var type = isWordChar(cur, helper) ? "w"
          : group && cur == "\n" ? "n"
          : !group || /\s/.test(cur) ? null
          : "p";
        if (group && !first && !type) { type = "s"; }
        if (sawType && sawType != type) {
          if (dir < 0) {dir = 1; moveOnce(); pos.sticky = "after";}
          break
        }

        if (type) { sawType = type; }
        if (dir > 0 && !moveOnce(!first)) { break }
      }
    }
    var result = skipAtomic(doc, pos, oldPos, origDir, true);
    if (equalCursorPos(oldPos, result)) { result.hitSide = true; }
    return result
  }

  // For relative vertical movement. Dir may be -1 or 1. Unit can be
  // "page" or "line". The resulting position will have a hitSide=true
  // property if it reached the end of the document.
  function findPosV(cm, pos, dir, unit) {
    var doc = cm.doc, x = pos.left, y;
    if (unit == "page") {
      var pageSize = Math.min(cm.display.wrapper.clientHeight, window.innerHeight || document.documentElement.clientHeight);
      var moveAmount = Math.max(pageSize - .5 * textHeight(cm.display), 3);
      y = (dir > 0 ? pos.bottom : pos.top) + dir * moveAmount;

    } else if (unit == "line") {
      y = dir > 0 ? pos.bottom + 3 : pos.top - 3;
    }
    var target;
    for (;;) {
      target = coordsChar(cm, x, y);
      if (!target.outside) { break }
      if (dir < 0 ? y <= 0 : y >= doc.height) { target.hitSide = true; break }
      y += dir * 5;
    }
    return target
  }

  // CONTENTEDITABLE INPUT STYLE

  var ContentEditableInput = function(cm) {
    this.cm = cm;
    this.lastAnchorNode = this.lastAnchorOffset = this.lastFocusNode = this.lastFocusOffset = null;
    this.polling = new Delayed();
    this.composing = null;
    this.gracePeriod = false;
    this.readDOMTimeout = null;
  };

  ContentEditableInput.prototype.init = function (display) {
      var this$1 = this;

    var input = this, cm = input.cm;
    var div = input.div = display.lineDiv;
    disableBrowserMagic(div, cm.options.spellcheck);

    on(div, "paste", function (e) {
      if (signalDOMEvent(cm, e) || handlePaste(e, cm)) { return }
      // IE doesn't fire input events, so we schedule a read for the pasted content in this way
      if (ie_version <= 11) { setTimeout(operation(cm, function () { return this$1.updateFromDOM(); }), 20); }
    });

    on(div, "compositionstart", function (e) {
      this$1.composing = {data: e.data, done: false};
    });
    on(div, "compositionupdate", function (e) {
      if (!this$1.composing) { this$1.composing = {data: e.data, done: false}; }
    });
    on(div, "compositionend", function (e) {
      if (this$1.composing) {
        if (e.data != this$1.composing.data) { this$1.readFromDOMSoon(); }
        this$1.composing.done = true;
      }
    });

    on(div, "touchstart", function () { return input.forceCompositionEnd(); });

    on(div, "input", function () {
      if (!this$1.composing) { this$1.readFromDOMSoon(); }
    });

    function onCopyCut(e) {
      if (signalDOMEvent(cm, e)) { return }
      if (cm.somethingSelected()) {
        setLastCopied({lineWise: false, text: cm.getSelections()});
        if (e.type == "cut") { cm.replaceSelection("", null, "cut"); }
      } else if (!cm.options.lineWiseCopyCut) {
        return
      } else {
        var ranges = copyableRanges(cm);
        setLastCopied({lineWise: true, text: ranges.text});
        if (e.type == "cut") {
          cm.operation(function () {
            cm.setSelections(ranges.ranges, 0, sel_dontScroll);
            cm.replaceSelection("", null, "cut");
          });
        }
      }
      if (e.clipboardData) {
        e.clipboardData.clearData();
        var content = lastCopied.text.join("\n");
        // iOS exposes the clipboard API, but seems to discard content inserted into it
        e.clipboardData.setData("Text", content);
        if (e.clipboardData.getData("Text") == content) {
          e.preventDefault();
          return
        }
      }
      // Old-fashioned briefly-focus-a-textarea hack
      var kludge = hiddenTextarea(), te = kludge.firstChild;
      cm.display.lineSpace.insertBefore(kludge, cm.display.lineSpace.firstChild);
      te.value = lastCopied.text.join("\n");
      var hadFocus = document.activeElement;
      selectInput(te);
      setTimeout(function () {
        cm.display.lineSpace.removeChild(kludge);
        hadFocus.focus();
        if (hadFocus == div) { input.showPrimarySelection(); }
      }, 50);
    }
    on(div, "copy", onCopyCut);
    on(div, "cut", onCopyCut);
  };

  ContentEditableInput.prototype.prepareSelection = function () {
    var result = prepareSelection(this.cm, false);
    result.focus = this.cm.state.focused;
    return result
  };

  ContentEditableInput.prototype.showSelection = function (info, takeFocus) {
    if (!info || !this.cm.display.view.length) { return }
    if (info.focus || takeFocus) { this.showPrimarySelection(); }
    this.showMultipleSelections(info);
  };

  ContentEditableInput.prototype.getSelection = function () {
    return this.cm.display.wrapper.ownerDocument.getSelection()
  };

  ContentEditableInput.prototype.showPrimarySelection = function () {
    var sel = this.getSelection(), cm = this.cm, prim = cm.doc.sel.primary();
    var from = prim.from(), to = prim.to();

    if (cm.display.viewTo == cm.display.viewFrom || from.line >= cm.display.viewTo || to.line < cm.display.viewFrom) {
      sel.removeAllRanges();
      return
    }

    var curAnchor = domToPos(cm, sel.anchorNode, sel.anchorOffset);
    var curFocus = domToPos(cm, sel.focusNode, sel.focusOffset);
    if (curAnchor && !curAnchor.bad && curFocus && !curFocus.bad &&
        cmp(minPos(curAnchor, curFocus), from) == 0 &&
        cmp(maxPos(curAnchor, curFocus), to) == 0)
      { return }

    var view = cm.display.view;
    var start = (from.line >= cm.display.viewFrom && posToDOM(cm, from)) ||
        {node: view[0].measure.map[2], offset: 0};
    var end = to.line < cm.display.viewTo && posToDOM(cm, to);
    if (!end) {
      var measure = view[view.length - 1].measure;
      var map$$1 = measure.maps ? measure.maps[measure.maps.length - 1] : measure.map;
      end = {node: map$$1[map$$1.length - 1], offset: map$$1[map$$1.length - 2] - map$$1[map$$1.length - 3]};
    }

    if (!start || !end) {
      sel.removeAllRanges();
      return
    }

    var old = sel.rangeCount && sel.getRangeAt(0), rng;
    try { rng = range(start.node, start.offset, end.offset, end.node); }
    catch(e) {} // Our model of the DOM might be outdated, in which case the range we try to set can be impossible
    if (rng) {
      if (!gecko && cm.state.focused) {
        sel.collapse(start.node, start.offset);
        if (!rng.collapsed) {
          sel.removeAllRanges();
          sel.addRange(rng);
        }
      } else {
        sel.removeAllRanges();
        sel.addRange(rng);
      }
      if (old && sel.anchorNode == null) { sel.addRange(old); }
      else if (gecko) { this.startGracePeriod(); }
    }
    this.rememberSelection();
  };

  ContentEditableInput.prototype.startGracePeriod = function () {
      var this$1 = this;

    clearTimeout(this.gracePeriod);
    this.gracePeriod = setTimeout(function () {
      this$1.gracePeriod = false;
      if (this$1.selectionChanged())
        { this$1.cm.operation(function () { return this$1.cm.curOp.selectionChanged = true; }); }
    }, 20);
  };

  ContentEditableInput.prototype.showMultipleSelections = function (info) {
    removeChildrenAndAdd(this.cm.display.cursorDiv, info.cursors);
    removeChildrenAndAdd(this.cm.display.selectionDiv, info.selection);
  };

  ContentEditableInput.prototype.rememberSelection = function () {
    var sel = this.getSelection();
    this.lastAnchorNode = sel.anchorNode; this.lastAnchorOffset = sel.anchorOffset;
    this.lastFocusNode = sel.focusNode; this.lastFocusOffset = sel.focusOffset;
  };

  ContentEditableInput.prototype.selectionInEditor = function () {
    var sel = this.getSelection();
    if (!sel.rangeCount) { return false }
    var node = sel.getRangeAt(0).commonAncestorContainer;
    return contains(this.div, node)
  };

  ContentEditableInput.prototype.focus = function () {
    if (this.cm.options.readOnly != "nocursor") {
      if (!this.selectionInEditor())
        { this.showSelection(this.prepareSelection(), true); }
      this.div.focus();
    }
  };
  ContentEditableInput.prototype.blur = function () { this.div.blur(); };
  ContentEditableInput.prototype.getField = function () { return this.div };

  ContentEditableInput.prototype.supportsTouch = function () { return true };

  ContentEditableInput.prototype.receivedFocus = function () {
    var input = this;
    if (this.selectionInEditor())
      { this.pollSelection(); }
    else
      { runInOp(this.cm, function () { return input.cm.curOp.selectionChanged = true; }); }

    function poll() {
      if (input.cm.state.focused) {
        input.pollSelection();
        input.polling.set(input.cm.options.pollInterval, poll);
      }
    }
    this.polling.set(this.cm.options.pollInterval, poll);
  };

  ContentEditableInput.prototype.selectionChanged = function () {
    var sel = this.getSelection();
    return sel.anchorNode != this.lastAnchorNode || sel.anchorOffset != this.lastAnchorOffset ||
      sel.focusNode != this.lastFocusNode || sel.focusOffset != this.lastFocusOffset
  };

  ContentEditableInput.prototype.pollSelection = function () {
    if (this.readDOMTimeout != null || this.gracePeriod || !this.selectionChanged()) { return }
    var sel = this.getSelection(), cm = this.cm;
    // On Android Chrome (version 56, at least), backspacing into an
    // uneditable block element will put the cursor in that element,
    // and then, because it's not editable, hide the virtual keyboard.
    // Because Android doesn't allow us to actually detect backspace
    // presses in a sane way, this code checks for when that happens
    // and simulates a backspace press in this case.
    if (android && chrome && this.cm.options.gutters.length && isInGutter(sel.anchorNode)) {
      this.cm.triggerOnKeyDown({type: "keydown", keyCode: 8, preventDefault: Math.abs});
      this.blur();
      this.focus();
      return
    }
    if (this.composing) { return }
    this.rememberSelection();
    var anchor = domToPos(cm, sel.anchorNode, sel.anchorOffset);
    var head = domToPos(cm, sel.focusNode, sel.focusOffset);
    if (anchor && head) { runInOp(cm, function () {
      setSelection(cm.doc, simpleSelection(anchor, head), sel_dontScroll);
      if (anchor.bad || head.bad) { cm.curOp.selectionChanged = true; }
    }); }
  };

  ContentEditableInput.prototype.pollContent = function () {
    if (this.readDOMTimeout != null) {
      clearTimeout(this.readDOMTimeout);
      this.readDOMTimeout = null;
    }

    var cm = this.cm, display = cm.display, sel = cm.doc.sel.primary();
    var from = sel.from(), to = sel.to();
    if (from.ch == 0 && from.line > cm.firstLine())
      { from = Pos(from.line - 1, getLine(cm.doc, from.line - 1).length); }
    if (to.ch == getLine(cm.doc, to.line).text.length && to.line < cm.lastLine())
      { to = Pos(to.line + 1, 0); }
    if (from.line < display.viewFrom || to.line > display.viewTo - 1) { return false }

    var fromIndex, fromLine, fromNode;
    if (from.line == display.viewFrom || (fromIndex = findViewIndex(cm, from.line)) == 0) {
      fromLine = lineNo(display.view[0].line);
      fromNode = display.view[0].node;
    } else {
      fromLine = lineNo(display.view[fromIndex].line);
      fromNode = display.view[fromIndex - 1].node.nextSibling;
    }
    var toIndex = findViewIndex(cm, to.line);
    var toLine, toNode;
    if (toIndex == display.view.length - 1) {
      toLine = display.viewTo - 1;
      toNode = display.lineDiv.lastChild;
    } else {
      toLine = lineNo(display.view[toIndex + 1].line) - 1;
      toNode = display.view[toIndex + 1].node.previousSibling;
    }

    if (!fromNode) { return false }
    var newText = cm.doc.splitLines(domTextBetween(cm, fromNode, toNode, fromLine, toLine));
    var oldText = getBetween(cm.doc, Pos(fromLine, 0), Pos(toLine, getLine(cm.doc, toLine).text.length));
    while (newText.length > 1 && oldText.length > 1) {
      if (lst(newText) == lst(oldText)) { newText.pop(); oldText.pop(); toLine--; }
      else if (newText[0] == oldText[0]) { newText.shift(); oldText.shift(); fromLine++; }
      else { break }
    }

    var cutFront = 0, cutEnd = 0;
    var newTop = newText[0], oldTop = oldText[0], maxCutFront = Math.min(newTop.length, oldTop.length);
    while (cutFront < maxCutFront && newTop.charCodeAt(cutFront) == oldTop.charCodeAt(cutFront))
      { ++cutFront; }
    var newBot = lst(newText), oldBot = lst(oldText);
    var maxCutEnd = Math.min(newBot.length - (newText.length == 1 ? cutFront : 0),
                             oldBot.length - (oldText.length == 1 ? cutFront : 0));
    while (cutEnd < maxCutEnd &&
           newBot.charCodeAt(newBot.length - cutEnd - 1) == oldBot.charCodeAt(oldBot.length - cutEnd - 1))
      { ++cutEnd; }
    // Try to move start of change to start of selection if ambiguous
    if (newText.length == 1 && oldText.length == 1 && fromLine == from.line) {
      while (cutFront && cutFront > from.ch &&
             newBot.charCodeAt(newBot.length - cutEnd - 1) == oldBot.charCodeAt(oldBot.length - cutEnd - 1)) {
        cutFront--;
        cutEnd++;
      }
    }

    newText[newText.length - 1] = newBot.slice(0, newBot.length - cutEnd).replace(/^\u200b+/, "");
    newText[0] = newText[0].slice(cutFront).replace(/\u200b+$/, "");

    var chFrom = Pos(fromLine, cutFront);
    var chTo = Pos(toLine, oldText.length ? lst(oldText).length - cutEnd : 0);
    if (newText.length > 1 || newText[0] || cmp(chFrom, chTo)) {
      replaceRange(cm.doc, newText, chFrom, chTo, "+input");
      return true
    }
  };

  ContentEditableInput.prototype.ensurePolled = function () {
    this.forceCompositionEnd();
  };
  ContentEditableInput.prototype.reset = function () {
    this.forceCompositionEnd();
  };
  ContentEditableInput.prototype.forceCompositionEnd = function () {
    if (!this.composing) { return }
    clearTimeout(this.readDOMTimeout);
    this.composing = null;
    this.updateFromDOM();
    this.div.blur();
    this.div.focus();
  };
  ContentEditableInput.prototype.readFromDOMSoon = function () {
      var this$1 = this;

    if (this.readDOMTimeout != null) { return }
    this.readDOMTimeout = setTimeout(function () {
      this$1.readDOMTimeout = null;
      if (this$1.composing) {
        if (this$1.composing.done) { this$1.composing = null; }
        else { return }
      }
      this$1.updateFromDOM();
    }, 80);
  };

  ContentEditableInput.prototype.updateFromDOM = function () {
      var this$1 = this;

    if (this.cm.isReadOnly() || !this.pollContent())
      { runInOp(this.cm, function () { return regChange(this$1.cm); }); }
  };

  ContentEditableInput.prototype.setUneditable = function (node) {
    node.contentEditable = "false";
  };

  ContentEditableInput.prototype.onKeyPress = function (e) {
    if (e.charCode == 0 || this.composing) { return }
    e.preventDefault();
    if (!this.cm.isReadOnly())
      { operation(this.cm, applyTextInput)(this.cm, String.fromCharCode(e.charCode == null ? e.keyCode : e.charCode), 0); }
  };

  ContentEditableInput.prototype.readOnlyChanged = function (val) {
    this.div.contentEditable = String(val != "nocursor");
  };

  ContentEditableInput.prototype.onContextMenu = function () {};
  ContentEditableInput.prototype.resetPosition = function () {};

  ContentEditableInput.prototype.needsContentAttribute = true;

  function posToDOM(cm, pos) {
    var view = findViewForLine(cm, pos.line);
    if (!view || view.hidden) { return null }
    var line = getLine(cm.doc, pos.line);
    var info = mapFromLineView(view, line, pos.line);

    var order = getOrder(line, cm.doc.direction), side = "left";
    if (order) {
      var partPos = getBidiPartAt(order, pos.ch);
      side = partPos % 2 ? "right" : "left";
    }
    var result = nodeAndOffsetInLineMap(info.map, pos.ch, side);
    result.offset = result.collapse == "right" ? result.end : result.start;
    return result
  }

  function isInGutter(node) {
    for (var scan = node; scan; scan = scan.parentNode)
      { if (/CodeMirror-gutter-wrapper/.test(scan.className)) { return true } }
    return false
  }

  function badPos(pos, bad) { if (bad) { pos.bad = true; } return pos }

  function domTextBetween(cm, from, to, fromLine, toLine) {
    var text = "", closing = false, lineSep = cm.doc.lineSeparator(), extraLinebreak = false;
    function recognizeMarker(id) { return function (marker) { return marker.id == id; } }
    function close() {
      if (closing) {
        text += lineSep;
        if (extraLinebreak) { text += lineSep; }
        closing = extraLinebreak = false;
      }
    }
    function addText(str) {
      if (str) {
        close();
        text += str;
      }
    }
    function walk(node) {
      if (node.nodeType == 1) {
        var cmText = node.getAttribute("cm-text");
        if (cmText) {
          addText(cmText);
          return
        }
        var markerID = node.getAttribute("cm-marker"), range$$1;
        if (markerID) {
          var found = cm.findMarks(Pos(fromLine, 0), Pos(toLine + 1, 0), recognizeMarker(+markerID));
          if (found.length && (range$$1 = found[0].find(0)))
            { addText(getBetween(cm.doc, range$$1.from, range$$1.to).join(lineSep)); }
          return
        }
        if (node.getAttribute("contenteditable") == "false") { return }
        var isBlock = /^(pre|div|p|li|table|br)$/i.test(node.nodeName);
        if (!/^br$/i.test(node.nodeName) && node.textContent.length == 0) { return }

        if (isBlock) { close(); }
        for (var i = 0; i < node.childNodes.length; i++)
          { walk(node.childNodes[i]); }

        if (/^(pre|p)$/i.test(node.nodeName)) { extraLinebreak = true; }
        if (isBlock) { closing = true; }
      } else if (node.nodeType == 3) {
        addText(node.nodeValue.replace(/\u200b/g, "").replace(/\u00a0/g, " "));
      }
    }
    for (;;) {
      walk(from);
      if (from == to) { break }
      from = from.nextSibling;
      extraLinebreak = false;
    }
    return text
  }

  function domToPos(cm, node, offset) {
    var lineNode;
    if (node == cm.display.lineDiv) {
      lineNode = cm.display.lineDiv.childNodes[offset];
      if (!lineNode) { return badPos(cm.clipPos(Pos(cm.display.viewTo - 1)), true) }
      node = null; offset = 0;
    } else {
      for (lineNode = node;; lineNode = lineNode.parentNode) {
        if (!lineNode || lineNode == cm.display.lineDiv) { return null }
        if (lineNode.parentNode && lineNode.parentNode == cm.display.lineDiv) { break }
      }
    }
    for (var i = 0; i < cm.display.view.length; i++) {
      var lineView = cm.display.view[i];
      if (lineView.node == lineNode)
        { return locateNodeInLineView(lineView, node, offset) }
    }
  }

  function locateNodeInLineView(lineView, node, offset) {
    var wrapper = lineView.text.firstChild, bad = false;
    if (!node || !contains(wrapper, node)) { return badPos(Pos(lineNo(lineView.line), 0), true) }
    if (node == wrapper) {
      bad = true;
      node = wrapper.childNodes[offset];
      offset = 0;
      if (!node) {
        var line = lineView.rest ? lst(lineView.rest) : lineView.line;
        return badPos(Pos(lineNo(line), line.text.length), bad)
      }
    }

    var textNode = node.nodeType == 3 ? node : null, topNode = node;
    if (!textNode && node.childNodes.length == 1 && node.firstChild.nodeType == 3) {
      textNode = node.firstChild;
      if (offset) { offset = textNode.nodeValue.length; }
    }
    while (topNode.parentNode != wrapper) { topNode = topNode.parentNode; }
    var measure = lineView.measure, maps = measure.maps;

    function find(textNode, topNode, offset) {
      for (var i = -1; i < (maps ? maps.length : 0); i++) {
        var map$$1 = i < 0 ? measure.map : maps[i];
        for (var j = 0; j < map$$1.length; j += 3) {
          var curNode = map$$1[j + 2];
          if (curNode == textNode || curNode == topNode) {
            var line = lineNo(i < 0 ? lineView.line : lineView.rest[i]);
            var ch = map$$1[j] + offset;
            if (offset < 0 || curNode != textNode) { ch = map$$1[j + (offset ? 1 : 0)]; }
            return Pos(line, ch)
          }
        }
      }
    }
    var found = find(textNode, topNode, offset);
    if (found) { return badPos(found, bad) }

    // FIXME this is all really shaky. might handle the few cases it needs to handle, but likely to cause problems
    for (var after = topNode.nextSibling, dist = textNode ? textNode.nodeValue.length - offset : 0; after; after = after.nextSibling) {
      found = find(after, after.firstChild, 0);
      if (found)
        { return badPos(Pos(found.line, found.ch - dist), bad) }
      else
        { dist += after.textContent.length; }
    }
    for (var before = topNode.previousSibling, dist$1 = offset; before; before = before.previousSibling) {
      found = find(before, before.firstChild, -1);
      if (found)
        { return badPos(Pos(found.line, found.ch + dist$1), bad) }
      else
        { dist$1 += before.textContent.length; }
    }
  }

  // TEXTAREA INPUT STYLE

  var TextareaInput = function(cm) {
    this.cm = cm;
    // See input.poll and input.reset
    this.prevInput = "";

    // Flag that indicates whether we expect input to appear real soon
    // now (after some event like 'keypress' or 'input') and are
    // polling intensively.
    this.pollingFast = false;
    // Self-resetting timeout for the poller
    this.polling = new Delayed();
    // Used to work around IE issue with selection being forgotten when focus moves away from textarea
    this.hasSelection = false;
    this.composing = null;
  };

  TextareaInput.prototype.init = function (display) {
      var this$1 = this;

    var input = this, cm = this.cm;
    this.createField(display);
    var te = this.textarea;

    display.wrapper.insertBefore(this.wrapper, display.wrapper.firstChild);

    // Needed to hide big blue blinking cursor on Mobile Safari (doesn't seem to work in iOS 8 anymore)
    if (ios) { te.style.width = "0px"; }

    on(te, "input", function () {
      if (ie && ie_version >= 9 && this$1.hasSelection) { this$1.hasSelection = null; }
      input.poll();
    });

    on(te, "paste", function (e) {
      if (signalDOMEvent(cm, e) || handlePaste(e, cm)) { return }

      cm.state.pasteIncoming = true;
      input.fastPoll();
    });

    function prepareCopyCut(e) {
      if (signalDOMEvent(cm, e)) { return }
      if (cm.somethingSelected()) {
        setLastCopied({lineWise: false, text: cm.getSelections()});
      } else if (!cm.options.lineWiseCopyCut) {
        return
      } else {
        var ranges = copyableRanges(cm);
        setLastCopied({lineWise: true, text: ranges.text});
        if (e.type == "cut") {
          cm.setSelections(ranges.ranges, null, sel_dontScroll);
        } else {
          input.prevInput = "";
          te.value = ranges.text.join("\n");
          selectInput(te);
        }
      }
      if (e.type == "cut") { cm.state.cutIncoming = true; }
    }
    on(te, "cut", prepareCopyCut);
    on(te, "copy", prepareCopyCut);

    on(display.scroller, "paste", function (e) {
      if (eventInWidget(display, e) || signalDOMEvent(cm, e)) { return }
      cm.state.pasteIncoming = true;
      input.focus();
    });

    // Prevent normal selection in the editor (we handle our own)
    on(display.lineSpace, "selectstart", function (e) {
      if (!eventInWidget(display, e)) { e_preventDefault(e); }
    });

    on(te, "compositionstart", function () {
      var start = cm.getCursor("from");
      if (input.composing) { input.composing.range.clear(); }
      input.composing = {
        start: start,
        range: cm.markText(start, cm.getCursor("to"), {className: "CodeMirror-composing"})
      };
    });
    on(te, "compositionend", function () {
      if (input.composing) {
        input.poll();
        input.composing.range.clear();
        input.composing = null;
      }
    });
  };

  TextareaInput.prototype.createField = function (_display) {
    // Wraps and hides input textarea
    this.wrapper = hiddenTextarea();
    // The semihidden textarea that is focused when the editor is
    // focused, and receives input.
    this.textarea = this.wrapper.firstChild;
  };

  TextareaInput.prototype.prepareSelection = function () {
    // Redraw the selection and/or cursor
    var cm = this.cm, display = cm.display, doc = cm.doc;
    var result = prepareSelection(cm);

    // Move the hidden textarea near the cursor to prevent scrolling artifacts
    if (cm.options.moveInputWithCursor) {
      var headPos = cursorCoords(cm, doc.sel.primary().head, "div");
      var wrapOff = display.wrapper.getBoundingClientRect(), lineOff = display.lineDiv.getBoundingClientRect();
      result.teTop = Math.max(0, Math.min(display.wrapper.clientHeight - 10,
                                          headPos.top + lineOff.top - wrapOff.top));
      result.teLeft = Math.max(0, Math.min(display.wrapper.clientWidth - 10,
                                           headPos.left + lineOff.left - wrapOff.left));
    }

    return result
  };

  TextareaInput.prototype.showSelection = function (drawn) {
    var cm = this.cm, display = cm.display;
    removeChildrenAndAdd(display.cursorDiv, drawn.cursors);
    removeChildrenAndAdd(display.selectionDiv, drawn.selection);
    if (drawn.teTop != null) {
      this.wrapper.style.top = drawn.teTop + "px";
      this.wrapper.style.left = drawn.teLeft + "px";
    }
  };

  // Reset the input to correspond to the selection (or to be empty,
  // when not typing and nothing is selected)
  TextareaInput.prototype.reset = function (typing) {
    if (this.contextMenuPending || this.composing) { return }
    var cm = this.cm;
    if (cm.somethingSelected()) {
      this.prevInput = "";
      var content = cm.getSelection();
      this.textarea.value = content;
      if (cm.state.focused) { selectInput(this.textarea); }
      if (ie && ie_version >= 9) { this.hasSelection = content; }
    } else if (!typing) {
      this.prevInput = this.textarea.value = "";
      if (ie && ie_version >= 9) { this.hasSelection = null; }
    }
  };

  TextareaInput.prototype.getField = function () { return this.textarea };

  TextareaInput.prototype.supportsTouch = function () { return false };

  TextareaInput.prototype.focus = function () {
    if (this.cm.options.readOnly != "nocursor" && (!mobile || activeElt() != this.textarea)) {
      try { this.textarea.focus(); }
      catch (e) {} // IE8 will throw if the textarea is display: none or not in DOM
    }
  };

  TextareaInput.prototype.blur = function () { this.textarea.blur(); };

  TextareaInput.prototype.resetPosition = function () {
    this.wrapper.style.top = this.wrapper.style.left = 0;
  };

  TextareaInput.prototype.receivedFocus = function () { this.slowPoll(); };

  // Poll for input changes, using the normal rate of polling. This
  // runs as long as the editor is focused.
  TextareaInput.prototype.slowPoll = function () {
      var this$1 = this;

    if (this.pollingFast) { return }
    this.polling.set(this.cm.options.pollInterval, function () {
      this$1.poll();
      if (this$1.cm.state.focused) { this$1.slowPoll(); }
    });
  };

  // When an event has just come in that is likely to add or change
  // something in the input textarea, we poll faster, to ensure that
  // the change appears on the screen quickly.
  TextareaInput.prototype.fastPoll = function () {
    var missed = false, input = this;
    input.pollingFast = true;
    function p() {
      var changed = input.poll();
      if (!changed && !missed) {missed = true; input.polling.set(60, p);}
      else {input.pollingFast = false; input.slowPoll();}
    }
    input.polling.set(20, p);
  };

  // Read input from the textarea, and update the document to match.
  // When something is selected, it is present in the textarea, and
  // selected (unless it is huge, in which case a placeholder is
  // used). When nothing is selected, the cursor sits after previously
  // seen text (can be empty), which is stored in prevInput (we must
  // not reset the textarea when typing, because that breaks IME).
  TextareaInput.prototype.poll = function () {
      var this$1 = this;

    var cm = this.cm, input = this.textarea, prevInput = this.prevInput;
    // Since this is called a *lot*, try to bail out as cheaply as
    // possible when it is clear that nothing happened. hasSelection
    // will be the case when there is a lot of text in the textarea,
    // in which case reading its value would be expensive.
    if (this.contextMenuPending || !cm.state.focused ||
        (hasSelection(input) && !prevInput && !this.composing) ||
        cm.isReadOnly() || cm.options.disableInput || cm.state.keySeq)
      { return false }

    var text = input.value;
    // If nothing changed, bail.
    if (text == prevInput && !cm.somethingSelected()) { return false }
    // Work around nonsensical selection resetting in IE9/10, and
    // inexplicable appearance of private area unicode characters on
    // some key combos in Mac (#2689).
    if (ie && ie_version >= 9 && this.hasSelection === text ||
        mac && /[\uf700-\uf7ff]/.test(text)) {
      cm.display.input.reset();
      return false
    }

    if (cm.doc.sel == cm.display.selForContextMenu) {
      var first = text.charCodeAt(0);
      if (first == 0x200b && !prevInput) { prevInput = "\u200b"; }
      if (first == 0x21da) { this.reset(); return this.cm.execCommand("undo") }
    }
    // Find the part of the input that is actually new
    var same = 0, l = Math.min(prevInput.length, text.length);
    while (same < l && prevInput.charCodeAt(same) == text.charCodeAt(same)) { ++same; }

    runInOp(cm, function () {
      applyTextInput(cm, text.slice(same), prevInput.length - same,
                     null, this$1.composing ? "*compose" : null);

      // Don't leave long text in the textarea, since it makes further polling slow
      if (text.length > 1000 || text.indexOf("\n") > -1) { input.value = this$1.prevInput = ""; }
      else { this$1.prevInput = text; }

      if (this$1.composing) {
        this$1.composing.range.clear();
        this$1.composing.range = cm.markText(this$1.composing.start, cm.getCursor("to"),
                                           {className: "CodeMirror-composing"});
      }
    });
    return true
  };

  TextareaInput.prototype.ensurePolled = function () {
    if (this.pollingFast && this.poll()) { this.pollingFast = false; }
  };

  TextareaInput.prototype.onKeyPress = function () {
    if (ie && ie_version >= 9) { this.hasSelection = null; }
    this.fastPoll();
  };

  TextareaInput.prototype.onContextMenu = function (e) {
    var input = this, cm = input.cm, display = cm.display, te = input.textarea;
    var pos = posFromMouse(cm, e), scrollPos = display.scroller.scrollTop;
    if (!pos || presto) { return } // Opera is difficult.

    // Reset the current text selection only if the click is done outside of the selection
    // and 'resetSelectionOnContextMenu' option is true.
    var reset = cm.options.resetSelectionOnContextMenu;
    if (reset && cm.doc.sel.contains(pos) == -1)
      { operation(cm, setSelection)(cm.doc, simpleSelection(pos), sel_dontScroll); }

    var oldCSS = te.style.cssText, oldWrapperCSS = input.wrapper.style.cssText;
    input.wrapper.style.cssText = "position: absolute";
    var wrapperBox = input.wrapper.getBoundingClientRect();
    te.style.cssText = "position: absolute; width: 30px; height: 30px;\n      top: " + (e.clientY - wrapperBox.top - 5) + "px; left: " + (e.clientX - wrapperBox.left - 5) + "px;\n      z-index: 1000; background: " + (ie ? "rgba(255, 255, 255, .05)" : "transparent") + ";\n      outline: none; border-width: 0; outline: none; overflow: hidden; opacity: .05; filter: alpha(opacity=5);";
    var oldScrollY;
    if (webkit) { oldScrollY = window.scrollY; } // Work around Chrome issue (#2712)
    display.input.focus();
    if (webkit) { window.scrollTo(null, oldScrollY); }
    display.input.reset();
    // Adds "Select all" to context menu in FF
    if (!cm.somethingSelected()) { te.value = input.prevInput = " "; }
    input.contextMenuPending = true;
    display.selForContextMenu = cm.doc.sel;
    clearTimeout(display.detectingSelectAll);

    // Select-all will be greyed out if there's nothing to select, so
    // this adds a zero-width space so that we can later check whether
    // it got selected.
    function prepareSelectAllHack() {
      if (te.selectionStart != null) {
        var selected = cm.somethingSelected();
        var extval = "\u200b" + (selected ? te.value : "");
        te.value = "\u21da"; // Used to catch context-menu undo
        te.value = extval;
        input.prevInput = selected ? "" : "\u200b";
        te.selectionStart = 1; te.selectionEnd = extval.length;
        // Re-set this, in case some other handler touched the
        // selection in the meantime.
        display.selForContextMenu = cm.doc.sel;
      }
    }
    function rehide() {
      input.contextMenuPending = false;
      input.wrapper.style.cssText = oldWrapperCSS;
      te.style.cssText = oldCSS;
      if (ie && ie_version < 9) { display.scrollbars.setScrollTop(display.scroller.scrollTop = scrollPos); }

      // Try to detect the user choosing select-all
      if (te.selectionStart != null) {
        if (!ie || (ie && ie_version < 9)) { prepareSelectAllHack(); }
        var i = 0, poll = function () {
          if (display.selForContextMenu == cm.doc.sel && te.selectionStart == 0 &&
              te.selectionEnd > 0 && input.prevInput == "\u200b") {
            operation(cm, selectAll)(cm);
          } else if (i++ < 10) {
            display.detectingSelectAll = setTimeout(poll, 500);
          } else {
            display.selForContextMenu = null;
            display.input.reset();
          }
        };
        display.detectingSelectAll = setTimeout(poll, 200);
      }
    }

    if (ie && ie_version >= 9) { prepareSelectAllHack(); }
    if (captureRightClick) {
      e_stop(e);
      var mouseup = function () {
        off(window, "mouseup", mouseup);
        setTimeout(rehide, 20);
      };
      on(window, "mouseup", mouseup);
    } else {
      setTimeout(rehide, 50);
    }
  };

  TextareaInput.prototype.readOnlyChanged = function (val) {
    if (!val) { this.reset(); }
    this.textarea.disabled = val == "nocursor";
  };

  TextareaInput.prototype.setUneditable = function () {};

  TextareaInput.prototype.needsContentAttribute = false;

  function fromTextArea(textarea, options) {
    options = options ? copyObj(options) : {};
    options.value = textarea.value;
    if (!options.tabindex && textarea.tabIndex)
      { options.tabindex = textarea.tabIndex; }
    if (!options.placeholder && textarea.placeholder)
      { options.placeholder = textarea.placeholder; }
    // Set autofocus to true if this textarea is focused, or if it has
    // autofocus and no other element is focused.
    if (options.autofocus == null) {
      var hasFocus = activeElt();
      options.autofocus = hasFocus == textarea ||
        textarea.getAttribute("autofocus") != null && hasFocus == document.body;
    }

    function save() {textarea.value = cm.getValue();}

    var realSubmit;
    if (textarea.form) {
      on(textarea.form, "submit", save);
      // Deplorable hack to make the submit method do the right thing.
      if (!options.leaveSubmitMethodAlone) {
        var form = textarea.form;
        realSubmit = form.submit;
        try {
          var wrappedSubmit = form.submit = function () {
            save();
            form.submit = realSubmit;
            form.submit();
            form.submit = wrappedSubmit;
          };
        } catch(e) {}
      }
    }

    options.finishInit = function (cm) {
      cm.save = save;
      cm.getTextArea = function () { return textarea; };
      cm.toTextArea = function () {
        cm.toTextArea = isNaN; // Prevent this from being ran twice
        save();
        textarea.parentNode.removeChild(cm.getWrapperElement());
        textarea.style.display = "";
        if (textarea.form) {
          off(textarea.form, "submit", save);
          if (typeof textarea.form.submit == "function")
            { textarea.form.submit = realSubmit; }
        }
      };
    };

    textarea.style.display = "none";
    var cm = CodeMirror(function (node) { return textarea.parentNode.insertBefore(node, textarea.nextSibling); },
      options);
    return cm
  }

  function addLegacyProps(CodeMirror) {
    CodeMirror.off = off;
    CodeMirror.on = on;
    CodeMirror.wheelEventPixels = wheelEventPixels;
    CodeMirror.Doc = Doc;
    CodeMirror.splitLines = splitLinesAuto;
    CodeMirror.countColumn = countColumn;
    CodeMirror.findColumn = findColumn;
    CodeMirror.isWordChar = isWordCharBasic;
    CodeMirror.Pass = Pass;
    CodeMirror.signal = signal;
    CodeMirror.Line = Line;
    CodeMirror.changeEnd = changeEnd;
    CodeMirror.scrollbarModel = scrollbarModel;
    CodeMirror.Pos = Pos;
    CodeMirror.cmpPos = cmp;
    CodeMirror.modes = modes;
    CodeMirror.mimeModes = mimeModes;
    CodeMirror.resolveMode = resolveMode;
    CodeMirror.getMode = getMode;
    CodeMirror.modeExtensions = modeExtensions;
    CodeMirror.extendMode = extendMode;
    CodeMirror.copyState = copyState;
    CodeMirror.startState = startState;
    CodeMirror.innerMode = innerMode;
    CodeMirror.commands = commands;
    CodeMirror.keyMap = keyMap;
    CodeMirror.keyName = keyName;
    CodeMirror.isModifierKey = isModifierKey;
    CodeMirror.lookupKey = lookupKey;
    CodeMirror.normalizeKeyMap = normalizeKeyMap;
    CodeMirror.StringStream = StringStream;
    CodeMirror.SharedTextMarker = SharedTextMarker;
    CodeMirror.TextMarker = TextMarker;
    CodeMirror.LineWidget = LineWidget;
    CodeMirror.e_preventDefault = e_preventDefault;
    CodeMirror.e_stopPropagation = e_stopPropagation;
    CodeMirror.e_stop = e_stop;
    CodeMirror.addClass = addClass;
    CodeMirror.contains = contains;
    CodeMirror.rmClass = rmClass;
    CodeMirror.keyNames = keyNames;
  }

  // EDITOR CONSTRUCTOR

  defineOptions(CodeMirror);

  addEditorMethods(CodeMirror);

  // Set up methods on CodeMirror's prototype to redirect to the editor's document.
  var dontDelegate = "iter insert remove copy getEditor constructor".split(" ");
  for (var prop in Doc.prototype) { if (Doc.prototype.hasOwnProperty(prop) && indexOf(dontDelegate, prop) < 0)
    { CodeMirror.prototype[prop] = (function(method) {
      return function() {return method.apply(this.doc, arguments)}
    })(Doc.prototype[prop]); } }

  eventMixin(Doc);
  CodeMirror.inputStyles = {"textarea": TextareaInput, "contenteditable": ContentEditableInput};

  // Extra arguments are stored as the mode's dependencies, which is
  // used by (legacy) mechanisms like loadmode.js to automatically
  // load a mode. (Preferred mechanism is the require/define calls.)
  CodeMirror.defineMode = function(name/*, mode, …*/) {
    if (!CodeMirror.defaults.mode && name != "null") { CodeMirror.defaults.mode = name; }
    defineMode.apply(this, arguments);
  };

  CodeMirror.defineMIME = defineMIME;

  // Minimal default mode.
  CodeMirror.defineMode("null", function () { return ({token: function (stream) { return stream.skipToEnd(); }}); });
  CodeMirror.defineMIME("text/plain", "null");

  // EXTENSIONS

  CodeMirror.defineExtension = function (name, func) {
    CodeMirror.prototype[name] = func;
  };
  CodeMirror.defineDocExtension = function (name, func) {
    Doc.prototype[name] = func;
  };

  CodeMirror.fromTextArea = fromTextArea;

  addLegacyProps(CodeMirror);

  CodeMirror.version = "5.41.0";

  return CodeMirror;

})));

!function(t){"object"==typeof exports&&"object"==typeof module?t(require("../../lib/codemirror")):"function"==typeof define&&define.amd?define(["../../lib/codemirror"],t):t(CodeMirror)}(function(y){"use strict";var N={autoSelfClosers:{area:!0,base:!0,br:!0,col:!0,command:!0,embed:!0,frame:!0,hr:!0,img:!0,input:!0,keygen:!0,link:!0,meta:!0,param:!0,source:!0,track:!0,wbr:!0,menuitem:!0},implicitlyClosed:{dd:!0,li:!0,optgroup:!0,option:!0,p:!0,rp:!0,rt:!0,tbody:!0,td:!0,tfoot:!0,th:!0,tr:!0},contextGrabbers:{dd:{dd:!0,dt:!0},dt:{dd:!0,dt:!0},li:{li:!0},option:{option:!0,optgroup:!0},optgroup:{optgroup:!0},p:{address:!0,article:!0,aside:!0,blockquote:!0,dir:!0,div:!0,dl:!0,fieldset:!0,footer:!0,form:!0,h1:!0,h2:!0,h3:!0,h4:!0,h5:!0,h6:!0,header:!0,hgroup:!0,hr:!0,menu:!0,nav:!0,ol:!0,p:!0,pre:!0,section:!0,table:!0,ul:!0},rp:{rp:!0,rt:!0},rt:{rp:!0,rt:!0},tbody:{tbody:!0,tfoot:!0},td:{td:!0,th:!0},tfoot:{tbody:!0},th:{td:!0,th:!0},thead:{tbody:!0,tfoot:!0},tr:{tr:!0}},doNotIndent:{pre:!0},allowUnquoted:!0,allowMissing:!0,caseFold:!0},z={autoSelfClosers:{},implicitlyClosed:{},contextGrabbers:{},doNotIndent:{},allowUnquoted:!1,allowMissing:!1,allowMissingTagName:!1,caseFold:!1};y.defineMode("xml",function(t,e){var i,a,l=t.indentUnit,u={},n=e.htmlMode?N:z;for(var r in n)u[r]=n[r];for(var r in e)u[r]=e[r];function d(e,n){function t(t){return(n.tokenize=t)(e,n)}var r=e.next();return"<"==r?e.eat("!")?e.eat("[")?e.match("CDATA[")?t(o("atom","]]>")):null:e.match("--")?t(o("comment","--\x3e")):e.match("DOCTYPE",!0,!0)?(e.eatWhile(/[\w\._\-]/),t(function r(o){return function(t,e){for(var n;null!=(n=t.next());){if("<"==n)return e.tokenize=r(o+1),e.tokenize(t,e);if(">"==n){if(1!=o)return e.tokenize=r(o-1),e.tokenize(t,e);e.tokenize=d;break}}return"meta"}}(1))):null:e.eat("?")?(e.eatWhile(/[\w\._\-]/),n.tokenize=o("meta","?>"),"meta"):(i=e.eat("/")?"closeTag":"openTag",n.tokenize=c,"tag bracket"):"&"!=r?(e.eatWhile(/[^&<]/),null):(e.eat("#")?e.eat("x")?e.eatWhile(/[a-fA-F\d]/)&&e.eat(";"):e.eatWhile(/[\d]/)&&e.eat(";"):e.eatWhile(/[\w\.\-:]/)&&e.eat(";"))?"atom":"error"}function c(t,e){var n=t.next();if(">"==n||"/"==n&&t.eat(">"))return e.tokenize=d,i=">"==n?"endTag":"selfcloseTag","tag bracket";if("="==n)return i="equals",null;if("<"!=n)return/[\'\"]/.test(n)?(e.tokenize=(r=n,(o=function(t,e){for(;!t.eol();)if(t.next()==r){e.tokenize=c;break}return"string"}).isInAttribute=!0,o),e.stringStartCol=t.column(),e.tokenize(t,e)):(t.match(/^[^\s\u00a0=<>\"\']*[^\s\u00a0=<>\"\'\/]/),"word");e.tokenize=d,e.state=g,e.tagName=e.tagStart=null;var r,o,a=e.tokenize(t,e);return a?a+" tag error":"tag error"}function o(n,r){return function(t,e){for(;!t.eol();){if(t.match(r)){e.tokenize=d;break}t.next()}return n}}function s(t,e,n){this.prev=t.context,this.tagName=e,this.indent=t.indented,this.startOfLine=n,(u.doNotIndent.hasOwnProperty(e)||t.context&&t.context.noIndent)&&(this.noIndent=!0)}function f(t){t.context&&(t.context=t.context.prev)}function m(t,e){for(var n;;){if(!t.context)return;if(n=t.context.tagName,!u.contextGrabbers.hasOwnProperty(n)||!u.contextGrabbers[n].hasOwnProperty(e))return;f(t)}}function g(t,e,n){return"openTag"==t?(n.tagStart=e.column(),p):"closeTag"==t?h:g}function p(t,e,n){return"word"==t?(n.tagName=e.current(),a="tag",k):u.allowMissingTagName&&"endTag"==t?(a="tag bracket",k(t,e,n)):(a="error",p)}function h(t,e,n){if("word"!=t)return u.allowMissingTagName&&"endTag"==t?(a="tag bracket",x(t,e,n)):(a="error",b);var r=e.current();return n.context&&n.context.tagName!=r&&u.implicitlyClosed.hasOwnProperty(n.context.tagName)&&f(n),n.context&&n.context.tagName==r||!1===u.matchClosing?(a="tag",x):(a="tag error",b)}function x(t,e,n){return"endTag"!=t?(a="error",x):(f(n),g)}function b(t,e,n){return a="error",x(t,0,n)}function k(t,e,n){if("word"==t)return a="attribute",w;if("endTag"!=t&&"selfcloseTag"!=t)return a="error",k;var r=n.tagName,o=n.tagStart;return n.tagName=n.tagStart=null,"selfcloseTag"==t||u.autoSelfClosers.hasOwnProperty(r)?m(n,r):(m(n,r),n.context=new s(n,r,o==n.indented)),g}function w(t,e,n){return"equals"==t?v:(u.allowMissing||(a="error"),k(t,0,n))}function v(t,e,n){return"string"==t?T:"word"==t&&u.allowUnquoted?(a="string",k):(a="error",k(t,0,n))}function T(t,e,n){return"string"==t?T:k(t,0,n)}return d.isInText=!0,{startState:function(t){var e={tokenize:d,state:g,indented:t||0,tagName:null,tagStart:null,context:null};return null!=t&&(e.baseIndent=t),e},token:function(t,e){if(!e.tagName&&t.sol()&&(e.indented=t.indentation()),t.eatSpace())return null;i=null;var n=e.tokenize(t,e);return(n||i)&&"comment"!=n&&(a=null,e.state=e.state(i||n,t,e),a&&(n="error"==a?n+" error":a)),n},indent:function(t,e,n){var r=t.context;if(t.tokenize.isInAttribute)return t.tagStart==t.indented?t.stringStartCol+1:t.indented+l;if(r&&r.noIndent)return y.Pass;if(t.tokenize!=c&&t.tokenize!=d)return n?n.match(/^(\s*)/)[0].length:0;if(t.tagName)return!1!==u.multilineTagIndentPastTag?t.tagStart+t.tagName.length+2:t.tagStart+l*(u.multilineTagIndentFactor||1);if(u.alignCDATA&&/<!\[CDATA\[/.test(e))return 0;var o=e&&/^<(\/)?([\w_:\.-]*)/.exec(e);if(o&&o[1])for(;r;){if(r.tagName==o[2]){r=r.prev;break}if(!u.implicitlyClosed.hasOwnProperty(r.tagName))break;r=r.prev}else if(o)for(;r;){var a=u.contextGrabbers[r.tagName];if(!a||!a.hasOwnProperty(o[2]))break;r=r.prev}for(;r&&r.prev&&!r.startOfLine;)r=r.prev;return r?r.indent+l:t.baseIndent||0},electricInput:/<\/[\s\w:]+>$/,blockCommentStart:"\x3c!--",blockCommentEnd:"--\x3e",configuration:u.htmlMode?"html":"xml",helperType:u.htmlMode?"html":"xml",skipAttribute:function(t){t.state==v&&(t.state=k)}}}),y.defineMIME("text/xml","xml"),y.defineMIME("application/xml","xml"),y.mimeModes.hasOwnProperty("text/html")||y.defineMIME("text/html",{name:"xml",htmlMode:!0})});